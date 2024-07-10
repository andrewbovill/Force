      module force_03_mp2_mod
!
!     This module supports the program force
!
!     -A. J. Bovill, 2023.
!
!
!     USE Connections
!
      use mqc_general
      use mqc_molecule
      use mqc_gaussian
      use mqc_algebra2
      use mqc_algebra
      use OMP_LIB
!
!     Variable Declarations
!
      implicit none

      CONTAINS

      function GetE2(moInts,CAlpha,moEnergiesAlpha,moEnergiesBeta,nElectronsAlpha, &
          nElectronsBeta,nBasisUse) result(E2) 
!
!     Reproduce E2 as a check to see if amplitudes are computed properly.
!     Note: Solely a check, ran against RHF calculations
!
      type(mqc_twoERIs)::moInts
      real(kind=real64) :: E2, deltaIJAB, numerator,E2AA,E2AB,E2BB,E2BA
      real(kind=real64),dimension(:,:) :: CAlpha
      real(kind=real64),dimension(:) :: moEnergiesAlpha,moEnergiesBeta
      integer(kind=int64) :: i,j,a,b,nElectronsAlpha,nElectronsBeta,nBasisUse

      E2 = float(0)
      E2AA = float(0)
      do i = 1,nElectronsAlpha
        do j = 1,nElectronsAlpha
          do a = nElectronsAlpha+1,nBasisUse
            do b = nElectronsAlpha+1,nBasisUse
              deltaIJAB = moEnergiesAlpha(i) + moEnergiesAlpha(j)  &
                - moEnergiesAlpha(a) - moEnergiesAlpha(b)
              numerator = moInts%at(i,a,j,b) - moInts%at(i,b,j,a)
              numerator = numerator*numerator
              E2AA = E2AA + numerator/(float(4)*deltaIJAB)
            endDo
          endDo
        endDo
      endDo
      E2AB = float(0)
      do i = 1,nElectronsAlpha
        do j = 1,nElectronsBeta
          do a = nElectronsAlpha+1,nBasisUse
            do b = nElectronsBeta+1,nBasisUse
              deltaIJAB = moEnergiesAlpha(i) + moEnergiesBeta(j)  &
                - moEnergiesAlpha(a) - moEnergiesBeta(b)
              numerator = moInts%at(i,a,j,b)*moInts%at(i,a,j,b)
              E2AB = E2AB + numerator/deltaIJAB
            endDo
          endDo
        endDo
      endDo

      E2 = 2*E2AA+E2AB

      end function GetE2 
      
      function GetMp2Amps(moInts,CAlpha,moEnergiesAlpha,moEnergiesBeta,nElectronsAlpha, &
          nElectronsBeta,nBasisUse) result(mp2_amps) 
!
!     Obtains the mp2 amplitudes and stores in r4 mqc tensor
!
      type(mqc_twoERIs) :: moInts
      type(mqc_vector) :: mp2_amps
      type(mqc_scalar) :: mqc_temp
      real(kind=real64) :: deltaIJAB,temp_scalar
      real(kind=real64),dimension(:,:) :: CAlpha
      real(kind=real64),dimension(:) :: moEnergiesAlpha,moEnergiesBeta
      integer(kind=int64) :: i,j,ii,a,b,nElectronsAlpha,nElectronsBeta, &
        nBasisUse,nOv,nVirt,nOcc,ia,ja
      real(kind=real64),dimension(:,:,:,:) :: temp_r4

      nOcc = nElectronsAlpha
      nVirt = nBasisUse - nElectronsAlpha
      nOV = (((nOcc*(nOcc-1))/2)*((nVirt*(nVirt-1))/2))

      call mp2_amps%init((((nOcc*(nOcc-1))/2)*((nVirt*(nVirt-1))/2))*2)

      write(*,*) "Andrew here"
      i = 0
      do ii = 1,nElectronsAlpha 
        do ia = ii+1,nElectronsAlpha
          do j = nElectronsAlpha+1,nBasisUse
            do ja = j+1,nBasisUse
              i = i + 1
              deltaIJAB = moEnergiesAlpha(ii) + moEnergiesAlpha(ia)  &
                - moEnergiesAlpha(j) - moEnergiesAlpha(ja)
              mqc_temp = moInts%at(ii,ia,j,ja)/deltaIJAB
              call mp2_amps%put(mqc_temp,i)
               != moInts%at(i,j,a,b)/deltaIJAB
            endDo
          endDo
        endDo
      endDo

      i = (mp2_amps%size/2)
      do ii = 0,nElectronsBeta
        do ia = ii+1,nElectronsBeta-1
          do j = nElectronsBeta+1,nBasisUse
            do ja = nElectronsBeta+1,nBasisUse
              i = i + 1
              deltaIJAB = moEnergiesBeta(ii) + moEnergiesBeta(ia)  &
                - moEnergiesBeta(j) - moEnergiesBeta(ja)
              !call mp2_amps%put(2.0,2)
               != moInts%at(i,j,a,b)/deltaIJAB
            endDo
          endDo
        endDo
      endDo
      end function GetMp2Amps


      end module force_03_mp2_mod


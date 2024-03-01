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
          nElectronsBeta,nBasisUse) result(temp_r4) 
!
!     Obtains the mp2 amplitudes and stores in r4 mqc tensor
!
      type(mqc_twoERIs)::moInts
      type(mqc_r4tensor) :: mp2_amps
      real(kind=real64) :: deltaIJAB,temp_scalar
      real(kind=real64),dimension(:,:) :: CAlpha
      real(kind=real64),dimension(:) :: moEnergiesAlpha,moEnergiesBeta
      integer(kind=int64) :: i,j,a,b,nElectronsAlpha,nElectronsBeta,nBasisUse
      real(kind=real64),dimension(:,:,:,:) :: temp_r4

      do i = 1,nElectronsAlpha
        do j = 1,nElectronsAlpha
          do a = nElectronsAlpha+1,nBasisUse
            do b = nElectronsAlpha+1,nBasisUse
              deltaIJAB = moEnergiesAlpha(i) + moEnergiesAlpha(j)  &
                - moEnergiesAlpha(a) - moEnergiesAlpha(b)
              temp_scalar = moInts%at(i,j,a,b)/deltaIJAB
              write(*,*) temp_scalar
    !         temp_r4(i,j,a,b) = temp_scalar
            endDo
          endDo
        endDo
      endDo

      end function GetMp2Amps


      end module force_03_mp2_mod


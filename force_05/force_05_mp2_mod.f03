      module force_05_mp2_mod
!
!     This module supports the program force
!
!     -A. J. Bovill, 2023.
!
!
!     USE Connections
!
      use force_05_mod
!     Variable Declarations
!
      implicit none

      CONTAINS

      function GetE2(moInts,moEnergiesAlpha,moEnergiesBeta,nElectronsAlpha, &
          nElectronsBeta,nBasisUse) result(E2) 
!
!     Reproduce E2 as a check to see if amplitudes are computed properly.
!     Note: Solely a check, ran against RHF calculations
!
      type(mqc_twoERIs)::moInts
      real(kind=real64) :: E2, deltaIJAB, numerator,E2AA,E2AB,E2BB,E2BA
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
      
      function GetMp2Amps(moInts,moEnergiesAlpha,moEnergiesBeta,nElectronsAlpha, &
          nElectronsBeta,nBasisUse) result(mp2_amps) 
!
!     Obtains the mp2 amplitudes and stores in r4 mqc tensor
!
      type(mqc_twoERIs) :: moInts
      type(mqc_vector) :: mp2_amps
      type(mqc_scalar) :: mqc_temp
      real(kind=real64) :: deltaIJAB,temp_scalar
      real(kind=real64),dimension(:) :: moEnergiesAlpha,moEnergiesBeta
      integer(kind=int64) :: i,j,ii,a,b,nElectronsAlpha,nElectronsBeta, &
        nBasisUse,nOv,nVirt,nOcc,ia,ja
      real(kind=real64),dimension(:,:,:,:) :: temp_r4

      nOcc = nElectronsAlpha
      nVirt = nBasisUse - nElectronsAlpha
      nOV = (((nOcc*(nOcc-1))/2)*((nVirt*(nVirt-1))/2))

      call mp2_amps%init((((nOcc*(nOcc-1))/2)*((nVirt*(nVirt-1))/2))*2)

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

      function mp2_tdm(wavefunction_gs,wavefunction_ex,CAlpha1,CBeta1,CAlpha2,CBeta2,& 
          iPrint,nBasis,nAlpha,nelec,nBeta,mocoeff_gs,mocoeff_ex,dipole_gs,dipole_ex, &
          tmp_int,SMatrixAO,mp2_amps_gs,mp2_amps_ex,mp2_mat,debug,dm_au) result(tdm_ci_au)
!
!     Calculate the MP2 TDM
! 
      integer(kind=int64),intent(in):: nAlpha,nBeta,nBasis,tmp_int,nelec,IPrint
      integer(kind=int64)::nMOs,nVirt,nOV,i,j,nOcc
      type(mqc_pscf_wavefunction)::wavefunction_gs,wavefunction_ex
      type(mqc_determinant)::det_0,det_1,det_2,det_3
      integer(kind=int64),dimension(:),allocatable::Ref_Det,Ref_Single_Det,Single_Det,Double_Det,Triple_Det
      type(mqc_vector)::int_1,int_2,int_3,int_4,tdm_ci_au ! Integrals 1,2,3,4
      type(mqc_vector)::mp2_amps_gs,mp2_amps_ex
      type(mqc_matrix)::Nfi_mat_SD,Nfi_mat_DD,Nfi_mat_TD
      type(mqc_vector)::Nfi_vec_S0,Nfi_vec_D0,Nfi_vec_T0,CI_Dipole_Vec,test_vec,dm_au
      type(mqc_matrix),dimension(3)::CI_Dipole_1,CI_Dipole_2,CI_Dipole_3,CI_Dipole_4
      type(mqc_matrix)::mp2_mat,tmp_mqc_mat
      type(mqc_variable)::CAlpha1,CAlpha2,CBeta1,CBeta2
      type(MQC_Variable)::SMatrixAO
      type(mqc_scf_integral)::mocoeff_gs,mocoeff_ex
      real(kind=real64)::Nij
      type(mqc_scf_integral),dimension(3)::dipole_gs,dipole_ex,dipoleMO_gs,dipoleMO_ex
      logical,intent(in)::debug

 3000 format(1x,"Entering integral 1",1x)
 3100 format(1x,"Entering integral 2",1x)
 3200 format(1x,"Entering integral 3",1x)
 3300 format(1x,"Entering integral 4",1x)

      nMOs = nBasis
      nOcc = nAlpha
      nVirt = nMOs-nOcc
      nOV = nOcc*nVirt

      if (debug) then
        write(*,*) "nOcc: ",nOcc
        write(*,*) "nVirt: ",nVirt
      end if
!
!     List of all substituted arrays one needs to calculate all the integrals
!
      Ref_Det = [0]
      Ref_Single_Det = [0,1]
      Single_Det = [1]
      Double_Det = [2]
      Triple_Det = [3]
!
!     Initialize all determinants.
!
      flush(iOut)
      write(*,*) "Det_0"
      call trci_dets_string(iOut,iPrint,nBasis,nAlpha,nBeta,Ref_Single_Det,det_0)
      write(*,*) "Det_1"
      call trci_dets_string(iOut,iPrint,nBasis,nAlpha,nBeta,Single_det,det_1)
      if(nElec.le.1 .or. nVirt.le.1) then
        write(*,*) "Not enough virtual or occupied orbitals for double &
          substituted determinants ... skipping"
      else
        write(*,*) "Det_2"
        call trci_dets_string(iOut,iPrint,nBasis,nAlpha,nBeta,Double_Det,det_2)
      end if
      if(nElec.le.2 .or. nVirt.le.2) then
        write(*,*) "Not enough virtual or occupied orbitals for triple &
          substituted determinants ... skipping"
      else
        write(*,*) "Det_3"
        call trci_dets_string(iOut,iPrint,nBasis,nAlpha,nBeta,Triple_Det,det_3)
      end if
      flush(iOut)
!
!
!
      dipoleMO_gs = dipole_expectation_value(moCoeff_gs,dipole_gs,moCoeff_gs)
      dipoleMO_ex = dipole_expectation_value(moCoeff_ex,dipole_ex,moCoeff_ex)

      Nfi_vec_S0 = NO_Overlap_vec(wavefunction_gs,wavefunction_ex,moCoeff_gs,moCoeff_ex,det_1,Single_det, &
        nBasis,nAlpha,nBeta,nOcc,nVirt,CAlpha1,CAlpha2,CBeta1,CBeta2,SMatrixAO)
      if(IPrint.eq.4) then
        call Nfi_vec_S0%print(iOut,"Nfi_vec_S0 vector")
      end if
      if(nElec.le.1 .or. nVirt.le.1) then
        write(*,*) "Not enough virtual or occupied orbitals for double &
          substituted determinants ... skipping"
      else
        Nfi_vec_D0 = NO_Overlap_vec(wavefunction_gs,wavefunction_ex,moCoeff_gs,moCoeff_ex,det_2,Double_Det, &
          nBasis,nAlpha,nBeta,nOcc,nVirt,CAlpha1,CAlpha2,CBeta1,CBeta2,SMatrixAO)
        if(IPrint.eq.4) then
          call Nfi_vec_D0%print(iOut,"Nfi_vec_D0 vector")
        end if
      end if
      if(nElec.le.2 .or. nVirt.le.2) then
        write(*,*) "Not enough virtual or occupied orbitals for triple &
          substituted determinants ... skipping"
      else
        Nfi_vec_T0 = NO_Overlap_vec(wavefunction_gs,wavefunction_ex,moCoeff_gs,moCoeff_ex,det_3,Triple_Det, &
          nBasis,nAlpha,nBeta,nOcc,nVirt,CAlpha1,CAlpha2,CBeta1,CBeta2,SMatrixAO)
        if(IPrint.eq.4) then
          call Nfi_vec_T0%print(iOut,"Nfi_vec_T0 vector")
        end if
      end if
      write(*,*) "Orthogonal vectors all good"

      if(nElec.le.1 .or. nVirt.le.1) then
        write(*,*) "Not enough virtual or occupied orbitals for double &
          substituted determinants ... skipping"
      else
        Nfi_mat_SD = NO_Overlap_mat(wavefunction_gs,wavefunction_ex,moCoeff_gs,moCoeff_ex,det_1,det_2,Single_det, &
          Double_Det,nBasis,nAlpha,nBeta,nOcc,nVirt)
        if(IPrint.eq.4) then
          call Nfi_mat_SD%print(iOut,"Nfi_mat_SD matrix")
        end if
        Nfi_mat_DD = NO_Overlap_mat(wavefunction_gs,wavefunction_ex,moCoeff_gs,moCoeff_ex,det_2,det_2,Double_Det, &
          Double_Det,nBasis,nAlpha,nBeta,nOcc,nVirt)
        if(IPrint.eq.4) then
          call Nfi_mat_DD%print(iOut,"Nfi_mat_DD matrix")
        end if
      end if

      if(nElec.le.2 .or. nVirt.le.2) then
        write(*,*) "Not enough virtual or occupied orbitals for triple &
          substituted determinants ... skipping"
      else
        Nfi_mat_TD = NO_Overlap_mat(wavefunction_gs,wavefunction_ex,moCoeff_gs,moCoeff_ex,det_3,det_2,Triple_Det, &
          Double_Det,nBasis,nAlpha,nBeta,nOcc,nVirt)
        if(IPrint.eq.4) then
          call Nfi_mat_TD%print(iOut,"Nfi_mat_DD matrix")
        end if
      end if
      flush(iOut)

!
!     Initialize integrals 1, 2, 3, and 4
!
      call int_1%init(3)
      call int_2%init(3)
      call int_3%init(3)
      call int_4%init(3)
!
!     Integral #1 <psi_0|u|psi_S><psi_S|phi_0>
!

      Nij = NO_Overlap(wavefunction_gs,moCoeff_gs,moCoeff_ex,nAlpha,nBeta)
      do i=1,3
         call int_1%put(dm_au%at(i)*Nij,i)
      end do

      write(*,3000)
      do i=1,3
        call mqc_build_ci_hamiltonian(iOut,iPrint,wavefunction_gs%nBasis,det_0,&
           dipoleMO_gs(i),CI_Hamiltonian=CI_Dipole_1(i),subs=Ref_Det,Dets2=det_1,Subs2=Single_Det,doS2=.false.)
        if(IPrint.eq.4) then
          call CI_Dipole_1(i)%print(iOut,"CI Dipole <0|S>") 
        end if
        CI_Dipole_Vec = CI_Dipole_1(i)%vat(Rows=[1],Cols=[0])
        call int_1%put(dot_product(CI_Dipole_Vec,Nfi_vec_S0)+int_1%at(i),i)
      enddo
      call int_1%print(iOut,"Contribution from integral 1")
!
!     Integral #2 a_mp2<psi_D|u|psi_S+psi_D+psi_T><psi_S+psi_D+psi_T|phi_0>
!     <D|S>
!
      call dipoleMO_gs(i)%print(11,"X dipole integrals")
      write(*,3100)
      do i=1,3
        call mqc_build_ci_hamiltonian(iOut,iPrint,wavefunction_gs%nBasis,det_2,&
          dipoleMO_gs(i),CI_Hamiltonian=CI_Dipole_2(i),subs=Double_Det,Dets2=det_1,Subs2=Single_Det,doS2=.false.)
        if(IPrint.eq.4) then
          call CI_Dipole_2(i)%print(iOut,"CI Dipole <D|S>") 
        end if
        test_vec = MQC_MatrixVectorDotProduct(CI_Dipole_2(i),Nfi_vec_S0) 
        call int_2%put(dot_product(mp2_amps_gs,test_vec),i)
      enddo

!     <D|D>
      if(nElec.le.1 .or. nVirt.le.1) then
        write(*,*) "Not enough virtual or occupied orbitals for double &
          substituted determinants"
      else
        do i=1,3
          call mqc_build_ci_hamiltonian(iOut,iPrint,wavefunction_gs%nBasis,det_2,&
            dipoleMO_gs(i),CI_Hamiltonian=CI_Dipole_3(i),subs=Double_Det,Dets2=det_2,Subs2=Double_Det,doS2=.false.)
          if(IPrint.eq.4) then
            call CI_Dipole_3(i)%print(iOut,"CI Dipole <D|D>") 
          end if
         test_vec = MQC_MatrixVectorDotProduct(CI_Dipole_3(i),Nfi_vec_D0) 
         call int_2%put((dot_product(mp2_amps_gs,test_vec)+int_2%at(i)),i)
        enddo
      end if
!     <D|T>
      if(nElec.le.2 .or. nVirt.le.2) then
        write(*,*) "Not enough virtual or occupied orbitals for triply &
          substituted determinants"
      else 
        do i=1,3
          call mqc_build_ci_hamiltonian(iOut,iPrint,wavefunction_gs%nBasis,det_2,&
            dipoleMO_gs(i),CI_Hamiltonian=CI_Dipole_4(i),subs=Double_Det,Dets2=det_3,Subs2=Triple_Det,doS2=.false.)
          test_vec = MQC_MatrixVectorDotProduct(CI_Dipole_4(i),Nfi_vec_T0) 
          if(IPrint.eq.4) then
            call CI_Dipole_4(i)%print(iOut,"CI Dipole <D|T>") 
          end if
          call int_2%put((dot_product(mp2_amps_gs,test_vec)+int_2%at(i)),i)
        enddo
      end if

      call int_2%print(iOut,"Contribution from integral 2")
!
!     Compute Integral #3 b_mp2<psi_0|u|psi_S><psi_S|phi_D>
!     <0|S> Need Nfi_Mat
      write(*,3200)
      if(nElec.le.1 .or. nVirt.le.1) then
        write(*,*) "Not enough virtual or occupied orbitals for double &
          substituted determinants"
      else
        do i=1,3
          CI_Dipole_Vec = CI_Dipole_1(i)%vat(Rows=[1],Cols=[0])
          test_vec = MQC_VectorMatrixDotProduct(CI_Dipole_Vec,Nfi_mat_SD) 
          test_vec = test_vec%transpose()
          call int_3%put((dot_product(mp2_amps_ex,test_vec)),i)
        enddo
      end if
      call int_3%print(iOut,"Contribution from integral 3")
!
!     Compute Integral #4 <psi_D|u|psi_S+psi_D+psi_T><psi_S+psi_D+psi_T|phi_D>
!
      write(*,3300)
!     <D|S>
      if(nElec.le.1 .or. nVirt.le.1) then
        write(*,*) "Not enough virtual or occupied orbitals for double &
          substituted determinants"
      else
        do i=1,3
          tmp_mqc_mat = matmul(CI_Dipole_2(i),Nfi_mat_SD) 
          call int_4%put(mqc_matrix_matrix_contraction(mp2_mat,tmp_mqc_mat),i)
        enddo
      end if
!     <D|D>
      if(nElec.le.1 .or. nVirt.le.1) then
        write(*,*) "Not enough virtual or occupied orbitals for double &
          substituted determinants"
      else
        do i=1,3
          tmp_mqc_mat = matmul(CI_Dipole_3(i),Nfi_mat_DD) 
          call int_4%put(mqc_matrix_matrix_contraction(mp2_mat,tmp_mqc_mat)+int_4%at(i),i)
        enddo
      end if
!     <D|T>
      if(nElec.le.2 .or. nVirt.le.2) then
        write(*,*) "Not enough virtual or occupied orbitals for triply &
          substituted determinants"
      else 
        do i=1,3
          tmp_mqc_mat = matmul(CI_Dipole_4(i),Nfi_mat_TD) 
          call int_4%put(mqc_matrix_matrix_contraction(mp2_mat,tmp_mqc_mat)+int_4%at(i),i)
        enddo
      end if

      call int_4%print(iOut,"Contribution from integral 4")

      call tdm_ci_au%init(3)
      do i = 1,3
        call tdm_ci_au%put(int_1%at(i)+int_2%at(i)+int_3%at(i)+int_4%at(i),i)
        call tdm_ci_au%print(iOut,"TDM CI Dipole")
      end do

      end function mp2_tdm

      end module force_05_mp2_mod


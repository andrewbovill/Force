INCLUDE 'force_03_mod.f03'
INCLUDE 'force_03_mp2_mod.f03'
      program force_03
!     force_03
!     
!     This program computes the dipole moment from a mp2 calculation
!     This code is an extension of "force_01" and "force_02"
!     In this code we set up a binary string corresponding to a ground state
!     determinant based on the number of alpha and beta electrons.

!     This code accomplishes the following
!       1. Read in a Gaussian matrix file
!       2. Read the dipole integrals and the HF Particle density matrix.
!       3. Read in the ERI's from a calculation
!       4. Compute dipole moment and magnitude, match against Gaussian output.
!       5. Build single, double, & triple, determinant string list from reference
!       wavefunction
!       6. Compute orthogonal matrix elments between two determinant lists
!       7. Use 'mqc_build_Hamiltonian' routine to build the dipole moment
!       between different determinants
!       8. Compute a final expression for the mp2 transition dipole moment
!       through multiplication of the ERIs, CI dipoles, and non-orthogonal
!       matrix elements       
!
!     -A. J. Bovill, 2023.
!
!     USE Connections
!
      use force_03_mod
      use force_03_mp2_mod
!
!     Variable Declarations
!
      implicit none
      integer(kind=int64)::nCommands,iPrint=4,nAtoms,nBasis, &
        nBasisUse,nElec,nAlpha,nBeta, &   
        nOcc,nVirt,nMOs,nOV,nA,nB
      integer(kind=int64)::i,j,iDetRef
!     Andrew integer arrays for singles and doubles
      real(kind=real64)::timeStart,timeEnd,test,temp_scalar,E2_test,Nij
!     Andrew conversion factor from a.u.s to Debyes
      real(kind=real64),parameter:: scale_debye=2.54158025
      real(kind=real64),dimension(:), allocatable :: moEnergiesAlpha_gs,moEnergiesBeta_gs,&
        moEnergiesAlpha_ex,moEnergiesBeta_ex
      real(kind=real64),dimension(:,:),allocatable::CAlpha,CBeta
      type(mqc_variable)::CMOAlpha1,CMOAlpha2,CMOBeta1,CMOBeta2
      character(len=512)::matrixFilename1,matrixFilename2
      type(mqc_vector)::nuclear_dipole_au,dm_au,tdm_ci_au !     Andrew dipole vectors in atomic units
      type(mqc_vector)::nuclear_dipole_db,dm_db,tdm_ci_db !     Andrew dipole vectors in Debyes
      type(mqc_vector)::int_1,int_2,int_3,int_4 ! Integrals 1,2,3,4
      type(mqc_vector)::aString,bString,mp2_amps_gs,mp2_amps_ex
      type(mqc_matrix):: mp2_mat,tmp_mqc_mat,Mij,bra_occ,ket_occ
      type(MQC_Variable)::mqcTmpArray,SMatrixAO
      type(mqc_gaussian_unformatted_matrix_file)::GMatrixFile1,GMatrixFile2
      type(mqc_molecule_data)::molData
      type(mqc_scf_integral),dimension(:),allocatable::density_gs,density_ex,moCoeff_gs,moCoeff_ex,overlap
      type(mqc_pscf_wavefunction)::wavefunction_gs,wavefunction_ex
      type(mqc_scf_integral),dimension(3)::dipole_gs,dipole_ex,dipoleMO_gs,dipoleMO_ex
      type(mqc_twoERIs)::eris_gs,eris_ex,mo_ERIs_gs,mo_ERIs_ex
!     Andrew --Holds CI_Dipole_moment matrix
      type(mqc_matrix),dimension(3)::CI_Dipole_1,CI_Dipole_2,CI_Dipole_3,CI_Dipole_4
      type(mqc_matrix)::Nfi_mat_SD,Nfi_mat_DD,Nfi_mat_TD
      type(mqc_vector)::Nfi_vec_S0,Nfi_vec_D0,Nfi_vec_T0,CI_Dipole_Vec,test_vec
!     Andrew -- det 0,1,2,3, are dets for singles doubles and triples
!     respectively
      type(mqc_determinant)::det_0,det_1,det_2,det_3
      integer(kind=int64),dimension(:),allocatable::Ref_Det,Ref_Single_Det,Single_Det,Double_Det,Triple_Det
      logical :: debug=.false.
!
!     Format Statements
!

 1000 Format(1x,'Enter Test program force_03.')
 1010 Format(1x,'Matrix File ',I1,': ',A/)
 1020 Format(1x,'nAtoms    =',I4,6x,'nBasis  =',I4,6x,'nBasisUse=',I4,/,  &
             1x,'nElec=',I4,6x,'nElAlpha=',I4,6x,'nElBeta  =',I4)
 1030 Format(1x,'nMos      =',I4,6x,'nOcc    =',I4,6x,'nVirt    =',I4,/,  &
             1x,'nOv       =',I4)
 2000 format(1x,a,': ',b31)
 2100 format(1x,a,1x,i5,': ',b31)
 2200 format(1x,a,1x,i5,': ',I5)
 3000 format(1x,"Entering integral 1",1x)
 3100 format(1x,"Entering integral 2",1x)
 3200 format(1x,"Entering integral 3",1x)
 3300 format(1x,"Entering integral 4",1x)
 5000 Format(1x,'Time (',A,'): ',f8.1,' s.')
 8999 Format(/,1x,'END OF program force_03.')
!
!
      call cpu_time(timeStart)
      write(IOut,1000)
      call mqc_version_print(iOut)
      if(.not.mqc_version_check(newerThanMajor=24,newerThanMinor=3,newerThanRevision=0))  &
        call mqc_error('MQCPack version is too old.')
!
!     Open the Gaussian matrix file and load the number of atomic centers.
!
 
      nCommands = command_argument_count()
      if(nCommands.lt.2.or.nCommands.ge.3) &
        call mqc_error('A ground state and excited state gaussian matrix file must be providedin the command line.')
      call get_command_argument(1,matrixFilename1)
      call get_command_argument(2,matrixFilename2)
      call GMatrixFile1%load(matrixFilename1)
      call GMatrixFile2%load(matrixFilename2)
      write(IOut,1010) 1,TRIM(matrixFilename1)
      write(IOut,1010) 2,TRIM(matrixFilename2)
      nAtoms = GMatrixFile1%getVal('nAtoms')
      nBasis = Int(GMatrixFile1%getVal('nbasis'))
      nBasisUse = Int(GMatrixFile1%getVal('nbasisuse'))
      nElec = Int(GMatrixFile1%getVal('nelectrons'))
      nAlpha = Int(GMatrixFile1%getVal('nAlpha'))
      nBeta = Int(GMatrixFile1%getVal('nBeta'))
      write(IOut,1020) nAtoms,nBasis,nBasisUse,nElec,  &
        nAlpha,nBeta
      write(*,*)

!
!     Check if input matrix file is restricted or unrestricted
!

allocate(moCoeff_gs(1))
allocate(moCoeff_ex(1))
allocate(density_gs(1))
allocate(density_ex(1))

      call GMatrixFile1%getArray('ALPHA ORBITAL ENERGIES',mqcVarOut=mqcTmpArray)
      moEnergiesAlpha_gs = mqcTmpArray
      call GMatrixFile1%getArray('ALPHA ORBITAL ENERGIES',mqcVarOut=mqcTmpArray)
      moEnergiesBeta_gs = mqcTmpArray
      call GMatrixFile1%getArray('ALPHA MO COEFFICIENTS',mqcVarOut=mqcTmpArray)
      CAlpha    = mqcTmpArray
      CMOAlpha1 = mqcTmpArray
      call GMatrixFile1%getArray('BETA MO COEFFICIENTS',mqcVarOut=mqcTmpArray)
      CMOBeta1  = mqcTmpArray
      call GMatrixFile1%getArray('OVERLAP',mqcVarOut=SMatrixAO)

      call GMatrixFile1%getESTObj('dipole x',est_integral=dipole_gs(1))
      call GMatrixFile1%getESTObj('dipole y',est_integral=dipole_gs(2))
      call GMatrixFile1%getESTObj('dipole z',est_integral=dipole_gs(3))
      call GMatrixFile1%getESTObj('mo coefficients',est_integral=moCoeff_gs(1))
      call GMatrixFile1%getESTObj('scf density',est_integral=density_gs(1))
      call GMatrixFile1%getESTObj('wavefunction',wavefunction_gs)
      call GMatrixFile1%get2ERIs('regular',eris_gs)

      call GMatrixFile2%getArray('ALPHA ORBITAL ENERGIES',mqcVarOut=mqcTmpArray)
      moEnergiesAlpha_ex = mqcTmpArray
      call GMatrixFile2%getArray('BETA ORBITAL ENERGIES',mqcVarOut=mqcTmpArray)
      moEnergiesBeta_ex = mqcTmpArray

      call GMatrixFile2%getESTObj('dipole x',est_integral=dipole_ex(1))
      call GMatrixFile2%getESTObj('dipole y',est_integral=dipole_ex(2))
      call GMatrixFile2%getESTObj('dipole z',est_integral=dipole_ex(3))
      call GMatrixFile2%getESTObj('mo coefficients',est_integral=moCoeff_ex(1))
      call GMatrixFile2%getESTObj('scf density',est_integral=density_ex(1))
      call GMatrixFile2%getESTObj('wavefunction',wavefunction_ex)
      call GMatrixFile2%get2ERIs('regular',eris_ex)

      call GMatrixFile2%getArray('ALPHA MO COEFFICIENTS',mqcVarOut=mqcTmpArray)
      CMOAlpha2 = mqcTmpArray
      call GMatrixFile2%getArray('BETA MO COEFFICIENTS',mqcVarOut=mqcTmpArray)
      CMOBeta2  = mqcTmpArray

!     Subroutine 'getMolData' collects a bunch of stuff from the matrix file
!     what we care about are the atomic charges and cartesian coordinates.
      call GmatrixFile1%getMolData(molData)
!
!     Obtain nuclear dipole moment, classical component of total dipole moment.
!
      nuclear_dipole_au = matmul(transpose(molData%Nuclear_Charges),& 
        transpose(molData%Cartesian_Coordinates))
      call nuclear_dipole_au%print(iOut,"Nuclear Dipole in Atomic units") 
!
!     Initialize total dipole moment vector and compute.
!
      call dm_au%init(3)
      do j = 1,3
         call dm_au%put((-1)*contraction(density_gs(1),dipole_gs(j))+nuclear_dipole_au%at(j),j)
      enddo
      call dm_au%print(iOut,'Total Dipole Moment in atomic units')
!
!     Compute Dipole Moment in Debyes
!
      call dm_db%init(3)
      do j = 1,3
         call dm_db%put(dm_au%at(j)*scale_debye,j)
      enddo

      call dm_db%print(iOut,'Total Dipole Moment in Debyes')

      nMos = nBasisUse
      nOcc = nAlpha
      nVirt = nMOs-nOcc
      nOV = nOcc*nVirt

      write(*,*) "nOcc: ",nOcc
      write(*,*) "nVirt: ",nVirt

      call twoERI_trans(iOut,0,wavefunction_gs%MO_Coefficients,eris_gs,mo_ERIs_gs)
      call twoERI_trans(iOut,0,wavefunction_ex%MO_Coefficients,eris_ex,mo_ERIs_ex)

      if (debug) then
        E2_test = GetE2(mo_ERIs_gs,CAlpha,moEnergiesAlpha_gs,moEnergiesBeta_gs,nAlpha,nBeta,nBasis)
        write(*,*) "E2 ", E2_test
      end if
!
!     Get MP2 Amps
!
      mp2_amps_gs = GetMp2Amps(mo_ERIs_gs,CAlpha,moEnergiesAlpha_gs,moEnergiesBeta_gs,nAlpha,nBeta,nBasis)
      mp2_amps_ex = GetMp2Amps(mo_ERIs_ex,CAlpha,moEnergiesAlpha_ex,moEnergiesBeta_ex,nAlpha,nBeta,nBasis)
      call mp2_amps_gs%print(iOut,"mp2_amps_gs values:")
      mp2_amps_gs = mp2_amps_gs%transpose()
      call mp2_amps_ex%print(iOut,"mp2_amps_ex values:")
      if (debug) then
        call mp2_amps_gs%print(iOut,"MP2 Amplitudes for the ground state")
      end if
      mp2_amps_ex = mp2_amps_ex%transpose()
      mp2_mat = mqc_outer(mp2_amps_ex%transpose(),mp2_amps_gs)
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
      call trci_dets_string(iOut,4,nBasis,nAlpha,nBeta,Ref_Single_Det,det_0)
      write(*,*) "Det_1"
      call trci_dets_string(iOut,4,nBasis,nAlpha,nBeta,Single_det,det_1)
      write(*,*) "Det_2"
      call trci_dets_string(iOut,4,nBasis,nAlpha,nBeta,Double_Det,det_2)
      write(*,*) "Det_3"
      call trci_dets_string(iOut,4,nBasis,nAlpha,nBeta,Triple_Det,det_3)
      flush(iOut)

!
!     Calculate all orthogonal vectors/matrices
!
      dipoleMO_gs = dipole_expectation_value(moCoeff_gs(1),dipole_gs,moCoeff_gs(1))
      dipoleMO_ex = dipole_expectation_value(moCoeff_ex(1),dipole_ex,moCoeff_ex(1))
      Nfi_vec_S0 = NO_Overlap_vec(wavefunction_gs,wavefunction_ex,moCoeff_gs(1),moCoeff_ex(1),det_1,Single_det, &
        nBasis,nAlpha,nBeta,nOcc,nVirt,CMOAlpha1,CMOAlpha2,CMOBeta1,CMOBeta2,SMatrixAO)
      call Nfi_vec_S0%print(iOut,"Nfi_vec_S0 vector")
      if(nElec.le.1 .or. nVirt.le.1) then
        write(*,*) "Not enough virtual or occupied orbitals for double &
          substituted determinants ... skipping"
      else
        Nfi_vec_D0 = NO_Overlap_vec(wavefunction_gs,wavefunction_ex,moCoeff_gs(1),moCoeff_ex(1),det_2,Double_Det, &
          nBasis,nAlpha,nBeta,nOcc,nVirt,CMOAlpha1,CMOAlpha2,CMOBeta1,CMOBeta2,SMatrixAO)
        call Nfi_vec_D0%print(iOut,"Nfi_vec_D0 vector")
      end if
      if(nElec.le.2 .or. nVirt.le.2) then
        write(*,*) "Not enough virtual or occupied orbitals for triple &
          substituted determinants ... skipping"
      else
        Nfi_vec_T0 = NO_Overlap_vec(wavefunction_gs,wavefunction_ex,moCoeff_gs(1),moCoeff_ex(1),det_3,Triple_Det, &
          nBasis,nAlpha,nBeta,nOcc,nVirt,CMOAlpha1,CMOAlpha2,CMOBeta1,CMOBeta2,SMatrixAO)
        call Nfi_vec_T0%print(iOut,"Nfi_vec_T0 vector")
      end if
      write(*,*) "Orthogonal vectors all good"

      if(nElec.le.1 .or. nVirt.le.1) then
        write(*,*) "Not enough virtual or occupied orbitals for double &
          substituted determinants ... skipping"
      else
        Nfi_mat_SD = NO_Overlap_mat(wavefunction_gs,wavefunction_ex,moCoeff_gs(1),moCoeff_ex(1),det_1,det_2,Single_det, &
          Double_Det,nBasis,nAlpha,nBeta,nOcc,nVirt)
        call Nfi_mat_SD%print(iOut,"Nfi_mat_SD matrix")
        Nfi_mat_DD = NO_Overlap_mat(wavefunction_gs,wavefunction_ex,moCoeff_gs(1),moCoeff_ex(1),det_2,det_2,Double_Det, &
          Double_Det,nBasis,nAlpha,nBeta,nOcc,nVirt)
        call Nfi_mat_DD%print(iOut,"Nfi_mat_DD matrix")
      end if

      if(nElec.le.2 .or. nVirt.le.2) then
        write(*,*) "Not enough virtual or occupied orbitals for triple &
          substituted determinants ... skipping"
      else
        Nfi_mat_TD = NO_Overlap_mat(wavefunction_gs,wavefunction_ex,moCoeff_gs(1),moCoeff_ex(1),det_3,det_2,Triple_Det, &
          Double_Det,nBasis,nAlpha,nBeta,nOcc,nVirt)
        call Nfi_mat_TD%print(iOut,"Nfi_mat_DD matrix")
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

      Nij = NO_Overlap(wavefunction_gs,moCoeff_gs(1),moCoeff_ex(1),nAlpha,nBeta)
      do i=1,3
         call int_1%put(dm_db%at(i)*Nij,i)
      end do

      write(*,3000)
      do i=1,3
         call mqc_build_ci_hamiltonian(iOut,iPrint,wavefunction_gs%nBasis,det_0,&
           dipoleMO_gs(i),CI_Hamiltonian=CI_Dipole_1(i),subs=Ref_Det,Dets2=det_1,Subs2=Single_Det,doS2=.false.)
         call CI_Dipole_1(i)%print(iOut,"CI Dipole <S|0>") 
         CI_Dipole_Vec = CI_Dipole_1(i)%vat(Rows=[1],Cols=[0])
         call int_1%put(dot_product(CI_Dipole_Vec,Nfi_vec_S0)+int_1%at(i),i)
      enddo
      call int_1%print(iOut,"Contribution from integral 1")
!
!     Integral #2 a_mp2<psi_D|u|psi_S+psi_D+psi_T><psi_S+psi_D+psi_T|phi_0>
!     <D|S>
!
      write(*,3100)
      do i=1,3
        call mqc_build_ci_hamiltonian(iOut,iPrint,wavefunction_gs%nBasis,det_2,&
           dipoleMO_gs(i),CI_Hamiltonian=CI_Dipole_1(i),subs=Double_Det,Dets2=det_1,Subs2=Single_Det,doS2=.false.)
        call CI_Dipole_1(i)%print(iOut,"CI Dipole <D|S>")
        write(*,*) "Andrew bug here!!!"
        test_vec = MQC_MatrixVectorDotProduct(CI_Dipole_1(i),Nfi_vec_S0) 
        write(*,*) "Andrew bug here!!!"
        call int_2%put(dot_product(mp2_amps_gs,test_vec),i)
      enddo

!     <D|D>
      if(nElec.le.1 .or. nVirt.le.1) then
        write(*,*) "Not enough virtual or occupied orbitals for double &
          substituted determinants"
      else
        do i=1,3
         call mqc_build_ci_hamiltonian(iOut,iPrint,wavefunction_gs%nBasis,det_2,&
           dipoleMO_gs(i),CI_Hamiltonian=CI_Dipole_2(i),subs=Double_Det,Dets2=det_2,Subs2=Double_Det,doS2=.false.)
         call CI_Dipole_2(i)%print(iOut,"CI Dipole <D|D>")
         test_vec = MQC_MatrixVectorDotProduct(CI_Dipole_2(i),Nfi_vec_D0) 
         call int_2%put((dot_product(mp2_amps_gs,test_vec)+int_2%at(i)),i)
        enddo
      end if
!     <D|T>
      if(nElec.le.2 .or. nVirt.le.2) then
        write(*,*) "Not enough virtual or occupied orbitals for triply &
          substituted determinants"
      else 
        do i=1,3
          call mqc_build_ci_hamiltonian(iOut,4,wavefunction_gs%nBasis,det_2,&
            dipoleMO_gs(i),CI_Hamiltonian=CI_Dipole_3(i),subs=Double_Det,Dets2=det_3,Subs2=Triple_Det,doS2=.false.)
          call CI_Dipole_3(i)%print(iOut,"CI Dipole <D|T>")
          test_vec = MQC_MatrixVectorDotProduct(CI_Dipole_3(i),Nfi_vec_T0) 
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
          call mqc_build_ci_hamiltonian(iOut,4,wavefunction_gs%nBasis,det_0,&
            dipoleMO_gs(i),CI_Hamiltonian=CI_Dipole_1(i),subs=Ref_Det,Dets2=det_1,Subs2=Single_Det,doS2=.false.)
          call CI_Dipole_1(i)%print(iOut,"CI Dipole <O|S>")
          CI_Dipole_Vec = CI_Dipole_1(i)%vat(Rows=[1],Cols=[0])
          test_vec = MQC_VectorMatrixDotProduct(CI_Dipole_Vec,Nfi_mat_SD) 
          test_vec = test_vec%transpose()
          call int_3%put((dot_product(mp2_amps_ex,test_vec)),i)
         ! test_vec = MQC_MatrixVectorDotProduct(CI_Dipole_3(i),Nfi_vec_T0) 
          !call int_3%put((dot_product(mp2_amps_gs,test_vec)),i)
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
          call mqc_build_ci_hamiltonian(iOut,iPrint,wavefunction_gs%nBasis,det_2,&
            dipoleMO_gs(i),CI_Hamiltonian=CI_Dipole_1(i),subs=Double_Det,Dets2=det_1,Subs2=Single_Det,doS2=.false.)
          call CI_Dipole_1(i)%print(iOut,"CI Dipole <D|S>")
          tmp_mqc_mat = matmul(CI_Dipole_1(i),Nfi_mat_SD) 
          call int_4%put(mqc_matrix_matrix_contraction(mp2_mat,tmp_mqc_mat),i)
        enddo
      end if
!     <D|D>
      if(nElec.le.1 .or. nVirt.le.1) then
        write(*,*) "Not enough virtual or occupied orbitals for double &
          substituted determinants"
      else
        do i=1,3
          call mqc_build_ci_hamiltonian(iOut,iPrint,wavefunction_gs%nBasis,det_2,&
            dipoleMO_gs(i),CI_Hamiltonian=CI_Dipole_2(i),subs=Double_Det,Dets2=det_2,Subs2=Double_Det,doS2=.false.)
          call CI_Dipole_2(i)%print(iOut,"CI Dipole <D|D>")
          tmp_mqc_mat = matmul(CI_Dipole_2(i),Nfi_mat_DD) 
          test_vec = MQC_MatrixVectorDotProduct(CI_Dipole_2(i),Nfi_vec_D0) 
          call int_4%put(mqc_matrix_matrix_contraction(mp2_mat,tmp_mqc_mat)+int_4%at(i),i)
        enddo
      end if
!     <D|T>
      if(nElec.le.2 .or. nVirt.le.2) then
        write(*,*) "Not enough virtual or occupied orbitals for triply &
          substituted determinants"
      else 
        do i=1,3
          call mqc_build_ci_hamiltonian(iOut,iPrint,wavefunction_gs%nBasis,det_2,&
            dipoleMO_gs(i),CI_Hamiltonian=CI_Dipole_3(i),subs=Double_Det,Dets2=det_3,Subs2=Triple_Det,doS2=.false.)
          call CI_Dipole_3(i)%print(iOut,"CI Dipole <D|T>")
          tmp_mqc_mat = matmul(CI_Dipole_3(i),Nfi_mat_TD) 
          call int_4%put(mqc_matrix_matrix_contraction(mp2_mat,tmp_mqc_mat)+int_4%at(i),i)
        enddo
      end if

      call int_4%print(iOut,"Contribution from integral 4")

      call tdm_ci_au%init(3)
      do i = 1,3
        call tdm_ci_au%put(int_1%at(i)+int_2%at(i)+int_3%at(i)+int_4%at(i),i)
        call tdm_ci_au%print(iOut,"TDM CI Dipole")
      end do

  999 Continue
      call cpu_time(timeEnd)
      write(iOut,5000) 'TOTAL JOB TIME',timeEnd-timeStart
      write(iOut,8999)
      end program force_03

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
      integer(kind=int64)::nCommands,iPrint=0,nAtoms,nBasis, &
        nBasisUse,nElec,nAlpha,nBeta, &   
        nOcc,nVirt,nMOs,nOV,nA,nB
      integer(kind=int64)::i,j,iDetRef,andrew_int
!     Andrew integer arrays for singles and doubles
      real(kind=real64)::timeStart,timeEnd,test,temp_scalar,E2_test
!     Andrew conversion factor from a.u.s to Debyes
      real(kind=real64),parameter:: scale_debye=2.54158025
      real(kind=real64),dimension(:), allocatable :: moEnergiesAlpha_gs,moEnergiesBeta_gs,&
        moEnergiesAlpha_ex,moEnergiesBeta_ex
      real(kind=real64),dimension(:,:),allocatable::CAlpha,CBeta
      real(kind=real64),dimension(:,:,:,:) :: MO_MP2_AMPS_gs,MO_MP2_AMPS_ex
      character(len=512)::matrixFilename1,matrixfilename2
      type(mqc_vector)::nuclear_dipole_au,dm_au,tdm_ci_au !     Andrew dipole vectors in atomic units
      type(mqc_vector)::nuclear_dipole_db,dm_db,tdm_ci_db !     Andrew dipole vectors in Debyes
      type(mqc_vector)::aString,bString,mp2_amps_gs,mp2_amps_ex
      type(MQC_Variable)::mqcTmpArray
      type(mqc_gaussian_unformatted_matrix_file)::GMatrixFile1,GMatrixFile2
      type(mqc_molecule_data)::molData
      type(mqc_scf_integral),dimension(:),allocatable::density_gs,density_ex,moCoeff_gs,moCoeff_ex,overlap
      type(mqc_pscf_wavefunction)::wavefunction_gs,wavefunction_ex
      type(mqc_scf_integral),dimension(3)::dipole_gs,dipole_ex,dipoleMO
      type(mqc_twoERIs)::eris_gs,eris_ex,mo_ERIs_gs,mo_ERIs_ex,andrew_mo_ints
!     Andrew --Holds CI_Dipole_moment matrix
      type(mqc_matrix),dimension(3)::CI_Dipole_1,CI_Dipole_2,CI_Dipole_3,CI_Dipole_4
      type(mqc_matrix)::Nfi_mat,temp_mqc_mat
      type(mqc_vector)::Nfi_vec,CI_Dipole_Vec,test_vec
!     Andrew -- det 0,1,2,3, are dets for singles doubles and triples
!     respectively
      type(mqc_determinant)::det_0,det_1,det_2,det_3
!     Andrew -- debug scalar
      type(mqc_scalar) :: andrew_hold
      integer(kind=int64),dimension(:),allocatable::Ref_Det,Ref_Single_Det,Single_Det,Double_Det,Triple_Det
      logical :: debug=.false.
      real(kind=real64),dimension(:,:,:,:),allocatable :: temp_r4tensor
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
 5000 Format(1x,'Time (',A,'): ',f8.1,' s.')
 8999 Format(/,1x,'END OF program force_03.')
!
!
      call cpu_time(timeStart)
      write(IOut,1000)
      call mqc_version_print(iOut)
      if(.not.mqc_version_check(newerThanMajor=22,newerThanMinor=12,newerThanRevision=1))  &
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
      CAlpha = mqcTmpArray

      call GMatrixFile1%getESTObj('dipole x',est_integral=dipole_gs(1))
      call GMatrixFile1%getESTObj('dipole y',est_integral=dipole_gs(2))
      call GMatrixFile1%getESTObj('dipole z',est_integral=dipole_gs(3))
      !call GMatrixFile1%getESTObj('overlap',est_integral=overlap(1))
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
      write(*,*) "Andrew checking if read scf density correctly"
      call GMatrixFile2%getESTObj('scf density',est_integral=density_ex(1))
      write(*,*) "Andrew after reading density "
      call GMatrixFile2%getESTObj('wavefunction',wavefunction_ex)
      write(*,*) "Andrew after reading density "
      call GMatrixFile2%get2ERIs('regular',eris_ex)


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

      call twoERI_trans(iOut,iPrint,wavefunction_gs%MO_Coefficients,eris_gs,mo_ERIs_gs)
      call twoERI_trans(iOut,iPrint,wavefunction_ex%MO_Coefficients,eris_ex,mo_ERIs_ex)

      if (debug) then
        E2_test = GetE2(mo_ERIs_gs,CAlpha,moEnergiesAlpha_gs,moEnergiesBeta_gs,nAlpha,nBeta,nBasis)
        write(*,*) "E2 ", E2_test
      end if
      write(*,*) "Andrew here here"
!
!     Get MP2 Amps
!

      mp2_amps_gs = GetMp2Amps(mo_ERIs_gs,CAlpha,moEnergiesAlpha_gs,moEnergiesBeta_gs,nAlpha,nBeta,nBasis)
      mp2_amps_ex = GetMp2Amps(mo_ERIs_ex,CAlpha,moEnergiesAlpha_ex,moEnergiesBeta_ex,nAlpha,nBeta,nBasis)
      andrew_int =  mp2_amps_gs%size()
      call mp2_amps_gs%print(iOut,"mp2_amps_gs values:")
      write(*,*) "mp2_amps_gs_size", andrew_int
      andrew_int =  mp2_amps_ex%size()
      call mp2_amps_ex%print(iOut,"mp2_amps_ex values:")
      write(*,*) "mp2_amps_ex_size", andrew_int
      if (debug) then
        call mp2_amps_gs%print(iOut,"MP2 Amplitudes for the ground state")
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
      call trci_dets_string(iOut,4,nBasis,nAlpha,nBeta,Ref_Single_Det,det_0)
      write(*,*) "Det_1"
      call trci_dets_string(iOut,4,nBasis,nAlpha,nBeta,Single_det,det_1)
      write(*,*) "Det_2",andrew_int
      call trci_dets_string(iOut,4,nBasis,nAlpha,nBeta,Double_Det,det_2)
      write(*,*) "Det_3"
      call gen_det_str(iOut,4,nBasis,nAlpha,nBeta,det_3)
      flush(iOut)

!
!     Integral #1 <psi_0|u|psi_S><psi_S|phi_0>
!
      dipoleMO = dipole_expectation_value(moCoeff_gs(1),dipole_gs,moCoeff_gs(1))

      Nfi_vec = NO_Overlap(wavefunction_gs,wavefunction_ex,moCoeff_gs(1),moCoeff_ex(1),det_0,Ref_Single_det,nBasis,nAlpha,nBeta,nOV)
      call Nfi_vec%print(iOut,"Non-orthogonal overlap for integral 1 <S|0>")
      flush(6)

      do i=1,3
         call mqc_build_ci_hamiltonian(iOut,4,wavefunction_gs%nBasis,det_0,&
           dipoleMO(i),CI_Hamiltonian=CI_Dipole_1(i),subs=Ref_Single_Det,Dets2=det_0,Subs2=Ref_Single_Det,doS2=.false.)
         call CI_Dipole_1(i)%print(iOut,"CI Dipole")
      enddo
     
!     Compute Integral #2 <psi_D|u|psi_S+psi_D+psi_T><psi_S+psi_D+psi_T|phi_0>

      do i=1,3
         call mqc_build_ci_hamiltonian(iOut,4,wavefunction_gs%nBasis,det_2,&
           dipoleMO(i),CI_Hamiltonian=CI_Dipole_2(i),subs=Double_Det,Dets2=det_1,Subs2=Single_Det,doS2=.false.)
         call CI_Dipole_2(i)%print(iOut,"CI Dipole <D|S>")
      enddo
      if(nElec.le.2 .or. nVirt.le.2) then
        write(*,*) "Not enough virtual or occupied orbitals for double &
          substituted determinants"
      else
        do i=1,3
           call mqc_build_ci_hamiltonian(iOut,4,wavefunction_gs%nBasis,det_2,&
             dipoleMO(i),CI_Hamiltonian=CI_Dipole_3(i),subs=Double_Det,Dets2=det_2,Subs2=Double_Det,doS2=.false.)
           call CI_Dipole_3(i)%print(iOut,"CI Dipole <D|D>")
        enddo
      end if

!
!     Error handling in case triplets do not exist
!
      if(nElec.le.3 .or. nVirt.le.3) then
        write(*,*) "Not enough virtual or occupied orbitals for triply &
          substituted determinants"
      else 
        do i=1,3
           call mqc_build_ci_hamiltonian(iOut,4,wavefunction_gs%nBasis,det_3,&
             dipoleMO(i),CI_Hamiltonian=CI_Dipole_4(i),subs=Triple_Det,Dets2=det_2,Subs2=Double_Det,doS2=.false.)
           call CI_Dipole_4(i)%print(iOut,"CI Dipole <D|T>")
        enddo
      end if
!
!     Compute Integral #2 <psi_0|u|psi_S><psi_S|phi_D>
!

!
!     Compute Integral #4 <psi_D|u|psi_S+psi_D+psi_T><psi_S+psi_D+psi_T|phi_D>
!
      call tdm_ci_au%init(3)
      do i = 1,3
        call tdm_ci_au%put(dm_au%at(i),i)
        !TDM_CI_Dipole(i) = CI_Dipole_1(i)+CI_Dipole_2(i)+CI_Dipole_3(i)+CI_Dipole_4(i)
        call tdm_ci_au%print(iOut,"TDM CI Dipole")
      end do


  999 Continue
      call cpu_time(timeEnd)
      write(iOut,5000) 'TOTAL JOB TIME',timeEnd-timeStart
      write(iOut,8999)
      end program force_03


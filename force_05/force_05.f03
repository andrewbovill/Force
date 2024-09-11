INCLUDE 'force_05_mod.f03'
INCLUDE 'force_05_mp2_mod.f03'
      program force_05
!     force_05
!     
!     This program computes the transition dipole moment between a ground state
!     Gaussian matrix file and an exicted state SCF gaussian matrix file
!     In this code we set up a binary string corresponding to a ground state
!     determinant based on the number of alpha and beta electrons.
!
!     Command line arguments are the following:
!     ./force_05.exe ground.mat excited.mat method Iprint
!     Method is an integer value between one and four that has the following
!     options
!       1. Calculate spin-projected transition dipole moment
!       2. Calculate Mp2 transition dipole moment
!       3. Calculate Mp2 spin-projected transition dipole moment
!     Iprint is an integer value from 1,4 which indicates printing verbosity of
!     the output file.
!     Debug is a boolean flag to print out all calculations in order to debug

!
!     -A. J. Bovill, 2024.
!
!     USE Connections
!
      use force_05_mod
      use force_05_mp2_mod
!
!     Variable Declarations
!
      implicit none
      integer(kind=int64)::nCommands,iPrint,nAtoms,nBasis, &
        nBasisUse,nElec,nAlpha,nBeta, &   
        nOcc,nVirt,nMOs,nOV,nA,nB,method
      integer(kind=int64)::i,j,iDetRef,tmp_int
!     Andrew integer arrays for singles and doubles
      real(kind=real64)::timeStart,timeEnd,test,temp_scalar,E2_test
!     Andrew conversion factor from a.u.s to Debyes
      real(kind=real64),parameter:: scale_debye=2.54158025
      real(kind=real64),dimension(:), allocatable :: moEnergiesAlpha_gs,moEnergiesBeta_gs,&
        moEnergiesAlpha_ex,moEnergiesBeta_ex
      type(mqc_variable)::CAlpha1,CBeta1,CAlpha2,CBeta2
      character(len=512)::matrixFilename1,matrixFilename2,m1,p1
      type(mqc_vector)::nuclear_dipole_au,dm_au,tdm_ci_au !     Dipole vectors in atomic units
      type(mqc_vector)::nuclear_dipole_db,dm_db,tdm_ci_db !     Dipole vectors in Debyes
      type(mqc_vector)::mp2_amps_gs,mp2_amps_ex           !     MP2 amplitudes for integrals
      type(MQC_Variable)::mqcTmpArray,SMatrixAO
      type(mqc_gaussian_unformatted_matrix_file)::GMatrixFile1,GMatrixFile2
      type(mqc_molecule_data)::molData
      type(mqc_scf_integral),dimension(:),allocatable::density_gs,density_ex,moCoeff_gs,moCoeff_ex
      type(mqc_pscf_wavefunction)::wavefunction_gs,wavefunction_ex
      type(mqc_scf_integral),dimension(3)::dipole_gs,dipole_ex,dipoleMO_gs,dipoleMO_ex
      type(mqc_matrix)::mp2_mat
      type(mqc_twoERIs)::eris_gs,eris_ex,mo_ERIS_ex,mo_ERIS_gs
!     Andrew --Holds CI_Dipole_moment matrix
      logical :: debug
      debug = .false.
!
!     Format Statements
!

 1000 Format(1x,'Enter Test program force_05.')
 1010 Format(1x,'Matrix File ',I1,': ',A/)
 1020 Format(1x,'nAtoms    =',I4,6x,'nBasis  =',I4,6x,'nBasisUse=',I4,/,  &
             1x,'nElec=',I4,6x,'nElAlpha=',I4,6x,'nElBeta  =',I4)
 1030 Format(1x,'nMos      =',I4,6x,'nOcc    =',I4,6x,'nVirt    =',I4,/,  &
             1x,'nOv       =',I4)
 2000 format(1x,a,': ',b31)
 2100 format(1x,a,1x,i5,': ',b31)
 2200 format(1x,a,1x,i5,': ',I5)
 5000 Format(1x,'Time (',A,'): ',f8.1,' s.')
 8999 Format(/,1x,'END OF program force_05.')
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
      if(nCommands.lt.4.or.nCommands.ge.5) &
        call mqc_error('Four command line arguments are required for this program')
      call get_command_argument(1,matrixFilename1)
      call get_command_argument(2,matrixFilename2)
      call get_command_argument(3,m1)
      call get_command_argument(4,p1)
      read(m1,'(I1)') method
      if(method.lt.1.or.method.ge.5) &
        call mqc_error('Incorrect choice of method. Correct choices are 1,2,3,4')
      read(p1,'(I1)') iPrint
      if(iPrint.lt.1.or.iPrint.ge.5) &
        call mqc_error('Incorrect choice of print verbosity. Correct choices are 1,2,3,4')

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
      tmp_int = size(moEnergiesAlpha_gs) 
      call GMatrixFile1%getArray('ALPHA ORBITAL ENERGIES',mqcVarOut=mqcTmpArray)
      moEnergiesBeta_gs = mqcTmpArray
      call GMatrixFile1%getArray('ALPHA MO COEFFICIENTS',mqcVarOut=mqcTmpArray)
      CAlpha1  = mqcTmpArray
      call GMatrixFile1%getArray('BETA MO COEFFICIENTS',mqcVarOut=mqcTmpArray)
      CBeta1  = mqcTmpArray
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
      CAlpha2 = mqcTmpArray
      call GMatrixFile2%getArray('BETA MO COEFFICIENTS',mqcVarOut=mqcTmpArray)
      CBeta2  = mqcTmpArray

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
!
!     Get ERI's (memory bottleneck at higher basis functions)
!

      call twoERI_trans(iOut,0,wavefunction_gs%MO_Coefficients,eris_gs,mo_ERIs_gs)
      call twoERI_trans(iOut,0,wavefunction_ex%MO_Coefficients,eris_ex,mo_ERIs_ex)

      if (debug) then
        E2_test = GetE2(mo_ERIs_gs,moEnergiesAlpha_gs,moEnergiesBeta_gs,nAlpha,nBeta,nBasis)
        write(*,*) "E2 ", E2_test
      end if
!
!     Get MP2 Amps
!
      select case(method)
      case(2:3)
        mp2_amps_gs = GetMp2Amps(mo_ERIs_gs,moEnergiesAlpha_gs,moEnergiesBeta_gs,nAlpha,nBeta,nBasis)
        mp2_amps_ex = GetMp2Amps(mo_ERIs_ex,moEnergiesAlpha_ex,moEnergiesBeta_ex,nAlpha,nBeta,nBasis)
        mp2_amps_gs = mp2_amps_gs%transpose()
        if(IPrint.eq.4) then
          call mp2_amps_gs%print(iOut,"MP2 Amplitudes for the ground state")
          call mp2_amps_ex%print(iOut,"MP2 Amplitudes for the excited state")
        end if
        mp2_amps_ex = mp2_amps_ex%transpose()
        mp2_mat = mqc_outer(mp2_amps_ex%transpose(),mp2_amps_gs)
      end select

      select case(method)
      case(1)
      ! call pj_tdm(nOcc)
      case(2)
        tdm_ci_au = mp2_tdm(wavefunction_gs,wavefunction_ex,CAlpha1,CBeta1,CAlpha2,CBeta2, &
          iPrint,nBasis,nAlpha,nelec,nBeta,mocoeff_gs(1),mocoeff_ex(1),dipole_gs,dipole_ex,&
          tmp_int,SMatrixAO,mp2_amps_gs,mp2_amps_ex,mp2_mat,debug,dm_db)
      case(3)
      ! call pj_mp2_tdm(nOcc)
      end select

      call twoERI_trans(iOut,0,wavefunction_gs%MO_Coefficients,eris_gs,mo_ERIs_gs)
      call twoERI_trans(iOut,0,wavefunction_ex%MO_Coefficients,eris_ex,mo_ERIs_ex)

      if (debug) then
        E2_test = GetE2(mo_ERIs_gs,moEnergiesAlpha_gs,moEnergiesBeta_gs,nAlpha,nBeta,nBasis)
        write(*,*) "E2 ", E2_test
      end if
!
!     Get MP2 Amps
!
      mp2_amps_gs = GetMp2Amps(mo_ERIs_gs,moEnergiesAlpha_gs,moEnergiesBeta_gs,nAlpha,nBeta,nBasis)
      mp2_amps_ex = GetMp2Amps(mo_ERIs_ex,moEnergiesAlpha_ex,moEnergiesBeta_ex,nAlpha,nBeta,nBasis)
      call mp2_amps_gs%print(66,"MP2 Amplitudes for the ground state")
      call mp2_amps_ex%print(66,"MP2 Amplitudes for the excited state")
  999 Continue
      call cpu_time(timeEnd)
      write(iOut,5000) 'TOTAL JOB TIME',timeEnd-timeStart
      write(iOut,8999)
      end program force_05

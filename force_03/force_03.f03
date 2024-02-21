INCLUDE 'force_03_mod.f03'
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
!
!     Variable Declarations
!
      implicit none
      integer(kind=int64)::nCommands,iPrint=0,nAtoms,nBasis, &
        nBasisUse,nElec,nAlpha,nBeta, &   
        nOcc,nVirt,nMOs,nOV,nA,nB
      integer(kind=int64)::i,j,iDetRef
!     Andrew integer arrays for singles and doubles
      real(kind=real64)::timeStart,timeEnd,test, temp_scalar
!     Andrew conversion factor from a.u.s to Debyes
      real(kind=real64),parameter:: scale_debye=2.54158025294
      character(len=512)::matrixFilename1,matrixfilename2
      type(mqc_vector)::nuclear_dipole_au,tdm_au,tdm_ci_au !     Andrew dipole vectors in atomic units
      type(mqc_vector)::nuclear_dipole_db,tdm_db,tdm_ci_db !     Andrew dipole vectors in Debyes
      type(mqc_gaussian_unformatted_matrix_file)::GMatrixFile1,GMatrixFile2
      type(mqc_molecule_data)::molData
      type(mqc_scf_integral),dimension(:),allocatable::density,moCoeff,overlap
      type(mqc_pscf_wavefunction)::wavefunction
      type(mqc_scf_integral),dimension(3)::dipole
!     Andrew --Holds CI_Dipole_moment matrix
      type(mqc_matrix),dimension(3)::CI_Dipole
      type(mqc_matrix)::Nfi_mat
      type(mqc_vector)::Nfi_vec,CI_Dipole_Vec
      type(mqc_determinant)::Singledet,Doubledet,Tripledet
      integer(kind=int64),dimension(:),allocatable::Ref_Det,Single_Det,Double_Det,Triple_Det
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

allocate(moCoeff(1))
allocate(density(1))

      call GMatrixFile1%getESTObj('dipole x',est_integral=dipole(1))
      call GMatrixFile1%getESTObj('dipole y',est_integral=dipole(2))
      call GMatrixFile1%getESTObj('dipole z',est_integral=dipole(3))
      !call GMatrixFile1%getESTObj('overlap',est_integral=overlap(1))
      call GMatrixFile1%getESTObj('mo coefficients',est_integral=moCoeff(1))
      call GMatrixFile1%getESTObj('density',est_integral=density(1))
      call GMatrixFile1%getESTObj('wavefunction',wavefunction)

      call GMatrixFile2%getESTObj('dipole x',est_integral=dipole(1))
      call GMatrixFile2%getESTObj('dipole y',est_integral=dipole(2))
      call GMatrixFile2%getESTObj('dipole z',est_integral=dipole(3))
      call GMatrixFile2%getESTObj('mo coefficients',est_integral=moCoeff(1))
      call GMatrixFile2%getESTObj('density',est_integral=density(1))
      call GMatrixFile2%getESTObj('wavefunction',wavefunction)

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
      call tdm_au%init(3)
      do j = 1,3
         call tdm_au%put((-1)*contraction(density(1),dipole(j))+nuclear_dipole_au%at(j),j)
      enddo
      call tdm_au%print(iOut,'Total Dipole Moment in atomic units')
!
!     Compute Dipole Moment in Debyes
!
      call tdm_db%init(3)
      do j = 1,3
         call tdm_db%put(tdm_au%at(j)*scale_debye,j)
      enddo

      call tdm_db%print(iOut,'Total Dipole Moment in Debyes')

!
!     List of all substituted arrays one needs to calculate all the integrals
!
      Ref_Det = [0]
      Single_Det = [1]
      Double_Det = [2]
      Triple_Det = [3]

!
!     Compute integral #1 for Transition Dipole Moment
!
!     call mqc_build_ci_hamiltonian(iOut,iPrint,wavefunction%nBasis,determinants, &
!       mo_overlap,UHF=UHF,CI_Hamiltonian=CI_Hamiltonian,subs=isubs,Dets2=Determinants2,&
!       subs2=isubs2,doS2=.true.)
       
!
!     Compute integral #2 for Transition Dipole Moment
!

!
!     Compute integral #3 for Transition Dipole Moment
!

!
!     Compute integral #4 for Transition Dipole Moment
!













  999 Continue
      call cpu_time(timeEnd)
      write(iOut,5000) 'TOTAL JOB TIME',timeEnd-timeStart
      write(iOut,8999)
      end program force_03


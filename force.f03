INCLUDE 'force_mod.f03'
      program force
!
!     This program is a test program to compute transition dipole moments with
!     MQC. The overall purpose of this program is a straightforward
!     implementation of MQC routines in comparison to calculating explicitly
!     with intrinsic Fortran routines.
!
!     -A. J. Bovill, 2023.
!
!     USE Connections
!
      use force_mod
!
!     Variable Declarations
!
      implicit none
      integer(kind=int64)::nCommands,iPrint=0,nAtoms,nBasis,  &
        nBasisUse,nElectrons,nElectronsAlpha,nElectronsBeta
      integer(kind=int64)::i,j
      real(kind=real64)::timeStart,timeEnd,test
      real(kind=real64),dimension(:),allocatable::moEnergiesAlpha,moEnergiesBeta
      real(kind=real64),dimension(:,:),allocatable::CAlpha,CBeta,  &
        tmpMatrix1,tmpMatrix2,tmpMatrix3
      type(MQC_Variable)::ERIs,mqcTmpArray
      character(len=512)::matrixFilename
      type(mqc_gaussian_unformatted_matrix_file)::GMatrixFile
      type(mqc_vector)::tdm,nuclear_dipole
      type(mqc_molecule_data)::molData
      type(mqc_pscf_wavefunction)::wavefunction
      type(mqc_scf_integral),dimension(:),allocatable::moCoeff,density,overlap
      type(mqc_scf_integral),dimension(3)::dipole
      type(mqc_matrix)::p,ca,cb,q
!
!     Format Statements
!
 1000 Format(1x,'Enter Test Program Force.')
 1010 Format(1x,'Matrix File: ',A,/)
 1100 Format(1x,'nAtoms    =',I4,6x,'nBasis  =',I4,6x,'nBasisUse=',I4,/,  &
             1x,'nElectrons=',I4,6x,'nElAlpha=',I4,6x,'nElBeta  =',I4)
 5000 Format(1x,'Time (',A,'): ',f8.1,' s.')
 8999 Format(/,1x,'END OF PROGRAM Force.')
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
      if(nCommands.eq.0)  &
        call mqc_error('No command line arguments provided. The input Gaussian matrix file name is required.')
      call get_command_argument(1,matrixFilename)
      call GMatrixFile%load(matrixFilename)
      write(IOut,1010) TRIM(matrixFilename)
      nAtoms = GMatrixFile%getVal('nAtoms')
      nBasis = Int(GMatrixFile%getVal('nbasis'))
      nBasisUse = Int(GMatrixFile%getVal('nbasisuse'))
      nElectrons = Int(GMatrixFile%getVal('nelectrons'))
      nElectronsAlpha = Int(GMatrixFile%getVal('nAlpha'))
      nElectronsBeta = Int(GMatrixFile%getVal('nBeta'))
      write(IOut,1100) nAtoms,nBasis,nBasisUse,nElectrons,  &
        nElectronsAlpha,nElectronsBeta

!
!     Allocate Molecular Orbital Coefficients and Densities
!     The 'mqc_scf_integral' type stores matrices in a vector  
!     Change the dimensions of vector allocated on number of input mat files
!     ...Check with Hrant

allocate(moCoeff(1))
allocate(density(1))
allocate(overlap(1))

      call GMatrixFile%getESTObj('dipole x',est_integral=dipole(1))
      call GMatrixFile%getESTObj('dipole y',est_integral=dipole(2))
      call GMatrixFile%getESTObj('dipole z',est_integral=dipole(3))
      call Gmatrixfile%getESTObj('mo coefficients',est_integral=moCoeff(1))
      call GmatrixFile%getESTObj('density',est_integral=density(1))
      call GmatrixFile%getESTObj('overlap',est_integral=overlap(1))

      call dipole(1)%print(iOut,'Dipole x matrix')
      call moCoeff(1)%print(iOut,'MO Coefficient matrix')
      call density(1)%print(iOut,'Density')
      
      ca = moCoeff(1)
      CAlpha = ca  

      cb = moCoeff(1)
      CBeta = cb 

      tmpMatrix1 = MatMul(CAlpha(:,1:nElectronsAlpha),Transpose(CAlpha(:,1:nElectronsAlpha)))
!     tmpMatrix1 = matmul(CAlpha(:,nElectronsAlpha),tmpMatrix2(:,nElectronsAlpha))

      p = matmul(moCoeff(1),transpose(moCoeff(1)))
      q = tmpMatrix1

!     call p%print(IOut,'Density calculated from CtC')
      call q%print(IOut,'Density calculated from intrisic fortran matrices CtC')


!
!     Mulliken contraction
!
      test = contraction(density(1),overlap(1))
      write(*,*) "Number of electrons from mulliken: ", test

!     Obtain nuclear dipole moment
!
      nuclear_dipole = matmul(transpose(molData%Nuclear_Charges),& 
        transpose(molData%Cartesian_Coordinates))
      nuclear_dipole = matmul(transpose(molData%Nuclear_Charges),& 
        transpose(molData%Cartesian_Coordinates))

      call tdm%init(3)
      do j = 1,3
      !  call tdm%put((-1)*dipole(j),j)
      enddo
      call tdm%print(iOut,'Total Dipole Moment')
!
!     Obtain nuclear dipole moment
!
      nuclear_dipole = matmul(transpose(molData%Nuclear_Charges),& 
        transpose(molData%Cartesian_Coordinates))
!     
!     call tdm%init(3)
!       do j = 1,3
!         call tdm%put((-1)*contraction(density(1),dipole(j))+nuclear_dipole%at(j),j)
!     enddo
!     call tdm%print(iOut,'Total Dipole Moment')
!
  999 Continue
      call cpu_time(timeEnd)
      write(iOut,5000) 'TOTAL JOB TIME',timeEnd-timeStart
      write(iOut,8999)
      end program force


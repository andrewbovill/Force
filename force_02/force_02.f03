INCLUDE 'force_02_mod.f03'
      program force_02
!     force_02
!     
!     This program is a precursor program to coding transition dipole moments.
!     The purpose of this code builds off of "force_01"
!     In this cod we set up a binary string corresponding to a ground state
!     determinant based on the number of alpha and beta electrons.

!     This code accomplishes the following
!       1. Read in a Gaussian matrix file
!       2. Read the dipole integrals and the HF Particle density matrix.
!       3. Compute dipole moment and magnitude, match against Gaussian output.
!       4. Build determinant string list for ground state dipoles
!       5. Read MO coefficient matrices and AO Dipole integrals
!       6. Use CI integrals with MQC to evaluate the one elctron integral with
!       the bra and ket being set to the ground state determinant. 
!       7. Call this routine three times for x,y,z
!       8. Compare CI calcualted dipole against first calcualted dipole moment
!       and Gaussaian output.
!
!     -A. J. Bovill, 2023.
!
!     USE Connections
!
      use force_02_mod
!
!     Variable Declarations
!
      implicit none
      integer(kind=int64)::nCommands,iPrint=0,nAtoms,nBasis,  &
        nBasisUse,nElectrons,nElectronsAlpha,nElectronsBeta
      integer(kind=int64)::i,j
      real(kind=real64)::timeStart,timeEnd,test
      real(kind=real64),dimension(:),allocatable::moEnergiesAlpha,moEnergiesBeta
      real(kind=real64),dimension(:,:),allocatable::CAlpha,CBeta  
      type(MQC_Variable)::ERIs,mqcTmpArray
      character(len=512)::matrixFilename
      type(mqc_gaussian_unformatted_matrix_file)::GMatrixFile
      type(mqc_vector)::nuclear_dipole,tdm,tdm_ci
      type(mqc_molecule_data)::molData
      type(mqc_pscf_wavefunction)::wavefunction
      type(mqc_scf_integral),dimension(:),allocatable::moCoeff,density
      type(mqc_scf_integral),dimension(3)::dipole
!
!     Format Statements
!
 1000 Format(1x,'Enter Test program force_02.')
 1010 Format(1x,'Matrix File: ',A,/)
 1100 Format(1x,'nAtoms    =',I4,6x,'nBasis  =',I4,6x,'nBasisUse=',I4,/,  &
             1x,'nElectrons=',I4,6x,'nElAlpha=',I4,6x,'nElBeta  =',I4)
 5000 Format(1x,'Time (',A,'): ',f8.1,' s.')
 8999 Format(/,1x,'END OF program force_02.')
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
      write(*,*)
!
!     Check if input matrix file is restricted or unrestricted
!
      call GMatrixFile1%getArray('ALPHA MO COEFFICIENTS',mqcVarOut=CAlpha1)
      if(GMatrixFile1%isUnrestricted()) then
        call GMatrixFile1%getArray('BETA MO COEFFICIENTS',mqcVarOut=CBeta1)
      else
        CBeta1 = CAlpha1

!
!     Allocate Molecular Orbital Coefficients and Densities
!     The 'mqc_scf_integral' type stores matrices in a vector  
!     Change the dimensions of vector allocated on number of input mat files
!     ...Check with Hrant
!

allocate(moCoeff(1))
allocate(density(1))

      call GMatrixFile%getESTObj('dipole x',est_integral=dipole(1))
      call GMatrixFile%getESTObj('dipole y',est_integral=dipole(2))
      call GMatrixFile%getESTObj('dipole z',est_integral=dipole(3))
      call Gmatrixfile%getESTObj('mo coefficients',est_integral=moCoeff(1))
      call GmatrixFile%getESTObj('density',est_integral=density(1))
!     Subroutine 'getMolData' collects a bunch of stuff from the matrix file
!     what we care about are the atomic charges and cartesian coordinates.
      call GmatrixFile%getMolData(molData)
!
!     Obtain nuclear dipole moment, classical component of total dipole moment.
!
      nuclear_dipole = matmul(transpose(molData%Nuclear_Charges),& 
        transpose(molData%Cartesian_Coordinates))
      call nuclear_dipole%print(iOut,"Nuclear Dipole") 
!
!     Initialize total dipole moment vector and compute.
!
      call tdm%init(3)
      do j = 1,3
         call tdm%put((-1)*contraction(density(1),dipole(j))+nuclear_dipole%at(j),j)
      enddo
      call tdm%print(iOut,'Total Dipole Moment')

!
!     Compute dipole moment from the 'CI_Dipole' routine
!
!     call check       

  999 Continue
      call cpu_time(timeEnd)
      write(iOut,5000) 'TOTAL JOB TIME',timeEnd-timeStart
      write(iOut,8999)
      end program force_02


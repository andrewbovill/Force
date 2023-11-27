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
      integer(kind=int64)::nCommands,iPrint=0,nAtoms,nBasis, &
        nBasisUse,nElectrons,nElectronsAlpha,nElectronsBeta, &   
        nOcc,nVirt,nMOs,nOV,iDetRef
      integer(kind=int64)::i,j
!     Andrew integer arrays for singles and doubles
      integer(kind=int64),dimension(:),allocatable::iDetSingles,IDetDoubles
      real(kind=real64)::timeStart,timeEnd,test
!     Andrew conversion factor from a.u.s to Debyes
      real(kind=real64),parameter:: scale_debye=2.54158025294
      real(kind=real64),dimension(:),allocatable::moEnergiesAlpha,moEnergiesBeta 
      type(MQC_Variable)::ERIs,mqcTmpArray,CAlpha,CBeta
      character(len=512)::matrixFilename
!     Andrew dipole vectors in atomic units
      type(mqc_vector)::nuclear_dipole_au,tdm_au,tdm_ci_au
!     Andrew dipole vectors in Debyes
      type(mqc_vector)::nuclear_dipole_db,tdm_db,tdm_ci_db
      type(mqc_gaussian_unformatted_matrix_file)::GMatrixFile
      type(mqc_molecule_data)::molData
      type(mqc_pscf_wavefunction)::wavefunction
      type(mqc_scf_integral),dimension(:),allocatable::moCoeff,density
      type(mqc_scf_integral),dimension(3)::dipole

!
!     Format Statements
!

 1000 Format(1x,'Enter Test program force_02.')
 1010 Format(1x,'Matrix File: ',A,/)
 1020 Format(1x,'nAtoms    =',I4,6x,'nBasis  =',I4,6x,'nBasisUse=',I4,/,  &
             1x,'nElectrons=',I4,6x,'nElAlpha=',I4,6x,'nElBeta  =',I4)
 1030 Format(1x,'nMos      =',I4,6x,'nOcc    =',I4,6x,'nVirt    =',I4,/,  &
             1x,'nOv       =',I4)
 1040 format(1x,a,': ',b31)
 1050 format(1x,a,1x,i5,': ',b31)
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
      write(IOut,1020) nAtoms,nBasis,nBasisUse,nElectrons,  &
        nElectronsAlpha,nElectronsBeta
      write(*,*)
!
!     Check if input matrix file is restricted or unrestricted
!
      call GMatrixFile%getArray('ALPHA MO COEFFICIENTS',mqcVarOut=CAlpha)
      if(GMatrixFile%isUnrestricted()) then
        call GMatrixFile%getArray('BETA MO COEFFICIENTS',mqcVarOut=CBeta)
      else
        CBeta = CAlpha
      endif

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

      call tdm_db%print(iOut,'Total Dipole Moment in atomic units')
!
!     Compute dipole moment from the 'CI_Dipole' routine
!     Obtain first the singly substituted determinats and store in array
!

      nMos = nBasisUse
      nOcc = nElectronsAlpha
      nVirt = nMOs-nOcc
      nOV = nOcc*nVirt

      write(iOut,1030) nMos,nOcc,nVirt,nOV
      Allocate(iDetSingles(nOV))
!
!     Build Reference Determinant and Singles list
!
      call ref_det(nMos,nOcc,iDetRef)
      call build_singles(nMos,nOcc,nVirt,nOV,iDetRef,iDetSingles)

      write(iOut,1040) 'Reference',iDetRef
      do i = 1,nOV
        write(iOut,1050) 'Singles',i,iDetSingles(i)
      enddo 


  999 Continue
      call cpu_time(timeEnd)
      write(iOut,5000) 'TOTAL JOB TIME',timeEnd-timeStart
      write(iOut,8999)
      end program force_02


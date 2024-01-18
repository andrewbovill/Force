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
        nBasisUse,nElec,nAlpha,nBeta, &   
        nOcc,nVirt,nMOs,nOV,nA,nB
      integer(kind=int64)::i,j,iDetRef
!     Andrew integer arrays for singles and doubles
      real(kind=real64)::timeStart,timeEnd,test, temp_scalar
!     Andrew conversion factor from a.u.s to Debyes
      real(kind=real64),parameter:: scale_debye=2.54158025294
      character(len=512)::matrixFilename
      type(mqc_vector)::nuclear_dipole_au,tdm_au,tdm_ci_au !     Andrew dipole vectors in atomic units
      type(mqc_vector)::nuclear_dipole_db,tdm_db,tdm_ci_db !     Andrew dipole vectors in Debyes
      type(mqc_gaussian_unformatted_matrix_file)::GMatrixFile
      type(mqc_molecule_data)::molData
      type(mqc_scf_integral),dimension(:),allocatable::density,moCoeff,overlap
      type(mqc_pscf_wavefunction)::wavefunction
      type(mqc_scf_integral),dimension(3)::dipole
!     Andrew --Holds CI_Dipole_moment matrix
      type(mqc_matrix),dimension(3)::CI_Dipole
      type(mqc_matrix)::Nfi_mat
      type(mqc_vector)::Nfi_vec,CI_Dipole_Vec
      type(mqc_determinant)::det
      integer, dimension(1) :: SingleArray = [1]
      integer, dimension(:),allocatable :: iDetSingles
!
!     Format Statements
!

 1000 Format(1x,'Enter Test program force_02.')
 1010 Format(1x,'Matrix File: ',A,/)
 1020 Format(1x,'nAtoms    =',I4,6x,'nBasis  =',I4,6x,'nBasisUse=',I4,/,  &
             1x,'nElec=',I4,6x,'nElAlpha=',I4,6x,'nElBeta  =',I4)
 1030 Format(1x,'nMos      =',I4,6x,'nOcc    =',I4,6x,'nVirt    =',I4,/,  &
             1x,'nOv       =',I4)
 2000 format(1x,a,': ',b31)
 2100 format(1x,a,1x,i5,': ',b31)
 2200 format(1x,a,1x,i5,': ',I5)
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
      nElec = Int(GMatrixFile%getVal('nelectrons'))
      nAlpha = Int(GMatrixFile%getVal('nAlpha'))
      nBeta = Int(GMatrixFile%getVal('nBeta'))
      write(IOut,1020) nAtoms,nBasis,nBasisUse,nElec,  &
        nAlpha,nBeta
      write(*,*)
!
!     Check if input matrix file is restricted or unrestricted
!

allocate(moCoeff(1))
allocate(density(1))

      call GMatrixFile%getESTObj('dipole x',est_integral=dipole(1))
      call GMatrixFile%getESTObj('dipole y',est_integral=dipole(2))
      call GMatrixFile%getESTObj('dipole z',est_integral=dipole(3))
      !call GMatrixFile%getESTObj('overlap',est_integral=overlap(1))
      call Gmatrixfile%getESTObj('mo coefficients',est_integral=moCoeff(1))
      call GmatrixFile%getESTObj('density',est_integral=density(1))
      call GmatrixFile%getESTObj('wavefunction',wavefunction)
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

      call tdm_db%print(iOut,'Total Dipole Moment in Debyes')

!
!     Compute dipole moment from the 'CI_Dipole' routine
!

      nMos = nBasisUse
      nOcc = nAlpha
      nVirt = nMOs-nOcc
      nOV = nOcc*nVirt
!
!     Call 'Single Det' to build integer values for all single subs
!
      allocate(iDetSingles(nOV))
      call SingleDet(nOcc,nVirt,nOV,nMOs,IDetRef,iDetSingles)
      write(iOut,2000) 'Reference', iDetRef
      do i = 1,nOv
        write(iOut,2100) 'Singles',i,iDetSingles(i)
        write(iOut,2200) 'Singles',i,iDetSingles(i)
      end do

      write(iOut,1030) nMos,nOcc,nVirt,nOV
!
!     Calling CI_Dipole_build routine to build out mqc_matrix object
!       
      call trci_dets_string(iOut,1,nBasis,nAlpha,nBeta, &
        SingleArray,det)

      CI_Dipole = CI_Dipole_build(moCoeff(1),wavefunction,dipole,nBasis, & 
          nAlpha,nBeta,det) 
!
!     Initialize Non_Orthogonal Vector to be nOV long
!     Vector of overlap values between groundstate and all single determinants

      Nfi_vec = NO_Overlap(wavefunction,moCoeff(1),det,nBasis,nAlpha,nBeta, &
        nOV,iDetSingles)

      call Nfi_vec%print(iOut,"Nonorthogonal vector") 
!
!     Turn density into mqc_matrix type object to contract with CI_dipole
!     This only works if the job is unrestricted
!
     
      call tdm_ci_au%init(3)
      do i = 1,3
        temp_scalar = 0.0
        do j = 1,(nOv+1)      
          temp_scalar = temp_scalar + CI_Dipole(i)%at(1,j)*Nfi_vec%at(j) 
        end do
        write(*,*) "temp_scalar after",temp_scalar
        call tdm_ci_au%put((-1)*temp_scalar,i)
      enddo

      call tdm_ci_au%print(iOut,'CI Total Dipole Moment in atomic units')

      call tdm_ci_db%init(3)
      do j = 1,3
         call tdm_ci_db%put(tdm_au%at(j)*scale_debye,j)
      enddo

      call tdm_ci_db%print(iOut,'Total Dipole Moment in Debyes')

  999 Continue
      call cpu_time(timeEnd)
      write(iOut,5000) 'TOTAL JOB TIME',timeEnd-timeStart
      write(iOut,8999)
      end program force_02


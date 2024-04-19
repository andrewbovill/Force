INCLUDE 'test_ci_mod.f03'
      program test_ci
!     -A. J. Bovill, 2023.
!
!     This is to test the 'mqc_build_ci' hamiltonian routine between the latests
!     version of mqc (as of march 3rd 2024) and a version before any updates to
!     the mqc_build_ci hamiltonian routine in 2024

!     Old commit I'm checking against is :
!     66fb501f66a7ccd5df104250bb75b7a4c5c5adcf
!     
!     To test different mqc_build_ci_Hamiltonian routine, uncomment one of the
!     many combinations I made to construct the "CI_Dipole"


!     Bugs as of so far.
!     1. Newest version of MQC produces a seg fault error with just a general determinant of 
!     all possibles combinations in bra and ket (gen_det str). 
!     gen_det_string works fine with older commit

!     2. CI_Dipole print routine i.e. '|a11110b>' does not print out correctly
!     with new version and different substitutions in bra and ket. Flush(iOut)
!     did not work

!     3. Certain combinations are not being produced. For example i can produce
!     a vector of CI_Dipoles between the reference and all singles, but I cannot
!     produce a matrix of the reference and singles in the bra and either the
!     singles in the ket or say the reference and singles in the ket.
!     Not sure if bug or inputing in incorretly.
!    
!     

!     USE Connections

!
      use test_ci_mod
!
!     Variable Declarations
!
      implicit none
      integer(kind=int64)::nCommands,iPrint=4,nAtoms,nBasis, &
        nBasisUse,nElec,nAlpha,nBeta,i,j
      real(kind=real64) ::timestart,timeend
      character(len=512)::matrixFilename1,matrixFilename2
      type(mqc_gaussian_unformatted_matrix_file)::GMatrixFile1,GMatrixFile2
      type(mqc_molecule_data)::molData
      type(mqc_scf_integral),dimension(:),allocatable::density,moCoeff
      real(kind=real64),parameter:: scale_debye=2.54158025
      type(mqc_vector)::nuclear_dipole_au,tdm_au,tdm_ci_au !     Andrew dipole vectors in atomic units
      type(mqc_vector)::nuclear_dipole_db,tdm_db,tdm_ci_db !     Andrew dipole vectors in Debyes
      type(mqc_pscf_wavefunction)::wavefunction_1,wavefunction_2
      type(mqc_scf_integral),dimension(3)::dipole,dipoleMO
      type(mqc_scf_integral)::overlap,moCoeff_swap
      type(mqc_matrix),dimension(3)::CI_Dipole
      type(mqc_matrix)::Nfi_mat_SD,Nfi_mat_DD,Nfi_mat_TD,Mij
      type(mqc_matrix)::bra_occ,ket_occ
      type(mqc_vector)::Nfi_vec_S0,Nfi_vec_D0,Nfi_vec_T0,CI_Dipole_Vec,test_vec
      type(mqc_scalar)::Nij
!     Different determinant strings for different combinations to feed into
!     MQC_Build_CI Hamiltonian routine and trci_det_strings.
      type(mqc_determinant)::det_0,det_1,det_2,det_3
      integer(kind=int64),dimension(:),allocatable::Ref_Det,Ref_Single_Det,Single_Det,Double_Det,Triple_Det
      logical :: debug=.false.
      type(mqc_vector)::aString,bString
      real(kind=real64)::temp
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
      if(.not.mqc_version_check(newerThanMajor=24,newerThanMinor=2,newerThanRevision=2))  &
        call mqc_error('MQCPack version is too old.')
!
!     Open the Gaussian matrix file and load the number of atomic centers.
!
 
      nCommands = command_argument_count()
      if(nCommands.lt.2.or.nCommands.ge.3) &
        call mqc_error('Only 2 matrix file is inputted.')
      call get_command_argument(1,matrixFilename1)
      call get_command_argument(2,matrixFilename2)
      call GMatrixFile1%load(matrixFilename1)
      write(IOut,1010) 1,TRIM(matrixFilename1)
      write(*,*) "Issues"
      call GMatrixFile2%load(matrixFilename2)
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

allocate(moCoeff(2))
allocate(density(2))

      call GMatrixFile1%getESTObj('dipole x',est_integral=dipole(1))
      call GMatrixFile1%getESTObj('dipole y',est_integral=dipole(2))
      call GMatrixFile1%getESTObj('dipole z',est_integral=dipole(3))
      call GMatrixFile1%getESTObj('mo coefficients',est_integral=moCoeff(1))
      call GMatrixFile1%getESTObj('scf density',est_integral=density(1))
      call GMatrixFile1%getESTObj('wavefunction',wavefunction_1)

      call GMatrixFile2%getESTObj('mo coefficients',est_integral=moCoeff(2))
      call GMatrixFile2%getESTObj('scf density',est_integral=density(2))
      call GMatrixFile2%getESTObj('wavefunction',wavefunction_2)
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
      Ref_Single_Det = [0,1]
      Single_Det = [1]
      Double_Det = [2]
      Triple_Det = [3]
!
!     Initialize all determinants.
!

      flush(iOut)
      write(*,*) "Det_0"
      call trci_dets_string(iOut,0,nBasis,nAlpha,nBeta,Ref_Single_Det,det_0)
      write(*,*) "Det_1"
      call trci_dets_string(iOut,0,nBasis,nAlpha,nBeta,Single_det,det_1)
      write(*,*) "Det_2"
      call trci_dets_string(iOut,0,nBasis,nAlpha,nBeta,Double_Det,det_2)
      write(*,*) "Det_3"
      call trci_dets_string(iOut,0,nBasis,nAlpha,nBeta,Triple_Det,det_3)
      flush(iOut)
          
     !  To check overlap between same dets 
      overlap = wavefunction_1%overlap_matrix
      bra_occ=mqc_integral_output_block(moCoeff(1)%orbitals('occupied',[nAlpha],[nBeta]),'full')
      ket_occ=mqc_integral_output_block(moCoeff(1)%orbitals('occupied',[nAlpha],[nBeta]),'full')
      Mij = matmul(matmul(dagger(bra_occ),overlap%getBlock("full")),ket_occ)
      Nij = abs(Mij%det())
      temp = Nij
      write(*,*) "God check the overlap!: ", temp

      temp = 0.0
     !  To check overlap between different dets 
      overlap = wavefunction_1%overlap_matrix
      bra_occ=mqc_integral_output_block(moCoeff(1)%orbitals('occupied',[nAlpha],[nBeta]),'full')
      moCoeff_swap = moCoeff(2)%swap([1,2])
      ket_occ=mqc_integral_output_block(moCoeff_swap%orbitals('occupied',[nAlpha],[nBeta]),'full')
      Mij = matmul(matmul(dagger(bra_occ),overlap%getBlock("full")),ket_occ)
      Nij = abs(Mij%det())
      temp = Nij
      write(*,*) "God check the overlap must be different!: ", temp

  999 Continue
      call cpu_time(timeEnd)
      write(iOut,5000) 'TOTAL JOB TIME',timeEnd-timeStart
      write(iOut,8999)
      end program test_ci


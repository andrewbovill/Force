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
      character(len=512)::matrixFilename
      type(mqc_gaussian_unformatted_matrix_file)::GMatrixFile
      type(mqc_molecule_data)::molData
      type(mqc_scf_integral),dimension(:),allocatable::density,moCoeff
      real(kind=real64),parameter:: scale_debye=2.54158025
      type(mqc_vector)::nuclear_dipole_au,tdm_au,tdm_ci_au !     Andrew dipole vectors in atomic units
      type(mqc_vector)::nuclear_dipole_db,tdm_db,tdm_ci_db !     Andrew dipole vectors in Debyes
      type(mqc_pscf_wavefunction)::wavefunction
      type(mqc_scf_integral),dimension(3)::dipole,dipoleMO
      type(mqc_matrix),dimension(3)::CI_Dipole
!     Different determinant strings for different combinations to feed into
!     MQC_Build_CI Hamiltonian routine and trci_det_strings.
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
      if(nCommands.lt.1.or.nCommands.ge.2) &
        call mqc_error('Only one matrix file is inputted.')
      call get_command_argument(1,matrixFilename)
      call GMatrixFile%load(matrixFilename)
      write(IOut,1010) 1,TRIM(matrixFilename)
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
      call GMatrixFile%getESTObj('mo coefficients',est_integral=moCoeff(1))
      call GMatrixFile%getESTObj('scf density',est_integral=density(1))
      call GMatrixFile%getESTObj('wavefunction',wavefunction)

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
      call gen_det_str(iOut,4,nBasis,nAlpha,nBeta,det_3)
      flush(iOut)

      dipoleMO = dipole_expectation_value(moCoeff(1),dipole,moCoeff(1))

!
!     Andrew terminates printing out whole CI determinant index *bug*
!     Note --- if you want to test with older version, you need UHF=.true. as an
!     arguement before, CI_Hamiltonian

!     Note this is to test new version of mqc_build_ci_hamiltonian
!     call wavefunction%nbasis%print(iOut,"nbasis")
write (*,*) "Andrew is right"
      call dipoleMO(1)%print(6,"checking dipoleMO 1")
      call dipoleMO(2)%print(6,"checking dipoleMO 2")
      call dipoleMO(3)%print(6,"checking dipoleMO 3")

!     do i=1,3
!        call mqc_build_ci_hamiltonian(iOut,4,wavefunction%nBasis,det_3,&
!          dipoleMO(i),CI_Hamiltonian=CI_Dipole(i))
!        call CI_Dipole(i)%print(iOut,"CI Dipole")
!     enddo
write (*,*) "Andrew is wrong"
!     Note this is to test old version mqc_build_ci_hamiltonian
!     call wavefunction%nbasis%print(iOut,"nbasis")
!     do i=1,3
!        call mqc_build_ci_hamiltonian(iOut,iPrint,wavefunction%nBasis,det_3,&
!          dipoleMO(i),UHF=.false.,CI_Hamiltonian=CI_Dipole(i))
!        call CI_Dipole(i)%print(iOut,"CI Dipole")
!     enddo

!     Below is the commented out CI dipole routine to manipualte to do
!     different bras and kets
!     This is a single reference in the bra and singles in the ket. 
!     DOES WORK!
      do i=1,3
         call mqc_build_ci_hamiltonian(iOut,4,wavefunction%nBasis,det_0,&
           dipoleMO(i),CI_Hamiltonian=CI_Dipole(i),Subs=Ref_Det,Dets2=det_1,Subs2=Single_Det,doS2=.false.)
         call CI_Dipole(i)%print(iOut,"CI Dipole")
      enddo

!     This is a single reference AND singles in the bra and singles in the ket.
!     DOES NOT WORK! (Seg fault)
!     do i=1,3
!        call mqc_build_ci_hamiltonian(iOut,4,wavefunction%nBasis,det_0,&
!          dipoleMO(i),CI_Hamiltonian=CI_Dipole(i),Subs=Ref_Single_Det,Dets2=det_1,Subs2=Single_Det,doS2=.false.)
!        call CI_Dipole(i)%print(iOut,"CI Dipole")
!     enddo

  999 Continue
      call cpu_time(timeEnd)
      write(iOut,5000) 'TOTAL JOB TIME',timeEnd-timeStart
      write(iOut,8999)
      end program test_ci


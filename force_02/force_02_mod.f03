      module force_02_mod
!
!     This module supports the program force
!
!     -A. J. Bovill, 2023.
!
!
!     USE Connections
!
      use mqc_general
      use mqc_molecule
      use mqc_gaussian
      use mqc_algebra2
      use mqc_algebra
      use iso_fortran_env
      use OMP_LIB
!
!     Variable Declarations
!
      implicit none
      integer,parameter::IOut=6
!
!
!     Module Procedures
!
      CONTAINS

      subroutine ref_det(nMos,nOcc,iDetRef)

      integer(kind=int64),intent(in)::nMOs,nOcc
      integer(kind=int64),intent(out)::iDetRef
      integer(kind=int64)::i
 
!     This version of the program uses intrinsic integers to store the
!     determinant bit strings. So, for now, we limit the number of MOs to 31.
 
      if(nMOs.gt.31) call mqc_error('More than 31 MOs requested. NYI.')
 
!     Set the reference determinant string in iDetRef.
 
      iDetRef = 0
      do i = 0,nOcc-1
        iDetRef = IBSet(iDetRef,i)
      endDo

      end subroutine ref_det

      subroutine build_singles(nMos,nOcc,nVirt,nOV,iDetRef,iDetSingles)

      integer(kind=int64),intent(in)::nOcc,nMOs,nVirt,nOV,iDetRef
      integer(kind=int64),dimension(:),intent(inout)::iDetSingles
      integer(kind=int64)::i,ia,ii

 
!     This version of the program uses intrinsic integers to store the
!     determinant bit strings. So, for now, we limit the number of MOs to 31.
 
      if(nMOs.gt.31) call mqc_error('More than 31 MOs requested. NYI.')

      i = 0
      do ii = 0,nOcc-1
        do ia = nOcc,nMOs-1
          i = i + 1
          iDetSingles(i) = IBClr(iDetRef,ii)
          iDetSingles(i) = IBSet(iDetSingles(i),ia)
        endDo
      endDo

      end subroutine build_singles
!
!     Andrew build out CI_hamiltonian
!
        function dipole_expectation_value(bra,dipole,ket) result(dipoleEV)
!
!Transforms the Atomic Orbital basis dipole operator provided in the Gaussian
!output files to the Molecular orbital basis.
!
        implicit none

        type(mqc_scf_integral),dimension(3),intent(in)::dipole
        type(mqc_scf_integral),intent(in)::bra,ket
        type(mqc_scf_integral),dimension(3)::dipoleEV
        integer(kind=int64)::i

!       do i = 1,3
!               dipoleEV(i)=matmul(matmul(dagger(bra),dipole(i)),ket)
!       enddo

      end function dipole_expectation_value

      function CI_Dipole_build(moCoeff,wavefunction,dipole,iDetSingles,nBasis, & 
          nElectronsAlpha,nElectronsBeta) result(CI_Dipole)

      implicit none

      type(mqc_pscf_wavefunction),intent(in)::wavefunction
      type(mqc_scf_integral),dimension(3),intent(in)::dipole
      type(mqc_scf_integral),intent(in)::moCoeff
      integer(kind=int64),dimension(:),intent(in)::iDetSingles
      integer(kind=int64),intent(in)::nBasis,nElectronsAlpha,nElectronsBeta
      type(mqc_matrix),dimension(3),intent(out)::CI_Dipole
      type(mqc_matrix)::tmpmat
      type(mqc_scf_integral),dimension(3)::dipoleMO
      integer(kind=int64)::i,j
      type(mqc_determinant)::det
      type(mqc_scalar)::mqcnBasis
      type(mqc_vector)::subs
      integer(kind=int64)::iPrint=4

      mqcnBasis = nBasis
!
!     Call trci_det_strings to get determinant, note "iPrint=4" prints alpha
!     strings as binary representation
!

!     call gen_det_str(iOut,iPrint,nBasis,nElectronsAlpha,nElectronsBeta,det)
      write(*,*)
      write(*,*) "Andrew printing out idetSingles"
      do i = 1,10
        write(*,*) idetsingles(i)
      end do
      write(*,*) size(idetsingles)
!
!     Lee -- I'm having difficulty using the trci_dets function to only obtain
!     singly substituted determinants for any matrix file that I call, I believe 
!     the iDetSingles array should be the correct type of array going into your
!     program... but the output is only a single element
! 
!     I understand that "Alpha_string" and "Beta_String" are matrices not
!     arrays due to needing more thant 32 bits to describe a determinant, but I
!     am unsure how to print out only the single substitutions, how exactly can
!     I do this properly? 

!     This commented out part here is for a general case for fullci dets that does work
!     call gen_det_str(iOut,iPrint,nBasis,nElectronsAlpha,nElectronsBeta,det)

      call trci_dets_string(iOut,4,nBasis,nElectronsAlpha,nElectronsBeta, &
        idetsingles,det)
!
!     Print out j which should match number of single substituted determinant
!     combos
!
      j = 0
      j = det%nDets
      write(*,*) j
!
!     Print out Alpha and beta strings to debug against, note both are matrices
!
      call det%Strings%Alpha%print(iOut,"Alpha strings")
      call det%Strings%Beta%print(iOut,"Beta strings")

!
!     Transform from AO to MO basis
!
      dipoleMO = dipole_expectation_value(moCoeff,dipole,moCoeff)
      
      do i=1,3
!     Lee -- This part is giving the following error regardless if I
!     use 'gen_det_str' or trci_det_str for a uhf calculation
!
!     The error is 'MQC ERROR: Slater_Condon only implemented for  spin or space
!     one-particle integrals
!
         call mqc_build_ci_hamiltonian(iOut,iPrint,mqcnBasis,det,&
              dipoleMO(i),UHF=.true.,CI_Hamiltonian=CI_Dipole(i))
         call CI_Dipole(i)%print(iOut,"CI Dipole")
      enddo
        
      end function CI_Dipole_build

      end module force_02_mod

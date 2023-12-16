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
!
!     Build out CI_hamiltonian for single substituted determinants only
!
      function dipole_expectation_value(bra,dipole,ket) result(dipoleEV)
!
!     Transforms the Atomic Orbital basis dipole operator provided in the Gaussian
!     output files to the Molecular orbital basis.
!
      implicit none

      type(mqc_scf_integral),dimension(3),intent(in)::dipole
      type(mqc_scf_integral),intent(in)::bra,ket
      type(mqc_scf_integral),dimension(3)::dipoleEV
      integer(kind=int64)::i

      do i = 1,3
              dipoleEV(i)=matmul(matmul(dagger(bra),dipole(i)),ket)
      enddo
      write(*,*) "Andrew checking dipole EV(1)"

      call dipoleEV(1)%print(iOut,'dipolev1')
      
      write(*,*) "Andrew checking dipole EV(1) done"

      end function dipole_expectation_value

      function CI_Dipole_build(moCoeff,wavefunction,dipole,nBasis, & 
          nElectronsAlpha,nElectronsBeta,det) result(CI_Dipole)

      implicit none

      type(mqc_pscf_wavefunction),intent(in)::wavefunction
      type(mqc_scf_integral),dimension(3),intent(in)::dipole
      type(mqc_scf_integral)::moCoeff
      integer(kind=int64),intent(in)::nBasis,nElectronsAlpha,nElectronsBeta
      type(mqc_matrix),dimension(3),intent(out)::CI_Dipole
      type(mqc_scf_integral),dimension(3)::dipoleMO
      integer(kind=int64)::i,j
      type(mqc_determinant),intent(in)::det
      type(mqc_scalar)::mqcnBasis
      type(mqc_vector)::subs
      integer(kind=int64)::iPrint=4
      integer, dimension(1) :: SingleArray = 1

      mqcnBasis = nBasis
!
!     Call trci_det_strings to get determinant, note "iPrint=4" prints alpha
!     strings as binary representation

!     Note can not get trci_dets_string to work with Ci dipole build
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
      write(*,*) 
      write(*,*) "Andrew starting here 1"

      dipoleMO = dipole_expectation_value(moCoeff,dipole,moCoeff)
      
      write(*,*) 
      write(*,*) "Andrew starting here 2"

!     do i=1,3
!       call mqc_build_ci_hamiltonian(iOut,iPrint,mqcnBasis,det,&
!         dipoleMO(i),UHF=.true.,CI_Hamiltonian=CI_Dipole(i),SingleArray)
!       call CI_Dipole(i)%print(iOut,"CI Dipole")
!     enddo

      do i=1,3
         write(*,*)
         call mqc_build_ci_hamiltonian(iOut,iPrint,mqcnBasis,det,&
              dipoleMO(i),UHF=.true.,CI_Hamiltonian=CI_Dipole(i))
         call CI_Dipole(i)%print(iOut,"CI Dipole")
      enddo
        
      end function CI_Dipole_build

      function NO_Overlap(bra,det,nBasis,nAlpha,nBeta) result(Nfi_mat)

      implicit none

      integer(kind=int64),intent(in)::nAlpha,nBeta,nBasis
      type(mqc_scf_integral),intent(in)::bra
      type(mqc_determinant),intent(in)::det
      type(mqc_matrix),intent(out)::Nfi_mat


      end function NO_Overlap

      end module force_02_mod

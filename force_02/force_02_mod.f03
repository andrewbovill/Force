      module force_02_mod.f03
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

!     Subroutine CI_Dipole_build(IOut,IPrint,nBasis,determinants, &
!         MO_Core_Ham,MO_ERIs,CI_Hamiltonian)

!     implicit none

!     Logical,Intent(In):: uhf


!     write(*,*) "Andrew checking"

!     end subroutine 
      end module force_02_mod.f03

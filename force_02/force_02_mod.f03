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

      subroutine build_singles(nMos,nOcc,nVirt,nOV,iDetRef,IDetSingles)

      integer(kind=int64),intent(in)::nOcc,nMOs,nVirt,nOV,iDetRef
      integer(kind=int64),dimension(:),intent(inout)::IDetSingles
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

      end module force_02_mod

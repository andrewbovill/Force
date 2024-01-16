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

      !call dipoleEV(1)%print(iOut,'dipolev1')
      
      end function dipole_expectation_value

      function CI_Dipole_build(moCoeff,wavefunction,dipole,nBasis, & 
          nElectronsAlpha,nElectronsBeta,det) result(CI_Dipole)

      implicit none

      type(mqc_pscf_wavefunction),intent(in)::wavefunction
      type(mqc_scf_integral),dimension(3),intent(in)::dipole
      type(mqc_scf_integral)::moCoeff
      integer(kind=int64),intent(in)::nBasis,nElectronsAlpha,nElectronsBeta
      type(mqc_matrix),dimension(3)::CI_Dipole
      type(mqc_scf_integral),dimension(3)::dipoleMO
      integer(kind=int64)::i,j
      type(mqc_determinant),intent(in)::det
      integer(kind=int64)::iPrint=4
      integer, dimension(2) :: SingleArray = [0,1]
      type(mqc_scalar)::mqc_nBasis

      mqc_nBasis= nBasis

!     Call trci_det_strings to get determinant, note "iPrint=4" prints alpha
!     strings as binary representation

!
!     Transform from AO to MO basis
!
      dipoleMO = dipole_expectation_value(moCoeff,dipole,moCoeff)

      do i=1,3
         call mqc_build_ci_hamiltonian(iOut,1,mqc_nBasis,det,&
              dipoleMO(i),UHF=.true.,CI_Hamiltonian=CI_Dipole(i),Subs=SingleArray)
         call CI_Dipole(i)%print(iOut,"CI Dipole")
      enddo
      end function CI_Dipole_build

      subroutine SingleDet(nOcc,nVirt,nOV,nMOs,IDetRef,iDetSingles)

      implicit none
      integer::i,ii,ia,nOcc,nMOs,nVirt,nOV,iDetRef
      integer, dimension(nOcc*nVirt) :: iDetSingles

      iDetRef = 0
      do i = 0,nOcc-1
        iDetRef = IBSet(iDetRef,i)
      endDo
!
!     Compute the number of singles substituted determinants and then build them
!     all in the array iDetSingles.
!
      i = 0
      do ii = 0,nOcc-1
        do ia = nOcc,nMOs-1
          i = i + 1
          iDetSingles(i) = IBClr(iDetRef,ii)
          iDetSingles(i) = IBSet(iDetSingles(i),ia)
        endDo
      endDo

      end subroutine SingleDet

     !function NO_Overlap() result(Nfi_mat)
     !
     !implicit none

     !end function NO_Overlap

      end module force_02_mod

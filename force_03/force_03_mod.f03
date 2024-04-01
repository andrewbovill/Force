      module force_03_mod
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

      subroutine SingleDet(nOcc,nVirt,nOV,nMOs,IDetRef,iDetSingles)

      implicit none
      integer::i,ii,ia,nOcc,nMOs,nVirt,nOV,iDetRef
      integer, dimension(nOcc*nVirt) :: iDetSingles

      iDetRef = 0
      do i = 0,nOcc-1
        iDetRef = IBSet(iDetRef,i)
      endDo
 
!     Compute the number of singles substituted determinants and then build them
!     all in the array iDetSingles.
 
      i = 0
      do ii = 0,nOcc-1
        do ia = nOcc,nMOs-1
          i = i + 1
          iDetSingles(i) = IBClr(iDetRef,ii)
          iDetSingles(i) = IBSet(iDetSingles(i),ia)
        endDo
      endDo

      end subroutine SingleDet

      subroutine det_to_swap(iDetSingle,virt,occ,nElec,nBasis)
!
!     This routine reading from the determinant string list returns the orbitals
!     to swap in the "swap" subroutine from the mqc_est_obj wavefunction
!

      implicit none
      integer(kind=int64),intent(in) :: iDetSingle,nElec,nBasis
      integer(kind=int64) :: iDetRef,iDetSwap,i,virt,occ
      logical::bit_test

      iDetRef = 0
      do i = 0,nElec-1
        iDetRef = IBSet(iDetRef,i)
      endDo
!
!     IDet swap turns on 1 where differences are located and 0
!     where the reference and single determinant are the same
!
      iDetSwap = XOR(iDetRef,iDetSingle)
!
!     Now taking the xor and obtaining '100001' I need a routine to go through
!     the bit and count up the swaps
!
      bit_test = .false.
      do i = 0,nElec-1  
        bit_test = BTEST(iDetSwap,i)
        if (bit_test.eqv. .true.) then
          occ = i+1
        end if
        !write(*,*) "the position: ", i ," is on or off: ", bit_test  
      end do

      do i = nElec,nBasis-1
        bit_test = BTEST(iDetSwap,i)
        if (bit_test .eqv. .true.) then
          virt = i+1
        end if
      end do

      end subroutine det_to_swap

      function NO_Overlap(wavefunction_1,wavefunction_2,moCoeff_1,moCoeff_2,det,Swap_Det,nBasis,nAlpha,nBeta,nOV) result(Nfi_vec)
!
!     Returns a vector of the orthogonal elements between either singles,
!     doubles, or triples and a reference determinant (which is either the
!     ground state or excited state
!

      implicit none
      type(mqc_pscf_wavefunction)::wavefunction_1,wavefunction_2
      type(mqc_vector)::Nfi_vec,aString,bString
      type(mqc_matrix)::Mij,bra_occ,ket_occ
      type(mqc_scf_integral)::moCoeff_1,moCoeff_2,overlap,moCoeff_ci
      type(mqc_determinant)::det
      integer(kind=int64),intent(in)::nBasis,nAlpha,nBeta,nOV
      integer(kind=int64)::Nij,occ_swap,virt_swap,i,swap_int
      integer(kind=int64),intent(in),dimension(:)::Swap_Det
      integer(kind=int64)::IPrint=1

!     integer(kind=int64),dimension(nOV)::iDetSingles
!
!     Case statement to generate an array of singles, doubles, or triple swaps
!     depending on input
!     Note: Solely working for systems with 32 electrons total. Will change when
!     working on larger systems
!
      overlap = wavefunction_1%overlap_matrix
!
!     Four cases to call to calculate 
!     case(1) = <S|0> 
!     case(2) = <D|0> 
!     case(3) = <T|0> 
!     wavefunction_1 is bra, wavefunction_2 is ket

      write (*,*) "nOv", nOV

      select case (Swap_Det(1))
      case (1)
        !Andrew -- write statement below is for debug only, remove in final version
        write(*,*) "Case 1 selected"
        ket_occ=mqc_integral_output_block(moCoeff_2%orbitals('occupied',[nAlpha],[nBeta]),'full')
        call Nfi_vec%init(2*nOV)
        do i = 1,nOV
          call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det,Swap_Det)
          swap_int = bString%at(1)
          call det_to_swap(swap_int,virt_swap,occ_swap,nAlpha,nBasis)
          moCoeff_ci = moCoeff_1%swap([occ_swap,virt_swap])
          bra_occ=mqc_integral_output_block(moCoeff_ci%orbitals('occupied',[nAlpha],[nBeta]),'full')
          Mij = matmul(matmul(dagger(bra_occ),overlap%getBlock("full")),ket_occ)
          Nij = abs(Mij%det())
          call Nfi_vec%put(Nij,(i))
        end do
        do i = nOv+1,2*nOV
          call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det,Swap_Det)
          swap_int = aString%at(1)
          call det_to_swap(swap_int,virt_swap,occ_swap,nAlpha,nBasis)
          moCoeff_ci = moCoeff_1%swap([occ_swap,virt_swap])
          bra_occ=mqc_integral_output_block(moCoeff_ci%orbitals('occupied',[nAlpha],[nBeta]),'full')
          Mij = matmul(matmul(dagger(bra_occ),overlap%getBlock("full")),ket_occ)
          Nij = abs(Mij%det())
          call Nfi_vec%put(Nij,(i))
        end do
      case (2)
        write(*,*) "Case 2 selected"
        ket_occ=mqc_integral_output_block(moCoeff_2%orbitals('occupied',[nAlpha],[nBeta]),'full')
        call Nfi_vec%init(2*nOV)
        do i = 1,nOV
          call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det,Swap_Det)
          swap_int = bString%at(1)
          call det_to_swap(swap_int,virt_swap,occ_swap,nAlpha,nBasis)
            do i = 
          moCoeff_ci = moCoeff_1%swap([occ_swap,virt_swap])
          bra_occ=mqc_integral_output_block(moCoeff_ci%orbitals('occupied',[nAlpha],[nBeta]),'full')
          Mij = matmul(matmul(dagger(bra_occ),overlap%getBlock("full")),ket_occ)
          Nij = abs(Mij%det())
          call Nfi_vec%put(Nij,(i))
        end do
        do i = nOv+1,2*nOV
          call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det,Swap_Det)
          swap_int = aString%at(1)
          call det_to_swap(swap_int,virt_swap,occ_swap,nAlpha,nBasis)
          moCoeff_ci = moCoeff_1%swap([occ_swap,virt_swap])
          bra_occ=mqc_integral_output_block(moCoeff_ci%orbitals('occupied',[nAlpha],[nBeta]),'full')
          Mij = matmul(matmul(dagger(bra_occ),overlap%getBlock("full")),ket_occ)
          Nij = abs(Mij%det())
          call Nfi_vec%put(Nij,(i))
        end do
        !call DoubleDet(nOcc,nVirt,nOV,nMOs,IDetRef,iDetSingles)
      case (3)
        !call TripleDet(nOcc,nVirt,nOV,nMOs,IDetRef,iDetSingles)
      case (4)
        !call TripleDet(nOcc,nVirt,nOV,nMOs,IDetRef,iDetSingles)
      case default
         call mqc_error('A single,double,or triple substituted determinant needs to be entered.')
      end select 

      end function NO_Overlap

      end module force_03_mod

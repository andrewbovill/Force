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

      subroutine det_to_swap_1(iDetIn,virt_1,occ_1,nElec,nBasis)
!
!     This routine reading from the determinant string list returns the orbitals
!     to swap in the "swap" subroutine from the mqc_est_obj wavefunction
!

      implicit none
      integer(kind=int64),intent(in) :: iDetIn,nElec,nBasis
      integer(kind=int64) :: iDetRef,iDetSwap,i,virt_1,occ_1
      logical::bit_test

      iDetRef = 0
      do i = 0,nElec-1
        iDetRef = IBSet(iDetRef,i)
      endDo
!
!     IDet swap turns on 1 where differences are located and 0
!     where the reference and single determinant are the same
!
      iDetSwap = XOR(iDetRef,iDetIn)
      write(*,*) iDetSwap
!
!     Now taking the xor and obtaining '100001' I need a routine to go through
!     the bit and count up the swaps
!
      bit_test = .false.
      do i = 0,nElec-1  
        bit_test = BTEST(iDetSwap,i)
        if (bit_test.eqv. .true.) then
          occ_1 = i+1
        end if
        !write(*,*) "the position: ", i ," is on or off: ", bit_test  
      end do

      do i = nElec,nBasis-1
        bit_test = BTEST(iDetSwap,i)
        if (bit_test .eqv. .true.) then
          virt_1 = i+1
        end if
      end do

      end subroutine det_to_swap_1

      subroutine det_to_swap_2(iDetIn,virt_1,virt_2,occ_1,occ_2,nElec,nBasis)
!
!     This routine reading from the determinant string list returns the orbitals
!     to swap in the "swap" subroutine from the mqc_est_obj wavefunction
!

      implicit none
      integer(kind=int64),intent(in) :: iDetIn,nElec,nBasis
      integer(kind=int64) :: iDetRef,iDetSwap,i,j,virt_1,virt_2,occ_1,occ_2
      logical::bit_test

      iDetRef = 0
      do i = 0,nElec-1
        iDetRef = IBSet(iDetRef,i)
      endDo
!
!     IDet swap turns on 1 where differences are located and 0
!     where the reference and single determinant are the same
!
      iDetSwap = XOR(iDetRef,iDetIn)
!
!     Now taking the xor and obtaining '100001' I need a routine to go through
!     the bit and count up the swaps
!
      bit_test = .false.
      do i = 0,nElec-1  
        bit_test = BTEST(iDetSwap,i)
        if (bit_test.eqv. .true.) then
          occ_1 = i+1
          exit
        end if
      end do

      do j = i+1,nElec-1 
        bit_test = BTEST(iDetSwap,j)
        if (bit_test.eqv. .true.) then
          occ_2 = j+1
          exit
        end if
      end do

      do i = nElec,nBasis-1
        bit_test = BTEST(iDetSwap,i)
        if (bit_test.eqv. .true.) then
          virt_1 = i+1
          exit
        end if
      end do

      do j = i+1,nBasis-1 
        bit_test = BTEST(iDetSwap,j)
        if (bit_test.eqv. .true.) then
          virt_2 = j+1
          exit
        end if
      end do

      end subroutine det_to_swap_2

      subroutine det_to_swap_3(iDetIn,virt_1,virt_2,virt_3,occ_1,occ_2,occ_3,nElec,nBasis)
!
!     This routine reading from the determinant string list returns the orbitals
!     to swap in the "swap" subroutine from the mqc_est_obj wavefunction
!

      implicit none
      integer(kind=int64),intent(in) :: iDetIn,nElec,nBasis
      integer(kind=int64) :: iDetRef,iDetSwap,i,j,virt_1,virt_2,virt_3, &
        occ_1,occ_2,occ_3,k
      logical::bit_test

      iDetRef = 0
      do i = 0,nElec-1
        iDetRef = IBSet(iDetRef,i)
      endDo
!
!     IDet swap turns on 1 where differences are located and 0
!     where the reference and single determinant are the same
!
      iDetSwap = XOR(iDetRef,iDetIn)
!
!     Now taking the xor and obtaining '100001' I need a routine to go through
!     the bit and count up the swaps
!
      bit_test = .false.
      do i = 0,nElec-1  
        bit_test = BTEST(iDetSwap,i)
        if (bit_test.eqv. .true.) then
          occ_1 = i+1
          exit
        end if
      end do

      do j = i+1,nElec-1 
        bit_test = BTEST(iDetSwap,j)
        if (bit_test.eqv. .true.) then
          occ_2 = j+1
          exit
        end if
      end do

      do k = i+1,nElec-1 
        bit_test = BTEST(iDetSwap,j)
        if (bit_test.eqv. .true.) then
          occ_3 = k+1
          exit
        end if
      end do

      do i = nElec,nBasis-1
        bit_test = BTEST(iDetSwap,i)
        if (bit_test.eqv. .true.) then
          virt_1 = i+1
          exit
        end if
      end do

      do j = i+1,nBasis-1 
        bit_test = BTEST(iDetSwap,j)
        if (bit_test.eqv. .true.) then
          virt_2 = j+1
          exit
        end if
      end do

      do k = j+1,nBasis-1 
        bit_test = BTEST(iDetSwap,j)
        if (bit_test.eqv. .true.) then
          virt_3 = k+1
          exit
        end if
      end do
      end subroutine det_to_swap_3

      function NO_Overlap_vec(wavefunction_1,wavefunction_2,moCoeff_1,moCoeff_2,det,Swap_Det,nBasis,nAlpha,nBeta,nOcc,nVirt) result(Nfi_vec)
!
!     Returns a vector of the orthogonal elements between either singles,
!     doubles, or triples and a reference determinant (which is either the
!     ground state or excited state
!

      implicit none
      type(mqc_pscf_wavefunction)::wavefunction_1,wavefunction_2
      type(mqc_vector)::Nfi_vec,aString,bString
      type(mqc_matrix)::Mij,bra_occ,ket_occ
      type(mqc_scf_integral)::moCoeff_1,moCoeff_2,overlap,moCoeff_ci_1,moCoeff_ci_2,moCoeff_ci_3
      type(mqc_determinant)::det
      integer(kind=int64),intent(in)::nBasis,nAlpha,nBeta,nVirt,nOcc
      integer(kind=int64)::Nij,occ_swap_1,virt_swap_1,occ_swap_2,virt_swap_2,occ_swap_3,virt_swap_3,i,swap_int
      integer(kind=int64),intent(in),dimension(:)::Swap_Det
      integer(kind=int64)::IPrint=1
      integer(kind=int64):: nOv,nOv2, nOv3 !Total # of Doubles & Triples count

1090  Format(1x,"swap_int at i: ",1x,i3,1x,"has value: ",b31)
2080  Format(1x,"virt_swap_int 1:",1x,i3,1x,"occ_swap_int 1 value:",1x,i3)
2090  Format(1x,"virt_swap_int 1:",1x,i3,1x,"virt_swap_int 2:",&
  1x,i3,1x,"occ_swap_int 1 value:",1x,i3,1x,"occ_swap_int 2 value:",1x,i3)

      overlap = wavefunction_1%overlap_matrix
      
      nOV = nOcc*nVirt
      nOV2 = (((nOcc*(nOcc-1))/2)*((nVirt*(nVirt-1))/2))
      nOV3 = (((nOcc*(nOcc-1)*(nOcc-2))/6)*((nVirt*(nVirt-1)*(nVirt-2))/6))
!
!     3 cases to call to calculate 
!     case(1) = <S|0> 
!     case(2) = <D|0> 
!     case(3) = <T|0> 
!     wavefunction_1 is bra, wavefunction_2 is ket

      write (*,*) "nOv", nOV
      call moCoeff_1%print(iOut,"moCoeff_1")

      select case (Swap_Det(1))
      case (1)
        !Andrew -- write statement below is for debug only, remove in final version
        write(*,*) "Case 1 selected"
        ket_occ=mqc_integral_output_block(moCoeff_2%orbitals('occupied',[nAlpha],[nBeta]),'full')
        call Nfi_vec%init(2*nOV)
        do i = 1,nOV
          call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det,Swap_Det)
          swap_int = bString%at(1)
          call det_to_swap_1(swap_int,virt_swap_1,occ_swap_1,nAlpha,nBasis)
          write(*,1090) i, swap_int
          write(*,2080) virt_swap_1,occ_swap_1
          moCoeff_ci_1 = moCoeff_1%swap([occ_swap_1,virt_swap_1])
          bra_occ=mqc_integral_output_block(moCoeff_ci_1%orbitals('occupied',[nAlpha],[nBeta]),'full')
          Mij = matmul(matmul(dagger(bra_occ),overlap%getBlock("full")),ket_occ)
          Nij = abs(Mij%det())
          call Nfi_vec%put(Nij,(i))
        end do
        do i = nOv+1,2*nOV
          call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det,Swap_Det)
          swap_int = aString%at(1)
          call det_to_swap_1(swap_int,virt_swap_1,occ_swap_1,nAlpha,nBasis)
          moCoeff_ci_1 = moCoeff_1%swap([occ_swap_1,virt_swap_1])
          bra_occ=mqc_integral_output_block(moCoeff_ci_1%orbitals('occupied',[nAlpha],[nBeta]),'full')
          Mij = matmul(matmul(dagger(bra_occ),overlap%getBlock("full")),ket_occ)
          Nij = abs(Mij%det())
          call Nfi_vec%put(Nij,(i))
        end do
      case (2)
        write(*,*) "Case 2 selected"
        ket_occ=mqc_integral_output_block(moCoeff_2%orbitals('occupied',[nAlpha],[nBeta]),'full')
        call Nfi_vec%init(2*nOV2)
        do i = 1,nOV2
          call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det,Swap_Det)
          swap_int = bString%at(1)
          write(*,*)
          write(*,1090) i, swap_int
          call det_to_swap_2(swap_int,virt_swap_1,virt_swap_2,occ_swap_1,occ_swap_2,nAlpha,nBasis)
          write(*,2090) virt_swap_1,virt_swap_2,occ_swap_1,occ_swap_2
          moCoeff_ci_1 = moCoeff_1%swap([occ_swap_1,virt_swap_1])
          moCoeff_ci_2 = moCoeff_ci_1%swap([occ_swap_2,virt_swap_2])
          bra_occ=mqc_integral_output_block(moCoeff_ci_2%orbitals('occupied',[nAlpha],[nBeta]),'full')
          Mij = matmul(matmul(dagger(bra_occ),overlap%getBlock("full")),ket_occ)
          Nij = abs(Mij%det())
          call Nfi_vec%put(Nij,(i))
        end do
        do i = nOv2+1,2*nOV2
          call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det,Swap_Det)
          swap_int = aString%at(1)
          call det_to_swap_2(swap_int,virt_swap_1,virt_swap_2,occ_swap_1,occ_swap_2,nAlpha,nBasis)
          moCoeff_ci_1 = moCoeff_1%swap([occ_swap_1,virt_swap_1])
          moCoeff_ci_2 = moCoeff_ci_1%swap([occ_swap_2,virt_swap_2])
          bra_occ=mqc_integral_output_block(moCoeff_ci_2%orbitals('occupied',[nAlpha],[nBeta]),'full')
          Mij = matmul(matmul(dagger(bra_occ),overlap%getBlock("full")),ket_occ)
          Nij = abs(Mij%det())
          call Nfi_vec%put(Nij,(i))
        end do
        !call DoubleDet(nOcc,nVirt,nOV,nMOs,IDetRef,iDetSingles)
      case (3)
        write(*,*) "Case 3 selected"
        ket_occ=mqc_integral_output_block(moCoeff_2%orbitals('occupied',[nAlpha],[nBeta]),'full')
        call Nfi_vec%init(2*nOV3)
        do i = 1,nOV3
          call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det,Swap_Det)
          swap_int = bString%at(1)
          write(*,*)
          write(*,1090) i, swap_int
          call det_to_swap_3(swap_int,virt_swap_1,virt_swap_2,virt_swap_3,occ_swap_1,occ_swap_2,occ_swap_3,nAlpha,nBasis)
          write(*,2090) virt_swap_1,virt_swap_2,occ_swap_1,occ_swap_2
          moCoeff_ci_1 = moCoeff_1%swap([occ_swap_1,virt_swap_1])
          moCoeff_ci_2 = moCoeff_ci_1%swap([occ_swap_2,virt_swap_2])
          moCoeff_ci_3 = moCoeff_ci_2%swap([occ_swap_3,virt_swap_3])
          bra_occ=mqc_integral_output_block(moCoeff_ci_2%orbitals('occupied',[nAlpha],[nBeta]),'full')
          Mij = matmul(matmul(dagger(bra_occ),overlap%getBlock("full")),ket_occ)
          Nij = abs(Mij%det())
          call Nfi_vec%put(Nij,(i))
        end do
        do i = nOv3+1,2*nOV3
          call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det,Swap_Det)
          swap_int = aString%at(1)
          call det_to_swap_3(swap_int,virt_swap_1,virt_swap_2,virt_swap_3,occ_swap_1,occ_swap_2,occ_swap_3,nAlpha,nBasis)
          moCoeff_ci_1 = moCoeff_1%swap([occ_swap_1,virt_swap_1])
          moCoeff_ci_2 = moCoeff_ci_1%swap([occ_swap_2,virt_swap_2])
          moCoeff_ci_3 = moCoeff_ci_2%swap([occ_swap_3,virt_swap_3])
          bra_occ=mqc_integral_output_block(moCoeff_ci_2%orbitals('occupied',[nAlpha],[nBeta]),'full')
          Mij = matmul(matmul(dagger(bra_occ),overlap%getBlock("full")),ket_occ)
          Nij = abs(Mij%det())
          call Nfi_vec%put(Nij,(i))
        !call TripleDet(nOcc,nVirt,nOV,nMOs,IDetRef,iDetSingles)
        end do
      case (4)
        !call TripleDet(nOcc,nVirt,nOV,nMOs,IDetRef,iDetSingles)
      case default
         call mqc_error('A single,double,or triple substituted determinant needs to be entered.')
      end select 

      end function NO_Overlap_vec

      function NO_Overlap_mat(wavefunction_1,wavefunction_2,moCoeff_1,moCoeff_2,det_bra,det_ket,Swap_Det_Bra,Swap_Det_Ket,& 
          nBasis,nAlpha,nBeta,nOcc,nVirt) result(Nfi_mat)
!
!     Returns a matrix of the orthogonal elements between either singles,
!     doubles, or triples determinant and a doubles determinant (which is 
!     either the ground state or excited state.
!

      implicit none
      type(mqc_pscf_wavefunction)::wavefunction_1,wavefunction_2
      type(mqc_vector)::aString,bString
      type(mqc_matrix)::Mij,bra_occ,ket_occ,Nfi_mat
      type(mqc_scf_integral)::moCoeff_1,moCoeff_2,overlap,moCoeff_ci_1,moCoeff_ci_2,moCoeff_ci_3
      type(mqc_determinant)::det_bra,det_ket
      integer(kind=int64),intent(in)::nBasis,nAlpha,nBeta,nVirt,nOcc
      integer(kind=int64)::Nij,occ_swap_1,virt_swap_1,occ_swap_2,virt_swap_2,occ_swap_3,virt_swap_3,i,swap_int,j
      integer(kind=int64),intent(in),dimension(:)::Swap_Det_Bra,Swap_Det_Ket
      integer(kind=int64)::IPrint=1
      integer(kind=int64):: nOv,nOv2, nOv3 !Total # of Doubles & Triples count

1090  Format(1x,"swap_int at i: ",1x,i3,1x,"has value: ",b31)
2080  Format(1x,"virt_swap_int 1:",1x,i3,1x,"occ_swap_int 1 value:",1x,i3)
2090  Format(1x,"virt_swap_int 1:",1x,i3,1x,"virt_swap_int 2:",&
  1x,i3,1x,"occ_swap_int 1 value:",1x,i3,1x,"occ_swap_int 2 value:",1x,i3)

      overlap = wavefunction_1%overlap_matrix
      
      nOV = nOcc*nVirt
      nOV2 = (((nOcc*(nOcc-1))/2)*((nVirt*(nVirt-1))/2))
      nOV3 = (((nOcc*(nOcc-1)*(nOcc-2))/6)*((nVirt*(nVirt-1)*(nVirt-2))/6))
!
!     3 cases to call to calculate 
!     case(1) = <S|D> 
!     case(2) = <D|D> 
!     case(3) = <T|D> 
!     wavefunction_1 is bra, wavefunction_2 is ket

      write (*,*) "nOv", nOV
      call moCoeff_1%print(iOut,"moCoeff_1")

      select case (Swap_Det_Bra(1))
      case (1)
        !Andrew -- write statement below is for debug only, remove in final version
        write(*,*) "Case 1 selected"
        call Nfi_mat%init(2*nOV,2*nOV2)
        do i = 1,nOV
          call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det_bra,Swap_Det_Bra)
          swap_int = bString%at(1)
          call det_to_swap_1(swap_int,virt_swap_1,occ_swap_1,nAlpha,nBasis)
          moCoeff_ci_1 = moCoeff_1%swap([occ_swap_1,virt_swap_1])
          bra_occ=mqc_integral_output_block(moCoeff_ci_1%orbitals('occupied',[nAlpha],[nBeta]),'full')
          do j = 1,nOV2
            call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det_ket,Swap_Det_Ket)
            swap_int = bString%at(1)
            call det_to_swap_2(swap_int,virt_swap_1,virt_swap_2,occ_swap_1,occ_swap_2,nAlpha,nBasis)
            moCoeff_ci_1 = moCoeff_2%swap([occ_swap_1,virt_swap_1])
            moCoeff_ci_2 = moCoeff_ci_1%swap([occ_swap_2,virt_swap_2])
            ket_occ=mqc_integral_output_block(moCoeff_ci_2%orbitals('occupied',[nAlpha],[nBeta]),'full')
            Mij = matmul(matmul(dagger(bra_occ),overlap%getBlock("full")),ket_occ)
            Nij = abs(Mij%det())
            call Nfi_mat%put(Nij,i,j,'element')
          end do
        end do
        do i = nOv+1,2*nOV
          call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det_bra,Swap_Det_Bra)
          swap_int = aString%at(1)
          call det_to_swap_1(swap_int,virt_swap_1,occ_swap_1,nAlpha,nBasis)
          moCoeff_ci_1 = moCoeff_1%swap([occ_swap_1,virt_swap_1])
          bra_occ=mqc_integral_output_block(moCoeff_ci_1%orbitals('occupied',[nAlpha],[nBeta]),'full')
          do j = nOv2+1,2*nOV2
            call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det_ket,Swap_Det_Ket)
            swap_int = aString%at(1)
            call det_to_swap_2(swap_int,virt_swap_1,virt_swap_2,occ_swap_1,occ_swap_2,nAlpha,nBasis)
            moCoeff_ci_1 = moCoeff_2%swap([occ_swap_1,virt_swap_1])
            moCoeff_ci_2 = moCoeff_ci_1%swap([occ_swap_2,virt_swap_2])
            ket_occ=mqc_integral_output_block(moCoeff_ci_2%orbitals('occupied',[nAlpha],[nBeta]),'full')
            Mij = matmul(matmul(dagger(bra_occ),overlap%getBlock("full")),ket_occ)
            Nij = abs(Mij%det())
            call Nfi_mat%put(Nij,i,j,'element')
          end do
        end do
      case (2)
        write(*,*) "Case 2 selected"
        call Nfi_mat%init(2*nOV2,2*nOV2)
        do i = 1,nOV2
          call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det_bra,Swap_Det_Bra)
          swap_int = bString%at(1)
          call det_to_swap_2(swap_int,virt_swap_1,virt_swap_2,occ_swap_1,occ_swap_2,nAlpha,nBasis)
          moCoeff_ci_1 = moCoeff_1%swap([occ_swap_1,virt_swap_1])
          moCoeff_ci_2 = moCoeff_ci_1%swap([occ_swap_2,virt_swap_2])
          bra_occ=mqc_integral_output_block(moCoeff_ci_2%orbitals('occupied',[nAlpha],[nBeta]),'full')
          do j = 1,nOV2
            call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det_ket,Swap_Det_Ket)
            swap_int = bString%at(1)
            call det_to_swap_2(swap_int,virt_swap_1,virt_swap_2,occ_swap_1,occ_swap_2,nAlpha,nBasis)
            moCoeff_ci_1 = moCoeff_2%swap([occ_swap_1,virt_swap_1])
            moCoeff_ci_2 = moCoeff_ci_1%swap([occ_swap_2,virt_swap_2])
            ket_occ=mqc_integral_output_block(moCoeff_ci_2%orbitals('occupied',[nAlpha],[nBeta]),'full')
            Mij = matmul(matmul(dagger(bra_occ),overlap%getBlock("full")),ket_occ)
            Nij = abs(Mij%det())
            call Nfi_mat%put(Nij,i,j,'element')
          end do
        end do
        do i = nOv2+1,2*nOV2
          call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det_bra,Swap_Det_Bra)
          swap_int = aString%at(1)
          call det_to_swap_2(swap_int,virt_swap_1,virt_swap_2,occ_swap_1,occ_swap_2,nAlpha,nBasis)
          moCoeff_ci_1 = moCoeff_1%swap([occ_swap_1,virt_swap_1])
          moCoeff_ci_2 = moCoeff_ci_1%swap([occ_swap_2,virt_swap_2])
          bra_occ=mqc_integral_output_block(moCoeff_ci_2%orbitals('occupied',[nAlpha],[nBeta]),'full')
          do j = nOv2+1,2*nOV2
            call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det_ket,Swap_Det_Ket)
            swap_int = aString%at(1)
            call det_to_swap_2(swap_int,virt_swap_1,virt_swap_2,occ_swap_1,occ_swap_2,nAlpha,nBasis)
            moCoeff_ci_1 = moCoeff_2%swap([occ_swap_1,virt_swap_1])
            moCoeff_ci_2 = moCoeff_ci_1%swap([occ_swap_2,virt_swap_2])
            ket_occ=mqc_integral_output_block(moCoeff_ci_2%orbitals('occupied',[nAlpha],[nBeta]),'full')
            Mij = matmul(matmul(dagger(bra_occ),overlap%getBlock("full")),ket_occ)
            Nij = abs(Mij%det())
            call Nfi_mat%put(Nij,i,j,'element')
          end do
        end do
      case (3)
        write(*,*) "Case 3 selected"
        call Nfi_mat%init(2*nOV3,2*nOV2)
        do i = 1,nOV3
          call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det_bra,Swap_Det_Bra)
          swap_int = bString%at(1)
          call det_to_swap_3(swap_int,virt_swap_1,virt_swap_2,virt_swap_3,occ_swap_1,occ_swap_2,occ_swap_3,nAlpha,nBasis)
          moCoeff_ci_1 = moCoeff_1%swap([occ_swap_1,virt_swap_1])
          moCoeff_ci_2 = moCoeff_ci_1%swap([occ_swap_2,virt_swap_2])
          moCoeff_ci_3 = moCoeff_ci_2%swap([occ_swap_2,virt_swap_2])
          bra_occ=mqc_integral_output_block(moCoeff_ci_3%orbitals('occupied',[nAlpha],[nBeta]),'full')
          do j = 1,nOV2
            call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det_ket,Swap_Det_Ket)
            swap_int = bString%at(1)
            call det_to_swap_2(swap_int,virt_swap_1,virt_swap_2,occ_swap_1,occ_swap_2,nAlpha,nBasis)
            moCoeff_ci_1 = moCoeff_2%swap([occ_swap_1,virt_swap_1])
            moCoeff_ci_2 = moCoeff_ci_1%swap([occ_swap_2,virt_swap_2])
            ket_occ=mqc_integral_output_block(moCoeff_ci_2%orbitals('occupied',[nAlpha],[nBeta]),'full')
            Mij = matmul(matmul(dagger(bra_occ),overlap%getBlock("full")),ket_occ)
            Nij = abs(Mij%det())
            call Nfi_mat%put(Nij,i,j,'element')
          end do
        end do
        do i = nOv3+1,2*nOV3
          call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det_bra,Swap_Det_Bra)
          swap_int = aString%at(1)
          call det_to_swap_3(swap_int,virt_swap_1,virt_swap_2,virt_swap_3,occ_swap_1,occ_swap_2,occ_swap_3,nAlpha,nBasis)
          moCoeff_ci_1 = moCoeff_1%swap([occ_swap_1,virt_swap_1])
          moCoeff_ci_2 = moCoeff_ci_1%swap([occ_swap_2,virt_swap_2])
          moCoeff_ci_3 = moCoeff_ci_2%swap([occ_swap_2,virt_swap_2])
          bra_occ=mqc_integral_output_block(moCoeff_ci_3%orbitals('occupied',[nAlpha],[nBeta]),'full')
          do j = nOv2+1,2*nOV2
            call mqc_get_strings_at_index(iOut,iPrint,i,aString,bString,wavefunction_1%nBasis,det_ket,Swap_Det_Ket)
            swap_int = aString%at(1)
            call det_to_swap_2(swap_int,virt_swap_1,virt_swap_2,occ_swap_1,occ_swap_2,nAlpha,nBasis)
            moCoeff_ci_1 = moCoeff_2%swap([occ_swap_1,virt_swap_1])
            moCoeff_ci_2 = moCoeff_ci_1%swap([occ_swap_2,virt_swap_2])
            ket_occ=mqc_integral_output_block(moCoeff_ci_2%orbitals('occupied',[nAlpha],[nBeta]),'full')
            Mij = matmul(matmul(dagger(bra_occ),overlap%getBlock("full")),ket_occ)
            Nij = abs(Mij%det())
            call Nfi_mat%put(Nij,i,j,'element')
          end do
        end do
      case default
         call mqc_error('A single,double,or triple substituted determinant needs to be entered.')
      end select 

      end function NO_Overlap_mat

      end module force_03_mod

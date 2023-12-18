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
      write(*,*) "Andrew checking dipole EV(1)"

      call dipoleEV(1)%print(iOut,'dipolev1')
      
      write(*,*) "Andrew checking dipole EV(1) done"

      end function dipole_expectation_value

      function CI_Dipole_build(moCoeff,wavefunction,dipole,nBasis, & 
          nElectronsAlpha,nElectronsBeta,det,mo_ERIS) result(CI_Dipole)

      implicit none

      type(mqc_pscf_wavefunction),intent(in)::wavefunction
      type(mqc_scf_integral),dimension(3),intent(in)::dipole
      type(mqc_scf_integral)::moCoeff
      integer(kind=int64),intent(in)::nBasis,nElectronsAlpha,nElectronsBeta
      type(mqc_matrix),dimension(3)::CI_Dipole
      type(mqc_scf_integral),dimension(3)::dipoleMO
      integer(kind=int64)::i,j
      type(mqc_determinant),intent(in)::det
      type(mqc_scalar)::mqcnBasis
      type(mqc_twoERIs),intent(in)::mo_ERIs
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

      dipoleMO = dipole_expectation_value(moCoeff,dipole,moCoeff)

      do i=1,3
         call mqc_build_ci_hamiltonian(iOut,iPrint,mqcnBasis,det,&
              dipoleMO(i),UHF=.true.,CI_Hamiltonian=CI_Dipole(i),Subs=SingleArray)
         call CI_Dipole(i)%print(iOut,"CI Dipole")
      enddo
      end function CI_Dipole_build

      function det_to_swap(det,A,B,coeff,nbasis) result(excitation)
!
! Takes the determinant strings and the indices of the alpha and beta strings and returns the swapped orbital for the
! given determinant string.
!

      implicit none

      type(mqc_scf_integral)::coeff,excitation
      integer(kind=int64)::A,B,A_init,A_exc,B_init,B_exc,nbasis,i,j,k,l,n,nbit_ints,nA,nB
      type(mqc_determinant)::det
      character(:),allocatable:: char_A_init,char_B_init,char_A_exc,char_B_exc
      Integer(kind=int64),Dimension(:),Allocatable::Alpha_String_1,Alpha_String_2,Beta_String_1, &
          Beta_String_2,A_init_array,A_exc_array,B_init_array,B_exc_array
      excitation = coeff

      nA = mqc_matrix_rows(det%Strings%Alpha)
      nB = mqc_matrix_rows(det%Strings%Beta)

      NBit_Ints = (NBasis/Bit_Size(0))+1
      Allocate(Alpha_String_1(NBit_Ints),Alpha_String_2(NBit_Ints),Beta_String_1(NBit_Ints),Beta_String_2(NBit_Ints))
      Alpha_String_1 = det%Strings%Alpha%vat([A],[1,NBit_Ints])
      Alpha_String_2 = det%Strings%Alpha%vat([nA],[1,NBit_Ints])
      Beta_String_1 = det%Strings%Beta%vat([B],[1,NBit_Ints])
      Beta_String_2 = det%Strings%Beta%vat([nB],[1,NBit_Ints])
! write(*,*) nbit_ints, "nbit_ints"
      do n = 1,nbit_ints
      A_init = Alpha_String_2(n)
      A_exc = Alpha_String_1(n)
      B_init = Beta_string_2(n)
      B_exc = Beta_String_1(n)
      enddo

      call build_swap_list_final(A_init,A_exc,A_init_array,A_exc_array,nbasis)
      call build_swap_list_final(B_init,B_exc,B_init_array,B_exc_array,nbasis)
      
      do i = 1,size(A_init_array)

       if(.not.A_init_array(i).eq.0)then
               excitation = excitation%swap([A_init_array(i),A_exc_array(i)])
       endif
      enddo


       do i = 1,size(B_init_array)

        if(.not.B_init_array(i).eq.0)then
                excitation = excitation%swap([1,1],[B_init_array(i),B_exc_array(i)])
        endif
      enddo

      end function det_to_swap

      subroutine build_swap_list(det_string,array,nbasis)
!
! Helper subroutine for det_to_swap.  Coverts determinant string integers to binary strings.  Reads strings returning an array with
! the index (position) of any "1"s in the string.
!

      integer(kind=int64)::det_string,n,j,nbasis,m
      character(:),allocatable::char_det_string
      integer,allocatable,dimension(:)::array

      allocate(character(len=nbasis)::char_det_string)
      write(char_det_string,'(B0)') det_string

      n=1
      allocate(integer::array(len(trim(char_det_string))))

      array=0

      m=len(trim(char_det_string))
      do j = 1, m
       if(char_det_string(m-j+1:m-j+1)=="1")then
               array(n)=n
              
       endif
       n=n+1
      enddo
      write(*,*) "Andrew build_swap_list complete"
      end subroutine build_swap_list

      subroutine build_swap_list_final(det_string_initial,det_string_final,array_initial,array_final,nbasis)
!
!  Helper subroutine for det_to_swap.  Calls build_swap_list to obtain arrays corresponding to occ and virt orbital swaps.
!  Build_swap_list_final removes cycles from those arrays and otherwise cleans arrays arrays into a usable format.
!

      integer(kind=int64)::det_string_initial,det_string_final,n,j,i,nbasis
      character(:),allocatable::char_det_string_initial,char_det_string_final
      integer,allocatable,dimension(:)::array_initial,array_final,temp_i,temp_f

      call build_swap_list(det_string_initial,array_initial,nbasis)
      call build_swap_list(det_string_final,array_final,nbasis)
      allocate(integer::temp_i(nbasis),temp_f(nbasis))
!     Andrew--- Had to add initialization to 0
      temp_i = 0
      temp_f = 0

      n=1 
      do i=1,size(array_initial)
        if(.not.any(array_initial(i).eq.array_final).and.array_initial(i).ne.0) then
              temp_i(n)=array_initial(i)
              n=n+1
        endif   
      enddo   

      n=1
      do j=1,size(array_final)
       if(.not.any(array_final(j).eq.array_initial).and.array_final(j).ne.0) then
              temp_f(n)=array_final(j)
              n=n+1
       endif   
      enddo   
      array_final = temp_f
      array_initial = temp_i

      end subroutine build_swap_list_final

      function NO_Overlap(bra,bra_coeff,det,nBasis,nAlpha,nBeta,nDet) result(Nfi_mat)

      implicit none

      type(mqc_pscf_wavefunction)::bra,ket
      type(mqc_matrix)::Nfi_mat,bra_occ,ket_occ,Mij
      real(kind=real64)::tempnij
      type(mqc_scalar)::Nij
      type(mqc_determinant),intent(in)::det
      type(mqc_scf_integral)::bra_coeff,ket_coeff,single,overlap,left,right
      integer(kind=int64)::a,b,i,j,nOcc,nA,nB,LA,LB,RA,RB,L,R       
      integer(Kind=int64),intent(in)::nBasis,nAlpha,nBeta,nDet

      overlap = bra%overlap_matrix

      write(*,*) nBasis,"nBasis"
      call overlap%print(iOut,"Overlap")
      
      call Nfi_mat%init(nDet,nDet) 
!
!     Dec 18, 2023 Everything up to this point is working... problem is in loop
!     below
!
      do LA = 1,nA
       do LB = 1,nB
        do RA = 1,nA
         do RB = 1,nB
             L = 1 + (LB-1)*nA + (LA-1)
             R = 1 + (RB-1)*nA + (RA-1)
             left = det_to_swap(det,LA,LB,bra_coeff,nbasis)
             right = bra_coeff
             bra_occ=mqc_integral_output_block(left%orbitals('occupied',[nAlpha],[nBeta]),'full')
             ket_occ=mqc_integral_output_block(right%orbitals('occupied',[nAlpha],[nBeta]),'full')
             Mij = matmul(matmul(dagger(bra_occ),overlap%getBlock("full")),ket_occ)
             Nij = Mij%det()
             Nij = 1.0
             call Nfi_mat%put(Nij,L,R,'element')
             
             enddo
        enddo
       enddo
      enddo

      call Nfi_mat%print(iOut, "Nonorthogonal Overlap")
      end function NO_Overlap


      end module force_02_mod

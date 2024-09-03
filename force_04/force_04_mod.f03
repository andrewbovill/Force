      module force_04_mod
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

      subroutine det_to_swap(det_1,det_2,det_3,nOV,nOV2,nOV3,nElec,nBasis)
!
!     This routine outputs matrices containing all substituted swaps
!     det_1 is size (2,nOV) where first column is occ_swap, second column is
!     virt_swap
!     det_1 is size (4,nOV2) where first 2 columns are occ_swaps, second column
!     are 2 virt_swaps
!     det_3 is size (6,nOV2) where first 3 columns are occ_swaps, second column
!     are 3 virt_swaps
!

      implicit none
      integer(kind=int64),intent(in) :: nOV,nOV2,nOV3,nElec,nBasis
      integer(kind=int64) :: nVirt
      integer(kind=int64),dimension(2,nOV)::det_1
      integer(kind=int64),dimension(4,nOV2),optional::det_2
      integer(kind=int64),dimension(6,nOV3),optional::det_3
      integer::i,j,k,l,m,n,a,b,c

      nVirt = nBasis - nElec

      a = 0
      b = 1
      c = 0

      do i = 1,nElec  
        do j = nElec+1,nBasis
          a = a + 1
          det_1(1,a) = i
          det_1(2,a) = j
        end do
      end do
      a = 0

      if(nElec.ge.2 .and. nVirt.ge.2) then
        do i = 1,nElec  
          do j = nElec+1,nBasis
            do k = i+1,nElec  
              do l = j+1,nBasis
                a = a + 1
                det_2(1,a) = i
                det_2(3,a) = j
                det_2(2,a) = k
                det_2(4,a) = l
              end do
            end do
          end do
        end do
      end if

      if(nElec.ge.3 .and. nVirt.ge.3) then
        do i = 1,nElec  
          do j = nElec+1,nBasis
            do k = i+1,nElec  
              do l = j+1,nBasis
                do m = k+1,nBasis
                  do n = l+1,nBasis
                    a = a + 1
                    det_3(1,a) = i
                    det_3(4,a) = j
                    det_3(2,a) = k
                    det_3(5,a) = l
                    det_3(1,a) = m
                    det_3(6,a) = n
                  end do
                end do
              end do
            end do
          end do
        end do
      end if

      end subroutine det_to_swap

      subroutine get_T_Overlap(PMat1,PMat2,SMat,CMOsKet,nOccKet, &
          nBasis,TD_Overlap)
!
!     This computes the Transition density overlap components of Alpha and Beta
!     to be used to calculate oscillator strength. This module constructs the T
!     Matrix from the following work 
!
!     https://doi.org/10.1063/5.0040454 H.P. Hratchian, H. Harb 2021
!

      implicit none
      type(mqc_variable)::PMat1,PMat2,SMat,CMOsKet, &
        diffDensity,diffDensityEVecs,diffDensityEVals,  &
        tmpMQCvar,tmpMQCvar1,tmpMQCvar2,tmpMQCvar3,TMatrix, &
        SMatEVals,SMatEVecs,SMatrixAOMinusHalf,SMatrixAOHalf
      integer(kind=int64)::nOccKet,nBasis,i
      real(kind=real64),dimension(:),allocatable::vector
      real(kind=real64),intent(out):: TD_Overlap
      integer(kind=int64)::nPlusOne,nMinusOne,iPlusOne,  &
        iMinusOne
      call SMat%eigen(SMatEVals,SMatEVecs)
      tmpMQCvar = SMatEVals%rpower(-0.5)
      SMatrixAOHalf = MatMul(MatMul(SMatEVecs,tmpMQCvar%diag()),TRANSPOSE(SMatEVecs))
      tmpMQCvar = SMatEVals%rpower(-0.5)
      SMatrixAOMinusHalf = MatMul(MatMul(SMatEVecs,tmpMQCvar%diag()),TRANSPOSE(SMatEVecs))

      diffDensity = PMat1 - PMat2
      tmpMQCvar = MatMul(SMatrixAOHalf,MatMul(diffDensity,SMatrixAOHalf))
      call tmpMQCvar%eigen(diffDensityEVals,diffDensityEVecs)

      vector = diffDensityEVals
      do i = 1,nBasis
        if(vector(i).ge.0.999) then
          vector(i) = float(0)
          iPlusOne = i
          nPlusOne = nPlusOne + 1
        endIf
      endDo
      do i = 1,nBasis
        if(vector(i).le.-0.999) then
          vector(i) = float(0)
          iMinusOne = i
          nMinusOne = nMinusOne + 1
        endIf
      endDo

      tmpMQCvar = MatMul(SMatrixAOMinusHalf,diffDensityEVecs)
      TMatrix = MatMul(Transpose(CMOsKet),MatMul(SMat,tmpMQCvar))
!     if(DEBUG) then
!       call TMatrix%print(header='TMatrix')
!       call mqc_print(MatMul(Transpose(TMatrix),TMatrix),header='TMatrix(t).TMatrix')
!     endIf
      tmpMQCvar = TMatrix%subMatrix(newrange1=[1,nOccKet])
      tmpMQCvar2 = vector
      tmpMQCvar1 = MatMul(MatMul(Transpose(tmpMQCvar),tmpMQCvar),tmpMQCvar2%diag())
      tmpMQCvar2 = MQC_Variable_UnitMatrix(nBasis)
      tmpMQCvar3 = tmpMQCvar2 - tmpMQCvar1
!     if(DEBUG) then
!       call tmpMQCvar2%print(header='unit matrix (nBasis)')
!       call tmpMQCvar1%print(header='Tt.T.diagE')
!       call tmpMQCvar3%print(header='I-T(occ)(t).T(occ).delta')
!     endIf
      TD_Overlap = tmpMQCvar3%det()

      end subroutine get_T_Overlap

      end module force_04_mod

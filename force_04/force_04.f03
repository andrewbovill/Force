INCLUDE 'force_04_mp2_mod.f03'
INCLUDE 'force_04_mod.f03'
      program force_04
!     force_04
!     
!     This program is the final version of the Delta-SCF Transition Dipole
!     Moment (TDM)
!
!     This code computes the projected, Mp2, and projected MP2 TDM's
!     In this code we set up a binary string corresponding to a ground state
!     determinant based on the number of alpha and beta electrons.
!     
!     Input for calculation
!     ./force_04.exe groundstate.mat excited state.mat Flag Verbosity
!
!     This code accomplishes the following
!       1. Read in a Gaussian matrix file
!       2. Read the dipole integrals and the HF Particle density matrix.
!       3. Read in the ERI's from a calculation
!       4. Compute dipole moment and magnitude, match against Gaussian output.
!       5. Build single, double, & triple, determinant string list from reference
!       wavefunction
!       6. Compute orthogonal matrix elments between two determinant lists
!       7. Use 'mqc_build_Hamiltonian' routine to build the dipole moment
!       between different determinants
!       Optional arguments
!       8. Compute a final expression for the projected TDM (Flag = 1)
!       9. Compute a final expression for the MP2 TDM (Flag = 2)
!       10. Compute a final expression for the projected TDM MP2 (Flag = 3)
!       11. Compute a final expression for all 3 (Flag = 4)
!
!     Verbosity ranges from 1-4 in order to print out the print level of the
!     calculation
!     -A. J. Bovill, 2024.
!     
!     Future work. I removed bitlogic and CI dipole objects due to limitations
!     on how many electrons can be stored... Will move to back to bit logic when
!     Properly implemented in MQC to handle more than 64 electrons
!


!     USE Connections
!
      use force_04_mod
      use force_04_mp2_mod
!
!     Variable Declarations
!
      implicit none
      type(mqc_gaussian_unformatted_matrix_file)::GMatrixFile1,GMatrixFile2
      character(len=512)::matrixFilename1,matrixFilename2
      integer(kind=int64)::nCommands,iPrint=4,nAtoms,nBasis, &
        nBasisUse,nElec,nAlpha,nBeta,nOcc,nVirt,nMOs,nOV,nOV2,nOV3,nA,nB,nDets
      integer(kind=int64)::i,j
      real(kind=real64)::timeStart,timeEnd,test,tmp_scalar,E2_test,Nij, &
        Nij_a,Nij_b,Dij,scfEnergy1,scfEnergy2,deltaSCFEnergy
!     Andrew conversion factor from a.u.s to Debyes
      real(kind=real64),parameter:: scale_debye=2.54158025! conversion factor au.s to Debyes
      real(kind=real64),dimension(:), allocatable::moEnergiesAlpha_gs, &
        moEnergiesBeta_gs,moEnergiesAlpha_ex,moEnergiesBeta_ex, &
        tmpvec_1,tmpvec_2,tmpvec_3
      real(kind=real64),dimension(:,:), allocatable::tmpmat_1,tmpmat_2, &
        tmpmat_3
      integer,dimension(:,:),allocatable::det_list_1,det_list_2,det_list_3
      type(mqc_vector)::nuclear_dipole_au,dm_au,tdm_ci_au ! Andrew dipole vectors in atomic units
      type(mqc_vector)::nuclear_dipole_db,dm_db,tdm_ci_db ! Andrew dipole vectors in Debyes
!     Mp2 ams and Final Mp2 integrals
      type(mqc_vector)::mp2_amps_gs,mp2_amps_ex,int_1,int_2,int_3,int_4
      type(mqc_matrix):: mp2_mat,tmp_mqc_mat
      type(mqc_molecule_data)::molData
      type(mqc_scf_integral),dimension(:),allocatable::moCoeff_gs,moCoeff_ex
      type(mqc_pscf_wavefunction)::wavefunction_gs,wavefunction_ex
      type(mqc_scf_integral),dimension(3)::dipole_ex,dipoleMO_gs,dipoleMO_ex
      type(mqc_twoERIs)::eris_gs,eris_ex,mo_ERIs_gs,mo_ERIs_ex
      type(mqc_variable) :: mqcTmpArray,dipoleAOx,dipoleAOy,dipoleAOz, &
        PMatrixTotal1,PMatrixAlpha1,PMatrixBeta1,PMatrixTotal2, &
        PMatrixAlpha2,PMatrixBeta2,CAlpha1,CBeta1,CAlpha2, &
        CBeta2,tmpMQC1,tmpMQC2,tmpMQC3,overlap_mat 
      type(mqc_matrix)::Nfi_mat_SD,Nfi_mat_DD,Nfi_mat_TD, &
        dipoleIntegralsSSX,dipoleIntegralsSSY, dipoleIntegralsSSZ,     &
        dipoleIntegralsSDX,dipoleIntegralsSDY, dipoleIntegralsSDZ,     &
        dipoleIntegralsSTX,dipoleIntegralsSTY, dipoleIntegralsSTZ,     &     
        tmp_mqc_mat1,tmp_mqc_mat2
      type(mqc_vector)::Nfi_vec_S0,Nfi_vec_D0,Nfi_vec_T0,CI_Dipole_Vec,& 
        test_vec, dipoleIntegralsX,dipoleIntegralsY, dipoleIntegralsZ, &     
        dipoleIntegrals0SX,dipoleIntegrals0SY, dipoleIntegrals0SZ     
      real(kind=real64)::dipoleStrength,oscillatorStrength,TDoverlapAlpha, &
        TDoverlapBeta
      logical :: debug=.false.
!
!     Format Statements
!

 1000 Format(1x,'Enter Test program force_04.')
 1010 Format(1x,'Matrix File ',I1,': ',A/)
 1020 Format(1x,'nAtoms    =',I4,6x,'nBasis  =',I4,6x,'nBasisUse=',I4,/,  &
             1x,'nElec=',I4,6x,'nElAlpha=',I4,6x,'nElBeta  =',I4)
 1030 Format(1x,'nMos      =',I4,6x,'nOcc    =',I4,6x,'nVirt    =',I4,/,  &
             1x,'nOv       =',I4)
 2000 format(1x,a,': ',b31)
 2100 format(1x,a,1x,i5,': ',b31)
 2200 format(1x,a,1x,i5,': ',I5)
 3000 format(1x,"Entering integral 1",1x)
 3100 format(1x,"Entering integral 2",1x)
 3200 format(1x,"Entering integral 3",1x)
 3300 format(1x,"Entering integral 4",1x)
 5000 Format(1x,'Time (',A,'): ',f8.1,' s.')
 5500 Format(1x,'Occ 1: ',I3,1X,'Virt 1: ',I3)
 5510 Format(1x,'Occ 1: ',I3,1X,'Virt 1: ',I3,1X,'Occ 2: ',I3,1X,'Virt 2: ',I3)
 5520 Format(1x,'Occ 1: ',I3,1X,'Virt 1: ',I3,'Occ 2: ',I3,1X,'Virt 2: ',I3,1x,'Occ: ',I3,1X,'Virt: ',I3)
 6000 Format(1x,'Dipole Strength  =',1X,f8.6)
 6100 Format(1x,'Oscillator Strength  =',1X,f8.6)
 8999 Format(/,1x,'END OF program force_04.')
!
!
      call cpu_time(timeStart)
      write(IOut,1000)
      call mqc_version_print(iOut)
      if(.not.mqc_version_check(newerThanMajor=24,newerThanMinor=3,newerThanRevision=0))  &
        call mqc_error('MQCPack version is too old.')
!
!     Open the Gaussian matrix file and load the number of atomic centers.
!
 
      nCommands = command_argument_count()
      if(nCommands.lt.2.or.nCommands.ge.3) &
        call mqc_error('A ground state and excited state gaussian matrix file must be providedin the command line.')
      call get_command_argument(1,matrixFilename1)
      call get_command_argument(2,matrixFilename2)
      call GMatrixFile1%load(matrixFilename1)
      call GMatrixFile2%load(matrixFilename2)
      write(IOut,1010) 1,TRIM(matrixFilename1)
      write(IOut,1010) 2,TRIM(matrixFilename2)
      nAtoms = GMatrixFile1%getVal('nAtoms')
      nBasis = Int(GMatrixFile1%getVal('nbasis'))
      nBasisUse = Int(GMatrixFile1%getVal('nbasisuse'))
      nElec = Int(GMatrixFile1%getVal('nelectrons'))
      nAlpha = Int(GMatrixFile1%getVal('nAlpha'))
      nBeta = Int(GMatrixFile1%getVal('nBeta'))
      write(IOut,1020) nAtoms,nBasis,nBasisUse,nElec,  &
        nAlpha,nBeta
      write(*,*)
      call GMatrixFile1%getArray('ALPHA ORBITAL ENERGIES',mqcVarOut=mqcTmpArray)
      moEnergiesAlpha_gs = mqcTmpArray
      call GMatrixFile1%getArray('BETA ORBITAL ENERGIES',mqcVarOut=mqcTmpArray)
      moEnergiesBeta_gs = mqcTmpArray

      call GMatrixFile1%getArray('OVERLAP',mqcVarOut=overlap_mat)
      call GMatrixFile1%getArray('DIPOLE INTEGRALS',mqcVarOut=dipoleAOx,arraynum=1)
      call GMatrixFile1%getArray('DIPOLE INTEGRALS',mqcVarOut=dipoleAOy,arraynum=2)
      call GMatrixFile1%getArray('DIPOLE INTEGRALS',mqcVarOut=dipoleAOz,arraynum=3)
      call GMatrixFile1%getArray('ALPHA SCF DENSITY MATRIX',mqcVarOut=PMatrixAlpha1)
      call GMatrixFile1%getArray('ALPHA MO COEFFICIENTS',mqcVarOut=CAlpha1)
      if(GMatrixFile1%isUnrestricted()) then
        call GMatrixFile1%getArray('BETA SCF DENSITY MATRIX',mqcVarOut=PMatrixBeta1)
        call GMatrixFile1%getArray('BETA MO COEFFICIENTS',mqcVarOut=CBeta1)
      else
        PMatrixBeta1 = PMatrixAlpha1
        CBeta1 = CAlpha1
      endIf
      PMatrixTotal1 = PMatrixAlpha1+PMatrixBeta1
      call GMatrixFile1%getESTObj('wavefunction',wavefunction_gs)
      call GMatrixFile1%get2ERIs('regular',eris_gs)
      call GMatrixFile2%getArray('ALPHA MO COEFFICIENTS',mqcVarOut=CAlpha2)
      call GMatrixFile2%getArray('ALPHA SCF DENSITY MATRIX',mqcVarOut=PMatrixAlpha2)
      if(GMatrixFile2%isUnrestricted()) then
        call GMatrixFile2%getArray('BETA SCF DENSITY MATRIX',mqcVarOut=PMatrixBeta2)
        call GMatrixFile2%getArray('BETA MO COEFFICIENTS',mqcVarOut=CBeta2)
      else
        CBeta2 = CAlpha2
        PMatrixBeta2 = PMatrixAlpha2
      endIf

      PMatrixTotal2 = PMatrixAlpha2+PMatrixBeta2

      call GMatrixFile2%getArray('ALPHA ORBITAL ENERGIES',mqcVarOut=mqcTmpArray)
      moEnergiesAlpha_ex = mqcTmpArray
      call GMatrixFile2%getArray('BETA ORBITAL ENERGIES',mqcVarOut=mqcTmpArray)
      moEnergiesBeta_ex = mqcTmpArray

      scfEnergy1 = GMatrixFile1%getValReal('scfEnergy')
      scfEnergy2 = GMatrixFile2%getValReal('scfEnergy')
      deltaSCFEnergy = scfEnergy2-scfEnergy1

      call GMatrixFile2%getESTObj('wavefunction',wavefunction_ex)
      call GMatrixFile2%get2ERIs('regular',eris_ex)

!     Subroutine 'getMolData' collects a bunch of stuff from the matrix file
!     what we care about are the atomic charges and cartesian coordinates.
      call GmatrixFile1%getMolData(molData)
!
!     Obtain nuclear dipole moment, classical component of total dipole moment.
!
      nuclear_dipole_au = matmul(transpose(molData%Nuclear_Charges),& 
        transpose(molData%Cartesian_Coordinates))
      call nuclear_dipole_au%print(iOut,"Nuclear Dipole in Atomic units") 
!
!     Initialize total dipole moment vector and compute.
!
      call dm_au%init(3)
      call dm_au%put(-1*float(contraction(PMatrixTotal1,dipoleAOx)),int(1))
      call dm_au%put(-1*float(contraction(PMatrixTotal1,dipoleAOy)),int(2))
      call dm_au%put(-1*float(contraction(PMatrixTotal1,dipoleAOz)),int(3))

      call dm_au%print(iOut,'Total Dipole Moment in atomic units')
!
!     Compute Dipole Moment in Debyes
!
      call dm_db%init(3)
      do j = 1,3
         call dm_db%put(dm_au%at(j)*scale_debye,j)
      enddo

      call dm_db%print(iOut,'Total Dipole Moment in Debyes')

      nMOs = nBasisUse
      nOcc = nAlpha
      nVirt = nMOs-nOcc
      nOV = nOcc*nVirt
      nOV2 = (((nOcc*(nOcc-1))/2)*((nVirt*(nVirt-1))/2))
      nOV3 = (((nOcc*(nOcc-1)*(nOcc-2))/6)*((nVirt*(nVirt-1)*(nVirt-2))/6))
      nDets = nOcc*nVirt+nOcc*nVirt

      call twoERI_trans(iOut,0,wavefunction_gs%MO_Coefficients,eris_gs,mo_ERIs_gs)
      call twoERI_trans(iOut,0,wavefunction_ex%MO_Coefficients,eris_ex,mo_ERIs_ex)

      if (debug) then
        E2_test = GetE2(mo_ERIs_gs,moEnergiesAlpha_gs,moEnergiesBeta_gs,nAlpha,nBeta,nBasis)
        write(*,*) "E2 ", E2_test
      end if
!
!     Get MP2 Amps
!
      mp2_amps_gs = GetMp2Amps(mo_ERIs_gs,moEnergiesAlpha_gs,moEnergiesBeta_gs,nAlpha,nBeta,nBasis)
      mp2_amps_ex = GetMp2Amps(mo_ERIs_ex,moEnergiesAlpha_ex,moEnergiesBeta_ex,nAlpha,nBeta,nBasis)
      mp2_amps_gs = mp2_amps_gs%transpose()
      mp2_amps_ex = mp2_amps_ex%transpose()
      if (debug) then
        call mp2_amps_gs%print(iOut,"MP2 Amplitude Ground State values:")
        call mp2_amps_ex%print(iOut,"MP2 Amplitude Excited State values:")
      end if
      mp2_mat = mqc_outer(mp2_amps_ex%transpose(),mp2_amps_gs)
!
!     August 27th Converted to computing determinants with no bit logic for 
!     Overlap and Dipole integrals
      allocate(det_list_1(2,nOV))
      det_list_1 = 0.0
      if(nElec.ge.2 .and. nVirt.ge.2) then
        allocate(det_list_2(4,nOV2))
        det_list_2 = 0.0
      else 
        det_list_2 = 0.0
      end if
      if(nElec.ge.3 .and. nVirt.ge.3) then
        allocate(det_list_3(6,nOV3))
        det_list_3 = 0.0
      else
        det_list_3 = 0.0
      end if

      call det_to_swap(det_list_1,det_list_2,det_list_3,nOV,nOV2,nOV3,nAlpha,nBasisUse)

      if (debug) then
        do i = 1,nOV 
          write(123,5500) det_list_1(1,i),det_list_1(2,i)
        end do
        do i = 1,nOV2 
          write(123,5510) det_list_2(1,i),det_list_2(3,i),det_list_2(2,i),det_list_2(4,i)
        end do
        do i = 1,nOV3 
          write(123,5520) det_list_3(1,i),det_list_3(4,i),det_list_3(2,i),det_list_3(5,i),det_list_3(3,i),det_list_3(6,i)
        end do
      end if

      call dipoleIntegrals0SX%init(nOV)
      call dipoleIntegrals0SY%init(nOV)
      call dipoleIntegrals0SZ%init(nOV)

      do i = 1,nOV
        tmpMQC1 = CAlpha1%column(det_list_1(1,i))
        tmpMQC2 = CAlpha1%column(det_list_1(2,i))
        tmpMQC3 = dot_product(tmpMQC1,MQC_Variable_MatrixVector(dipoleAox,tmpMQC2))
        Dij=tmpMQC3
        call dipoleIntegrals0SX%put(Dij,i) 
        tmpMQC3 = dot_product(tmpMQC1,MQC_Variable_MatrixVector(dipoleAoy,tmpMQC2))
        Dij=tmpMQC3
        call dipoleIntegrals0SY%put(Dij,i) 
        tmpMQC3 = dot_product(tmpMQC1,MQC_Variable_MatrixVector(dipoleAoz,tmpMQC2))
        Dij=tmpMQC3
        call dipoleIntegrals0SZ%put(Dij,i) 
      end do

      call dipoleIntegrals0SX%print(123,"Dipole 0X") 
      call dipoleIntegrals0SY%print(123,"Dipole 0Y") 
      call dipoleIntegrals0SZ%print(123,"Dipole 0Z") 

!
!     Calculate all orthogonal vectors/matrices
!
      call Nfi_vec_S0%init(2*nOV)
        
      do i = 1,nOV
        tmpMQC1 = CBeta1
        call MQC_Variable_MatrixPermuteColumns(tmpMQC1,& 
          det_list_1(1,i),det_list_1(2,i))
        tmpMQC2 = MatMul(Transpose(tmpMQC1%subMatrix([1,nBasis],[1,nBeta])),  &
          MatMul(overlap_mat,CBeta2%subMatrix([1,nBasis],[1,nBeta])))
        Nij_b = tmpMQC2%det()
        tmpMQC3 = MatMul(Transpose(CAlpha1%subMatrix([1,nBasis],[1,nAlpha])),  &
          MatMul(overlap_mat,CAlpha2%subMatrix([1,nBasis],[1,nAlpha])))
        Nij_a = tmpMQC3%det()
        Nij = Nij_a*Nij_b
        call Nfi_vec_S0%put(Nij,i)
      end do

      do i = nOV + 1,2*nOV
        tmpMQC1 = CAlpha1
        call MQC_Variable_MatrixPermuteColumns(tmpMQC1,& 
          det_list_1(1,i-nOv),det_list_1(2,i-nOv))
        tmpMQC2 = MatMul(Transpose(tmpMQC1%subMatrix([1,nBasis],[1,nAlpha])),  &
          MatMul(overlap_mat,CAlpha2%subMatrix([1,nBasis],[1,nAlpha])))
        Nij_a = tmpMQC2%det()
        tmpMQC3 = MatMul(Transpose(CBeta1%subMatrix([1,nBasis],[1,nBeta])),  &
          MatMul(overlap_mat,CBeta2%subMatrix([1,nBasis],[1,nBeta])))
        Nij_b = tmpMQC3%det()
        Nij = Nij_a*Nij_b
        Nij = abs(Nij)
        call Nfi_vec_S0%put(Nij,i)
      end do

      call Nfi_vec_S0%print(123,"Nfi_Vec_S0 Vector")

!     Calculate Final Dipole/Overlap Integrals
! 
      call int_1%init(3)
      call int_2%init(3)
      call int_3%init(3)
      call int_4%init(3)

!     Integral #1 <psi_0|u|psi_S><psi_S|phi_0>

      do i = 1,3
        tmpMQC1 = MatMul(Transpose(CBeta1%subMatrix([1,nBasis],[1,nAlpha])),  &
          MatMul(overlap_mat,CBeta2%subMatrix([1,nBasis],[1,nAlpha])))
        tmpMQC2 = MatMul(Transpose(CAlpha1%subMatrix([1,nBasis],[1,nAlpha])),  &
          MatMul(overlap_mat,CAlpha2%subMatrix([1,nBasis],[1,nAlpha])))
        Nij_b = tmpMQC1%det()
        Nij_a = tmpMQC2%det()
        Nij = Nij_b*Nij_a
        tmp_scalar = Nij*dm_db%at(i)
        call int_1%put(tmp_scalar,i) 
      end do

      do i = 1,nOV
        tmp_scalar = dipoleIntegrals0SX%at(i)*Nfi_vec_S0%at(i)
        call int_1%put(tmp_scalar + int_1%at(1),1) 
      end do

      do i = nOV+1,2*nOV
        tmp_scalar = dipoleIntegrals0SX%at(i-nOV)*Nfi_vec_S0%at(i)
        call int_1%put(tmp_scalar + int_1%at(1),1) 
      end do

      do i = 1,nOV
        tmp_scalar = dipoleIntegrals0SY%at(i)*Nfi_vec_S0%at(i)
        call int_1%put(tmp_scalar + int_1%at(2),3) 
      end do

      do i = nOV+1,2*nOV
        tmp_scalar = dipoleIntegrals0SY%at(i-nOV)*Nfi_vec_S0%at(i)
        call int_1%put(tmp_scalar + int_1%at(2),3) 
      end do

      do i = 1,nOV
        tmp_scalar = dipoleIntegrals0SZ%at(i)*Nfi_vec_S0%at(i)
        call int_1%put(tmp_scalar + int_1%at(3),3) 
      end do

      do i = nOV+1,2*nOV
        tmp_scalar = dipoleIntegrals0SZ%at(i-nOV)*Nfi_vec_S0%at(i)
        call int_1%put(tmp_scalar + int_1%at(3),3) 
      end do

      call int_1%print(iOut,"Integral 1")

!     Dipole dot_product(dipoleIntegrals0SX,Nfi_vec_SO)

!     dipoleIntegralsOSX
!     dipoleIntegralsOSy
!     dipoleIntegralsOSz
!     Nfi_vec_S0

      dipoleStrength = 0.0
      call tdm_ci_au%init(3)
      do i = 1,3
        call tdm_ci_au%put(int_1%at(i)+int_2%at(i)+int_3%at(i)+int_4%at(i),i)
      end do

      call tdm_ci_au%print(iOut,"TDM CI Dipole")
!
!     Calculate final oscillator strength using DDNO code
!

      call get_T_Overlap(PMatrixAlpha1,PMatrixAlpha2, &
        overlap_mat,CAlpha2,nAlpha,nbasis,TDoverlapAlpha)
      call get_T_Overlap(PMatrixBeta1,PMatrixBeta2, &
        overlap_mat,CBeta2,nBeta,nbasis,TDoverlapBeta)
      tmpvec_1 = tdm_ci_au
      dipoleStrength = dot_product(tmpvec_1,tmpvec_1) 
      dipoleStrength = TDoverlapAlpha*TDoverlapAlpha*TDoverlapBeta*TDoverlapBeta* &
        dipoleStrength
      oscillatorStrength = float(2)*deltaSCFEnergy/float(3)
      oscillatorStrength = oscillatorStrength*dipoleStrength
      write(iOut,6000) dipoleStrength
      write(iOut,6100) oscillatorStrength

  999 Continue
      call cpu_time(timeEnd)
      write(iOut,5000) 'TOTAL JOB TIME',timeEnd-timeStart
      write(iOut,8999)
      end program force_04

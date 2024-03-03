#
# This is a simple makefile for building spin-squared calculation code.
# Specify where your MQC_directory is built
MQCDir       = $(mqc_install)
MQCMODS      = $(MQCDir)/PGI/mod
MQCLIB       = $(MQCDir)/PGI/lib
LIBS         = -llapack -lblas -L$(MQCLIB)
F03Flags     = 
#RunF         = gfortran -std=f2008 -fdefault-real-8 -fdefault-integer-8 -fopenmp
RunF         = pgfortran -i8 -r8 -Mallocatable=03 -mp
#
#
# The 'all' rule.
#
all: test_ci.exe

#
# Generic rules for building module (*.mod) and object (*.o) files.
#
%.mod: %.f03
	$(RunF) $(LIBS) $(Prof) -I$(MQCMODS) -c $*.f03

%.o: %.f90
	$(RunF) -I$(MQCMODS) -c $*.f90

%.o: %.f03
	$(RunF) $(F03Flags) -I$(MQCMODS) -c $*.f03

#
# Generic rule for building general executable program (*.exe) from a standard
# f03 source (*.f03) file.
#
%.exe: %.f03 %_mod.f03 
	$(RunF) $(LIBS) $(Prof) -I$(MQCMODS) -o $*.exe $*.f03 $(MQCLIB)/libmqc.a
clean:
	rm -rf *.o *.exe *.mod


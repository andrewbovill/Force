#
# This is a simple makefile for building spin-squared calculation code.
#
MQCDir       = "/home/abovill/MQC_install"
MQCMODS      = $(MQCDir)/PGI/mod
MQCLIB       = $(MQCDir)/PGI/lib
LIBS         = -llapack -lblas -L$(MQCLIB)
RunF         = pgfortran -i8 -r8 -Mallocatable=03
#RunF         = pgfortran -i8 -r8
#
#
# The 'all' rule.
#
all: nio.exe

#
# Generic rules for building module (*.mod) and object (*.o) files.
#
%.mod: %.f03
	$(RunF) $(LIBS) -I$(MQCMODS) -c $*.f03

%.o: %.f90
	$(RunF) -I$(MQCMODS) -c $*.f90

%.o: %.f03
	$(RunF) $(F03Flags) -I$(MQCMODS) -c $*.f03

#
# Generic rule for building general executable program (*.exe) from a standard
# f03 source (*.f03) file.
#
%.exe: %.f03 %_mod.f03 
	$(RunF) $(LIBS) -I$(MQCMODS) -o nio.exe nio.f03 $(MQCLIB)/libmqc.a
clean:
	rm -rf *.exe *.o

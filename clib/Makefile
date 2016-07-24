# Makefile for clib

include ../make.sys

OBJS = \
customize_signals.o \
stack.o \
c_mkdir.o \
copy.o \
cptimer.o \
eval_infix.o \
indici.o \
md5.o \
md5_from_file.o \
memstat.o \
ptrace.o \
qsort.o

C99_OBJS = \
esh5_interfaces.o

all : clib.a

clib.a : $(OBJS)  $(C99_OBJS)
	$(AR) $(ARFLAGS) $@ $?
	$(RANLIB) $@

esh5_interfaces.o : esh5_interfaces.c
	$(CC) $(CFLAGS) $(CFLAGS_C99) -c $<

source :
	co -l $(OBJS:.o=.c)

clean :
	- rm -f clib.a *.o *.mod *.i core*

include make.depend

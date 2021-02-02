PROGS=gcd loops print_arg emptyloop fibo_iter fib
CLANG_BC=clang-3.6 -emit-llvm -c
LLVM_LINK=llvm-link-3.6
LLC_I386=llc-3.6 -march=x86 -mcpu=haswell  
GCC_I386=gcc -m32  

I386_O0_OBJS=$(patsubst %,%.i386.O0.s,$(PROGS))
I386_O2_OBJS=$(patsubst %,%.i386.O2.s,$(PROGS))
I386_O3_OBJS=$(patsubst %,%.i386.O3.s,$(PROGS))

BC_O0_OBJS=$(patsubst %,%.bc.O0.o,$(PROGS))
BC_O2_OBJS=$(patsubst %,%.bc.O2.o,$(PROGS))

SRCS=$(patsubst %,%.c,$(PROGS))
I386_OBJS=$(I386_O0_OBJS) $(I386_O2_OBJS) $(I386_O3_OBJS)
BC_OBJS=$(BC_O0_OBJS) $(BC_O2_OBJS)

all: $(I386_OBJS) main.i386.O0 main.i386.O2 main.i386.O3 main.bc.O0 main.bc.O2

$(BC_O0_OBJS): %.bc.O0.o: %.c
	$(CLANG_BC) $^ -O0 -o $@

$(BC_O2_OBJS): %.bc.O2.o: %.c
	$(CLANG_BC) $^ -O2 -o $@

main.bc.o: main.c
	$(CLANG_BC) $^ -O3 -o $@

main.bc.O0: $(BC_O0_OBJS) main.bc.o
	$(LLVM_LINK) $^ -o $@

main.bc.O2: $(BC_O2_OBJS) main.bc.o
	$(LLVM_LINK) $^ -o $@

$(I386_O3_OBJS): %.i386.O3.s: %.bc.O2.o
	$(LLC_I386) $^ -O3 -o $@

$(I386_O2_OBJS): %.i386.O2.s: %.bc.O2.o
	$(LLC_I386) $^ -O2 -o $@

$(I386_O0_OBJS): %.i386.O0.s: %.bc.O0.o
	$(LLC_I386) $^ -O0 -o $@


main.i386.O0.s: main.bc.O2
	$(LLC_I386) $^ -O0 -o $@

main.i386.O2.s: main.bc.O2
	$(LLC_I386) $^ -O2 -o $@

main.i386.O3.s: main.bc.O2
	$(LLC_I386) $^ -O3 -o $@

main.i386.O0: main.i386.O0.s
	$(GCC_I386) $^ -o $@

main.i386.O2: main.i386.O2.s
	$(GCC_I386) $^ -o $@

main.i386.O3: main.i386.O3.s
	$(GCC_I386) $^ -o $@


clean::
	rm -f main.i386* main.bc* $(I386_OBJS) $(BC_OBJS)

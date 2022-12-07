EQ32 = eq32
CC = ../fuzzing/afl-2.52b/afl-gcc
AFL_FUZZ = ../fuzzing/afl-2.52b/afl-fuzz

FUZZ_TARGETS = fuzz_openbsd_glibc fuzz_dietlibc_openbsd fuzz_dietlibc_glibc

all: $(FUZZ_TARGETS)

$(FUZZ_TARGETS): %: %.o dietlibc.o openbsd.o glibc.o fuzz_harness.o
	$(CC) $^ -o $@

%.o: %.c
	$(CC) -c $< -o $@

fuzz::
	$(AFL_FUZZ) -i in -o out ./fuzzgoat @@

test1::
	$(EQ32) -f memrchr dietlibc.c openbsd.c > test1.out 2>&1

test2::
	$(EQ32) -f memrchr dietlibc.c glibc.c > test2.out 2>&1

clean::
	rm -rf out *.bc *.bc.tmp *tfg eq.proof* *.o $(FUZZ_TARGETS) test1.out test2.out out

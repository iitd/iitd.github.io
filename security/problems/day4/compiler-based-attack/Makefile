#CC = ../day2/afl-2.52b/afl-gcc
CC = clang 
CLANG = clang
OPT = opt
LLC = llc
AS = as
BACKDOOR_SO = ./LLVMBackdoor.so

TARGETS = login login-with-backdoor

all: $(TARGETS)

login: %: %.o password-checker.o
	$(CC) $^ -o $@

login-with-backdoor: login.o password-checker-with-backdoor.o
	$(CC) $^ -o $@

%-with-backdoor.o: %.c
	$(CLANG) -emit-llvm -c $< -o $@.tmp.bc
	$(OPT) -load $(BACKDOOR_SO) -instrumentBackdoor $@.tmp.bc -o $@.bc
	$(LLC) $@.bc -o $@.s
	$(AS) $@.s -o $@

%.o: %.c
	$(CC) -c $< -o $@

clean::
	rm -rf *-with-backdoor.o password-checker.o *.bc *.s *.ll $(TARGETS)

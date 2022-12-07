#CC = ../day2/afl-2.52b/afl-gcc
CC = gcc

TARGETS = login

all: $(TARGETS)

$(TARGETS): %: %.o password-checker.o
	$(CC) $^ -o $@

%.o: %.c
	$(CC) -c $< -o $@

clean::
	rm -rf password-checker.o $(TARGETS)

# tools
CC := gcc
RM := rm -f

# flags
CFLAGS := -ggdb -m32
LDFLAGS := -m32
LDLIBS :=

# sources
sources := xploit1.c xploit2.c
execs := $(sources:.c=)

.PHONY: default all clean

default: all
all: $(execs)

clean:
	$(RM) $(execs) $(sources:.c=.o)

#dependencies
$(sources:.c=.o): shellcode.h

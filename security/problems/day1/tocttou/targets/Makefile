# tools
CC := gcc
RM := rm -f
EXECSTACK := execstack

# flags
CFLAGS := -ggdb -m32 -g -std=c99 -D_GNU_SOURCE -fno-stack-protector -mpreferred-stack-boundary=2 -Wno-format-security
LDFLAGS := -m32
LDLIBS :=

# sources
sources := target1.c target2.c
execs := $(sources:.c=)

.PHONY: default all clean

default: all
all: runexecstack

runexecstack: $(execs)
	$(EXECSTACK) -s $(execs)

install: runexecstack
	install -o root -t /tmp $(execs)
	chmod 4755 /tmp/target*

%.o: %.c
	$(CC) $< -c -o $@ $(CFLAGS)

clean:
	$(RM) $(execs) $(sources:.c=.o)

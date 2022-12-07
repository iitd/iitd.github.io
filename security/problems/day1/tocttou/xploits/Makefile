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
all: $(execs) only_root_can_write

only_root_can_write::
	rm -f $@
	sudo touch only_root_can_write

clean:
	$(RM) $(execs) $(sources:.c=.o) only_root_can_write

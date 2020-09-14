
# 2207718881418
all: test_mem

LIBDIR=../lib
KERNELDIR=$(LIBDIR)/kernel
SOURCES=memalloc.c $(KERNELDIR)/list.c
SOURCES1=test_mem.c $(SOURCES)

test_mem: $(SOURCES1)
	$(CC) -g -Wall -I$(LIBDIR) -I$(KERNELDIR) -o $@ $(SOURCES1) -lpthread

clean:
	rm test_mem *.o

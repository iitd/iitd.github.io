#include <stdlib.h>

int fuzz_harness(int argc, char** argv, char* line, int* c, size_t* n);;

void* dietlibc_memrchr(const void* s, int c, size_t n);
void *openbsd_memrchr(const void *s, int c, size_t n);
void *glibc_memrchr(const void *s, int c, size_t n);

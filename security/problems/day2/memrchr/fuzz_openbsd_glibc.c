#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <assert.h>
#include "fuzz_harness.h"

int main(int argc, char** argv)
{
  char s[256];
  int c;
  size_t n;

  if (fuzz_harness(argc, argv, s, &c, &n)) {
    return 1;
  }

  const void* g = glibc_memrchr(s, c, n);
  const void* o = openbsd_memrchr(s, c, n);
  printf("g = %p, o = %p\n", g, o);

  if (g != o) {
    fprintf(stderr, "Fatal: found an inequivalence between the glibc and openbsd implementations!\n");
    assert(0);
  }
  return 0;
}

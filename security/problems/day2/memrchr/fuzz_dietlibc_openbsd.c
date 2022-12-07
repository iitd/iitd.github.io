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

  const void* d = dietlibc_memrchr(s, c, n);
  const void* o = openbsd_memrchr(s, c, n);
  printf("d = %p, o = %p\n", d, o);
  if (d != o) {
    fprintf(stderr, "Fatal: found an inequivalence between the dietlibc and openbsd implementations!\n");
    assert(0);
  }
  return 0;
}

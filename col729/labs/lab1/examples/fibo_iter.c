#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <assert.h>
#include <limits.h>

unsigned long
fibo_iter(unsigned int n)
{
  unsigned long fibo_cur, fibo_prev;
  unsigned int i, tmp;

  if (n < 3)
    return 1;

  fibo_cur = 1;
  fibo_prev = 1;

  for (i = 3; i <= n; i++)
  {
    tmp = fibo_cur;
    fibo_cur += fibo_prev;
    fibo_prev = tmp;
  }

  return fibo_cur;
}

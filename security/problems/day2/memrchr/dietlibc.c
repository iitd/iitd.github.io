/* dietlibc */
#include <stdio.h>

static void* memrchr(const void *s, int c, size_t n) {
  register const char* t=s;
  register const char* last=0;
  int i;
  for (i=n; i; --i) {
    if (*t==c)
      last=t;
    ++t;
  }
  return (void*)last; /* man, what an utterly b0rken prototype */
}

void* dietlibc_memrchr(const void* s, int c, size_t n)
{
  return memrchr(s, c, n);
}

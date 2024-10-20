Consider the following simple implementation of the `strlen` function:
```
#include <stddef.h>

size_t strlen(char *s)
{
  char *p ;
  for (p = s; *p; ++p);
  return p-s ;
}
```

Now, consider the following optimized implementation of `strlen` (taken from glibc):
```
#include <stddef.h>
#include <limits.h>

size_t strlen(char * str)
{
  char *ptr ;
  unsigned long *longword_ptr;
  unsigned long longword, himagic, lomagic;
  for (ptr = str; ((unsigned long)ptr & sizeof(unsigned long)) != 0; ++ptr)
    if (*ptr == '\0')
      return ptr-str ;
  longword_ptr = (unsigned long*)ptr ;
#if ULONG_MAX == 0xFFFFFFFFFFFFFFFF
  himagic = 0x8080808080808080L;
  lomagic = 0x0101010101010101L;
#else
  himagic = 0x80808080L;
  lomagic = 0x01010101L;
#endif
  for (;;)
  {
    longword = *longword_ptr++;
    if ((longword - lomagic) & ~longword & himagic) {
      char *cp = (char *)(longword_ptr - 1);
      if (cp[0] == 0) return cp - str ;
      if (cp[1] == 0) return cp - str + 1;
      if (cp[2] == 0) return cp - str + 2;
      if (cp[3] == 0) return cp - str + 3;
      if (cp[4] == 0) return cp - str + 4;
      if (cp[5] == 0) return cp - str + 5;
      if (cp[6] == 0) return cp - str + 6;
      if (cp[7] == 0) return cp - str + 7;
    }
  }
}
```

Copy these two `strlen` programs (simple and optimized) into separate files, say `strlen_unopt.c` and `strlen_opt.c`, and check them for equivalence using the following command:
```
eq32 --unroll-factor 8 strlen_unopt.c strlen_opt.c
```
The equivalence check should succeed.  Now trying modifying the optimized program in various ways, and see if the equivalence check still succeeds.

Fun fact: these two implementations are only equivalent if the page-size of the underlying machine architecture is a multiple of eight --- on the x86 architecture, the page size is 4096 (which is a multiple of eight).  What can go wrong if the page size was not a multiple of eight, i.e., what is an input for which the two programs would have different behaviour if the page size was not a multiple of eight?

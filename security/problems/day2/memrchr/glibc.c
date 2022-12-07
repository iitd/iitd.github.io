/* old glibc */
#include <stddef.h>
static void *memrchr(const void *s, int c, size_t n) {
    const unsigned char *char_ptr;
    char_ptr = (unsigned char*)s + n;
    while (n-- > 0) {
        if (*--char_ptr == c)
          // eqcheck fails because (*--char_ptr) gets zero-extended and thus may not be equal to c (cf. dst where a cast is performed) when c is greater than UCHAR_MAX
          // See example inputs below
            return (void *)char_ptr;
    }

    return 0;
}

void* glibc_memrchr(const void* s, int c, size_t n)
{
  return memrchr(s, c, n);
}

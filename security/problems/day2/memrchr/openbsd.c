/* openbsd */
#include <stddef.h>
static void *memrchr(const void *s, int c, size_t n) {
    const unsigned char *cp;

    if (n != 0) {
        cp = (unsigned char *)s + n;
        do {
            if (*(--cp) == (unsigned char)c)
                return ((void *)cp);
        } while (--n != 0);
    }
    return (NULL);
}

void *openbsd_memrchr(const void *s, int c, size_t n) {
  return memrchr(s, c, n);
}

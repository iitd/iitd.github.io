#include <stdio.h>
#include <stdbool.h>

bool is_sorted(int *a, int n) {
    for (int i = 0; i < n - 1; i++) {
        if (a[i] > a[i + 1]) {
            return false;
        }
    }
    return true;
}

void add_arrays(int *a, int *b, int *c, int n) {
    for (int i = 0; i < n; i++) {
        c[i] = a[i] + b[i];
    }
}

int sum(unsigned char *a, int n) {
    int ret = 0;
    for (int i = 0; i < n; i++) {
        ret += a[i];
    }
    return ret;
}

int sumn(int n)
{
  int ret = 0;
  for (int i = 0; i < n; i++) {
    ret = ret + i;
  }
  return ret;
}

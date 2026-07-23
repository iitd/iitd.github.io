#include <stdio.h>
#include <time.h>
#include <stdbool.h>
#include <stdint.h>
#include <limits.h>

int gcd1(int a, int b);
int gcd2(int a, int b);
int gcd3(int a, int b);
bool is_sorted(int *a, int n);
void add_arrays(int *a, int *b, int *c, int n);
int sum(unsigned char *a, int n);
int sumn(int n);
int print_arg(int argc, char * argv[]);
int emptyloop(int argc, char **argv);
unsigned long fibo_iter(unsigned int n);
int fib(int n);

int main(int argc, char *argv[])
{
  printf("hello, world\n");
  print_arg(argc, argv);
  printf("gcd1(238, 618) = %d\n", gcd1(238, 618));
  printf("gcd2(238, 618) = %d\n", gcd2(238, 618));
  printf("gcd3(238, 618) = %d\n", gcd3(238, 618));
  int a[5] = {1, 2, 3, 6, 7};
  int b[8] = {7, 2, 6, 1, 3, 2, 6, 9};
  int c[5];
  printf("is_sorted(a) = %d\n", is_sorted(a, 5));
  printf("is_sorted(b) = %d\n", is_sorted(b, 8));
  add_arrays(a, b, c, 5);
  printf("after add_arrays(a, b, c): c = \n");
  for (size_t i = 0; i < 5; i++) {
    printf(" %d", c[i]);
  }
  printf("\n");
  unsigned char d[5] = {1, 2, 3, 7};
  printf("sum(d) = %d\n", sum(d, 5));
  printf("sumn(35) = %d\n", sumn(35));
  printf("Running emptyloop... ");
  clock_t start = clock();
  emptyloop(0, NULL);
  clock_t stop = clock();
  printf(" done; time taken = %Lfs\n", (long double)(stop - start)/CLOCKS_PER_SEC);

  printf("Running fibo_iter... ");
  start = clock();
  unsigned long ret = fibo_iter(INT_MAX - 1);
  stop = clock();
  printf(" done; result = %lu; time taken = %Lfs\n", ret, (long double)(stop - start)/CLOCKS_PER_SEC);

  printf("Running fib(36)... ");
  start = clock();
  ret = fib(36);
  stop = clock();
  printf(" done; result = %lu; time taken = %Lfs\n", ret, (long double)(stop - start)/CLOCKS_PER_SEC);

  return 0;
}

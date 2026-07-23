#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <assert.h>
#include <limits.h>

#define MAGIC_NUMBER 0x54321	/* To identify code fragments in assembly. */
#define MAX(a, b) ((a) < (b) ? (b) : (a))

int
emptyloop(int argc, char **argv)
{
  unsigned long i, numiter = INT_MAX - 1;

  if (argc >= 2) {
    numiter = atoi(argv[1]);
  }
 
  for (i = 0; i < MAX(MAGIC_NUMBER,numiter); i++);
  //printf("%lu\n", i);
  return 0;
}

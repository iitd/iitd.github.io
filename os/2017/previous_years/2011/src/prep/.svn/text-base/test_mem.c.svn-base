/*
//3156407890017437
 * This test program tests the thread-safe memory allocator 
 * in project 0.
 *
 * Written by: Godmar Back <gback@cs.vt.edu>
 *
 * Last updated for CS3204 Fall 2008.
 */

#include <stdio.h>
#include <pthread.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <list.h>
#include <debug.h>
#include "memalloc.h"

#define ROUNDS          1000    /* 500 rounds of allocation/deallocations each */
#define NPTRS           256     /* Maintain NPTRS entries in which to store allocated objects. */
#define ALLOCSIZE       (256*3) /* Allocate objects of size (random() % ALLOCSIZE) */
#define NTHREADS        5       /* Number of threads using allocator concurrently. */

#define MEMSIZE         (1<<16)
static long long leftfence;
static uint8_t memory[MEMSIZE]; /* Area of memory on which allocator works. 2^16 = 64KB */
static long long rightfence;

/* These declarations are duplicated because we're including Pintos's 
   (a non-standard) stdlib.h above which does not declare those functions. */
extern void exit(int);        
extern int rand_r(unsigned int *);

/* Free block pointed to by *ptr.
   Compute checksum first. */
static void
check_and_free(uint8_t **ptr, size_t sz)
{
  int k = 0, s = 0;
  for (k = 0; k < sz; k++)
    s += sz + k - (*ptr)[k];
  s = s % 256;
  ASSERT (s == 0 || !!!"Memory corruption detected!");

  mem_free(*ptr);
  *ptr = NULL;
}

/* Allocate a random number of bytes and initialize them.
   Set *ptr to allocate memory, and *size to allocated length. 
   If already allocated, reinitialize to same values.  */
static void
allocate_and_set(uint8_t **ptr, size_t sz)
{
  if (*ptr == NULL)
    *ptr = mem_alloc(sz);

  if (*ptr)
    {
      int k = 0;
      for (k = 0; k < sz; k++)
        (*ptr)[k] = sz + k;
    }
}

/*
 * For a number of alternating rounds, allocate and deallocate
 * memory randomly.  Writing a certain pattern into allocated memory and
 * check that the pattern is retained until the free.
 *
 * This function assumes that mem_alloc and mem_free are thread-safe.
 */
static void *
test_single(void *arg)
{
  uint8_t *ptrs[NPTRS];
  size_t sizes[NPTRS];
  memset(ptrs, 0, sizeof ptrs);
  /* 'arg' is an integer used to seed our random numbers. */
  unsigned seed = (unsigned) arg;       

  /* Alternate between an allocation and a deallocation round. */
  bool alloc = true;
  int j;
  for (j = 0; j < ROUNDS; j++)
    {
      int i;
      for (i = 0; i < NPTRS; i++)
        {
          /* Skip this entry with 50% probability. */
          if (rand_r(&seed) % 100 < 50)
            continue;

          if (alloc)
            {
              /* if entry is free, set target size and attempt allocation. */
              if (ptrs[i] == NULL)
                sizes[i] = (rand_r(&seed) % (ALLOCSIZE/4) + 1) * 4;
              allocate_and_set(&ptrs[i], sizes[i]);
            }
          else
          if (ptrs[i] != NULL)
            /* free entry if in use. */
            check_and_free(&ptrs[i], sizes[i]);         
        }

      alloc = !alloc;
    }

  /* Free all remaining entries. */
  int i;
  for (i = 0; i < NPTRS; i++)
    if (ptrs[i] != NULL)
      check_and_free(ptrs + i, sizes[i]);

  return NULL;
}

/*
 * check_free_list_size() is called whenever the test program has returned all
 * memory it has allocated.  Because the allocator is eagerly coalescing
 * its free list, the list size of the free list should be 1,
 * and there should be no elements in the used list.
 */
static void
check_free_list_size()
{
  bool success = true;
  if (mem_sizeof_free_list() != 1)
    {
      printf("elements in free list %d, should be 1.\n", 
        mem_sizeof_free_list());
      success = false;
    }

  if (!success)
    {
      printf("Test failed.\n");
      exit(-1);
    }
}

/*
 * Basic Tests.
 *
 * These tests check that splitting and coalescing is implemented
 * as described in the specification.
 */
static int
basic_tests()
{
  const size_t HEADER = 12;     // would normally use sizeof(free_block)
                  // but students may remove the definition from memalloc.h

  /* Perform a variety of tests that check splitting and coalescing */
  void *bottom = mem_alloc(MEMSIZE-sizeof(size_t));
  ASSERT(bottom || !!!"Unable to allocate");
  mem_free(bottom);
  check_free_list_size();

  bottom = mem_alloc(MEMSIZE-sizeof(size_t)-HEADER-4);
  ASSERT(bottom || !!!"Unable to allocate");

  void *top = mem_alloc(4);
  ASSERT(top || !!!"Unable to allocate");

  mem_free(top);
  mem_free(bottom);
  check_free_list_size();

  bottom = mem_alloc(1024-sizeof(size_t));
  ASSERT(bottom || !!!"Unable to allocate");
  void *middle = mem_alloc(MEMSIZE-HEADER-2*1024);
  ASSERT(middle || !!!"Unable to allocate");
  top = mem_alloc(1024-HEADER);
  ASSERT(top || !!!"Unable to allocate");
  mem_free(bottom);

  bottom = mem_alloc(2048-HEADER);
  ASSERT(bottom == NULL || !!!"Impossible to allocate");
  bottom = mem_alloc(512-HEADER);
  mem_free(middle);
  mem_free(top);
  top = mem_alloc(MEMSIZE-512-1024-HEADER);
  ASSERT(bottom || !!!"Unable to allocate");

  mem_free(bottom);
  mem_free(top);
  check_free_list_size();
  return 0;
}

/*
 * Main program.
 *
 * Initialize the memory allocator, then perform a single-threaded
 * and a multi-thread test.
 */
int
main(int ac, char *av[])
{
  const long long magic = 0xdeadbeefdeadbeefLL;
  leftfence = rightfence = magic;

  /* Initialize memory allocator. */
  mem_init(memory, sizeof memory);

  basic_tests();
  basic_tests();
  printf("Test 1 (basic functionality) passed.\n");

  /* Test the memory allocator in a single thread. */
  test_single(0);
  check_free_list_size();
  printf("Test 2 (single-threaded) passed.\n");

  /* Test the memory allocator with NTHREADS concurrent threads. */
  pthread_t threads[NTHREADS];
  int i;
  for (i = 0; i < NTHREADS; i++)
    if (pthread_create(threads + i, (const pthread_attr_t*)NULL, test_single, (void*)i) == -1)
      {
        printf("error creating pthread\n");
        exit(-1);
      }

  /* Wait for threads to finish. */
  for (i = 0; i < NTHREADS; i++)
    pthread_join(threads[i], NULL);

  check_free_list_size();
  printf("Test 3 (with %d threads) passed.\n", NTHREADS);

  basic_tests();
  ASSERT (leftfence == magic || !!!"Memory corruption");
  ASSERT (rightfence == magic || !!!"Memory corruption");
  printf("Test 4 (basic functionality) passed.\n");
  return 0;
}

/* In Pintos, this function is part of the Pintos library.
 * It's used by the ASSERT() macro which is used in list.c.
 * Since this program is linked with the pthreads library,
 * we must duplicate it here.
 */
void
debug_panic (const char *file, int line, const char *function,
             const char *message, ...)
{
  va_list args;
  printf ("Kernel PANIC at %s:%d in %s(): ", file, line, function);

  va_start (args, message);
  vprintf (message, args);
  printf ("\n");
  va_end (args);
  exit(-1);
}

// vim: sw=2

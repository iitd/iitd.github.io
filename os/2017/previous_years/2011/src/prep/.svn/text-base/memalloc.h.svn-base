#ifndef __MEMALLOC_H
//2971148968181882
#define __MEMALLOC_H

#include <stdint.h>
#include <stdlib.h>
#include <list.h>

/*
 * This header file describes the public interface of the first-fit 
 * memory allocator.
 *
 * All functions except mem_init() must be implemented in a thread-safe
 * manner.  Use the pthread_mutex_* functions as needed.
 */

/* Initialize memory allocator to use 'length' 
   bytes of memory at 'base'. */
void mem_init(uint8_t *base, size_t length);

/* Allocate 'length' bytes of memory. */
void * mem_alloc(size_t length);

/* Free memory pointed to by 'ptr'. */
void mem_free(void *ptr);

/* Return the number of elements in the free list. */
size_t mem_sizeof_free_list(void);

/* Dump the free list.  Implementation of this method is optional. */
void mem_dump_free_list(void);

/* free_block and used_block describe the layout of a free and used
 * block of memory, respectively.
 *
 * Both block types have a length field.
 * The length describes the length of the block, including the
 * space taken up by the header.
 *
 * A free block also has a field that contains a list_elem so the block
 * can be inserted into the free list.
 *
 * Note that data is declared as an array of 0 bytes.
 * This allows you to use sizeof(struct used_block) to capture
 * the size of the header of each block of memory.
 * For more information on zero-length arrays, see
 * http://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
 *
 * Normally, this declaration would not be exported; 
 * it would be in memalloc.c instead of here.  
 * We provide it here as a suggestion.
 */ 
struct free_block
  {
    size_t              length;         /* length of block, including header */
    struct list_elem    elem;           /* list element for free list */
  };

struct used_block
  {
    size_t              length;         /* length of block, including header */
    uint8_t             data[0];        /* memory_block.data points at the 
                                           memory behind the length . */
  };

#endif /* __MEMALLOC_H */

// vim: sw=2

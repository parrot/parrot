/* Memory.h
 *
 * Memory functions header
 *
 */

#if !defined(PARROT_MEMORY_H_GUARD)
#define PARROT_MEMORY_H_GUARD

void *mem_allocate_aligned(IV);

void *mem_sys_allocate(IV);

void mem_setup_allocator(struct Perl_Interp *);

#define mem_allocate_new_stash() NULL
#define mem_allocate_new_stack() NULL
#define mem_sys_memcopy memcpy
#define mem_sys_realloc realloc
#define mem_sys_free free

#endif

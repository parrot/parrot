/* Memory.h
 *
 * Memory functions header
 *
 */

#if !defined(PARROT_MEMORY_H_GUARD)
#define PARROT_MEMORY_H_GUARD

void *Allocate_Aligned(IV);

void *Sys_Allocate(IV);

void Setup_Allocator(struct Perl_Interp *);

#define Allocate_New_Stash() NULL
#define Allocate_New_Stack() NULL
#define Sys_Memcopy memcpy

#endif

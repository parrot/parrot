/* headers.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Header management functions. Handles getting of various headers, and pool creation
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_BUFFERS_H_GUARD)
#define PARROT_BUFFERS_H_GUARD

#include "parrot/parrot.h"

#define BUFFER_ALIGNMENT 16
#define STRING_ALIGNMENT 8


static void *
get_from_free_pool(struct Parrot_Interp *interpreter,
                   struct Small_Object_Pool *pool)
{
    return (*pool->get_free_object)(interpreter, pool);
}
static void
add_to_free_pool(struct Parrot_Interp *interpreter, struct Small_Object_Pool *pool, void* to_free)
{
    (*pool->add_free_object)(interpreter, pool, to_free);
}

/** Header Management Functions **/

/* pmc header small-object methods */
void add_free_pmc(struct Parrot_Interp *interpreter, struct Small_Object_Pool *pool, void *pmc);
void *get_free_pmc(struct Parrot_Interp *interpreter, struct Small_Object_Pool *pool);
void alloc_more_pmcs(struct Parrot_Interp *interpreter, struct Small_Object_Pool *pool);

/* buffer header small-object methods */
void add_free_buffer(struct Parrot_Interp *interpreter, struct Small_Object_Pool *pool, void *buffer);
void *get_free_buffer(struct Parrot_Interp *interpreter, struct Small_Object_Pool *pool);
void alloc_more_buffers(struct Parrot_Interp *interpreter, struct Small_Object_Pool *pool);

/* pool creation and access functions */
struct Small_Object_Pool *new_pmc_pool(struct Parrot_Interp *interpreter);
struct Small_Object_Pool *new_bufferlike_pool(struct Parrot_Interp *interpreter, size_t unit_size);
struct Small_Object_Pool *new_buffer_pool(struct Parrot_Interp *interpreter);
struct Small_Object_Pool *new_string_pool(struct Parrot_Interp *interpreter, INTVAL constant);
struct Small_Object_Pool *get_bufferlike_pool(struct Parrot_Interp *interpreter, size_t unit_size);

/* header creation functions */
PMC *new_pmc_header(struct Parrot_Interp *interpreter);
STRING *new_string_header(struct Parrot_Interp *interpreter, UINTVAL flags);
Buffer *new_buffer_header(struct Parrot_Interp *interpreter);
void *new_bufferlike_header(struct Parrot_Interp *interpreter, size_t size);

size_t get_max_buffer_address(struct Parrot_Interp *interpreter);
size_t get_min_buffer_address(struct Parrot_Interp *interpreter);
size_t get_max_pmc_address(struct Parrot_Interp *interpreter);
size_t get_min_pmc_address(struct Parrot_Interp *interpreter);
int is_buffer_ptr(struct Parrot_Interp *, void *);
int is_pmc_ptr(struct Parrot_Interp *, void *);

/* miscellaneous functions */
void free_pmc(PMC *);
void free_buffer(Buffer *);
void add_extra_buffer_header(struct Parrot_Interp *, void *);
void Parrot_initialize_header_pools(struct Parrot_Interp *);

#endif /* PARROT_HEADERS_H */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

/* headers.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Header management functions. Handles getting of various headers,
 *     and pool creation
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

/* XXX kwoo:  This was formerly mis-defined as PARROT_BUFFERS_H_GUARD -- if
 *      any weirdness goes forth, check for clashes with that header.
 */
#if !defined(PARROT_HEADERS_H_GUARD)
#define PARROT_HEADERS_H_GUARD

#include "parrot/parrot.h"

#define BUFFER_ALIGNMENT 16
/* XXX Temporary alignment hack.  See mem_allocate in resources.c */
#define STRING_ALIGNMENT 16 /* was 4 */


/* pool creation and access functions */
struct Small_Object_Pool *new_pmc_pool(Interp *interpreter);
struct Small_Object_Pool *new_bufferlike_pool(Interp *interpreter, size_t unit_size);
struct Small_Object_Pool *new_buffer_pool(Interp *interpreter);
struct Small_Object_Pool *new_string_pool(Interp *interpreter, INTVAL constant);
struct Small_Object_Pool *get_bufferlike_pool(Interp *interpreter, size_t unit_size);

struct Small_Object_Pool *make_bufferlike_pool(Interp *interpreter, size_t unit_size);
/* header creation functions */
PMC *new_pmc_header(Interp *interpreter, UINTVAL flags);
void add_pmc_ext(Interp *interpreter, PMC *pmc);
STRING *new_string_header(Interp *interpreter, UINTVAL flags);
Buffer *new_buffer_header(Interp *interpreter);
void *new_bufferlike_header(Interp *interpreter, size_t size);

size_t get_max_buffer_address(Interp *interpreter);
size_t get_min_buffer_address(Interp *interpreter);
size_t get_max_pmc_address(Interp *interpreter);
size_t get_min_pmc_address(Interp *interpreter);
int is_buffer_ptr(Interp *, void *);
int is_pmc_ptr(Interp *, void *);

/* COW support */
void buffer_mark_COW(Buffer *b);
Buffer * buffer_unmake_COW(Interp *, Buffer *src);
Buffer * buffer_copy_if_diff(Interp *, Buffer *src, Buffer *dst);

/* miscellaneous functions */
void Parrot_initialize_header_pools(Interp *);
void Parrot_destroy_header_pools(Interp *interpreter);

#endif /* PARROT_HEADERS_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

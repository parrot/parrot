/* headers.h
 *  Copyright (C) 2001-2003, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Header management functions. Handles getting of various headers,
 *     and pool creation
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_HEADERS_H_GUARD
#define PARROT_HEADERS_H_GUARD

#include "parrot/parrot.h"

/*
 * we need an alignment that is the same as malloc(3) have for
 * allocating Buffer items like FLOATVAL (double)
 * This should be either a config hint or tested
 */
#ifdef MALLOC_ALIGNMENT
#  define BUFFER_ALIGNMENT MALLOC_ALIGNMENT
#else
/* or (2 * sizeof (size_t)) */
#  define BUFFER_ALIGNMENT 8
#endif

#define BUFFER_ALIGN_1 (BUFFER_ALIGNMENT - 1)
#define BUFFER_ALIGN_MASK ~BUFFER_ALIGN_1

#define WORD_ALIGN_1 (sizeof (void *) - 1)
#define WORD_ALIGN_MASK ~WORD_ALIGN_1

/* pool iteration */
typedef enum {
    POOL_PMC    = 0x01,
    POOL_BUFFER = 0x02,
    POOL_CONST  = 0x04,
    POOL_ALL    = 0x07
} pool_iter_enum;

typedef int (*pool_iter_fn)(Interp *, struct Small_Object_Pool *, int, void*);


/* HEADERIZER BEGIN: src/headers.c */

void add_pmc_ext( Interp *interp /*NN*/, PMC *pmc /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void add_pmc_sync( Interp *interp, PMC *pmc /*NN*/ )
        __attribute__nonnull__(2);

Small_Object_Pool * get_bufferlike_pool( Interp *interp /*NN*/,
    size_t buffer_size )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

size_t get_max_buffer_address( Interp *interp /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__pure__
        __attribute__warn_unused_result__;

size_t get_max_pmc_address( const Interp *interp /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__pure__
        __attribute__warn_unused_result__;

size_t get_min_buffer_address( Interp *interp /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__pure__
        __attribute__warn_unused_result__;

size_t get_min_pmc_address( Interp *interp /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__pure__
        __attribute__warn_unused_result__;

int is_buffer_ptr( Interp *interp /*NN*/, const void *ptr /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

int is_pmc_ptr( Interp *interp /*NN*/, const void *ptr )
        __attribute__nonnull__(1);

Small_Object_Pool * make_bufferlike_pool( Interp *interp /*NN*/,
    size_t buffer_size )
        __attribute__nonnull__(1);

Buffer * new_buffer_header( Interp *interp /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

Small_Object_Pool * new_buffer_pool( Interp *interp /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

void * new_bufferlike_header( Interp *interp /*NN*/, size_t size )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

Small_Object_Pool * new_bufferlike_pool( Interp *interp /*NN*/,
    size_t actual_buffer_size )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

PMC * new_pmc_header( Interp *interp /*NN*/, UINTVAL flags )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

Small_Object_Pool * new_pmc_pool( Interp *interp /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

STRING * new_string_header( Interp *interp /*NN*/, UINTVAL flags )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

Small_Object_Pool * new_string_pool( Interp *interp /*NN*/, INTVAL constant )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

void Parrot_destroy_header_pools( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

int Parrot_forall_header_pools( Interp *interp /*NN*/,
    int flag,
    void *arg,
    pool_iter_fn func /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(4);

void Parrot_initialize_header_pool_names( Interp *interp );
void Parrot_initialize_header_pools( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

void Parrot_merge_header_pools( Interp *dest_interp /*NN*/,
    Interp *source_interp /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: src/headers.c */


#endif /* PARROT_HEADERS_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

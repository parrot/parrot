/*
Copyright (C) 2010-2012, Parrot Foundation.

=head1 NAME

include/parrot/pointer_array.h - Storage of pointers.

=head1 DESCRIPTION

Storage for pointers used in GC implementation.

Storage organized in 4KB chunks. Every cell in chunk either real pointer
or pointer to next free cell.

Lower bit in cell masked to indicate pointer-to-free-cell.

*/

#ifndef PARROT_POINTER_ARRAY_H_GUARD
#define PARROT_POINTER_ARRAY_H_GUARD

#include <parrot/memory.h>

/* Calculate size of chunk data     "header"  */
#define CHUNK_SIZE 4096
#define CELL_PER_CHUNK ((CHUNK_SIZE - 2 * sizeof(size_t)) / sizeof (void *))

typedef struct Parrot_Pointer_Array_Chunk {
    size_t   num_free;
    size_t   next_free; /* Index of next free element within chunk */
    void    *data[CELL_PER_CHUNK];
} Parrot_Pointer_Array_Chunk;

typedef struct Parrot_Pointer_Array {
    /* Next free cell (used after freeing some cells) */
    /* "Look, ma! Pointer to pointer to void!!!" */
    void                       **next_free;
    /* Index of last used chunk */
    size_t                       current_chunk;
    /* Total number of allocated chunks */
    size_t                       total_chunks;

    Parrot_Pointer_Array_Chunk **chunks;
} Parrot_Pointer_Array;

/* Poor man C++ templating... */
#define POINTER_ARRAY_ITER(_array, _code)                           \
do {                                                                \
    size_t _i;                                                      \
    for (_i = 0; _i < (_array)->total_chunks; _i++) {               \
        Parrot_Pointer_Array_Chunk  *chunk = (_array)->chunks[_i];  \
        size_t                       _j;                            \
                                                                    \
        for (_j = 0; _j < CELL_PER_CHUNK - chunk->num_free; _j++) { \
            void *ptr = chunk->data[_j];                            \
            if ((ptrcast_t)(ptr) & 1)                                 \
                continue;                                           \
                                                                    \
            { _code }                                               \
        }                                                           \
    }                                                               \
} while (0);

/*

Inline functions for faster access.

*/


/*

=over 4

=item C<static void * Parrot_pa_insert(Parrot_Pointer_Array *self, void *ptr)>

Insert pointer into the array.

=cut

*/

static
PARROT_INLINE
void *
Parrot_pa_insert(ARGMOD(Parrot_Pointer_Array *self), ARGIN(void *ptr))
{
    void *ret;

    /* Reuse removed cell */
    if (self->next_free) {
        void **next      = (void**)((ptrcast_t)*self->next_free & ~1);
        ret = self->next_free;
        *self->next_free = ptr;
        self->next_free = next;
    }
    else {
        Parrot_Pointer_Array_Chunk *chunk;

        /* If there is no free chunks */
        if (self->current_chunk >= self->total_chunks
                || !self->chunks[self->current_chunk]->num_free) {
            self->current_chunk = self->total_chunks++;
            mem_internal_realloc_n_typed(self->chunks,
                    self->total_chunks,
                    Parrot_Pointer_Array_Chunk*);
            self->chunks[self->current_chunk] = mem_internal_allocate_typed(Parrot_Pointer_Array_Chunk);
            self->chunks[self->current_chunk]->num_free  = CELL_PER_CHUNK;
            self->chunks[self->current_chunk]->next_free = 0;
        }

        chunk = self->chunks[self->current_chunk];
        --chunk->num_free;
        /* Invariant: all chunks after chunk->next_free are free */
        /* We handle previously freed chunks early */
        ret = &chunk->data[chunk->next_free];
        chunk->data[chunk->next_free++] = ptr;
    }
    return ret;
}

/*

=item C<static void Parrot_pa_remove(PARROT_INTERP, Parrot_Pointer_Array *self,
void *ptr)>

Remove pointer from array.

=back

=cut

*/

static
PARROT_INLINE
void
Parrot_pa_remove(PARROT_INTERP, ARGIN(Parrot_Pointer_Array *self), ARGIN(void *ptr))
{
    /* Mark sell to avoid iterating over */
    *(void**)ptr = (void*)((ptrcast_t)self->next_free | 1);
    self->next_free = (void**)ptr;
}


/* HEADERIZER BEGIN: src/pointer_array.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void Parrot_pa_destroy(PARROT_INTERP, ARGFREE(Parrot_Pointer_Array *self))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
int Parrot_pa_is_owned(
    ARGIN(const Parrot_Pointer_Array *self),
    ARGIN(const void *orig),
    ARGIN_NULLOK(const void *ref))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Parrot_Pointer_Array * Parrot_pa_new(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
size_t Parrot_pa_count_allocated(PARROT_INTERP,
    ARGIN(const Parrot_Pointer_Array *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
size_t Parrot_pa_count_used(PARROT_INTERP,
    ARGIN(const Parrot_Pointer_Array *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_pa_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pa_is_owned __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(orig))
#define ASSERT_ARGS_Parrot_pa_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pa_count_allocated __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_Parrot_pa_count_used __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/pointer_array.c */



#endif /* PARROT_POINTER_ARRAY_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

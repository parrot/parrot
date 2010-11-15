/*
Copyright (C) 2010, Parrot Foundation.

=head1 NAME

src/pointer_array.c - Implementation Pointer Array storage.

=head1 DESCRIPTION

=cut

*/

#include "parrot/parrot.h"
#include "parrot/pointer_array.h"


/* HEADERIZER HFILE: include/parrot/pointer_array.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void allocate_more_chunks(PARROT_INTERP,
    ARGIN(Parrot_Pointer_Array *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_allocate_more_chunks __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

PARROT_CANNOT_RETURN_NULL
Parrot_Pointer_Array *
Parrot_pa_new(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_pa_new)
    Parrot_Pointer_Array *res = mem_allocate_zeroed_typed(Parrot_Pointer_Array);
    return res;
}

void
Parrot_pa_destroy(PARROT_INTERP, ARGIN(Parrot_Pointer_Array *self))
{
    /* TODO */
}

void **
Parrot_pa_insert(PARROT_INTERP, ARGIN(Parrot_Pointer_Array *self), ARGIN(void *ptr))
{
    Parrot_Pointer_Array_Chunk   *chunk;
    void                        **ret;

    /* If there is no free chunks */
    if (self->current_chunk >= self->total_chunks)
         allocate_more_chunks(interp, self);

    /* Reuse removed cell */
    if (self->next_free) {
        // FIXME. Cast to UINTVAL is wrong
        void **next      = (void**)((UINTVAL)*self->next_free & ~1);
        ret = self->next_free;
        *self->next_free = ptr;
        self->next_free = next;
        return ret;
    }

    if (!self->chunks[self->current_chunk]->num_free)
        allocate_more_chunks(interp, self);

    chunk = self->chunks[self->current_chunk];
    --chunk->num_free;
    /* Invariant: all chunks after chunk->next_free are free */
    /* We handle previously freed chunks early */
    ret = &chunk->data[chunk->next_free];
    chunk->data[chunk->next_free++] = ptr;
    return ret;
}

void
Parrot_pa_remove(PARROT_INTERP, ARGIN(Parrot_Pointer_Array *self), ARGIN(void **ptr))
{
    ASSERT_ARGS(Parrot_pa_remove)
    if (self->next_free)
        *self->next_free = (void**)((UINTVAL)*self->next_free | 1);
    self->next_free = ptr;
}

static void
allocate_more_chunks(PARROT_INTERP, ARGIN(Parrot_Pointer_Array *self))
{
    ASSERT_ARGS(allocate_more_chunks)
    self->current_chunk = self->total_chunks++;
    self->chunks = mem_realloc_n_typed(self->chunks,
            self->total_chunks,
            Parrot_Pointer_Array_Chunk*);
    self->chunks[self->current_chunk] = mem_allocate_typed(Parrot_Pointer_Array_Chunk);
    self->chunks[self->current_chunk]->num_free  = CELL_PER_CHUNK;
    self->chunks[self->current_chunk]->next_free = 0;
}

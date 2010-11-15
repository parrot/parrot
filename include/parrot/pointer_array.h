/*
Copyright (C) 2010, Parrot Foundation.

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

/* Calculate size of chunk data     "header"  */
#define CELL_PER_CHUNK ((4096 - 2 * sizeof(size_t) / sizeof (void *)))

typedef struct Parrot_Pointer_Array_Chunk {
    size_t   num_free;
    size_t   next_free; /* Index of next free element within chunk */
    void    *data[1000];
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


/* HEADERIZER BEGIN: src/pointer_array.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void Parrot_pa_destroy(PARROT_INTERP, ARGIN(Parrot_Pointer_Array *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void ** Parrot_pa_insert(PARROT_INTERP,
    ARGIN(Parrot_Pointer_Array *self),
    ARGIN(void *ptr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
Parrot_Pointer_Array * Parrot_pa_new(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_pa_remove(PARROT_INTERP,
    ARGIN(Parrot_Pointer_Array *self),
    ARGIN(void **ptr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_Parrot_pa_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_Parrot_pa_insert __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(ptr))
#define ASSERT_ARGS_Parrot_pa_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pa_remove __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(ptr))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/pointer_array.c */



#endif /* PARROT_POINTER_ARRAY_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

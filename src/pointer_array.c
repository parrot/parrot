/*
Copyright (C) 2010-2011, Parrot Foundation.

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

/*

=over 4

=item C<Parrot_Pointer_Array * Parrot_pa_new(PARROT_INTERP)>

Allocate new Pointer_Array.

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Parrot_Pointer_Array *
Parrot_pa_new(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_pa_new)
    Parrot_Pointer_Array * const res = mem_allocate_zeroed_typed(Parrot_Pointer_Array);
    return res;
}

/*

=item C<void Parrot_pa_destroy(PARROT_INTERP, Parrot_Pointer_Array *self)>

Destroy Pointer_Arra and free allocated memory.

=cut

*/

PARROT_EXPORT
void
Parrot_pa_destroy(PARROT_INTERP, ARGFREE(Parrot_Pointer_Array *self))
{
    ASSERT_ARGS(Parrot_pa_destroy)
    size_t i;
    for (i = 0; i < self->total_chunks; i++)
        mem_sys_free(self->chunks[i]);
    mem_sys_free(self->chunks);
    mem_sys_free(self);
}

/*

=item C<size_t Parrot_pa_count_allocated(PARROT_INTERP, const
Parrot_Pointer_Array *self)>

Get count of allocated objects.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
size_t
Parrot_pa_count_allocated(PARROT_INTERP, ARGIN(const Parrot_Pointer_Array *self))
{
    ASSERT_ARGS(Parrot_pa_count_allocated)
    return self->total_chunks * CELL_PER_CHUNK;
}

/*

=item C<size_t Parrot_pa_count_used(PARROT_INTERP, const Parrot_Pointer_Array
*self)>

Get count of allocated objects.

=cut

*/
PARROT_WARN_UNUSED_RESULT
size_t
Parrot_pa_count_used(PARROT_INTERP, ARGIN(const Parrot_Pointer_Array *self))
{
    ASSERT_ARGS(Parrot_pa_count_used)
    size_t count = 0;
    POINTER_ARRAY_ITER(self, count++;);
    return count;
}


/*

=item C<int Parrot_pa_is_owned(PARROT_INTERP, Parrot_Pointer_Array *self, void
*orig, void *ref)>

Check that C<orig> pointer is stored in C<ref> cell. Used during system stack t

=cut

*/
PARROT_EXPORT
int
Parrot_pa_is_owned(PARROT_INTERP, ARGIN(Parrot_Pointer_Array *self),
        ARGIN(void *orig), ARGIN_NULLOK(void *ref))
{
    ASSERT_ARGS(Parrot_pa_is_owned)
    size_t i;

    /* Return early if ref is null */
    if (!ref)
        return 0;

    /* We can't just deref pointer. It can be garbage */
    /* So, ensure that C<ref> is looks like real pointer */
    for (i = 0; i < self->total_chunks; i++) {
        const Parrot_Pointer_Array_Chunk * const chunk = self->chunks[i];
        if (PTR2UINTVAL(ref) < PTR2UINTVAL(chunk->data))
            continue;
        if (PTR2UINTVAL(ref) > PTR2UINTVAL(chunk) + CHUNK_SIZE)
            continue;
        return (*(void **)ref == orig);
    }

    return 0;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/pointer_array.h>

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

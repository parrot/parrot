/*
Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/lexical.c - Lexical Pads

=head1 DESCRIPTION

Lexical pad aka scratchpad functions. One lexical pad is a FixedPMCArray of
OrderedHashes per statically nesting depth. The OrderedHash has lexical names
as keys pointing to indices into the contained array. Mixing store_by_name and
store_by_index isn't supported by the OrderedHash.

=head2 Functions

=over 4

*/

#include "parrot/parrot.h"

/*

=item C<static struct Parrot_Lexicals *
scratchpad_index(Interp* interpreter, PMC* pad,
                 INTVAL scope_index)>

Uses C<scope_index> to find and return the appropriate scope.

=cut

*/

static PMC*
scratchpad_index(Interp* interpreter, PMC* pad, INTVAL scope_index)
{
    PMC **data;
    /* if scope_index is negative we count out from current pad */
    scope_index = scope_index < 0 ?
        PMC_int_val(pad) + scope_index : scope_index;

    if (scope_index >= PMC_int_val(pad) || scope_index < 0) {
        internal_exception(-1, "Pad index out of range");
        return NULL;
    }

    data = (PMC **)PMC_data(pad);
    return data[scope_index];
}

/*

=item C<PMC *
scratchpad_get_current(Interp * interp)>

Returns a pointer to the current scratchpad.

=cut

*/

PMC *
scratchpad_get_current(Interp * interp)
{
    return (PMC *)stack_peek(interp, interp->ctx.pad_stack, NULL);
}

/*

=item C<PMC*
scratchpad_new(Interp * interp, PMC * base, INTVAL depth)>

Creates and initializes a new C<Scratchpad> PMC.

=cut

*/

PMC*
scratchpad_new(Interp * interp, PMC * base, INTVAL depth)
{
    PMC * pad_pmc;

    Parrot_block_DOD(interp);
    pad_pmc = pmc_new(interp, enum_class_Scratchpad);
    if (base && depth < 0) {
        depth = PMC_int_val(base) + depth + 1;
    }

    if ((depth < 0)
        || (base && depth > PMC_int_val(base))
        || (!base && depth != 0)) {
        Parrot_unblock_DOD(interp);
        internal_exception(-1, "-scratch_pad: too deep\n");
        return NULL;
    }

    VTABLE_set_integer_native(interp, pad_pmc, depth + 1);

    if (base) {
        memcpy(PMC_data(pad_pmc), PMC_data(base), PMC_int_val(base) *
               sizeof(PMC*));
    }

    ((PMC**)PMC_data(pad_pmc))[depth] = pmc_new(interp, enum_class_OrderedHash);

    Parrot_unblock_DOD(interp);

    return pad_pmc;
}

/*

=item C<void
scratchpad_store(Interp *, PMC *pad, STRING * name, PMC* value)>

Store lexical name C<name>. It has to exist at some statical depth already.

=cut

*/

void
scratchpad_store(Interp * interp, PMC *pad, STRING * name, PMC* value)
{
    PMC *ohash;
    HashBucket *b;
    INTVAL i;

    for (i = PMC_int_val(pad) - 1; i >= 0; i--) {
        ohash = ((PMC**)PMC_data(pad))[i];
        b = hash_get_bucket(interp, (Hash*) PMC_struct_val(ohash), name);
        if (b) {
            VTABLE_set_pmc_keyed_int(interp, ohash,
                PMC_int_val((PMC*)b->value), value);
            return;
        }
    }

    internal_exception(-1, "Lexical '%s' not found",
                               (name == NULL) ? "???"
                               : string_to_cstring(interp, name));
}

/*

=item C<void
scratchpad_store_by_index(Interp * interp, PMC *pad,
                       INTVAL scope_index, INTVAL position, PMC* value)>

scratchpad_store_by_name(Interp * interp, PMC *pad,
                       INTVAL scope_index, STRING *name, PMC* value)>

Stores C<*value> with name C<*name> or index C<position> in the
scratchpad at C<scope_index>.

=cut

*/

void
scratchpad_store_by_index(Interp * interp, PMC *pad,
                       INTVAL scope_index, INTVAL position, PMC* value)
{
    PMC *ohash;

    ohash = scratchpad_index(interp, pad, scope_index);
    VTABLE_set_pmc_keyed_int(interp, ohash, position, value);
}

void
scratchpad_store_by_name(Interp * interp, PMC *pad,
                       INTVAL scope_index, STRING* name, PMC* value)
{
    PMC *ohash;

    ohash = scratchpad_index(interp, pad, scope_index);
    VTABLE_set_pmc_keyed_str(interp, ohash, name, value);
}

/*

=item C<PMC* scratchpad_find(Interp* interp, STRING * name)>

Returns the lexical C<*name> at any depth or
C<NULL> if it can not be found.

=cut

*/

PMC*
scratchpad_find(Interp* interp, PMC *pad, STRING * name)
{
    PMC *ohash;
    HashBucket *b;
    INTVAL i;

    if (!pad)
        return NULL;
    for (i = PMC_int_val(pad) - 1; i >= 0; i--) {
        ohash = ((PMC**)PMC_data(pad))[i];
        b = hash_get_bucket(interp, (Hash*) PMC_struct_val(ohash), name);
        if (b)
            return VTABLE_get_pmc_keyed_int(interp, ohash,
                PMC_int_val((PMC*)b->value));
    }

    return NULL;
}

/*

=item C<PMC *
scratchpad_get_by_name(Interp *, PMC *pad, INTVAL depth, STRING * name)>

Get lexical at C<depth> by C<name>.

=cut

*/

PMC *
scratchpad_get_by_name(Interp * interp, PMC *pad, INTVAL depth, STRING * name)
{
    PMC *ohash;
    HashBucket *b;

    if (!pad)
        return NULL;

    ohash = scratchpad_index(interp, pad, depth);
    b = hash_get_bucket(interp, (Hash*) PMC_struct_val(ohash), name);

    if (!b)
        return NULL;
    return VTABLE_get_pmc_keyed_int(interp, ohash,
                PMC_int_val((PMC*)b->value));
}

/*

=item C<PMC *
scratchpad_get_by_index(Interp *, INTVAL scope_index, INTVAL position)>

Get the lexical at depth C<scope_index> and C<position>.

=cut

*/

PMC *
scratchpad_get_by_index(Interp * interp, PMC *pad, INTVAL depth, INTVAL pos)
{
    PMC *ohash;

    if (!pad)
        return NULL;

    ohash = scratchpad_index(interp, pad, depth);
    return VTABLE_get_pmc_keyed_int(interp, ohash, pos);
}

/*

=item C<void
lexicals_mark(Interp * interp, PMC *lex)>

Calls C<list_mark()> on the lexical's names and values.

=cut

*/

void
lexicals_mark(Interp * interp, PMC *lex)
{
    pobject_lives(interp, (PObj*)lex);
}

/*

=item C<void
scratchpad_delete(Parrot_Interp interp, PMC *pad, STRING *name)>

Deletes scratchpad C<*pad>.

=cut

*/

void
scratchpad_delete(Parrot_Interp interp, PMC *pad, STRING *name)
{
    PMC *ohash;
    HashBucket *b;
    INTVAL i;

    for (i = PMC_int_val(pad) - 1; i >= 0; i--) {
        ohash = ((PMC**)PMC_data(pad))[i];
        b = hash_get_bucket(interp, (Hash*) PMC_struct_val(ohash), name);
        if (b) {
            VTABLE_delete_keyed_str(interp, ohash, name);
            return;
        }
    }
}
/*

=back

=head1 SEE ALSO

F<include/parrot/lexical.h>.

=head1 HISTORY

  Initial version by Melvin on 2002/06/6.
  Splitted into separate file by leo on 20.06.2004.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */

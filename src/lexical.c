/*
Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/lexical.c - Lexical Pads

=head1 DESCRIPTION

Lexical pad aka scratchpad functions.

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

static struct Parrot_Lexicals *
scratchpad_index(Interp* interpreter, PMC* pad,
                 INTVAL scope_index)
{
    /* if scope_index is negative we count out from current pad */
    scope_index = scope_index < 0 ?
        PMC_int_val(pad) + scope_index : scope_index;

    if (scope_index >= PMC_int_val(pad) || scope_index < 0) {
        internal_exception(-1, "Pad index out of range");
        return NULL;
    }

    return &(((struct Parrot_Lexicals *)PMC_data(pad))[scope_index]);
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

=item C<static INTVAL
lexicals_get_position(Interp * interp,
                      struct Parrot_Lexicals *lex, STRING* name)>

Returns the position of the lexical variable corresponding to C<*name>.
If such a variable can not be found the length of the list is returned
(i.e. the position that this new lexical should be stored in).

=cut

*/

static INTVAL
lexicals_get_position(Interp * interp,
                      struct Parrot_Lexicals *lex, STRING* name)
{
    STRING * cur;
    INTVAL pos;

    for (pos = 0; pos < list_length(interp, lex->names); pos++) {
        cur = *(STRING**)list_get(interp, lex->names, pos, enum_type_STRING);
        if (cur && string_compare(interp, cur, name) == 0) {
            break;
        }
    }

    return pos;
}

/*

=item C<static struct Parrot_Lexicals *
scratchpad_find(Interp* interp, PMC* pad, STRING * name,
                INTVAL * position)>

Returns first lexical scope and position where C<*name> is found, or
C<NULL> if it can not be found.

=cut

*/

static struct Parrot_Lexicals *
scratchpad_find(Interp* interp, PMC* pad, STRING * name,
                INTVAL * position)
{
    INTVAL i, pos = 0;
    struct Parrot_Lexicals * lex = NULL;

    for (i = PMC_int_val(pad) - 1; i >= 0; i--) {
        lex = &(((struct Parrot_Lexicals *)PMC_data(pad))[i]);
        pos = lexicals_get_position(interp, lex, name);
        if (pos == list_length(interp, lex->names))
            lex = NULL;
        else
            break;
    }

    *position = pos;
    return lex;
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

    /* XXX JPS: should we use a List * here instead? */
    PMC_data(pad_pmc) = mem_sys_allocate((depth + 1) *
                                     sizeof(struct Parrot_Lexicals));

    if (base) {
        /* XXX JPS: I guess this is copying the front, when it should
           be copying the end of the parent (base) */
        memcpy(PMC_data(pad_pmc), PMC_data(base), depth *
               sizeof(struct Parrot_Lexicals));
    }

    PMC_int_val(pad_pmc) = depth + 1;

    /* in case call to list_new triggers gc */
    ((struct Parrot_Lexicals *)PMC_data(pad_pmc))[depth].values = NULL;
    ((struct Parrot_Lexicals *)PMC_data(pad_pmc))[depth].names = NULL;

    ((struct Parrot_Lexicals *)PMC_data(pad_pmc))[depth].values =
        list_new(interp, enum_type_PMC);
    ((struct Parrot_Lexicals *)PMC_data(pad_pmc))[depth].names =
        list_new(interp, enum_type_STRING);

    Parrot_unblock_DOD(interp);

    return pad_pmc;
}

/*

=item C<void
scratchpad_store(Interp * interp, PMC * pad,
                 STRING * name, INTVAL position, PMC* value)>

Routines for storing and reading lexicals in C<Scratchpad> PMCs. These
take both a name and a position, however in general only one of these
will be considered. This is to support both by name access and by
position (which is faster). If by position access is intended name
should be passed as C<NULL>.

=cut

*/

void
scratchpad_store(Interp * interp, PMC * pad,
                 STRING * name, INTVAL position, PMC* value)
{
    struct Parrot_Lexicals * lex;

    if (name) {
        /* use name to find lex and position */
        lex = scratchpad_find(interp, pad, name, &position);
        if (!lex)
            internal_exception(-1, "Lexical '%s' not found",
                               (name == NULL) ? "???"
                               : string_to_cstring(interp, name));
    }
    else {
        /* assume current lexical pad */
        lex = scratchpad_index(interp, pad, -1);
    }

    list_assign(interp, lex->values, position, value, enum_type_PMC);
}

/*

=item C<void
scratchpad_store_index(Interp * interp, PMC * pad,
                       INTVAL scope_index, STRING * name, INTVAL position,
                       PMC* value)>

Stores C<*value> with name C<*name> or index C<position> in the
scratchpad at C<scope_index>.

=cut

*/

void
scratchpad_store_index(Interp * interp, PMC * pad,
                       INTVAL scope_index, STRING * name, INTVAL position,
                       PMC* value)
{
    struct Parrot_Lexicals * lex;

    lex = scratchpad_index(interp, pad, scope_index);

    if (name) {
        position = lexicals_get_position(interp, lex, name);
    }

    if (position == list_length(interp, lex->names)) {
        if (!name) {
            /* no name for new variable, give it a default name of "" */
            /* XXX JPS: is this the way to make an empty string? */
            name = string_make(interp, "        ", 9,"iso-8859-1",0);
        }
        list_assign(interp, lex->names, position, name, enum_type_STRING);
    }

    list_assign(interp, lex->values, position, value, enum_type_PMC);
}

/*

=item C<PMC *
scratchpad_get(Interp * interp, PMC * pad, STRING * name,
               INTVAL position)>

Finds and returns the value for name C<*name> in scratchpad C<*pad>.

=cut

*/

PMC *
scratchpad_get(Interp * interp, PMC * pad, STRING * name,
               INTVAL position)
{
    struct Parrot_Lexicals * lex = NULL;

    if (!pad)
        return NULL;
    if (name) lex = scratchpad_find(interp, pad, name, &position);
    else lex = scratchpad_index(interp, pad, -1);

    if (!lex)
        return NULL;

    return *(PMC **)list_get(interp, lex->values, position, enum_type_PMC);
}

/*

=item C<PMC *
scratchpad_get_index(Interp * interp, PMC * pad,
                     INTVAL scope_index, STRING * name, INTVAL position)>

Finds and returns the value for name C<*name> in scratchpad C<*pad>.

=cut

*/

PMC *
scratchpad_get_index(Interp * interp, PMC * pad,
                     INTVAL scope_index, STRING * name, INTVAL position)
{
    struct Parrot_Lexicals * lex;

    if (!pad)
        return NULL;
    lex = scratchpad_index(interp, pad, scope_index);

    if (name) {
        position = lexicals_get_position(interp, lex, name);
    }

    if (!lex || position < 0 || position >= list_length(interp, lex->values)) {
        return NULL;
    }

    return *(PMC **)list_get(interp, lex->values, position, enum_type_PMC);
}

/*

=item C<void
lexicals_mark(Interp * interp, struct Parrot_Lexicals *lex)>

Calls C<list_mark()> on the lexical's names and values.

=cut

*/

void
lexicals_mark(Interp * interp, struct Parrot_Lexicals *lex)
{
    if (lex->names)
        list_mark(interp, lex->names);
    if (lex->values)
        list_mark(interp, lex->values);
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
    INTVAL pos;
    struct Parrot_Lexicals *lex = scratchpad_find(interp, pad, name, &pos);
    if (lex)
        list_assign(interp, lex->names, pos, NULL, enum_type_STRING);
}
/*

=back

=head1 SEE ALSO

F<include/parrot/lexical.h>.

=head1 HISTORY

  Initial version by Melvin on 2002/06/6.
  Splitted into separate file by leo.

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

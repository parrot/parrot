/*
Copyright (C) 2010, Parrot Foundation.
$Id$

=head1 NAME

src/string/grapheme.c - Grapheme table handling

=head1 DESCRIPTION

This file implements the grapheme tables tha underly the NFG support
for the Parrot string subsystem.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "grapheme.h"

/* HEADERIZER HFILE: src/string/grapheme.h */

/* HEADERIZER BEGIN: static */
/* HEADERIZER END: static */


#if PARROT_HAS_ICU

/*

=item C<INTVAL grapheme_table_capacity(PARROT_INTERP, grapheme_table *table)>

Return the space left on C<table>.

*/

INTVAL
grapheme_table_capacity(PARROT_INTERP, grapheme_table *table)
{
    ASSERT_ARGS(grapheme_table_capacity)
    if (table)
        return table->size - table->used;
    return 0;
}

/*

=item C<grapheme_table * create_grapheme_table(PARROT_INTERP, UINTVAL n)>

Creates and returns a grapheme table with space for at least C<n> graphemes.

*/

grapheme_table *
create_grapheme_table(PARROT_INTERP, UINTVAL n)
{
    ASSERT_ARGS(create_grapheme_table)
    UINTVAL entries = (n > MIN_TABLE_LENGTH) ? n - MIN_TABLE_LENGTH : 0;
    grapheme_table *table = (grapheme_table *) mem_sys_allocate(sizeof (grapheme_table)
        + entries * sizeof (grapheme));

    table->size = entries + MIN_TABLE_LENGTH;
    table->used = 0;

    return table;
}

/*

=item C<grapheme_table * clone_grapheme_table(PARROT_INTERP, grapheme_table
*src)>

Creates and returns a deep clone of the grapheme table passed in C<src>.

*/

grapheme_table *
clone_grapheme_table(PARROT_INTERP, grapheme_table *src)
{
    ASSERT_ARGS(clone_grapheme_table)
    if (src != NULL) {
        INTVAL i;
        grapheme_table * dst = create_grapheme_table(interp, src->used);

        dst->used = src->used;

        for (i = 0; i < src->used; i++) {
            dst->graphemes[i].len =  src->graphemes[i].len;
            dst->graphemes[i].hash = src->graphemes[i].hash;
            dst->graphemes[i].codepoints =
                mem_gc_allocate_n_typed(interp, src->graphemes[i].len, UChar32);
            memcpy(dst->graphemes[i].codepoints, src->graphemes[i].codepoints,
                   src->graphemes[i].len * sizeof (UChar32));
        }

        return dst;
    }
    else {
        return NULL;
    }
}

/*

=item C<grapheme_table * grow_grapheme_table(PARROT_INTERP, grapheme_table *src,
UINTVAL n)>

Returns a grapheme table with the same contents as C<src> and space for at least
C<n> extra graphemes.

*/
grapheme_table *
grow_grapheme_table(PARROT_INTERP, grapheme_table *src, UINTVAL n)
{
    ASSERT_ARGS(grow_grapheme_table)
    grapheme_table *table;
    if (src) {
        const INTVAL newsize = src->size + n;
        table = (grapheme_table *) mem_sys_realloc(src, sizeof (grapheme_table)
                                                        + newsize * sizeof (grapheme));
        table->size = newsize;
    }
    else {
        table = create_grapheme_table(interp, n);
    }

    return table;
}

/*

=item C<void destroy_grapheme_table(PARROT_INTERP, grapheme_table *table)>

Releases back to the system all resources consumed by the grapheme table an
the graphemes it contains.

*/

void
destroy_grapheme_table(PARROT_INTERP, grapheme_table *table)
{
    ASSERT_ARGS(destroy_grapheme_table)
    INTVAL i = 0;
    while (i < table->used) {
        mem_gc_free(interp, table->graphemes[i++].codepoints);
    }
    mem_gc_free(interp, table);
}


/*

=item C<void merge_tables_and_fixup_substring(PARROT_INTERP, STRING *dest,
grapheme_table *table, UINTVAL offset, UINTVAL len)>

Causes all graphemes contained in C<table> to be appended to C<dest>'s grapheme
table and any references to the codepoints in  C<table> found in the C<len>
positions that follow C<offset> are changed to be consistent with the graphemes
stored in C<dest>'s grapheme table.

*/

void
merge_tables_and_fixup_substring(PARROT_INTERP, STRING *dest,
    grapheme_table *table, UINTVAL offset, UINTVAL len)
{
    ASSERT_ARGS(merge_tables_and_fixup_substring)
    INTVAL i;
    UChar32 *buf = (UChar32 *) dest->strstart;
    UChar32 *new_codepoints;

    if (table == NULL || table->used == 0)
        return;

    if (dest->extra == NULL) {
        dest->extra = clone_grapheme_table(interp, table);
        return;
    }

    new_codepoints = mem_gc_allocate_n_typed(interp, table->used, UChar32);

    dest->extra = grow_grapheme_table(interp, (grapheme_table *)dest->extra, table->used);

    /* Add the new graphemes to the old table. */
    for (i = 0; i < table->used; i++) {
        new_codepoints[i] = add_grapheme(interp,
            (grapheme_table *) dest->extra, &(table->graphemes[i]));
    }

    /* And fixup the string. */
    for (i = offset; i < len; i++) {
        int32_t codepoint = buf[i];
        if (codepoint < 0)
            buf[i] = new_codepoints[(-1 - codepoint)];
    }

    mem_gc_free(interp, new_codepoints);
}

/*

=item C<grapheme_table * rehash_grapheme_table(PARROT_INTERP, grapheme_table
*src)>

Recalculates the hash value for all graphemes in C<src>.

*/

grapheme_table *
rehash_grapheme_table(PARROT_INTERP, grapheme_table *src)
{
    ASSERT_ARGS(rehash_grapheme_table)
    if (src != NULL) {
        INTVAL i;
        UINTVAL hash = 0xffff;
        for (i = 0; i < src->used; i++) {
            INTVAL    j = 0;
            while (j < src->graphemes[i].len) {
                hash += hash << 5;
                hash += src->graphemes[i].codepoints[j++];
            }
            src->graphemes[i].hash = hash;
        }
    }

    return src;
}

/*

=item C<UChar32 add_grapheme(PARROT_INTERP, grapheme_table *table, grapheme
*src)>

Adds a copy of the grapheme passed in C<src> to the grapheme table passed in
C<table> returning the dynamic codepoint value.

*/

UChar32
add_grapheme(PARROT_INTERP, grapheme_table *table, grapheme *src)
{
    ASSERT_ARGS(add_grapheme)
    int32_t i;

    /* Check if it's in the table already... */
    for (i = 0; i < table->used; i++) {
        if (table->graphemes[i].hash == src->hash)
            return (UChar32) (-1 - i);
    }

    PARROT_ASSERT(table->used < table->size);

    /* ... and add it if it isn't */
    table->graphemes[i].len = src->len;
    table->graphemes[i].hash = src->hash;
    table->graphemes[i].codepoints =
        mem_gc_allocate_n_typed(interp, src->len, UChar32);
    memcpy(table->graphemes[i].codepoints, src->codepoints,
               src->len * sizeof (UChar32));
    table->used++;

    return (UChar32) (-1 - i);
}

/*

=item C<UChar32 add_grapheme_from_substr(PARROT_INTERP, grapheme_table *table,
STRING *src, UINTVAL start, UINTVAL len, UINTVAL hash)>

Creates and adds to the grapheme table passed in C<table> a grapheme consisting
of the C<len> characters found after C<start> in the string C<src>.
It returns the dynamic codepoint value for the new grapheme.

*/

UChar32
add_grapheme_from_substr(PARROT_INTERP, grapheme_table *table, STRING *src,
                         UINTVAL start, UINTVAL len, UINTVAL hash)
{
    ASSERT_ARGS(add_grapheme_from_substr)
    int32_t i;
    /* Check if it's in the table already... */
    for (i = 0; i < table->used; i++) {
        if (table->graphemes[i].hash == hash)
            return (UChar32) (-1 - i);
    }

    /* ... and add it if it isn't */
    table->graphemes[table->used].len = len;
    table->graphemes[table->used].hash = hash;
    table->graphemes[table->used].codepoints =
        mem_gc_allocate_n_typed(interp, len, UChar32);
    for (i = 0; i < len; i++){
        table->graphemes[table->used].codepoints[i] =
            src->encoding->get_codepoint(interp, src, start + i);
    };
    i = table->used++;
    return (UChar32) (-1 - i);
}

/*

=item C<UINTVAL get_grapheme_base(PARROT_INTERP, grapheme_table *table, int32_t
codepoint)>

Returns the base character for the grapheme passed in C<codepoint>, as stored in
C<table>.

*/

UINTVAL
get_grapheme_base(PARROT_INTERP, grapheme_table *table, int32_t codepoint)
{
    ASSERT_ARGS(get_grapheme_base)
    const int32_t index = -1 - codepoint;

    if (codepoint > 0)
        return (UINTVAL) codepoint;

    if (index >= table->used)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_OUT_OF_BOUNDS,
            "Grapheme table index out of bounds!");

    return table->graphemes[index].codepoints[0];
}

#endif /* PARROT_HAS_ICU */

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

/*
Copyright (C) 2010, Parrot Foundation.
$Id$
*/

#include "parrot/parrot.h"
#include "grapheme.h"

/* HEADERIZER HFILE: src/string/grapheme.h */

/* HEADERIZER BEGIN: static */
/* HEADERIZER END: static */

grapheme_table *
create_grapheme_table(PARROT_INTERP, UINTVAL n)
{
    UINTVAL entries = ( n > MIN_TABLE_LENGTH) ? n - MIN_TABLE_LENGTH : 0;
    grapheme_table *table = mem_sys_allocate(sizeof (grapheme_table) 
                                              + entries * sizeof (grapheme));
    table->size = entries + MIN_TABLE_LENGTH;
    table->used = 0;

    return table;
}

UChar32 *
add_grapheme_from_substr(PARROT_INTERP, grapheme_table *table, STRING *src,
                         UINTVAL start, UINTVAL len, UINTVAL hash)
{
    int32_t i;
    /* Check if it's in the table already... */
    for (i = 0; i < table->used; i++) {
        if (table->graphemes[i].hash == hash )
            return (UChar32) (-1 * (i + 1));
    }

    /* ... and add it if it isn't */
    table->graphemes[table->used].len = len;
    table->graphemes[table->used].hash = hash;
    table->graphemes[table->used].codepoints  = mem_gc_allocate_n_typed(interp, len, UChar32);
    for (i = 0; i < len; i++){
        table->graphemes[table->used].codepoints[i] = 
            src->encoding->get_codepoint(interp, src, start + i);
    };
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

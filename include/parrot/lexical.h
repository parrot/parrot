/* lexcical.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *  Data Structure and Algorithms:
 *
 *  History:
 *     Initial version by Melvin on on 2002/06/6
 *     Splitted into separate file by leo 20.06.2004
 *  Notes:
 *  References:
 */

#if !defined(PARROT_LEXICAL_H_GUARD)
#define PARROT_LEXICAL_H_GUARD

/* Used by Scratchpad PMC */
typedef struct Parrot_Lexicals {
    List * values;    /* lexicals go here */
    List * names;     /* names of lexicals go here */
} * parrot_lexicals_t;

PMC * scratchpad_new(struct Parrot_Interp * interp, PMC * base, INTVAL depth);

PMC * scratchpad_get_current(struct Parrot_Interp * interp);

void scratchpad_store(struct Parrot_Interp * interp, PMC * pad,
                      STRING * name, INTVAL position, PMC* value);

void scratchpad_store_index(struct Parrot_Interp * interp, PMC * pad, INTVAL pad_index,
                            STRING * name, INTVAL position, PMC* value);

PMC * scratchpad_get(struct Parrot_Interp * interp, PMC * pad, STRING * name,
                     INTVAL position);

PMC * scratchpad_get_index(struct Parrot_Interp * interp, PMC * pad, INTVAL pad_index,
                           STRING * name, INTVAL position);

void lexicals_mark(struct Parrot_Interp * interp, struct Parrot_Lexicals *lex);
void scratchpad_delete(Parrot_Interp interp, PMC *pad, STRING *name);
#endif /* PARROT_LEXICAL_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */

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


PMC * scratchpad_new(Interp *, PMC * base, INTVAL depth);

PMC * scratchpad_get_current(Interp *);

void scratchpad_store(Interp *, PMC* pad, STRING * name,  PMC* value);
void scratchpad_store_by_name(Interp *, PMC *pad, INTVAL depth, STRING *, PMC*);
void scratchpad_store_by_index(Interp *, PMC *pad, INTVAL depth, INTVAL , PMC*);

PMC * scratchpad_find(Interp *, PMC *pad, STRING * name);
PMC * scratchpad_get_by_name(Interp *, PMC *pad, INTVAL depth, STRING * name);
PMC * scratchpad_get_by_index(Interp *, PMC *pad, INTVAL depth, INTVAL);


void lexicals_mark(Interp *, PMC *pad);
void scratchpad_delete(Interp *, PMC *pad, STRING *name);

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

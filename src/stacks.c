/* stacks.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Stack handling routines for Parrot
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

/* Push something on the generic stack. Return a pointer to the entry */
struct Stack_Entry *push_generic_entry(struct Perl_Interp *interpreter, void *thing, IV type, void *cleanup) {
    
}

/* Pop off an entry and return a pointer to the contents*/
void *pop_generic_entry(struct Perl_Interp *interpreter, void *where, IV type) {
}

/* Pop off an entry and throw it out */
void toss_generic_entry(struct Perl_Interp *interpreter, IV type) {
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
i

/* stacks.h
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

#if !defined(PARROT_STACKS_H_GUARD)
#define PARROT_STACKS_H_GUARD

struct Stack_Entry {
    IV entry_type;
    union {
        NV number;
        IV int;
        PMC *pmc;
        STRING *string;
        void *generic_pointer;
    } entry;
}

struct Stack {
    struct *Stack_Entry[];
}

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

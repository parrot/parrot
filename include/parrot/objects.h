/* objects.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Parrot class and object header stuff
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_OBJECTS_H_GUARD)
#define PARROT_OBJECTS_H_GUARD

#include "parrot/parrot.h"

#define PARROT_NAMESPACE_SEPARATOR "\0"
#define PARROT_NAMESPACE_SEPARATOR_LENGTH 1

typedef enum {
    PCD_PARENTS,        /* An array of immediate parents */
    PCD_CLASS_NAME,     /* Perlstring */
    PCD_ALL_PARENTS,    /* array in search order */
    PCD_ATTRIB_OFFS,    /* class => offset hash */
    PCD_ATTRIBUTES,      /* class::attrib => offset hash */
    PCD_CLASS_ATTRIBUTES, /* Class attribute array */
    PCD_MAX
} PARROT_CLASS_DATA_ENUM;

typedef enum {
    POD_CLASS,          /* class PMC of object */
    POD_CLASS_NAME,     /* Perlstring */
    POD_FIRST_ATTRIB    /* attributes start here */
} PARROT_OBJECT_DATA_ENUM;

PMC *Parrot_single_subclass(Parrot_Interp, PMC *, STRING *);
void Parrot_new_class(Parrot_Interp, PMC *, STRING *);
PMC *Parrot_class_lookup(Parrot_Interp, STRING *);
void Parrot_class_register(Parrot_Interp, STRING *, PMC *);
PMC *Parrot_add_parent(Parrot_Interp, PMC *, PMC *);
PMC *Parrot_remove_parent(Parrot_Interp, PMC *, PMC *);
PMC *Parrot_multi_subclass(Parrot_Interp, PMC *, STRING *);
void Parrot_instantiate_object(Parrot_Interp, PMC *);
INTVAL Parrot_object_isa(Parrot_Interp interpreter, PMC *, PMC *);
PMC *Parrot_new_method_cache(Parrot_Interp);
PMC *Parrot_find_method_with_cache(Parrot_Interp, PMC *, STRING *);
INTVAL Parrot_add_attribute(Parrot_Interp, PMC*, STRING*, STRING*);
void Parrot_note_method_offset(Parrot_Interp, UINTVAL, PMC *);

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

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
    PCD_OBJECT_VTABLE,   /* Vtable PMC that holds the vtable for
                            objects of this class */
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
INTVAL Parrot_class_register(Parrot_Interp, STRING *, PMC *);
PMC *Parrot_add_parent(Parrot_Interp, PMC *, PMC *);
PMC *Parrot_remove_parent(Parrot_Interp, PMC *, PMC *);
PMC *Parrot_multi_subclass(Parrot_Interp, PMC *, STRING *);
void Parrot_instantiate_object(Parrot_Interp, PMC *);
INTVAL Parrot_object_isa(Parrot_Interp interpreter, PMC *, PMC *);
PMC *Parrot_new_method_cache(Parrot_Interp);
PMC *Parrot_find_method_with_cache(Parrot_Interp, PMC *, STRING *);
INTVAL Parrot_add_attribute(Parrot_Interp, PMC*, STRING*);
void Parrot_note_method_offset(Parrot_Interp, UINTVAL, PMC *);
PMC *Parrot_get_attrib_by_num(Parrot_Interp, PMC *, INTVAL);
void Parrot_set_attrib_by_num(Parrot_Interp, PMC *, INTVAL, PMC *);
INTVAL Parrot_get_attrib_num(Parrot_Interp, PMC *, STRING *);
INTVAL Parrot_class_offset(Parrot_Interp, PMC *, STRING *);
PMC *Parrot_find_class_constructor(Parrot_Interp, STRING *, INTVAL);
PMC *Parrot_find_class_destructor(Parrot_Interp, STRING *, INTVAL);
PMC *Parrot_find_class_fallback(Parrot_Interp, STRING *, INTVAL);
void Parrot_set_class_constructor(Parrot_Interp, STRING *, INTVAL, STRING *);
void Parrot_set_class_destructor(Parrot_Interp, STRING *, INTVAL, STRING *);
void Parrot_set_class_fallback(Parrot_Interp, STRING *, INTVAL, STRING *);

/* Get and set attributes. */
#if 0
/* Old way */
#define get_attrib_num(x, y) VTABLE_get_pmc_keyed_int(interpreter, x, y)
#define set_attrib_num(x, y, z) VTABLE_set_pmc_keyed_int(interpreter, x, y, z)
#define get_attrib_count(x) VTABLE_elements(interpreter, x)
#define new_attrib_array() pmc_new(interpreter, enum_class_Array)
#define set_attrib_array_size(x, y) VTABLE_set_integer_native(interpreter, (x), (y))
#define resize_attrib_array(x, y)  VTABLE_set_integer_native(interpreter, (x), (y))
#define set_attrib_flags(x)
#define SLOTTYPE PMC

#else
/* These are the new way */
#define get_attrib_num(x, y) *((PMC **)PObj_bufstart(x)+y)
#define set_attrib_num(x, y, z) { PMC **foo = (PMC **)PObj_bufstart(x); foo[y] = z; }
#define get_attrib_count(x) (PObj_buflen(x) / sizeof(PMC *))
#define new_attrib_array() new_buffer_header(interpreter)
#define set_attrib_flags(x) PObj_is_buffer_of_PMCs_ptr_SET(x)
#define set_attrib_array_size(x, y) Parrot_allocate_zeroed(interpreter, x, (sizeof(PMC *)*(y)))
#define resize_attrib_array(x, y) Parrot_reallocate(interpreter, x, (sizeof(PMC *)*(y)))
#define SLOTTYPE Buffer
#endif
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

/* objects.h
 *  Copyright (C) 2001-2003, The Perl Foundation.
 *  SVN Info
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
    PCD_CLASS_NAME,     /* A String PMC */
    PCD_ATTRIBUTES,      /* class::attrib => offset hash */
    PCD_CLASS_ATTRIBUTES, /* Class attribute array */
    PCD_OBJECT_VTABLE,   /* Vtable PMC that holds the vtable for
                            objects of this class */
    PCD_MAX
} PARROT_CLASS_DATA_ENUM;

PARROT_API PMC *Parrot_single_subclass(Parrot_Interp, PMC *, PMC *);
PARROT_API void Parrot_new_class(Parrot_Interp, PMC *, PMC *);
PARROT_API PMC *Parrot_class_lookup(Parrot_Interp, STRING *);
PARROT_API PMC *Parrot_class_lookup_p(Parrot_Interp, PMC *);
PARROT_API PMC *Parrot_add_parent(Parrot_Interp, PMC *, PMC *);
PARROT_API PMC *Parrot_remove_parent(Parrot_Interp, PMC *, PMC *);
PARROT_API PMC *Parrot_multi_subclass(Parrot_Interp, PMC *, STRING *);
PARROT_API void Parrot_instantiate_object(Parrot_Interp, PMC *);
PARROT_API void Parrot_instantiate_object_init(Parrot_Interp, PMC *, PMC *);
PARROT_API INTVAL Parrot_object_isa(Parrot_Interp interp, PMC *, PMC *);
PARROT_API PMC *Parrot_new_method_cache(Parrot_Interp);
PARROT_API PMC *Parrot_find_method_with_cache(Parrot_Interp, PMC *, STRING *);
PARROT_API PMC *Parrot_find_method_direct(Parrot_Interp, PMC *, STRING *);
PARROT_API INTVAL Parrot_add_attribute(Parrot_Interp, PMC*, STRING*);
PARROT_API void Parrot_note_method_offset(Parrot_Interp, UINTVAL, PMC *);
PARROT_API PMC *Parrot_get_attrib_by_num(Parrot_Interp, PMC *, INTVAL);
PARROT_API void Parrot_set_attrib_by_num(Parrot_Interp, PMC *, INTVAL, PMC *);
PARROT_API PMC *Parrot_get_attrib_by_str(Parrot_Interp, PMC *, STRING*);
PARROT_API void Parrot_set_attrib_by_str(Parrot_Interp, PMC *, STRING*, PMC *);
PARROT_API INTVAL Parrot_get_attrib_num(Parrot_Interp, PMC *, STRING *);
PARROT_API INTVAL Parrot_class_offset(Parrot_Interp, PMC *, STRING *);
PARROT_API PMC *Parrot_find_class_constructor(Parrot_Interp, STRING *, INTVAL);
PARROT_API PMC *Parrot_find_class_destructor(Parrot_Interp, STRING *, INTVAL);
PARROT_API PMC *Parrot_find_class_fallback(Parrot_Interp, STRING *, INTVAL);
PARROT_API void Parrot_set_class_constructor(Parrot_Interp, STRING *, INTVAL, STRING *);
PARROT_API void Parrot_set_class_destructor(Parrot_Interp, STRING *, INTVAL, STRING *);
PARROT_API void Parrot_set_class_fallback(Parrot_Interp, STRING *, INTVAL, STRING *);
PARROT_API void Parrot_invalidate_method_cache(Interp*, STRING *class, STRING *meth);
PARROT_API STRING *readable_name(Parrot_Interp, PMC *);
PARROT_API int Parrot_is_vtable_name(Interp *, const char *name);

/* Objects, classes and PMCarrays all use the same data scheme:
 * PMC_data() holds a malloced array, PMC_int_val() is the size of it
 * this simplifies DOD mark a lot
 *
 * The active destroy flag is necessary to free the malloced array.
 */
#define SLOTTYPE PMC*
#define get_attrib_num(x, y)    ((PMC **)x)[y]
#define set_attrib_num(o, x, y, z) \
    do { \
        DOD_WRITE_BARRIER(interp, o, ((PMC **)x)[y], z); \
        ((PMC **)x)[y] = z; \
    } while (0)
#define get_attrib_count(x)     PMC_int_val2(x)
#define new_attrib_array() Dont_use
#define set_attrib_flags(x) do { \
        PObj_data_is_PMC_array_SET(x); \
        PObj_active_destroy_SET(x); \
    } while (0)
#define set_attrib_array_size(o, y) do { \
    PMC_data(o) = mem_sys_allocate_zeroed((sizeof(PMC *)*(y))); \
    PMC_int_val(o) = y; \
} while (0)

#define resize_attrib_array(o, y) do { \
    PMC_data(o) = mem_sys_realloc(PMC_data(o), (sizeof(PMC *)*(y))); \
    PMC_int_val(o) = y; \
} while (0)

/*
 * class marocs
 */

#  define CLASS_ATTRIB_COUNT(cl) PMC_int_val2(cl)
#  define SET_CLASS(arr, obj, cl) \
       obj->vtable->class = cl
#  define GET_CLASS(arr, obj) \
       obj->vtable->class

#endif /* PARROT_OBJECTS_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

/*
** classobject.h
**
** structs, typedefs and macros for the Class and Object PMCs. This header
** file is only included by the two PMCs, since they are allowed to know
** about each other's internals, but all other usage should be through the
** documented interface.
*/

#ifndef PARROT_CLASSOBJECT_H_GUARD
#define PARROT_CLASSOBJECT_H_GUARD

/* Class PMC's underlying struct. */
typedef struct Parrot_Class {
    STRING *name;         /* The name of the class. */
    PMC *_namespace;      /* The namespace it's linked to, if any. */
    int instantiated;     /* Any instantiations since last modification? */
    PMC *parents;         /* Immediate parent classes. */
    PMC *all_parents;     /* Cached list of ourself and all parents, in MRO order. */
    PMC *roles;           /* An array of roles. */
    PMC *methods;         /* Hash of method names to methods in this class. */
    PMC *vtable_methods;  /* Hash of Parrot v-table methods we override. */
    PMC *attrib_metadata; /* Hash of attributes in this class to hashes of metadata. */
    PMC *attrib_index;    /* Lookup table for attributes in this and parents. */
    PMC *attrib_cache;    /* Cache of visible attrib names to indexes. */
    PMC *resolve_method;  /* List of method names the class provides to resolve
                           * conflicts with methods from roles. */
} Parrot_Class;

/* Macro to access underlying structure of a Class PMC. */
#define PARROT_CLASS(o) ((Parrot_Class *) PMC_data(o))

/* Object PMC's underlying struct. */
typedef struct Parrot_Object {
    PMC *_class;          /* The class this is an instance of. */
    PMC *attrib_store;   /* The attributes store - a resizable PMC array. */
} Parrot_Object;

/* Macro to access underlying structure of an Object PMC. */
#define PARROT_OBJECT(o) ((Parrot_Object *) PMC_data(o))

/* Fully qualified class name generation; defined in Class, used by Object. */
STRING* Parrot_Class_get_fq_classname(Parrot_Interp interp, Parrot_Class *class_info);

#endif /* PARROT_CLASSOBJECT_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

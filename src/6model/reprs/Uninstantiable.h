#ifndef P6UNINSTANTIABLE_H_GUARD
#define P6UNINSTANTIABLE_H_GUARD

/* Uninstantiable just has the bare minimum things. */
typedef struct {
    /* The commonalities all objects have. */
    SixModelObjectCommonalities common;
} UninstantiableInstance;

/* Initializes the Uninstantiable REPR. */
REPROps * Uninstantiable_initialize(PARROT_INTERP);

#endif

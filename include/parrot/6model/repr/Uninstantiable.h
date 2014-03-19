/* 6model/repr/Uninstantiable.h
 * Copyright (C) 2010-2011, The Perl Foundation.
 * Copyright (C) 2014, Parrot Foundation.
 *
 * struct UninstantiableInstance
 *
 */

#ifndef PARROT_UNINSTANTIABLE_H_GUARD
#define PARROT_UNINSTANTIABLE_H_GUARD

/* Uninstantiable just has the bare minimum things. */
typedef struct {
    /* The commonalities all objects have. */
    SixModelObjectCommonalities common;
} UninstantiableInstance;

/* HEADERIZER BEGIN: src/6model/reprs/Uninstantiable.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
REPROps * Uninstantiable_initialize(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Uninstantiable_initialize __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/6model/reprs/Uninstantiable.c */

#endif /* PARROT_UNINSTANTIABLE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

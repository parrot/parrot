/* 6model/repr/KnowHOWREPR.h
 * Copyright (C) 2010-2011, The Perl Foundation.
 * Copyright (C) 2014, Parrot Foundation.
 *
 * struct KnowHOWREPRInstance
 *
 */

#ifndef PARROT_KNOWHOWREPR_H_GUARD
#define PARROT_KNOWHOWREPR_H_GUARD

/* This is how an instance with the KnowHOWREPR representation looks. */
typedef struct {
    /* The commonalities all objects have. */
    SixModelObjectCommonalities common;

    /* Methods table; a hash. */
    PMC *methods;

    /* Array of attribute meta-objects. */
    PMC *attributes;

    /* Name of the object. */
    STRING *name;
} KnowHOWREPRInstance;

/* HEADERIZER BEGIN: src/6model/reprs/KnowHOWREPR.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
REPROps * KnowHOWREPR_initialize(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_KnowHOWREPR_initialize __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/6model/reprs/KnowHOWREPR.c */

#endif

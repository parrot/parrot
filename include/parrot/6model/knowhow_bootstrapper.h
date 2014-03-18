/* 6model/knowhow_bootstrapper.h
 * Copyright (C) 2010-2011, The Perl Foundation.
 * Copyright (C) 2014, Parrot Foundation.
 */

#ifndef PARROT_KNOWHOW_BOOTSTRAPPER_H_GUARD
#define PARROT_KNOWHOW_BOOTSTRAPPER_H_GUARD

/* HEADERIZER BEGIN: src/6model/knowhow_bootstrapper.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * SixModelObject_bootstrap_knowhow(PARROT_INTERP, ARGIN(PMC *sc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * SixModelObject_setup_knowhow_attribute(PARROT_INTERP,
    ARGIN(PMC *sc),
    ARGIN(PMC *knowhow))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_SixModelObject_bootstrap_knowhow \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sc))
#define ASSERT_ARGS_SixModelObject_setup_knowhow_attribute \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sc) \
    , PARROT_ASSERT_ARG(knowhow))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/6model/knowhow_bootstrapper.c */

#endif /* PARROT_KNOWHOW_BOOTSTRAPPER_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

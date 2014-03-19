/* 6model/multi_dispatch.h
 * Copyright (C) 2010-2011, The Perl Foundation.
 * Copyright (C) 2014, Parrot Foundation.
 *
 * simplified Perl6-like multiple dispatch
 */

#ifndef PARROT_MULTI_DISPATCH_H_GUARD
#define PARROT_MULTI_DISPATCH_H_GUARD

/* HEADERIZER BEGIN: src/6model/multi_dispatch.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_sixmodel_multi_dispatch(PARROT_INTERP,
    ARGIN(PMC *dispatcher),
    ARGIN(PMC *capture))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_Parrot_sixmodel_multi_dispatch \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(dispatcher) \
    , PARROT_ASSERT_ARG(capture))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/6model/multi_dispatch.c */

#endif /* PARROT_MULTI_DISPATCH_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

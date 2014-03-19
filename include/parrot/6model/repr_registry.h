/* 6model/repr_registry.h
 * Copyright (C) 2010-2011, The Perl Foundation.
 * Copyright (C) 2014, Parrot Foundation.
 *
 * representation and representation registry handling.
 */

#ifndef PARROT_REPR_REGISTRY_H_GUARD
#define PARROT_REPR_REGISTRY_H_GUARD

/* HEADERIZER BEGIN: src/6model/repr_registry.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_INLINE
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
REPROps * REPR_get_by_id(PARROT_INTERP, INTVAL id);

PARROT_INLINE
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
REPROps * REPR_get_by_name(PARROT_INTERP, ARGIN(STRING *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void REPR_initialize_registry(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_INLINE
PARROT_WARN_UNUSED_RESULT
INTVAL REPR_name_to_id(PARROT_INTERP, ARGIN(STRING *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_REPR_get_by_id __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_REPR_get_by_name __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_REPR_initialize_registry __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_REPR_name_to_id __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/6model/repr_registry.c */

#endif /* PARROT_REPR_REGISTRY_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

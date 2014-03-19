/* 6model/HashAttrStore.h
 * Copyright (C) 2010-2011, The Perl Foundation.
 * Copyright (C) 2014, Parrot Foundation.
 *
 * struct HashAttrStoreInstance:
 */

#ifndef PARROT_HASHATTRSTORE_H_GUARD
#define PARROT_HASHATTRSTORE_H_GUARD

typedef struct {
    /* The commonalities all objects have. */
    SixModelObjectCommonalities common;

    /* Storage slot (hash). Note in the future we could have a Parrot
     * Hash data structure right here and make every object 1 GC-able. */
    PMC *store;
} HashAttrStoreInstance;

/* HEADERIZER BEGIN: src/6model/reprs/HashAttrStore.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
REPROps * HashAttrStore_initialize(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_HashAttrStore_initialize __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/6model/reprs/HashAttrStore.c */

#endif /* PARROT_HASHATTRSTORE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

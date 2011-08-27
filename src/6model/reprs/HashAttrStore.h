#ifndef HAS_H_GUARD
#define HAS_H_GUARD

typedef struct {
    /* The commonalities all objects have. */
    SixModelObjectCommonalities common;

    /* Storage slot (hash). Note in the future we could have a Parrot
     * Hash data structure right here and make every object 1 GC-able. */
    PMC *store;
} HashAttrStoreInstance;

/* Initializes the Hash Attribute Store REPR. */
REPROps * HashAttrStore_initialize(PARROT_INTERP);

#endif

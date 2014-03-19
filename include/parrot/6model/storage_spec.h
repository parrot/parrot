/* 6model/storage_spec.h
 * Copyright (C) 2010-2011, The Perl Foundation.
 * Copyright (C) 2014, Parrot Foundation.
 *
 * struct storage_spec:
 *
 * This data structure describes what storage a given representation
 * needs if something of that representation is to be embedded in
 * another place. For any representation that expects to be used
 * as a kind of reference type, it will just want to be a pointer.
 * But for other things, they would prefer to be "inlined" into
 * the object.
 */

#ifndef PARROT_STORAGE_SPEC_H_GUARD
#define PARROT_STORAGE_SPEC_H_GUARD

typedef struct {
    /* 0 if this is to be referenced, anything else otherwise. */
    INTVAL inlineable;

    /* For things that want to be inlined, the number of bits of
     * storage they need. Ignored otherwise. */
    INTVAL bits;

    /* For things that are inlined, if they are just storage of a
     * primitive type and can unbox, this says what primitive type
     * that they unbox to. */
    INTVAL boxed_primitive;
} storage_spec;

/* Inlined or not. */
#define STORAGE_SPEC_REFERENCE  0
#define STORAGE_SPEC_INLINED    1

/* Possible options for boxed primitives. */
#define STORAGE_SPEC_BP_NONE    0
#define STORAGE_SPEC_BP_INT     1
#define STORAGE_SPEC_BP_NUM     2
#define STORAGE_SPEC_BP_STR     3

#endif /* PARROT_STORAGE_SPEC_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

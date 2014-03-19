/* 6model/P6opaque.h
 * Copyright (C) 2010-2011, The Perl Foundation.
 * Copyright (C) 2014, Parrot Foundation.
 *
 * struct P6opaqueInstance:
 */

#ifndef PARROT_P6OPAQUE_H_GUARD
#define PARROT_P6OPAQUE_H_GUARD

/* This is how an instance with the P6opaque representation starts. However, what
 * follows on from this depends on the declaration. For object attributes, it will
 * be a pointer size and point to another 6model Object. For native integers and
 * numbers, it will be the appropriate sized piece of memory to store them
 * right there in the object. Note that P6opaque does not do packed storage, so
 * an int2 gets as much space as an int. */
typedef struct {
    /* The commonalities all objects have. */
    SixModelObjectCommonalities common;

    /* Spill (for MI, dynamically added attributes, etc.) Normally null. */
    PMC *spill;
} P6opaqueInstance;

/* This is used in the name to class mapping. */
typedef struct {
    PMC *class_key;
    PMC *name_map;
} P6opaqueNameMap;

/* The P6opaque REPR data has the slot mapping, allocation size and
 * various other bits of info. It hangs off the REPR_data pointer
 * in the s-table. */
typedef struct {
    /* The memory allocation size for an object instance. Includes space
     * for the Shared Table pointer, spill hash and then for storing the
     * actual, pre-declared attributes. Note, this is in bytes. */
    INTVAL allocation_size;

    /* The number of attributes we have allocated slots for. */
    INTVAL num_attributes;

    /* Maps attribute position numbers to the byte offset in the object. */
    INTVAL *attribute_offsets;

    /* Flags if we are MI or not. */
    INTVAL mi;

    /* Instantiated objects are just a blank piece of memory that needs to
     * be set up. However, in some cases we'd like them to magically turn in
     * to some container type. */
    PMC **auto_viv_values;

    /* If we can unbox to a native integer, this is the offset to find it. */
    INTVAL unbox_int_offset;

    /* If we can unbox to a native number, this is the offset to find it. */
    INTVAL unbox_num_offset;

    /* If we can unbox to a native string, this is the offset to find it. */
    INTVAL unbox_str_offset;

    /* A table mapping attribute names to indexes (which can then be looked
     * up in the offset table). Uses a final null entry as a sentinel. */
    P6opaqueNameMap *name_to_index_mapping;

    /* Offsets into the object that are elligible for PMC GC marking. */
    INTVAL *gc_pmc_mark_offsets;

    /* Offsets into the object that are elligible for string GC marking. */
    INTVAL *gc_str_mark_offsets;
} P6opaqueREPRData;

/* HEADERIZER BEGIN: src/6model/reprs/P6opaque.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PMC * index_mapping_and_flat_list(PARROT_INTERP,
    PMC *WHAT,
    P6opaqueREPRData *repr_data)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
REPROps * P6opaque_initialize(PARROT_INTERP);

#define ASSERT_ARGS_index_mapping_and_flat_list __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_P6opaque_initialize __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/6model/reprs/P6opaque.c */

#endif /* PARROT_P6OPAQUE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

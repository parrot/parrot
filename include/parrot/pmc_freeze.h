/* pmc_freeze.h
 *  Copyright (C) 2001-2003, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     PMC freeze and thaw interface
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_PMC_FREEZE_H_GUARD
#define      PARROT_PMC_FREEZE_H_GUARD

struct _visit_info;
typedef void (*visit_f)(PARROT_INTERP, PMC*, struct _visit_info*);

typedef enum {
    VISIT_FREEZE_NORMAL,
    VISIT_FREEZE_AT_DESTRUCT,
    VISIT_FREEZE_SIZE,
    VISIT_THAW_NORMAL,
    VISIT_THAW_CONSTANTS,
    VISIT_CLONE,
    VISIT_DESTRUCTION_ORDER
} visit_enum_type;

struct _image_io;
#define IMAGE_IO struct _image_io
typedef void (*push_integer_f)       (PARROT_INTERP, IMAGE_IO*, INTVAL);
typedef void (*push_pmc_f)           (PARROT_INTERP, IMAGE_IO*, PMC*);
typedef void (*push_string_f)        (PARROT_INTERP, IMAGE_IO*, STRING*);
typedef void (*push_number_f)        (PARROT_INTERP, IMAGE_IO*, FLOATVAL);
typedef INTVAL (*shift_integer_f)      (PARROT_INTERP, IMAGE_IO*);
typedef PMC*    (*shift_pmc_f)          (PARROT_INTERP, IMAGE_IO*);
typedef STRING* (*shift_string_f)       (PARROT_INTERP, IMAGE_IO*);
typedef FLOATVAL (*shift_number_f)       (PARROT_INTERP, IMAGE_IO*);

typedef struct _image_funcs {
    push_integer_f      push_integer;
    push_pmc_f          push_pmc;
    push_string_f       push_string;
    push_number_f       push_float;
    shift_integer_f     shift_integer;
    shift_pmc_f         shift_pmc;
    shift_string_f      shift_string;
    shift_number_f      shift_float;
} image_funcs;

typedef struct _image_io {
    STRING *image;
    struct PackFile *pf;
    const image_funcs *vtable;
} image_io;

typedef enum {
    EXTRA_IS_NULL,
    EXTRA_IS_UNUSED,
    EXTRA_IS_PROP_HASH,
    EXTRA_CLASS_EXISTS
} extra_flags_enum;

typedef struct _visit_info {
    visit_f             visit_pmc_now;
    visit_f             visit_pmc_later;
    visit_f             visit_action;   /* freeze, thaw ... */
    INTVAL              what;
    STRING             *image;
    PMC                *mark_ptr;
    PMC               **thaw_ptr;       /* where to thaw a new PMC */
    PMC                *container;      /* when thawing aggregate items */
    INTVAL              last_type;
    PMC                *seen;           /* seen hash */
    PMC                *todo;           /* todo list */
    PMC                *id_list;        /* seen list used by thaw */
    UINTVAL             id;             /* freze ID of PMC */
    void               *extra;          /* PMC specific */
    INTVAL              extra_flags;    /* concerning to extra */
    PMC                *thaw_result;    /* 1st thawed */
    IMAGE_IO           *image_io;
} visit_info;

/*
 * public interfaces
 */

/* HEADERIZER BEGIN: src/pmc_freeze.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC* Parrot_clone(PARROT_INTERP, ARGIN(PMC* pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING* Parrot_freeze(PARROT_INTERP, ARGIN(PMC* pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING* Parrot_freeze_at_destruct(PARROT_INTERP, ARGIN(PMC* pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC* Parrot_thaw(PARROT_INTERP, ARGIN(STRING* image))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC* Parrot_thaw_constants(PARROT_INTERP, ARGIN(STRING* image))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_clone __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pmc)
#define ASSERT_ARGS_Parrot_freeze __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pmc)
#define ASSERT_ARGS_Parrot_freeze_at_destruct __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pmc)
#define ASSERT_ARGS_Parrot_thaw __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(image)
#define ASSERT_ARGS_Parrot_thaw_constants __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(image)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/pmc_freeze.c */

#endif /* PARROT_PMC_FREEZE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

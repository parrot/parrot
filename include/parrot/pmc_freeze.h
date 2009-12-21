/* pmc_freeze.h
 *  Copyright (C) 2001-2003, Parrot Foundation.
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
#define PARROT_PMC_FREEZE_H_GUARD

struct _visit_info;
typedef void (*visit_f)(PARROT_INTERP, ARGIN_NULLOK(PMC*), ARGIN(struct _visit_info*));

typedef enum {
    VISIT_FREEZE_NORMAL,
    VISIT_THAW_NORMAL,
    VISIT_THAW_CONSTANTS,
} visit_enum_type;

struct _visit_info;
typedef INTVAL   (*get_integer_f)   (PARROT_INTERP, struct _visit_info*);
typedef void     (*push_integer_f)  (PARROT_INTERP, struct _visit_info*, INTVAL);
typedef void     (*push_string_f)   (PARROT_INTERP, struct _visit_info*, STRING*);
typedef void     (*push_number_f)   (PARROT_INTERP, struct _visit_info*, FLOATVAL);
typedef void     (*push_pmc_f)      (PARROT_INTERP, struct _visit_info*, PMC*);
typedef INTVAL   (*shift_integer_f) (PARROT_INTERP, struct _visit_info*);
typedef STRING*  (*shift_string_f)  (PARROT_INTERP, struct _visit_info*);
typedef FLOATVAL (*shift_number_f)  (PARROT_INTERP, struct _visit_info*);
typedef PMC*     (*shift_pmc_f)     (PARROT_INTERP, struct _visit_info*);

typedef struct _image_funcs {
    get_integer_f       get_integer;
    push_integer_f      push_integer;
    push_string_f       push_string;
    push_number_f       push_float;
    push_pmc_f          push_pmc;
    shift_integer_f     shift_integer;
    shift_string_f      shift_string;
    shift_number_f      shift_float;
    shift_pmc_f         shift_pmc;
} image_funcs;

typedef enum {
    EXTRA_IS_NULL,
    EXTRA_IS_UNUSED,
    EXTRA_IS_PROP_HASH,
    EXTRA_CLASS_EXISTS
} extra_flags_enum;

typedef struct _visit_info {
    visit_f             visit_pmc_now;
    char               *pos;            /* current read/write position in buffer */
    Buffer             *buffer;
    size_t              input_length;   /* */
    INTVAL              what;
    PMC               **thaw_ptr;       /* where to thaw a new PMC */
    PMC                *seen;           /* seen hash */
    PMC                *todo;           /* todo list */
    PMC                *id_list;        /* seen list used by thaw */
    UINTVAL             id;             /* freze ID of PMC */
    void               *extra;          /* PMC specific */
    INTVAL              extra_flags;    /* concerning to extra */
    PMC                *thaw_result;    /* 1st thawed */
    struct PackFile *pf;
    const image_funcs *vtable;
    struct _visit_info *image_io;       /* dummy backwards-compat pointer. */
} visit_info;

#define IMAGE_IO visit_info

#define VISIT_PMC_ATTR(interp, visit, self, pmclass, attr_name) do {\
    PMC *_visit_pmc_attr; \
    switch (VTABLE_get_integer((interp), (visit))) { \
      case VISIT_FREEZE_NORMAL: \
        GETATTR_ ## pmclass ## _ ## attr_name((interp), (self), _visit_pmc_attr); \
        VTABLE_push_pmc((interp), (visit), _visit_pmc_attr); \
        break; \
      case VISIT_THAW_NORMAL: \
      case VISIT_THAW_CONSTANTS: \
        _visit_pmc_attr = VTABLE_shift_pmc((interp), (visit)); \
        SETATTR_ ## pmclass ## _ ## attr_name((interp), (self), _visit_pmc_attr); \
        break; \
    } \
} while (0)

/*
 * public interfaces
 */

/* HEADERIZER BEGIN: src/pmc_freeze.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC* Parrot_clone(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING* Parrot_freeze(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC* Parrot_thaw(PARROT_INTERP, ARGIN(STRING *image))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC* Parrot_thaw_constants(PARROT_INTERP, ARGIN(STRING *image))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_clone __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_freeze __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_thaw __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(image))
#define ASSERT_ARGS_Parrot_thaw_constants __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(image))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/pmc_freeze.c */

#endif /* PARROT_PMC_FREEZE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

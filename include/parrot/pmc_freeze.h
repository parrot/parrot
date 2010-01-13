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
    VISIT_HOW_PMC_TO_VISITOR     = 0x00, /* push to visitor */
    VISIT_HOW_VISITOR_TO_PMC     = 0x01, /* shift from visitor */
    VISIT_HOW_PMC_TO_PMC         = 0x02, /* push to visitor; then shift from visitor */
    VISIT_HOW_VISITOR_TO_VISITOR = 0x03, /* shift from visitor; then push to visitor */
} visit_how_enum_t;

#define VISIT_HOW_MASK 0x03

typedef enum {
    VISIT_WHAT_PMC      = 0x04,
    VISIT_WHAT_STRING   = 0x08,
    VISIT_WHAT_FLOATVAL = 0x10,
    VISIT_WHAT_INTVAL   = 0x20,
} visit_what_enum_t;

#define VISIT_WHAT_MASK 0x3c

/* backwards-compat defns */
#define visit_enum_type      INTVAL
#define VISIT_FREEZE_NORMAL  (VISIT_HOW_PMC_TO_VISITOR | VISIT_WHAT_PMC)
#define VISIT_THAW_NORMAL    (VISIT_HOW_VISITOR_TO_PMC | VISIT_WHAT_PMC)
#define VISIT_THAW_CONSTANTS VISIT_THAW_NORMAL

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
    EXTRA_IS_PROP_HASH,
} extra_flags_enum;

typedef struct _visit_info {
    visit_f             visit_pmc_now;
    size_t              pos;            /* current read/write position in buffer */
    Buffer             *buffer;
    size_t              input_length;   /* */
    INTVAL              what;
    PMC               **thaw_ptr;       /* where to thaw a new PMC */
    PMC                *seen;           /* seen hash */
    PMC                *todo;           /* todo list */
    PMC                *id_list;        /* seen list used by thaw */
    UINTVAL             id;             /* freze ID of PMC */
    INTVAL              extra_flags;    /* concerning to extra */
    struct PackFile    *pf;
    const image_funcs  *vtable;
    struct _visit_info *image_io;       /* dummy backwards-compat pointer. */
} visit_info;

#define IMAGE_IO visit_info

#define VISIT_PMC(interp, visit, pmc) do {\
    const INTVAL _visit_pmc_flags = VTABLE_get_integer((interp), (visit)); \
    if (_visit_pmc_flags & VISIT_WHAT_PMC) { \
        switch (_visit_pmc_flags & VISIT_HOW_MASK) { \
          case VISIT_HOW_PMC_TO_VISITOR: \
            VTABLE_push_pmc((interp), (visit), (pmc)); \
            break; \
          case VISIT_HOW_VISITOR_TO_PMC: \
            (pmc) = VTABLE_shift_pmc((interp), (visit)); \
            break; \
          case VISIT_HOW_PMC_TO_PMC: \
            VTABLE_push_pmc((interp), (visit), (pmc)); \
            (pmc) = VTABLE_shift_pmc((interp), (visit)); \
            break; \
          case VISIT_HOW_VISITOR_TO_VISITOR: \
            (pmc) = VTABLE_shift_pmc((interp), (visit)); \
            VTABLE_push_pmc((interp), (visit), (pmc)); \
            break; \
          default: \
            do_panic((interp), "Bad VISIT_HOW in VISIT_PMC", __FILE__, __LINE__); \
        } \
    } \
} while (0)

#define VISIT_PMC_ATTR(interp, visit, self, pmclass, attr_name) do {\
    const INTVAL _visit_pmc_attr_flags = VTABLE_get_integer((interp), (visit)); \
    if (_visit_pmc_attr_flags & VISIT_WHAT_PMC) { \
        PMC *_visit_pmc_attr; \
        switch (_visit_pmc_attr_flags & VISIT_HOW_MASK) { \
          case VISIT_HOW_PMC_TO_VISITOR: \
            GETATTR_ ## pmclass ## _ ## attr_name((interp), (self), _visit_pmc_attr); \
            VTABLE_push_pmc((interp), (visit), _visit_pmc_attr); \
            break; \
          case VISIT_HOW_VISITOR_TO_PMC: \
            _visit_pmc_attr = VTABLE_shift_pmc((interp), (visit)); \
            SETATTR_ ## pmclass ## _ ## attr_name((interp), (self), _visit_pmc_attr); \
            break; \
          case VISIT_HOW_PMC_TO_PMC: \
            GETATTR_ ## pmclass ## _ ## attr_name((interp), (self), _visit_pmc_attr); \
            VTABLE_push_pmc((interp), (visit), _visit_pmc_attr); \
            _visit_pmc_attr = VTABLE_shift_pmc((interp), (visit)); \
            SETATTR_ ## pmclass ## _ ## attr_name((interp), (self), _visit_pmc_attr); \
            break; \
          case VISIT_HOW_VISITOR_TO_VISITOR: \
            _visit_pmc_attr = VTABLE_shift_pmc((interp), (visit)); \
            SETATTR_ ## pmclass ## _ ## attr_name((interp), (self), _visit_pmc_attr); \
            GETATTR_ ## pmclass ## _ ## attr_name((interp), (self), _visit_pmc_attr); \
            VTABLE_push_pmc((interp), (visit), _visit_pmc_attr); \
            break; \
          default: \
            do_panic((interp), "Bad VISIT_HOW in VISIT_PMC_ATTR", __FILE__, __LINE__); \
        } \
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

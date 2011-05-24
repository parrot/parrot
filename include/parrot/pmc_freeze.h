/* pmc_freeze.h
 *  Copyright (C) 2001-2003, Parrot Foundation.
 *  Overview:
 *     PMC freeze and thaw interface
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_PMC_FREEZE_H_GUARD
#define PARROT_PMC_FREEZE_H_GUARD

#include "parrot/packfile.h"

typedef enum {
    VISIT_HOW_PMC_TO_VISITOR     = 0x00, /* push to visitor */
    VISIT_HOW_VISITOR_TO_PMC     = 0x01, /* shift from visitor */
    VISIT_HOW_PMC_TO_PMC         = 0x02, /* push to visitor; then shift from visitor */
    VISIT_HOW_VISITOR_TO_VISITOR = 0x03 /* shift from visitor; then push to visitor */
} visit_how_enum_t;

#define VISIT_HOW_MASK 0x03

typedef enum {
    VISIT_WHAT_PMC      = 0x04,
    VISIT_WHAT_STRING   = 0x08,
    VISIT_WHAT_FLOATVAL = 0x10,
    VISIT_WHAT_INTVAL   = 0x20
} visit_what_enum_t;

#define VISIT_WHAT_MASK 0x3c

/* backwards-compat defns */
#define visit_enum_type      INTVAL
#define VISIT_FREEZE_NORMAL  (VISIT_HOW_PMC_TO_VISITOR | VISIT_WHAT_PMC)
#define VISIT_THAW_NORMAL    (VISIT_HOW_VISITOR_TO_PMC | VISIT_WHAT_PMC)
#define VISIT_THAW_CONSTANTS VISIT_THAW_NORMAL

typedef enum {
    EXTRA_IS_NULL,
    EXTRA_IS_PROP_HASH
} extra_flags_enum;

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

/* HEADERIZER BEGIN: src/packfile/object_serialization.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC* Parrot_clone(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING* Parrot_freeze(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t * Parrot_freeze_pbc(PARROT_INTERP,
    ARGIN(PMC *pmc),
    ARGIN(const PackFile_ConstTable *pf),
    ARGOUT(opcode_t *cursor),
    ARGOUT(Hash **seen))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*cursor)
        FUNC_MODIFIES(*seen);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
UINTVAL Parrot_freeze_pbc_size(PARROT_INTERP,
    ARGIN(PMC *pmc),
    ARGIN(const PackFile_ConstTable *pf),
    ARGOUT(Hash **seen))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*seen);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_freeze_strings(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_thaw(PARROT_INTERP, ARGIN(STRING *image))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC* Parrot_thaw_constants(PARROT_INTERP, ARGIN(STRING *image))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC* Parrot_thaw_pbc(PARROT_INTERP,
    ARGIN(PackFile_ConstTable *ct),
    ARGMOD(const opcode_t **cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*cursor);

void Parrot_pf_verify_image_string(PARROT_INTERP, ARGIN(STRING *image))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_clone __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_freeze __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_freeze_pbc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(pf) \
    , PARROT_ASSERT_ARG(cursor) \
    , PARROT_ASSERT_ARG(seen))
#define ASSERT_ARGS_Parrot_freeze_pbc_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(pf) \
    , PARROT_ASSERT_ARG(seen))
#define ASSERT_ARGS_Parrot_freeze_strings __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_thaw __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(image))
#define ASSERT_ARGS_Parrot_thaw_constants __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(image))
#define ASSERT_ARGS_Parrot_thaw_pbc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ct) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_Parrot_pf_verify_image_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(image))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/packfile/object_serialization.c */

#endif /* PARROT_PMC_FREEZE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

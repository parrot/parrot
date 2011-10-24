/* sub.h
 *  Copyright (C) 2001-2008, Parrot Foundation.
 *  Data Structure and Algorithms:
 *     Subroutine, coroutine, closure and continuation structures
 *     and related routines.
 */

#ifndef PARROT_SUB_H_GUARD
#define PARROT_SUB_H_GUARD

#include "parrot/parrot.h"

/*
 * Subroutine flags
 */
typedef enum {
    /* runtime usage flags */
    SUB_FLAG_CORO_FF      = PObj_private0_FLAG,
    SUB_FLAG_C_HANDLER    = PObj_private0_FLAG, /* C exceptions only */
    SUB_FLAG_TAILCALL     = PObj_private2_FLAG,
    SUB_FLAG_GENERATOR    = PObj_private3_FLAG, /* unused old python pmcs */

    /* compile/loadtime usage flags */
    /* from packfile */
    SUB_FLAG_IS_OUTER     = PObj_private1_FLAG,
    SUB_FLAG_PF_ANON      = PObj_private3_FLAG,
    SUB_FLAG_PF_MAIN      = PObj_private4_FLAG,
    SUB_FLAG_PF_LOAD      = PObj_private5_FLAG,
    SUB_FLAG_PF_IMMEDIATE = PObj_private6_FLAG,
    SUB_FLAG_PF_POSTCOMP  = PObj_private7_FLAG,

    SUB_FLAG_PF_MASK      = SUB_FLAG_PF_ANON
                          | SUB_FLAG_PF_LOAD
                          | SUB_FLAG_PF_IMMEDIATE
                          | SUB_FLAG_PF_POSTCOMP
} sub_flags_enum;

#define SUB_FLAG_get_FLAGS(o) (PObj_get_FLAGS(o))
#define SUB_FLAG_flag_TEST(flag, o) (SUB_FLAG_get_FLAGS(o) & SUB_FLAG_ ## flag)
#define SUB_FLAG_flag_SET(flag, o) (SUB_FLAG_get_FLAGS(o) |= SUB_FLAG_ ## flag)
#define SUB_FLAG_flag_CLEAR(flag, o) (SUB_FLAG_get_FLAGS(o) &= ~(UINTVAL)(SUB_FLAG_ ## flag))

#define SUB_FLAG_flags_SETTO(o, f) SUB_FLAG_get_FLAGS(o) = (f)
#define SUB_FLAG_flags_CLEARALL(o) SUB_FLAG_flags_SETTO((o), 0)

#define SUB_FLAG_TAILCALL_TEST(o)   SUB_FLAG_flag_TEST(TAILCALL, (o))
#define SUB_FLAG_TAILCALL_ISSET(o)  SUB_FLAG_flag_TEST(TAILCALL, (o))
#define SUB_FLAG_TAILCALL_NOTSET(o) (!SUB_FLAG_flag_TEST(TAILCALL, (o)))
#define SUB_FLAG_TAILCALL_SET(o)    SUB_FLAG_flag_SET(TAILCALL, (o))
#define SUB_FLAG_TAILCALL_CLEAR(o)  SUB_FLAG_flag_CLEAR(TAILCALL, (o))

#define SUB_FLAG(n) ((UINTVAL)1 << (n))
typedef enum {
    SUB_COMP_FLAG_BIT_0     = SUB_FLAG(0),
    SUB_COMP_FLAG_BIT_1     = SUB_FLAG(1),
    SUB_COMP_FLAG_VTABLE    = SUB_COMP_FLAG_BIT_1,
    SUB_COMP_FLAG_BIT_2     = SUB_FLAG(2),
    SUB_COMP_FLAG_METHOD    = SUB_COMP_FLAG_BIT_2,
    SUB_COMP_FLAG_BIT_3     = SUB_FLAG(3),
    SUB_COMP_FLAG_BIT_4     = SUB_FLAG(4),
    SUB_COMP_FLAG_BIT_5     = SUB_FLAG(5),
    SUB_COMP_FLAG_BIT_6     = SUB_FLAG(6),
    SUB_COMP_FLAG_BIT_7     = SUB_FLAG(7),
    SUB_COMP_FLAG_BIT_8     = SUB_FLAG(8),
    SUB_COMP_FLAG_BIT_9     = SUB_FLAG(9),
    SUB_COMP_FLAG_BIT_10    = SUB_FLAG(10),
    SUB_COMP_FLAG_PF_INIT   = SUB_COMP_FLAG_BIT_10,
    SUB_COMP_FLAG_BIT_11    = SUB_FLAG(11),
    SUB_COMP_FLAG_NSENTRY   = SUB_COMP_FLAG_BIT_11,
    SUB_COMP_FLAG_BIT_12    = SUB_FLAG(12),
    SUB_COMP_FLAG_BIT_13    = SUB_FLAG(13),
    SUB_COMP_FLAG_BIT_14    = SUB_FLAG(14),
    SUB_COMP_FLAG_BIT_15    = SUB_FLAG(15),
    SUB_COMP_FLAG_BIT_16    = SUB_FLAG(16),
    SUB_COMP_FLAG_BIT_17    = SUB_FLAG(17),
    SUB_COMP_FLAG_BIT_18    = SUB_FLAG(18),
    SUB_COMP_FLAG_BIT_19    = SUB_FLAG(19),
    SUB_COMP_FLAG_BIT_20    = SUB_FLAG(20),
    SUB_COMP_FLAG_BIT_21    = SUB_FLAG(21),
    SUB_COMP_FLAG_BIT_22    = SUB_FLAG(22),
    SUB_COMP_FLAG_BIT_23    = SUB_FLAG(23),
    SUB_COMP_FLAG_BIT_24    = SUB_FLAG(24),
    SUB_COMP_FLAG_BIT_25    = SUB_FLAG(25),
    SUB_COMP_FLAG_BIT_26    = SUB_FLAG(26),
    SUB_COMP_FLAG_BIT_27    = SUB_FLAG(27),
    SUB_COMP_FLAG_BIT_28    = SUB_FLAG(28),
    SUB_COMP_FLAG_BIT_29    = SUB_FLAG(29),
    SUB_COMP_FLAG_BIT_30    = SUB_FLAG(30),
    SUB_COMP_FLAG_MASK      = SUB_COMP_FLAG_VTABLE | SUB_COMP_FLAG_METHOD | SUB_COMP_FLAG_NSENTRY | SUB_COMP_FLAG_PF_INIT
} sub_comp_flags_enum;
#undef SUB_FLAG

#define Sub_comp_get_FLAGS(o) ((o)->comp_flags)
#define Sub_comp_flag_TEST(flag, o) (Sub_comp_get_FLAGS(o) & SUB_COMP_FLAG_ ## flag)
#define Sub_comp_flag_SET(flag, o) (Sub_comp_get_FLAGS(o) |= SUB_COMP_FLAG_ ## flag)
#define Sub_comp_flag_CLEAR(flag, o) (Sub_comp_get_FLAGS(o) &= ~(UINTVAL)(SUB_COMP_FLAG_ ## flag))

#define Sub_comp_flags_SETTO(o, f) Sub_comp_get_FLAGS(o) = (f)
#define Sub_comp_flags_CLEARALL(o) Sub_comp_flags_SETTO((o), 0)

#define Sub_comp_INIT_TEST(o) Sub_comp_flag_TEST(PF_INIT, o)
#define Sub_comp_INIT_SET(o) Sub_comp_flag_SET(PF_INIT, o)
#define Sub_comp_INIT_CLEAR(o) Sub_comp_flag_CLEAR(PF_INIT, o)

/*
 * a flag to signal a Sub that a new Continuation should be created
 */

#define NEED_CONTINUATION ((PMC *)1)

/*
 * maximum sub recursion depth
 */

#define RECURSION_LIMIT 1000


/*
 * Counts and flags describing the arguments.
 */
typedef struct Parrot_sub_arginfo {
    Parrot_UInt2 pos_required;
    Parrot_UInt2 pos_optional;
    Parrot_UInt2 named_required;
    Parrot_UInt2 named_optional;
    Parrot_UInt1 pos_slurpy;
    Parrot_UInt1 named_slurpy;
} Parrot_sub_arginfo;

#define PMC_get_sub(interp, pmc, sub) \
    do { \
        const INTVAL type = (pmc)->vtable->base_type; \
        if (type == enum_class_Sub || \
            type == enum_class_Coroutine) \
        {\
            (sub) = PARROT_SUB((pmc)); \
        } \
        else { \
            (sub) = (Parrot_Sub_attributes*)Parrot_get_sub_pmc_from_subclass((interp), (pmc)); \
        } \
    } while (0)

typedef struct Parrot_Sub_attributes Parrot_sub;
typedef struct Parrot_Coroutine_attributes Parrot_coro;
typedef struct Parrot_Continuation_attributes Parrot_cont;

#define PMC_cont(pmc) PARROT_CONTINUATION(pmc)

typedef struct Parrot_Context_info {
    STRING   *subname;
    STRING   *nsname;
    STRING   *fullname;
    STRING   *file;
    opcode_t *address;
    int       pc;
    int       line;
} Parrot_Context_info;

/* HEADERIZER BEGIN: src/sub.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
void * Parrot_get_sub_pmc_from_subclass(PARROT_INTERP, ARGIN(PMC *subclass))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_sub_capture_lex(PARROT_INTERP, ARGMOD(PMC *sub_pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*sub_pmc);

PARROT_EXPORT
int Parrot_sub_context_get_info(PARROT_INTERP,
    ARGIN(PMC *ctx),
    ARGOUT(Parrot_Context_info *info))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*info);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING* Parrot_sub_Context_infostr(PARROT_INTERP,
    ARGIN(PMC *ctx),
    int is_top)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING* Parrot_sub_full_sub_name(PARROT_INTERP, ARGIN_NULLOK(PMC* sub_pmc))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC* Parrot_sub_new_closure(PARROT_INTERP, ARGIN(PMC *sub_pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_sub_continuation_check(PARROT_INTERP, ARGIN(const PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_sub_continuation_rewind_environment(PARROT_INTERP,
    ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC* Parrot_sub_find_dynamic_pad(PARROT_INTERP,
    ARGIN(STRING *lex_name),
    ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC* Parrot_sub_find_pad(PARROT_INTERP,
    ARGIN(STRING *lex_name),
    ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
STRING * Parrot_sub_get_filename_from_pc(PARROT_INTERP,
    ARGIN_NULLOK(PMC *subpmc),
    ARGIN_NULLOK(opcode_t *pc))
        __attribute__nonnull__(1);

INTVAL Parrot_sub_get_line_from_pc(PARROT_INTERP,
    ARGIN_NULLOK(PMC *subpmc),
    ARGIN_NULLOK(opcode_t *pc))
        __attribute__nonnull__(1);

void Parrot_sub_mark_context_start(void);
#define ASSERT_ARGS_Parrot_get_sub_pmc_from_subclass \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(subclass))
#define ASSERT_ARGS_Parrot_sub_capture_lex __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sub_pmc))
#define ASSERT_ARGS_Parrot_sub_context_get_info __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx) \
    , PARROT_ASSERT_ARG(info))
#define ASSERT_ARGS_Parrot_sub_Context_infostr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_sub_full_sub_name __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_sub_new_closure __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sub_pmc))
#define ASSERT_ARGS_Parrot_sub_continuation_check __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_sub_continuation_rewind_environment \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_Parrot_sub_find_dynamic_pad __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(lex_name) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_sub_find_pad __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(lex_name) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_Parrot_sub_get_filename_from_pc \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_sub_get_line_from_pc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_sub_mark_context_start __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/sub.c */

#endif /* PARROT_SUB_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

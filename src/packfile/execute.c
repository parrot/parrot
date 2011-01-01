/*
Copyright (C) 2001-2010, Parrot Foundation.
This program is free software. It is subject to the same license as
Parrot itself.

=head1 NAME

src/packfile/execute.c - Parrot PackFile API

=head1 DESCRIPTION

This file contain some private functions relating to executing functions.

=cut
*/

#include "parrot/parrot.h"
#include "parrot/packfile.h"
#include "pmc/pmc_sub.h"
#include "packfile_private.h"
#include "parrot/runcore_api.h"
#include "execute.str"


/* This is temporary, to make do_sub_pragmas public... */
/* HEADERIZER HFILE: include/parrot/packfile.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC* do_1_sub_pragma(PARROT_INTERP,
    ARGMOD(PMC *sub_pmc),
    pbc_action_enum_t action)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*sub_pmc);

PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
static PMC* run_sub(PARROT_INTERP, ARGIN(PMC *sub_pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static int sub_pragma(PARROT_INTERP,
    pbc_action_enum_t action,
    ARGIN(const PMC *sub_pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_do_1_sub_pragma __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sub_pmc))
#define ASSERT_ARGS_run_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sub_pmc))
#define ASSERT_ARGS_sub_pragma __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sub_pmc))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<static PMC* run_sub(PARROT_INTERP, PMC *sub_pmc)>

Runs the B<sub_pmc> due to its B<:load>, B<:immediate>, ... pragma

=cut

*/

PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
static PMC*
run_sub(PARROT_INTERP, ARGIN(PMC *sub_pmc))
{
    ASSERT_ARGS(run_sub)
    Parrot_runcore_t *old_core = interp->run_core;
    PMC              *retval   = PMCNULL;

    Parrot_pcc_set_constants(interp, CURRENT_CONTEXT(interp),
            interp->code->const_table);

    Parrot_ext_call(interp, sub_pmc, "->P", &retval);
    interp->run_core = old_core;

    return retval;
}


/*

=item C<static PMC* do_1_sub_pragma(PARROT_INTERP, PMC *sub_pmc,
pbc_action_enum_t action)>

Runs autoloaded or immediate bytecode, marking the MAIN subroutine entry.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC*
do_1_sub_pragma(PARROT_INTERP, ARGMOD(PMC *sub_pmc), pbc_action_enum_t action)
{
    ASSERT_ARGS(do_1_sub_pragma)
    Parrot_Sub_attributes *sub;
    PMC_get_sub(interp, sub_pmc, sub);

    switch (action) {
      case PBC_IMMEDIATE:
        /* run IMMEDIATE sub */
        if (PObj_get_FLAGS(sub_pmc) & SUB_FLAG_PF_IMMEDIATE) {
            void *lo_var_ptr = interp->lo_var_ptr;
            PMC  *result;

            PObj_get_FLAGS(sub_pmc) &= ~SUB_FLAG_PF_IMMEDIATE;
            result     = run_sub(interp, sub_pmc);

            /* reset initial flag so MAIN detection works
             * and reset lo_var_ptr to prev */
            interp->resume_flag = RESUME_INITIAL;
            interp->lo_var_ptr  = lo_var_ptr;
            return result;
        }
        break;
      case PBC_POSTCOMP:
        /* run POSTCOMP sub */
        if (PObj_get_FLAGS(sub_pmc) &   SUB_FLAG_PF_POSTCOMP) {
            PObj_get_FLAGS(sub_pmc) &= ~SUB_FLAG_PF_POSTCOMP;
            run_sub(interp, sub_pmc);

            /* reset initial flag so MAIN detection works */
            interp->resume_flag = RESUME_INITIAL;
            return NULL;
        }
        break;

      case PBC_LOADED:
        if (PObj_get_FLAGS(sub_pmc) &   SUB_FLAG_PF_LOAD) {
            PObj_get_FLAGS(sub_pmc) &= ~SUB_FLAG_PF_LOAD;

            /* if loaded no need for init */
            Sub_comp_INIT_CLEAR(sub);
            run_sub(interp, sub_pmc);
        }
        break;
      default:
        if (PObj_get_FLAGS(sub_pmc) & SUB_FLAG_PF_MAIN) {
            if ((interp->resume_flag   &  RESUME_INITIAL)
             &&  interp->resume_offset == 0) {
                void           *ptr   = VTABLE_get_pointer(interp, sub_pmc);
                const ptrdiff_t code  = (ptrdiff_t) sub->seg->base.data;

                interp->resume_offset = ((ptrdiff_t)ptr - code)
                                      / sizeof (opcode_t *);

                PObj_get_FLAGS(sub_pmc)      &= ~SUB_FLAG_PF_MAIN;
                Parrot_pcc_set_sub(interp, CURRENT_CONTEXT(interp), sub_pmc);
            }
            else {
                Parrot_warn(interp, PARROT_WARNINGS_ALL_FLAG,
                                ":main sub not allowed\n");
            }
        }

        /* run :init tagged functions */
        if (action == PBC_MAIN && Sub_comp_INIT_TEST(sub)) {
            /* if loaded no need for init */
            Sub_comp_INIT_CLEAR(sub);

            /* if inited no need for load */
            PObj_get_FLAGS(sub_pmc) &= ~SUB_FLAG_PF_LOAD;

            run_sub(interp, sub_pmc);
            interp->resume_flag = RESUME_INITIAL;
        }
        break;
    }

    return NULL;
}


/*

=item C<void do_sub_pragmas(PARROT_INTERP, PackFile_ByteCode *self,
pbc_action_enum_t action, PMC *eval_pmc)>

C<action> is one of C<PBC_PBC>, C<PBC_LOADED>, C<PBC_INIT>, or C<PBC_MAIN>.
These determine which subs get executed at this point. Some rules:

 :immediate subs always execute immediately
 :postcomp subs always execute immediately
 :main subs execute when we have the PBC_MAIN or PBC_PBC actions
 :init subs execute when :main does
 :load subs execute on PBC_LOAD

Also store the C<eval_pmc> in the sub structure, so that the eval PMC is kept
alive by living subs.

=cut

*/

void
do_sub_pragmas(PARROT_INTERP, ARGIN(PackFile_ByteCode *self),
               pbc_action_enum_t action, ARGIN_NULLOK(PMC *eval_pmc))
{
    ASSERT_ARGS(do_sub_pragmas)
    PackFile_ConstTable * const ct = self->const_table;
    opcode_t i;

    TRACE_PRINTF(("PackFile: do_sub_pragmas (action=%d)\n", action));

    for (i = 0; i < ct->pmc.const_count; ++i) {
        STRING * const SUB = CONST_STRING(interp, "Sub");
        PMC *sub_pmc = ct->pmc.constants[i];

        if (VTABLE_isa(interp, sub_pmc, SUB)) {
            Parrot_Sub_attributes *sub;

            PMC_get_sub(interp, sub_pmc, sub);
            sub->eval_pmc = eval_pmc;

            if (((PObj_get_FLAGS(sub_pmc) & SUB_FLAG_PF_MASK)
            ||   (Sub_comp_get_FLAGS(sub) & SUB_COMP_FLAG_MASK))
            &&    sub_pragma(interp, action, sub_pmc)) {
                PMC * const result = do_1_sub_pragma(interp, sub_pmc,
                        action);

                /* replace Sub PMC with computation results */
                if (action == PBC_IMMEDIATE && !PMC_IS_NULL(result)) {
                    ct->pmc.constants[i] = result;
                }
            }
        }
    }
}


/*

=item C<static int sub_pragma(PARROT_INTERP, pbc_action_enum_t action, const PMC
*sub_pmc)>

Checks B<sub_pmc>'s pragmas (e.g. flags like C<:load>, C<:main>, etc.)
returning 1 if the sub should be run for C<action>, a C<pbc_action_enum_t>.

=cut

*/

static int
sub_pragma(PARROT_INTERP, pbc_action_enum_t action, ARGIN(const PMC *sub_pmc))
{
    ASSERT_ARGS(sub_pragma)

    /* Note: the const casting is only needed because of the
     * internal details of the Sub_comp macros.
     * The assumption is that the TEST versions are in fact const,
     * so the casts are safe.
     * These casts are a quick fix to allow parrot build with c++,
     * a refactor of the macros will be a cleaner solution.  */
    DECL_CONST_CAST;
    Parrot_Sub_attributes *sub;
    int         todo    = 0;
    const int   pragmas = PObj_get_FLAGS(sub_pmc) &  SUB_FLAG_PF_MASK
                                                  & ~SUB_FLAG_IS_OUTER;
    PMC_get_sub(interp, PARROT_const_cast(PMC *, sub_pmc), sub);
    if (!pragmas && !Sub_comp_INIT_TEST(sub))
        return 0;

    switch (action) {
      case PBC_PBC:
      case PBC_MAIN:
        /* denote MAIN entry in first loaded PASM */
        if (interp->resume_flag & RESUME_INITIAL)
            todo = 1;

        /* :init functions need to be called at MAIN time, so return 1 */
        /* symreg.h:P_INIT */
        if (Sub_comp_INIT_TEST(sub))
            todo = 1;

        break;
      case PBC_LOADED:
        /* symreg.h:P_LOAD */
        if (pragmas & SUB_FLAG_PF_LOAD)
            todo = 1;
        break;
      default:
        break;
    }

    if (pragmas & (SUB_FLAG_PF_IMMEDIATE | SUB_FLAG_PF_POSTCOMP))
        todo = 1;

    return todo;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

/*
 * sub.c
 *
 * Calling Conventions API for generating subs definitions, calls, etc.
 *
 * Called by the code generators, optimizers and flow graph code which
 * are mostly independent of the low-level call conventions.
 *
 * Depending on compiler pragmas this API will callout to one of several
 * supported code generators. (see pcc.c or fastcall.c)
 *
 * The default is PCC (prototyped and non-prototyped).
 * PCC (Parrot Calling Convention) is the default for Perl6 and other
 * languages that want to interface with Perl6 on Parrot. PCC works
 * well with continuations and co-routines.
 *
 * Plans are for a FASTCALL convention which can be enabled with:
 * .pragma fastcall
 * which will allow library developers (or non-Perl languages) to turn
 * on very efficient calling conventions. It could also be used for internal
 * libs that do not callout to PCC routines, but present PCC entry points
 * for the module itself.
 *
 * Currently the only fully functional convention is PCC but the generic
 * API allows us to experiment with calling conventions side by
 * side without completely breaking IMCC every time we tweak something.
 * The side effect is the subroutine code generators and optimizers can be
 * very modular and less interlocked to a specific convention.
 *
 */

#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "imc.h"
#include "parser.h"

/*
 * Expand a subroutine definition depending on the active
 * calling convention. (FAST or PCC)
 */
void
expand_sub(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins)
{
    /* IMC_FASTSUB */
#if IMC_TRACE
    PIO_eprintf(NULL, "expand_sub\n");
#endif
    /* For expand sub, we check the unit->type only, since the
     * pragma might be overridden.
     */
    if (pragmas.fastcall) {
        expand_fast_sub(interp, unit, ins);
    }
    /* IMC_PCCSUB */
    else {
        expand_pcc_sub(interp, unit, ins);
    }
}


/*
 * Expand return instructions depending on active
 * calling convention (FAST or PCC).
 */
void
expand_sub_ret(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins)
{
#if IMC_TRACE
    PIO_eprintf(NULL, "expand_sub_ret\n");
#endif
    /* IMC_FASTSUB */
    if (pragmas.fastcall) {
        expand_fast_sub_ret(interp, unit, ins);
    }
    /* IMC_PCCSUB */
    else {
        expand_pcc_sub_ret(interp, unit, ins);
    }
}

/*
 * Expand a sub call depending on active calling convention.
 * (FAST or PCC).
 */
void
expand_sub_call(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins)
{
#if IMC_TRACE
    PIO_eprintf(NULL, "expand_sub_call\n");
#endif
    /* IMC_FASTSUB */
    if (pragmas.fastcall) {
        expand_fast_sub_call(interp, unit, ins);
    }
    /* IMC_PCCSUB */
    else {
        expand_pcc_sub_call(interp, unit, ins);
    }
}


/*
 * Peephole optimizer for subroutine Unit depending on its calling convention.
 * Currently the same optimizer works for both.
 */
void
sub_optimize(Parrot_Interp interp, IMC_Unit * unit)
{
    /* IMC_FASTSUB */
    if (pragmas.fastcall) {
        pcc_sub_optimize(interp, unit);
    }
    /* IMC_PCCSUB */
    else {
        pcc_sub_optimize(interp, unit);
    }
}


/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */

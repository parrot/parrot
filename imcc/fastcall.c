/*
 * fastcall.c
 *
 * A specific call convention implementation. Called by the generic
 * API for subs (see sub.c).
 *
 * FASTCALL convention can be enabled with:
 * .pragma fastcall
 * at the start of an IMC module.
 *
 * This will allow library developers (or non-Perl languages) to turn
 * on very efficient optimizations and a lightweight calling convention.
 * It could also be used for internal libs that do not callout to PCC
 * routines, but present PCC entry points for the module itself.
 *
 * XXX FIXME: FASTCALL is not currently finished and may not be completely
 * compatible with PCC convention. (ie. you can't mix and match, for now at least)
 */

#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "imc.h"
#include "parser.h"

/* XXX FIXME: This call convention is not finished, so using
 * .pragma fastcall will cause IMCC to exit.
 */


/*
 * Utilty instruction routine. Creates and inserts an instruction
 * into the current block in one call.
 */
static Instruction *
insINS(Interp *interpreter, IMC_Unit * unit, Instruction *ins,
        char *name, SymReg **regs, int n)
{
    Instruction *tmp = INS(interpreter, unit, name, NULL, regs, n, 0, 0);
    insert_ins(unit, ins, tmp);
    return tmp;
}


/*
 * XXX Unimplemented. (Proof of concept only)
 *
 * Expand a FASTCALL sub, whatever that happens to be. Currently
 * it means passing and returning arguments on the stack
 * Enabled by .pragma fastcall
 */
void
expand_fast_sub(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins)
{
    SymReg *sub, *regs[IMCC_MAX_REGS];
    int i, n;

#if IMC_TRACE
    PIO_eprintf(NULL, "expand_fast_sub\n");
#endif

    sub = ins->r[1];
    n = sub->pcc_sub->nargs;
    for (i = 0; i < n; i++) {
       regs[0] = sub->pcc_sub->args[i];
       ins = insINS(interp, unit, ins, "restore", regs, 1);
    }

}

/*
 * XXX Unimplemented. (Proof of concept only)
 */
void
expand_fast_sub_ret(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins)
{
    SymReg *sub, *regs[IMCC_MAX_REGS];
    int i;

#if IMC_TRACE
    PIO_eprintf(NULL, "expand_fast_sub_ret\n");
#endif

    sub = ins->r[1];
    for (i = 0; i < sub->pcc_sub->nret; i++) {
       regs[0] = sub->pcc_sub->ret[i];
       ins = insINS(interp, unit, ins, "save", regs, 1);
    }
}

/*
 * XXX Unimplemented. (Proof of concept only)
 * Currently not compatible with .pcc_call since .pcc_call
 * uses an identifier (not a label) as its argument.
 * We need to hide the call implementation and have each call convention
 * generate necessary code.
 */
void
expand_fast_sub_call(Parrot_Interp interp, IMC_Unit * unit, Instruction *ins)
{
    SymReg *sub, *ret, *regs[IMCC_MAX_REGS];
    int i;

#if IMC_TRACE
    PIO_eprintf(NULL, "expand_fast_sub_call\n");
#endif

    sub = ins->r[0];
    for (i = 0; i < sub->pcc_sub->nargs; i++) {
        regs[0] = sub->pcc_sub->args[i];
        ins = insINS(interp, unit, ins, "save", regs, 1);
    }

    regs[0] = sub->pcc_sub->sub;
    ins = insINS(interp, unit, ins, "bsr", regs, 1);

    /* XXX: Only supports prototyped subs for now */

    for (i = 0; i < sub->pcc_sub->nret; i++) {
        ret = sub->pcc_sub->ret[i];
        regs[0] = mk_temp_reg(interp, ret->set);
        ins = insINS(interp, unit, ins, "restore", regs, 1);
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



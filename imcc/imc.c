/*
 * imc.c
 *
 * Main entry point and top level of IMCC compiler.
 *
 * Moved all register allocation and spill code to reg_alloc.c
 */

#include <string.h>
#include <assert.h>
#include "imc.h"
#include "optimizer.h"


void imc_check_units(Interp *interp, char * caller);

/*
 * A sanity checking function used for debugging only.
 * Useful for tracking down memory corruptions by inserting
 * validation calls between compilation steps.
 */
void imc_check_units(Interp *interp, char * caller)
{
#if IMC_TRACE
    IMC_Unit * unit, *unit_next;
    static int ncheck;
    int i = 1;
#endif
    UNUSED(interp);
    UNUSED(caller);
#if IMC_TRACE
    fprintf(stderr, "imc.c: unit check pass %d from %s\n", ++ncheck, caller);
    for (unit = interp->imc_info->imc_units; unit; unit = unit_next) {
        unit_next = unit->next;
        {
            Instruction *ins = unit->instructions;
            if (ins->r[1] && ins->r[1]->pcc_sub) {
#if IMC_TRACE_HIGH
                fprintf(stderr, "UNIT[%d] : pcc_sub %s (nargs=%d)\n",
                     i, ins->r[1]->name, ins->r[1]->pcc_sub->nargs);
#endif
            }
        }

        i++;
    }
#endif
}


void
imc_compile_all_units(Interp *interp)
{
    IMC_Unit *unit, *unit_next;
    Instruction *ins, *ins_next;
#if IMC_TRACE
    int i = 1;

    fprintf(stderr, "imc.c:  imc_compile_all_units()\n");
#endif
    UNUSED(ins_next);
    UNUSED(ins);
    for (unit = interp->imc_info->imc_units; unit; unit = unit_next) {
        unit_next = unit->next;
#if IMC_TRACE
        fprintf(stderr, "compiling unit %d\n", i++);
#endif
        imc_compile_unit(interp, unit);
        emit_flush(interp, unit);
        imc_close_unit(interp, unit);
    }

    /* All done with compilation, now free instructions and other structures */

    /* XXX FIXME: Can't free instructions yet without causing memory problems
     * in the symbol tables.
     */
#if 1
    for (unit = interp->imc_info->imc_units; unit;) {
        unit_next = unit->next;
#if 1
        for (ins = unit->instructions; ins; ) {
            ins_next = ins->next;
            free_ins(ins);
            ins = ins_next;
        }
#endif
        imc_free_unit(interp, unit);
        unit = unit_next;
    }
#endif

    /* XXX: Memory leak */
    interp->imc_info->imc_units = NULL;
    interp->imc_info->last_unit = NULL;
}

/* imc_compile_unit is the main loop of the IMC compiler for each unit. It operates
 * on a single compilation unit at a time.
 */
void
imc_compile_unit(Interp *interp, IMC_Unit * unit)
{
    /* Not much here for now except the allocator */
    cur_unit = unit;

#if IMC_TRACE
    imc_check_units(interp, "imc_compile_unit");
#endif

    imc_reg_alloc(interp, unit);
}


/*
 * Any activity required to cleanup the compiler state and be
 * ready for a new compiler invokation goes here.
 */
void
imc_cleanup(Interp *interp)
{
     UNUSED(interp);
     clear_globals();
}


/*
 * Create a new IMC_Unit.
 */
IMC_Unit *
imc_new_unit(IMC_Unit_Type t)
{
   IMC_Unit * unit = calloc(1, sizeof(IMC_Unit));
   unit->hash = calloc(HASH_SIZE, sizeof(SymReg*));
   unit->type = t;
   return unit;
}

/*
 * Create a new IMC_Unit and "open" it for construction.
 * This sets the current state of the parser. The unit
 * can be closed later retaining all the current state.
 */
IMC_Unit *
imc_open_unit(Parrot_Interp interp, IMC_Unit_Type t)
{
    IMC_Unit * unit;
    unit = imc_new_unit(t);
    if (!interp->imc_info->imc_units)
       interp->imc_info->imc_units = unit;
    unit->prev = interp->imc_info->last_unit;
    if (interp->imc_info->last_unit)
       interp->imc_info->last_unit->next = unit;
    interp->imc_info->last_unit = unit;
    interp->imc_info->n_comp_units++;
#if IMC_TRACE
    fprintf(stderr, "imc_open_unit()\n");
#endif
    return interp->imc_info->last_unit;
}

/*
 * Close a unit from compilation.
 * Does not destroy the unit, leaves it on the
 * list. This appends a invoke P1 if its a PCC sub and it doesn't
 * have a return.
 */
void
imc_close_unit(Parrot_Interp interp, IMC_Unit * unit)
{
#if IMC_TRACE
    fprintf(stderr, "imc_close_unit()\n");
#endif
    UNUSED(interp);
    if (unit) {
    }
    cur_unit = NULL;
}

/*
 * XXX FIXME: Memory leakage. Can't call free_reglist or clear_tables()
 * yet due to interaction between units. One unit may hold a reference
 * to another (subs). Garbage collection would solve this.
 */
void
imc_free_unit(Parrot_Interp interp, IMC_Unit * unit)
{
    imc_info_t *imc = interp->imc_info;

#if IMC_TRACE_HIGH
    fprintf(stderr, "imc_free_unit()\n");
#endif

    /* XXX See above
    free_reglist(unit);
    */

    clear_basic_blocks(unit);       /* and cfg ... */
    if (!imc->n_comp_units)
        fatal(1, "imc_free_unit", "non existent unit\n");
    imc->n_comp_units--;

    clear_locals(unit);
    free(unit->hash);

    free(unit);
}

/*
 * Set a global compiler option. No fancy parsing needed.
 */
void
imc_pragma(char * str)
{
#if IMC_TRACE
    fprintf(stderr, "imc_pragma %s\n", str);
#endif
    if     (!strcmp(str, "fastcall"))   pragmas.fastcall = 1;
    else if (!strcmp(str, "prototyped")) pragmas.prototyped = 1;
    else return;
    /* More options here */
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

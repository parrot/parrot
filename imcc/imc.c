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

#define COMPILE_IMMEDIATE 1
static void imc_free_unit(Parrot_Interp interp, IMC_Unit * unit);


/* AST doesn't honor COMPILE_IMMEDIATE yet. So we need to make sure that 
 * the units get compiled.
 */
void
imc_compile_all_units_for_ast(Interp *interp)
{
    IMC_Unit *unit, *unit_next;
#if COMPILE_IMMEDIATE
    for (unit = IMCC_INFO(interp)->imc_units; unit; unit = unit_next) {
        unit_next = unit->next;
        imc_compile_unit(interp, unit);
    }
#endif

    return;
}

void
imc_compile_all_units(Interp *interp)
{
    IMC_Unit *unit, *unit_next;
    Instruction *ins, *ins_next;
#if ! COMPILE_IMMEDIATE
    for (unit = IMCC_INFO(interp)->imc_units; unit; unit = unit_next) {
        unit_next = unit->next;
        imc_compile_unit(interp, unit);
    }
#endif
    emit_close(interp, NULL);
    /* All done with compilation, now free instructions and other structures */

    for (unit = IMCC_INFO(interp)->imc_units; unit;) {
        unit_next = unit->next;
        for (ins = unit->instructions; ins; ) {
            ins_next = ins->next;
            free_ins(ins);
            ins = ins_next;
        }
        imc_free_unit(interp, unit);
        unit = unit_next;
    }

    IMCC_INFO(interp)->imc_units = NULL;
    IMCC_INFO(interp)->last_unit = NULL;
}

/* imc_compile_unit is the main loop of the IMC compiler for each unit. It
 * operates on a single compilation unit at a time.
 */
void
imc_compile_unit(Interp *interp, IMC_Unit * unit) {
    /* Not much here for now except the allocator */
    cur_unit = unit;

    imc_reg_alloc(interp, unit);
    emit_flush(interp, NULL, unit);
}


/*
 * Any activity required to cleanup the compiler state and be
 * ready for a new compiler invocation goes here.
 */
void
imc_cleanup(Interp *interp)
{
     clear_globals(interp);
     mem_sys_free(IMCC_INFO(interp)->ghash);
     IMCC_INFO(interp)->ghash = NULL;
}


/*
 * Create a new IMC_Unit.
 */
static IMC_Unit *
imc_new_unit(IMC_Unit_Type t)
{
   IMC_Unit * unit = calloc(1, sizeof(IMC_Unit));
   unit->hash = mem_sys_allocate_zeroed(HASH_SIZE * sizeof(SymReg*));
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
    imc_info_t *imc_info;

    unit = imc_new_unit(t);
    imc_info = IMCC_INFO(interp);
    if (!imc_info->imc_units)
       imc_info->imc_units = unit;
    if (!imc_info->ghash)
       imc_info->ghash = mem_sys_allocate_zeroed(HASH_SIZE * sizeof(SymReg*));
    unit->prev = imc_info->last_unit;
    if (imc_info->last_unit)
       imc_info->last_unit->next = unit;
    imc_info->last_unit = unit;
    imc_info->n_comp_units++;
    unit->pasm_file = imc_info->state->pasm_file;
    return unit;
}

/*
 * Close a unit from compilation.
 * Does not destroy the unit, leaves it on the
 * list.
 */
void
imc_close_unit(Parrot_Interp interp, IMC_Unit * unit)
{
    UNUSED(interp);
    if (unit) {
#if COMPILE_IMMEDIATE
        imc_compile_unit(interp, unit);
#endif
    }
    cur_unit = NULL;
}

/*
 * XXX FIXME: Memory leakage. Can't call free_reglist or clear_tables()
 * yet due to interaction between units. One unit may hold a reference
 * to another (subs). Garbage collection would solve this.
 */
static void
imc_free_unit(Parrot_Interp interp, IMC_Unit * unit)
{
    imc_info_t *imc = IMCC_INFO(interp);

#if IMC_TRACE_HIGH
    fprintf(stderr, "imc_free_unit()\n");
#endif

    /* XXX See above
    free_reglist(unit);
    */

    clear_basic_blocks(unit);       /* and cfg ... */
    if (!imc->n_comp_units)
        IMCC_fatal(interp, 1, "imc_free_unit: non existent unit\n");
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

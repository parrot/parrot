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


static IMC_Unit * imc_units;
static IMC_Unit * cur_unit;


void
imc_compile_all_units(struct Parrot_Interp *interp)
{
    IMC_Unit * unit;
    for(unit = interp->imc_info->imc_units; unit; unit = unit->next) {
        imc_compile_unit(interp, unit);
        emit_flush(interp, unit);
        imc_close_unit(interp, unit);
    }
}

/* imc_compile_unit is the main loop of the IMC compiler for each unit. It operates
 * on a single compilation unit at a time.
 */
void
imc_compile_unit(struct Parrot_Interp *interp, IMC_Unit * unit)
{
    /* Not much here for now except the allocator */

    imc_reg_alloc(interp, unit);
}


/*
 * Create a new IMC_Unit.
 */
IMC_Unit *
imc_new_unit(IMC_Unit_Type t)
{
   IMC_Unit * unit = calloc(1, sizeof(IMC_Unit));
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
    if(!interp->imc_info->cur_unit)
       interp->imc_info->imc_units = unit;
    unit->prev = cur_unit;
    if(interp->imc_info->cur_unit)
       interp->imc_info->cur_unit->next = unit;
    interp->imc_info->cur_unit = unit;
    interp->imc_info->n_comp_units++;
#if 0
    fprintf(stderr, "imc_open_unit()\n");
#endif
    return interp->imc_info->cur_unit;
}

void
imc_close_unit(Parrot_Interp interp, IMC_Unit * unit)
{
    imc_info_t *imc = interp->imc_info;

    free_reglist(unit);
    clear_basic_blocks(unit);       /* and cfg ... */
    if (!imc->n_comp_units)
        fatal(1, "close_comp_unit", "non existent comp_unit\n");
    imc->n_comp_units--;
    clear_tables(unit, hash);
#if 0
    fprintf(stderr, "imc_close_unit()\n");
#endif
/*
    imc->cur_unit->instructions = imc->cur_unit->last_ins = NULL;
*/
}


IMC_Unit *
imc_cur_unit(Parrot_Interp interp)
{
   /* Have to put this here as yacc and bison have problems
    * with the null pointer deref
    */
   return interp->imc_info->cur_unit;
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

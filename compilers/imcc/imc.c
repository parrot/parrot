/*
 * $Id$
 * Copyright (C) 2002-2007, The Perl Foundation.
 */

/*

=head1 NAME

compilers/imcc/imc.c

=head1 DESCRIPTION

Main entry point and top level of IMCC compiler.

Moved all register allocation and spill code to reg_alloc.c

=head2 Functions

=over 4

=cut

*/

#include <string.h>
#include "imc.h"
#include "optimizer.h"

/* HEADERIZER HFILE: compilers/imcc/imc.h */

/* HEADERIZER BEGIN: static */

static void imc_free_unit(PARROT_INTERP, NOTNULL(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static IMC_Unit * imc_new_unit(IMC_Unit_Type t);

/* HEADERIZER END: static */

#define COMPILE_IMMEDIATE 1
/*
extern FILE* yyin;
*/


/*

=item C<void imc_compile_all_units>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API
void
imc_compile_all_units(PARROT_INTERP)
{
    IMC_Unit *unit;
#if ! COMPILE_IMMEDIATE
    for (unit = IMCC_INFO(interp)->imc_units; unit;) {
        IMC_Unit * const unit_next = unit->next;
        imc_compile_unit(interp, unit);
        unit = unit_next;
    }
#endif
    emit_close(interp, NULL);
    /* All done with compilation, now free instructions and other structures */

    for (unit = IMCC_INFO(interp)->imc_units; unit;) {
        IMC_Unit * const unit_next = unit->next;
        Instruction *ins;

        for (ins = unit->instructions; ins;) {
            Instruction * const ins_next = ins->next;
            free_ins(ins);
            ins = ins_next;
        }
        imc_free_unit(interp, unit);
        unit = unit_next;
    }

    IMCC_INFO(interp)->imc_units = NULL;
    IMCC_INFO(interp)->last_unit = NULL;
}

/*

=item C<void imc_compile_unit>

imc_compile_unit is the main loop of the IMC compiler for each unit. It
operates on a single compilation unit at a time.

=cut

*/

PARROT_API
void
imc_compile_unit(PARROT_INTERP, NOTNULL(IMC_Unit *unit))
{
    /* Not much here for now except the allocator */
    IMCC_INFO(interp)->cur_unit = unit;

    imc_reg_alloc(interp, unit);
    emit_flush(interp, NULL, unit);
}

/*

=item C<void imc_cleanup>

Any activity required to cleanup the compiler state and be
ready for a new compiler invocation goes here.

=cut

*/

PARROT_API
void
imc_cleanup(PARROT_INTERP, NULLOK(void *yyscanner))
{
    IMCC_pop_parser_state(interp, yyscanner);
    clear_globals(interp);
    mem_sys_free(IMCC_INFO(interp)->ghash.data);
    IMCC_INFO(interp)->ghash.data = NULL;
}

/*

=item C<static IMC_Unit * imc_new_unit>

Create a new IMC_Unit.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static IMC_Unit *
imc_new_unit(IMC_Unit_Type t)
{
    IMC_Unit * const unit = (IMC_Unit *)calloc(1, sizeof (IMC_Unit));
    create_symhash(&unit->hash);
    unit->type = t;
    return unit;
}

/*

=item C<IMC_Unit * imc_open_unit>

Create a new IMC_Unit and "open" it for construction.
This sets the current state of the parser. The unit
can be closed later retaining all the current state.

=cut

*/

PARROT_CANNOT_RETURN_NULL
IMC_Unit *
imc_open_unit(PARROT_INTERP, IMC_Unit_Type t)
{
    IMC_Unit * const unit = imc_new_unit(t);
    imc_info_t * const imc_info = IMCC_INFO(interp);

    if (!imc_info->imc_units)
        imc_info->imc_units = unit;
    if (!imc_info->ghash.data)
        create_symhash(&imc_info->ghash);
    unit->prev = imc_info->last_unit;
    if (imc_info->last_unit)
        imc_info->last_unit->next = unit;
    imc_info->last_unit = unit;
    imc_info->n_comp_units++;
    unit->file = imc_info->state->file;
    unit->pasm_file = imc_info->state->pasm_file;

    return unit;
}

/*

=item C<void imc_close_unit>

Close a unit from compilation.
Does not destroy the unit, leaves it on the list.

=cut

*/

void
imc_close_unit(PARROT_INTERP, NULLOK(IMC_Unit *unit))
{
#if COMPILE_IMMEDIATE
    if (unit) {
        imc_compile_unit(interp, unit);
    }
#endif

    IMCC_INFO(interp)->cur_unit = NULL;
}

/*

=item C<static void imc_free_unit>

RT#48260: Not yet documented!!!

=cut

*/

static void
imc_free_unit(PARROT_INTERP, NOTNULL(IMC_Unit *unit))
{
    imc_info_t * const imc = IMCC_INFO(interp);

#if IMC_TRACE_HIGH
    fprintf(stderr, "imc_free_unit()\n");
#endif

    free_reglist(unit);

    clear_basic_blocks(unit);       /* and cfg ... */
    if (!imc->n_comp_units)
        IMCC_fatal(interp, 1, "imc_free_unit: non existent unit\n");
    imc->n_comp_units--;

    clear_locals(unit);
    free(unit->hash.data);

    free(unit);
}

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

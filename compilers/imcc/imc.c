/*
 * $Id$
 * Copyright (C) 2002-2009, Parrot Foundation.
 */

/*

=head1 NAME

compilers/imcc/imc.c

=head1 DESCRIPTION

Routines for handling imc_units, which represent subs.

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
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void imc_free_unit(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
static IMC_Unit * imc_new_unit(PARROT_INTERP, IMC_Unit_Type t)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_imc_free_unit __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_imc_new_unit __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#define COMPILE_IMMEDIATE 1

/*

=item C<void imc_compile_all_units(PARROT_INTERP)>

Compiles all imc_units, and free all memory of instructions and structures
afterwards.

=cut

*/

void
imc_compile_all_units(PARROT_INTERP)
{
    ASSERT_ARGS(imc_compile_all_units)
    /* compile all units created during the parse */
    IMC_Unit *unit;

#if ! COMPILE_IMMEDIATE
    for (unit = IMCC_INFO(interp)->imc_units; unit;) {
        IMC_Unit * const unit_next = unit->next;
        imc_compile_unit(interp, unit);
        unit = unit_next;
    }
#endif

    emit_close(interp, NULL);

    /* All done with compilation, now free all memory allocated
     * for instructions and other structures.  */
    for (unit = IMCC_INFO(interp)->imc_units; unit;) {
        IMC_Unit    * const unit_next = unit->next;
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

=item C<void imc_compile_unit(PARROT_INTERP, IMC_Unit *unit)>

Compiles each unit in IMCC.  This is the main loop of the compiler; it operates
on a single compilation unit at a time.

=cut

*/

void
imc_compile_unit(PARROT_INTERP, ARGIN(IMC_Unit *unit))
{
    ASSERT_ARGS(imc_compile_unit)
    /* Not much here for now except the allocator */
    IMCC_INFO(interp)->cur_unit = unit;

    imc_reg_alloc(interp, unit);
    emit_flush(interp, NULL, unit);
}


/*

=item C<void imc_cleanup(PARROT_INTERP, void *yyscanner)>

Cleans up the compiler state in preparation for another compiler invocation.

=cut

*/

void
imc_cleanup(PARROT_INTERP, ARGIN_NULLOK(void *yyscanner))
{
    ASSERT_ARGS(imc_cleanup)
    IMCC_pop_parser_state(interp, yyscanner);
    clear_globals(interp);
    mem_sys_free(IMCC_INFO(interp)->ghash.data);
    IMCC_INFO(interp)->ghash.data = NULL;

    if (IMCC_INFO(interp)->state) {
        mem_sys_free(IMCC_INFO(interp)->state->file);
        IMCC_INFO(interp)->state->file = NULL;
    }
}


/*

=item C<static IMC_Unit * imc_new_unit(PARROT_INTERP, IMC_Unit_Type t)>

Creates a new IMC_Unit of the given IMC_Unit_Type C<t>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
static IMC_Unit *
imc_new_unit(PARROT_INTERP, IMC_Unit_Type t)
{
    ASSERT_ARGS(imc_new_unit)
    IMC_Unit * const unit = mem_gc_allocate_zeroed_typed(interp, IMC_Unit);
    create_symhash(interp, &unit->hash);
    unit->type = t;
    return unit;
}


/*

=item C<IMC_Unit * imc_open_unit(PARROT_INTERP, IMC_Unit_Type t)>

Creates a new IMC_Unit and "open" it for construction.  This sets the current
state of the parser.  You can close the unit later while retaining all the
current state.

=cut

*/

PARROT_CANNOT_RETURN_NULL
IMC_Unit *
imc_open_unit(PARROT_INTERP, IMC_Unit_Type t)
{
    ASSERT_ARGS(imc_open_unit)
    IMC_Unit   * const unit     = imc_new_unit(interp, t);
    imc_info_t * const imc_info = IMCC_INFO(interp);

    if (!imc_info->imc_units)
        imc_info->imc_units = unit;

    if (!imc_info->ghash.data)
        create_symhash(interp, &imc_info->ghash);

    unit->prev = imc_info->last_unit;

    if (imc_info->last_unit)
        imc_info->last_unit->next = unit;

    imc_info->last_unit = unit;
    imc_info->n_comp_units++;

    unit->file      = imc_info->state->file;
    unit->pasm_file = imc_info->state->pasm_file;

    return unit;
}


/*

=item C<void imc_close_unit(PARROT_INTERP, IMC_Unit *unit)>

Closes a unit from compilation.  This does not destroy the unit, but leaves it
on the list of units.

=cut

*/

void
imc_close_unit(PARROT_INTERP, ARGIN_NULLOK(IMC_Unit *unit))
{
    ASSERT_ARGS(imc_close_unit)
#if COMPILE_IMMEDIATE
    if (unit)
        imc_compile_unit(interp, unit);
#endif

    IMCC_INFO(interp)->cur_unit = NULL;
}


/*

=item C<static void imc_free_unit(PARROT_INTERP, IMC_Unit *unit)>

Frees an IMC_Unit and all of its associated memory.

=cut

*/

static void
imc_free_unit(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(imc_free_unit)
    imc_info_t * const imc = IMCC_INFO(interp);

    free_reglist(unit);

    /* and cfg ... */
    clear_basic_blocks(unit);

    if (!imc->n_comp_units)
        IMCC_fatal(interp, 1, "imc_free_unit: non existent unit\n");

    imc->n_comp_units--;

    clear_locals(unit);

    if (unit->_namespace && unit->owns_namespace)
        free_sym(unit->_namespace);
    if (unit->vtable_name)
        mem_sys_free(unit->vtable_name);
    if (unit->instance_of)
        mem_sys_free(unit->instance_of);

    mem_sys_free(unit->hash.data);
    mem_sys_free(unit);
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

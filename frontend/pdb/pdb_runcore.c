/* Copyright (C) 2001-2009, Parrot Foundation. */

/* TODO Remove headers I don't need */
#include "parrot/runcore_api.h"
#include "parrot/embed.h"
#include "parrot/runcore_trace.h"
#include "cores.str"

#include "parrot/oplib/ops.h"
#include "parrot/oplib/core_ops.h"
#include "parrot/dynext.h"

#include "pmc/pmc_sub.h"
#include "pmc/pmc_callcontext.h"

void
Parrot_runcore_pdb_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_runcore_fast_init)

    Parrot_runcore_t * const coredata = mem_gc_allocate_zeroed_typed(interp, Parrot_runcore_t);
    coredata->name             = CONST_STRING(interp, "pdb");
    coredata->id               = PARROT_PDB_CORE;
    coredata->opinit           = PARROT_CORE_OPLIB_INIT;
    coredata->runops           = runops_pdb_core;
    coredata->destroy          = NULL;
    coredata->prepare_run      = NULL;
    coredata->flags            = 0;

    PARROT_RUNCORE_FUNC_TABLE_SET(coredata);

    Parrot_runcore_register(interp, coredata);
}

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t *
runops_pdb_core(PARROT_INTERP, SHIM(Parrot_runcore_t *runcore), ARGIN(opcode_t *pc))
{
    ASSERT_ARGS(runops_pdb_core)

    /* disable pc */
    Parrot_pcc_set_pc(interp, CURRENT_CONTEXT(interp), NULL);

    while (pc) {
        DO_OP(pc, interp);
    }

    return pc;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */


#include <string.h>
#include "parrot/parrot.h"
#include "bcg.h"
#include "bcg_private.h"
#include "bcg_logger.h"

static int get_pargma_type(BCG_info * bcg_info, char *pragma);

bcg_unit *
bcg_unit_create(BCG_info * bcg_info, char *name, char *pragma)
{
    bcg_unit *unit;

    unit = (bcg_unit *) mem_sys_allocate_zeroed(sizeof(bcg_unit));
    unit->name = name;
    unit->pragma = get_pargma_type(bcg_info, pragma);
    mem_sys_free(pragma);
    return unit;
}

void
bcg_unit_destroy(BCG_info * bcg_info, bcg_unit * unit)
{
    bcg_op *op, *cur_op;

    mem_sys_free(unit->name);
    bcg_hash_destroy(bcg_info, unit->symbol_table);

    op = unit->first_op;
    while (!op) {
        cur_op = op;
        op = op->next;
        bcg_op_destroy(bcg_info, cur_op);
    }

    mem_sys_free(unit);
}

void
bcg_unit_add_op(BCG_info * bcg_info, bcg_unit * unit, bcg_op * op)
{
    UNUSED(bcg_info);
    if (!unit->first_op) {
        unit->first_op = op;
        op->next = NULL;
        op->prev = NULL;
    }
    else {
        unit->last_op->next = op;
        op->prev = unit->last_op;
    }
    unit->last_op = op;
}

bcg_unit *
bcg_info_current_unit(BCG_info * bcg_info)
{
    bcg_info_private *bcg_info_priv = BCG_INFO_PRIV(bcg_info);
    return bcg_info_priv->last_unit;
}

static int
get_pargma_type(BCG_info * bcg_info, char *pragma)
{
    if (!pragma && !strlen(pragma)) {
        return BCG_UNIT_PRAGMA_NONE;
    }

    if (!strcmp(pragma, "main")) {
        return BCG_UNIT_PRAGMA_MAIN;
    }
    else if (!strcmp(pragma, "load")) {
        return BCG_UNIT_PRAGMA_LOAD;
    }
    else if (!strcmp(pragma, "immediate")) {
        return BCG_UNIT_PRAGMA_IMMEDIATE;
    }
    else if (!strcmp(pragma, "init")) {
        return BCG_UNIT_PRAGMA_INIT;
    }
    else {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION, "Un-supported pragma %s.",
                            pragma);
    }
    return -1;
}

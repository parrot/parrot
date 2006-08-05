#include <string.h>
#include "bcg.h"
#include "bcg_private.h"
#include "bcg_logger_private.h"

/* Forward decleration for state management functions. */
static void set_state(BCG_info * bcg_info, bcg_state state);
static void unset_state(BCG_info * bcg_info, bcg_state state);
static int in_state(BCG_info * bcg_info, bcg_state state);

BCG_info *
BCG_create(void)
{
    BCG_info *bcg_info;

    bcg_info = (BCG_info *) mem_sys_allocate(sizeof(BCG_info));
    bcg_info->state = 0;
    set_state(bcg_info, BCG_STATE_INIT);
    return bcg_info;
}

void
BCG_destroy(BCG_info * bcg_info)
{
    mem_sys_free(bcg_info);
}

void
BCG_start_code_gen(BCG_info * bcg_info)
{
    if (bcg_info->state != BCG_STATE_INIT) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in INIT state.");
    }

    set_state(bcg_info, BCG_STATE_IN_CODEGEN);
}

void
BCG_end_code_gen(BCG_info * bcg_info)
{
    if (bcg_info->state != BCG_STATE_IN_CODEGEN) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_CODEGEN state.");
    }

    unset_state(bcg_info, BCG_STATE_IN_CODEGEN);
}

void
BCG_start_sub(BCG_info * bcg_info, char *sub_name, char *pragma)
{

    if (bcg_info->state != BCG_STATE_IN_CODEGEN) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_CODEGEN state.");
    }

    set_state(bcg_info, BCG_STATE_IN_SUB);
}

void
BCG_end_sub(BCG_info * bcg_info)
{
    if (!in_state(bcg_info, BCG_STATE_IN_SUB)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_SUB state.");
    }

    unset_state(bcg_info, BCG_STATE_IN_SUB);
}

void
BCG_start_call(BCG_info * bcg_info, char *sub_name)
{
    if (!in_state(bcg_info, BCG_STATE_IN_SUB)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_SUB state.");
    }

    set_state(bcg_info, BCG_STATE_IN_CALL);
}

void
BCG_end_call(BCG_info * bcg_info)
{
    if (!in_state(bcg_info, BCG_STATE_IN_CALL)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_CALL state.");
    }

    unset_state(bcg_info, BCG_STATE_IN_CALL);
}

void
BCG_start_op(BCG_info * bcg_info, char *op)
{
    if (!in_state(bcg_info, BCG_STATE_IN_SUB)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_SUB state.");
    }

    set_state(bcg_info, BCG_STATE_IN_OP);
}

void
BCG_end_op(BCG_info * bcg_info)
{
    if (!in_state(bcg_info, BCG_STATE_IN_OP)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_CALL state.");
    }

    unset_state(bcg_info, BCG_STATE_IN_OP);
}

void
BCG_var(BCG_info * bcg_info, char *var_name, char var_type)
{
    if (!in_state(bcg_info, BCG_STATE_IN_OP)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_OP state.");
    }
}

void
BCG_val(BCG_info * bcg_info, char *val)
{
    if (!in_state(bcg_info, BCG_STATE_IN_OP)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_OP state.");
    }
}

void
BCG_label(BCG_info * bcg_info, char *label)
{
    if (!in_state(bcg_info, BCG_STATE_IN_SUB)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_SUB state.");
    }
}

static void
set_state(BCG_info * bcg_info, bcg_state state)
{
    bcg_info->state |= state;
}

static void
unset_state(BCG_info * bcg_info, bcg_state state)
{
    bcg_info->state &= (~state);
}

static int
in_state(BCG_info * bcg_info, bcg_state state)
{
    return state == (state & bcg_info->state);
}

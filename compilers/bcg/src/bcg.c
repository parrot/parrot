#include <string.h>

#include "bcg.h"
#include "parrot/parrot.h"

BCG *
BCG_create(void)
{
    BCG *bcg;

    bcg = (BCG *)mem_sys_allocate(sizeof(BCG));
    bcg->state = 0;
    BCG_set_state(bcg, BCG_STATE_INIT);
    return bcg;
}

void
BCG_destroy(BCG *bcg)
{
    mem_sys_free(bcg);
}

void
BCG_set_state(BCG *bcg, BCGState state)
{
    bcg->state |= state;
}

void
BCG_unset_state(BCG *bcg, BCGState state)
{
    bcg->state &= (~state);
}

int
BCG_in_state(BCG *bcg, BCGState state)
{
    return state == (state & bcg->state);
}

void
BCG_throw_exception(BCG *bcg, char *message)
{
    char *buffer = mem_sys_allocate(sizeof(char) * strlen(message));
    strcpy(buffer, message);
    bcg->error_msg = buffer;
    BCG_THROW(bcg, BCG_EXCEPTION);
}

void
BCG_start_code_gen(BCG *bcg)
{
    if (bcg->state != BCG_STATE_INIT) {
        char message[] = "Expected BCG to be in INIT state.";
        BCG_throw_exception(bcg, message);
    }

    BCG_set_state(bcg, BCG_STATE_IN_CODEGEN);
}

void
BCG_end_code_gen(BCG *bcg)
{
    if (bcg->state != BCG_STATE_IN_CODEGEN) {
        char message[] = "Expected BCG to be in IN_CODEGEN state.";
        BCG_throw_exception(bcg, message);
    }

    BCG_unset_state(bcg, BCG_STATE_IN_CODEGEN);
}

void
BCG_start_sub(BCG *bcg, char *subName, char *pragma)
{

    if (bcg->state != BCG_STATE_IN_CODEGEN) {
        char message[] = "Expected BCG to be in IN_CODEGEN state.";
        BCG_throw_exception(bcg, message);
    }

    BCG_set_state(bcg, BCG_STATE_IN_SUB);
}

void
BCG_end_sub(BCG *bcg)
{
    if (!BCG_in_state(bcg, BCG_STATE_IN_SUB)) {
        char message[] = "Expected BCG to be in IN_SUB state.";
        BCG_throw_exception(bcg, message);
    }

    BCG_unset_state(bcg, BCG_STATE_IN_SUB);
}

void
BCG_start_call(BCG *bcg, char *subName)
{
    if (!BCG_in_state(bcg, BCG_STATE_IN_SUB)) {
        char message[] = "Expected BCG to be in IN_SUB state.";
        BCG_throw_exception(bcg, message);
    }

    BCG_set_state(bcg, BCG_STATE_IN_CALL);
}

void
BCG_end_call(BCG *bcg)
{
    if (!BCG_in_state(bcg, BCG_STATE_IN_CALL)) {
        char message[] = "Expected BCG to be in IN_CALL state.";
        BCG_throw_exception(bcg, message);
    }

    BCG_unset_state(bcg, BCG_STATE_IN_CALL);
}

void
BCG_start_op(BCG *bcg, char *op)
{
    if (!BCG_in_state(bcg, BCG_STATE_IN_SUB)) {
        char message[] = "Expected BCG to be in IN_SUB state.";
        BCG_throw_exception(bcg, message);
    }

    BCG_set_state(bcg, BCG_STATE_IN_OP);
}

void
BCG_end_op(BCG *bcg)
{
    if (!BCG_in_state(bcg, BCG_STATE_IN_OP)) {
        char message[] = "Expected BCG to be in IN_CALL state.";
        BCG_throw_exception(bcg, message);
    }

    BCG_unset_state(bcg, BCG_STATE_IN_OP);
}

void
BCG_var(BCG *bcg, char *varName, char varType)
{
    if (!BCG_in_state(bcg, BCG_STATE_IN_OP)) {
        char message[] = "Expected BCG to be in IN_OP state.";
        BCG_throw_exception(bcg, message);
    }
}

void
BCG_val(BCG *bcg, char *val)
{
    if (!BCG_in_state(bcg, BCG_STATE_IN_OP)) {
        char message[] = "Expected BCG to be in IN_OP state.";
        BCG_throw_exception(bcg, message);
    }
}

void
BCG_label(BCG *bcg, char *label)
{
    if (!BCG_in_state(bcg, BCG_STATE_IN_SUB)) {
        char message[] = "Expected BCG to be in IN_SUB state.";
        BCG_throw_exception(bcg, message);
    }
}

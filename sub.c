/*  sub.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Sub-routines, co-routines and other fun stuff...
 *  Data Structure and Algorithms:
 *  History:
 *     Initial version by Melvin on 2002/06/6
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"


void 
save_context(struct Parrot_Interp * interp, struct Parrot_Context * ctx) 
{
    /*
     * TODO:
     * Once interp contains a context struct, this all becomes a single memcpy()
     */
    memcpy(&ctx->int_reg,    &interp->int_reg,    sizeof(interp->int_reg));
    memcpy(&ctx->num_reg,    &interp->num_reg,    sizeof(interp->num_reg));
    memcpy(&ctx->string_reg, &interp->string_reg, sizeof(interp->string_reg));
    memcpy(&ctx->pmc_reg,    &interp->pmc_reg,    sizeof(interp->pmc_reg));
    ctx->int_reg_top     = interp->int_reg_top;
    ctx->num_reg_top     = interp->num_reg_top;
    ctx->string_reg_top  = interp->string_reg_top;
    ctx->pmc_reg_top     = interp->pmc_reg_top;
    ctx->int_reg_base    = interp->int_reg_base;
    ctx->num_reg_base    = interp->num_reg_base;
    ctx->string_reg_base = interp->string_reg_base;
    ctx->pmc_reg_base    = interp->pmc_reg_base;
    ctx->user_stack      = interp->user_stack;
    ctx->control_stack   = interp->control_stack;
    stack_mark_cow(ctx->user_stack);
    stack_mark_cow(ctx->control_stack);
}

void 
restore_context(struct Parrot_Interp * interp, struct Parrot_Context * ctx) 
{
    /*
     * TODO: This is way too expensive.
     * Once interp contains a context struct, this all becomes a single memcpy()
     */
    memcpy(&interp->int_reg,    &ctx->int_reg,    sizeof(interp->int_reg));
    memcpy(&interp->num_reg,    &ctx->num_reg,    sizeof(interp->num_reg));
    memcpy(&interp->string_reg, &ctx->string_reg, sizeof(interp->string_reg));
    memcpy(&interp->pmc_reg,    &ctx->pmc_reg,    sizeof(interp->pmc_reg));
    interp->int_reg_top     = ctx->int_reg_top;
    interp->num_reg_top     = ctx->num_reg_top;
    interp->string_reg_top  = ctx->string_reg_top;
    interp->pmc_reg_top     = ctx->pmc_reg_top;
    interp->int_reg_base    = ctx->int_reg_base;
    interp->num_reg_base    = ctx->num_reg_base;
    interp->string_reg_base = ctx->string_reg_base;
    interp->pmc_reg_base    = ctx->pmc_reg_base;
    interp->user_stack      = ctx->user_stack;
    interp->control_stack   = ctx->control_stack;
}

struct Parrot_Sub *
new_sub(struct Parrot_Interp * interp, opcode_t * address) 
{
    /* Using system memory until I figure out GC issues */
    struct Parrot_Sub * newsub = mem_sys_allocate(sizeof(struct Parrot_Sub));
    newsub->init = address;
    newsub->user_stack = (struct stack_chunk *)new_stack(interp);
    newsub->control_stack = (struct stack_chunk *)new_stack(interp);
    newsub->lex_pad = NULL;
    return newsub;
}


struct Parrot_Coroutine *
new_coroutine(struct Parrot_Interp * interp, opcode_t * address) 
{
    /* Using system memory until I figure out GC issues */
    struct Parrot_Coroutine * newco = 
        mem_sys_allocate(sizeof(struct Parrot_Coroutine));
    newco->init = address;
    newco->resume = NULL;
    newco->user_stack = (struct stack_chunk *)new_stack(interp);
    newco->control_stack = (struct stack_chunk *)new_stack(interp);
    newco->lex_pad = NULL;
    return newco;
}

struct Parrot_Continuation *
new_continuation(struct Parrot_Interp * interp, opcode_t * address) 
{
    struct Parrot_Continuation * cc = 
        mem_sys_allocate(sizeof(struct Parrot_Continuation));
    cc->continuation = address;
    save_context(interp, &cc->ctx);
/*
    stack_mark_cow(interp->user_stack);
    stack_mark_cow(interp->control_stack);
*/
    return cc;
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

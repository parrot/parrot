/*
Copyright (C) 2009, Parrot Foundation.
$Id$

=head1 NAME

src/context.c - Parrot_Context functions.

=head1 DESCRIPTION

=cut

*/

#include "parrot/parrot.h"
#include "parrot/call.h"

/* HEADERIZER HFILE: include/parrot/context.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_INLINE
PARROT_CANNOT_RETURN_NULL
static Parrot_Context * get_context_struct_fast(PARROT_INTERP,
    ARGIN(PMC *ctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_get_context_struct_fast __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ctx))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=head2 Context API Functions

=over 4

*/

/*

=item C<struct PackFile_Constant ** Parrot_pcc_get_constants(PARROT_INTERP, PMC
*ctx)>

=item C<void Parrot_pcc_set_constants(PARROT_INTERP, PMC *ctx, struct
PackFile_Constant **constants)>

Get/set constants from context.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
struct PackFile_Constant **
Parrot_pcc_get_constants(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_constants)
    return get_context_struct_fast(interp, ctx)->constants;
}

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
void
Parrot_pcc_set_constants(PARROT_INTERP, ARGIN(PMC *ctx),
        ARGIN_NULLOK(struct PackFile_Constant **constants))
{
    ASSERT_ARGS(Parrot_pcc_set_constants)
    Parrot_Context * c = get_context_struct_fast(interp, ctx);
    c->constants = constants;
}

/*

=item C<UINTVAL Parrot_pcc_get_recursion_depth(PARROT_INTERP, PMC *ctx)>

Get recursion depth from context.

=cut

*/

PARROT_EXPORT
UINTVAL
Parrot_pcc_get_recursion_depth(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_recursion_depth)
    Parrot_Context const *c = get_context_struct_fast(interp, ctx);
    return c->recursion_depth;
}

/*

=item C<UINTVAL Parrot_pcc_inc_recursion_depth(PARROT_INTERP, PMC *ctx)>

Increase recurtion depth. Returns previous recursion_depth value.

=cut

*/

PARROT_EXPORT
UINTVAL
Parrot_pcc_inc_recursion_depth(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_inc_recursion_depth)
    Parrot_Context *c = get_context_struct_fast(interp, ctx);
    return c->recursion_depth++;
}

/*

=item C<UINTVAL Parrot_pcc_dec_recursion_depth(PARROT_INTERP, PMC *ctx)>

Decrease recurtion depth. Returns new recursion_depth value.

=cut

*/

PARROT_EXPORT
UINTVAL
Parrot_pcc_dec_recursion_depth(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_dec_recursion_depth)
    Parrot_Context *c = get_context_struct_fast(interp, ctx);
    return --c->recursion_depth;
}

/*

=item C<PMC* Parrot_pcc_get_caller_ctx(PARROT_INTERP, PMC *ctx)>

=item C<void Parrot_pcc_set_caller_ctx(PARROT_INTERP, PMC *ctx, PMC
*caller_ctx)>

Get/set caller Context.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_pcc_get_caller_ctx(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_caller_ctx)
    Parrot_Context const *c = get_context_struct_fast(interp, ctx);
    return c->caller_ctx;
}

PARROT_EXPORT
void
Parrot_pcc_set_caller_ctx(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN(PMC *caller_ctx))
{
    ASSERT_ARGS(Parrot_pcc_set_caller_ctx)
    Parrot_Context *c = get_context_struct_fast(interp, ctx);
    c->caller_ctx = caller_ctx;
}

/*

=item C<PMC* Parrot_pcc_get_outer_ctx(PARROT_INTERP, PMC *ctx)>

=item C<void Parrot_pcc_set_outer_ctx(PARROT_INTERP, PMC *ctx, PMC *outer_ctx)>

Get/set outer Context.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_pcc_get_outer_ctx(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_outer_ctx)
    Parrot_Context const *c = get_context_struct_fast(interp, ctx);
    return c->outer_ctx;
}

PARROT_EXPORT
void
Parrot_pcc_set_outer_ctx(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN(PMC *outer_ctx))
{
    ASSERT_ARGS(Parrot_pcc_set_outer_ctx)
    Parrot_Context *c = get_context_struct_fast(interp, ctx);
    c->outer_ctx = outer_ctx;
}

/*

=item C<PMC* Parrot_pcc_get_lex_pad(PARROT_INTERP, PMC *ctx)>

=item C<void Parrot_pcc_set_lex_pad(PARROT_INTERP, PMC *ctx, PMC *lex_pad)>

Get/set LexPad.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_pcc_get_lex_pad(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_lex_pad)
    Parrot_Context const *c = get_context_struct_fast(interp, ctx);
    return c->lex_pad;
}

PARROT_EXPORT
void
Parrot_pcc_set_lex_pad(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN(PMC *lex_pad))
{
    ASSERT_ARGS(Parrot_pcc_set_lex_pad)
    Parrot_Context *c = get_context_struct_fast(interp, ctx);
    c->lex_pad = lex_pad;
}

/*

=item C<PMC* Parrot_pcc_get_namespace(PARROT_INTERP, PMC *ctx)>

=item C<void Parrot_pcc_set_namespace(PARROT_INTERP, PMC *ctx, PMC *_namespace)>

Get/set namespace of Context.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_pcc_get_namespace(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_namespace)
    Parrot_Context const *c = get_context_struct_fast(interp, ctx);
    return c->current_namespace;
}

PARROT_EXPORT
void
Parrot_pcc_set_namespace(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN_NULLOK(PMC *_namespace))
{
    ASSERT_ARGS(Parrot_pcc_set_namespace)
    Parrot_Context *c = get_context_struct_fast(interp, ctx);
    c->current_namespace = _namespace;
}

/*

=item C<INTVAL Parrot_pcc_get_HLL(PARROT_INTERP, PMC *ctx)>

=item C<void Parrot_pcc_set_HLL(PARROT_INTERP, PMC *ctx, INTVAL hll)>

Get/set HLL of Context.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_pcc_get_HLL(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_HLL)
    Parrot_Context const *c = get_context_struct_fast(interp, ctx);
    return c->current_HLL;
}

PARROT_EXPORT
void
Parrot_pcc_set_HLL(PARROT_INTERP, ARGIN(PMC *ctx), INTVAL hll)
{
    ASSERT_ARGS(Parrot_pcc_set_HLL)
    Parrot_Context *c = get_context_struct_fast(interp, ctx);
    c->current_HLL = hll;
}

/*

=item C<PMC* Parrot_pcc_get_handlers(PARROT_INTERP, PMC *ctx)>

=item C<void Parrot_pcc_set_handlers(PARROT_INTERP, PMC *ctx, PMC *handlers)>

Get/set scheduler handlers.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_pcc_get_handlers(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_handlers)
    Parrot_Context const *c = get_context_struct_fast(interp, ctx);
    return c->handlers;
}


PARROT_EXPORT
void
Parrot_pcc_set_handlers(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN(PMC *handlers))
{
    ASSERT_ARGS(Parrot_pcc_set_handlers)
    Parrot_Context *c = get_context_struct_fast(interp, ctx);
    c->handlers = handlers;
}

/*

=item C<PMC* Parrot_pcc_get_continuation(PARROT_INTERP, PMC *ctx)>

=item C<void Parrot_pcc_set_continuation(PARROT_INTERP, PMC *ctx, PMC
*_continuation)>

Get/set continuation of Context.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_pcc_get_continuation(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_continuation)
    Parrot_Context const *c = get_context_struct_fast(interp, ctx);
    return c->current_cont;
}

PARROT_EXPORT
void
Parrot_pcc_set_continuation(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN_NULLOK(PMC *_continuation))
{
    ASSERT_ARGS(Parrot_pcc_set_continuation)
    Parrot_Context *c = get_context_struct_fast(interp, ctx);
    c->current_cont = _continuation;
}

/*

=item C<PMC* Parrot_pcc_get_signature(PARROT_INTERP, PMC *ctx)>

=item C<void Parrot_pcc_set_signature(PARROT_INTERP, PMC *ctx, PMC *sig_object)>

Get/set call signature object of Context (in sub/method call).

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_pcc_get_signature(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_signature)
    Parrot_Context const *c = get_context_struct_fast(interp, ctx);
    return c->current_sig;
}

PARROT_EXPORT
void
Parrot_pcc_set_signature(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN_NULLOK(PMC *sig_object))
{
    ASSERT_ARGS(Parrot_pcc_set_signature)
    Parrot_Context *c = get_context_struct_fast(interp, ctx);
    c->current_sig = sig_object;
}

/*

=item C<PMC* Parrot_pcc_get_object(PARROT_INTERP, PMC *ctx)>

=item C<void Parrot_pcc_set_object(PARROT_INTERP, PMC *ctx, PMC *object)>

Get object of Context (in method call).

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_pcc_get_object(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_object)
    Parrot_Context const *c = get_context_struct_fast(interp, ctx);
    return c->current_object;
}

PARROT_EXPORT
void
Parrot_pcc_set_object(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN_NULLOK(PMC *object))
{
    ASSERT_ARGS(Parrot_pcc_set_object)
    Parrot_Context *c = get_context_struct_fast(interp, ctx);
    c->current_object = object;
}

/*

=item C<opcode_t* Parrot_pcc_get_pc(PARROT_INTERP, PMC *ctx)>

=item C<void Parrot_pcc_set_pc(PARROT_INTERP, PMC *ctx, opcode_t *pc)>

Get/set program counter of Sub invocation.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
opcode_t*
Parrot_pcc_get_pc(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_pc)
    Parrot_Context const *c = get_context_struct_fast(interp, ctx);
    return c->current_pc;
}

PARROT_EXPORT
void
Parrot_pcc_set_pc(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN_NULLOK(opcode_t *pc))
{
    ASSERT_ARGS(Parrot_pcc_set_pc)
    Parrot_Context *c = get_context_struct_fast(interp, ctx);
    c->current_pc = pc;
}

/*

=item C<opcode_t* Parrot_pcc_get_results(PARROT_INTERP, PMC *ctx)>

=item C<void Parrot_pcc_set_results(PARROT_INTERP, PMC *ctx, opcode_t *pc)>

Get/set ptr into code with get_results opcode.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
opcode_t*
Parrot_pcc_get_results(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_results)
    Parrot_Context const *c = get_context_struct_fast(interp, ctx);
    return c->current_results;
}

PARROT_EXPORT
void
Parrot_pcc_set_results(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN_NULLOK(opcode_t *pc))
{
    ASSERT_ARGS(Parrot_pcc_set_results)
    Parrot_Context *c = get_context_struct_fast(interp, ctx);
    c->current_results = pc;
}

/*

=item C<PMC* Parrot_pcc_get_results_signature(PARROT_INTERP, PMC *ctx)>

=item C<void Parrot_pcc_set_results_signature(PARROT_INTERP, PMC *ctx, PMC
*sig)>

Get/set ptr into code with get_results opcode.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_pcc_get_results_signature(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_results_signature)
    Parrot_Context const *c = get_context_struct_fast(interp, ctx);
    return c->results_signature;
}

PARROT_EXPORT
void
Parrot_pcc_set_results_signature(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN_NULLOK(PMC *sig))
{
    ASSERT_ARGS(Parrot_pcc_set_results_signature)
    Parrot_Context *c = get_context_struct_fast(interp, ctx);
    PARROT_ASSERT(PMC_IS_NULL(sig) || PObj_is_PMC_TEST(sig));
    c->results_signature = sig;
}


/*

=item C<size_t Parrot_pcc_get_pred_offset(PARROT_INTERP, PMC *ctx)>

=item C<void Parrot_pcc_set_pred_offset(PARROT_INTERP, PMC *ctx, size_t
pred_offset)>

Get/set pred_offset

=cut

*/

PARROT_EXPORT
size_t
Parrot_pcc_get_pred_offset(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_pred_offset)
    Parrot_Context const *c = get_context_struct_fast(interp, ctx);
    return c->pred_offset;
}

PARROT_EXPORT
void
Parrot_pcc_set_pred_offset(PARROT_INTERP, ARGIN(PMC *ctx), size_t pred_offset)
{
    ASSERT_ARGS(Parrot_pcc_set_pred_offset)
    Parrot_Context *c = get_context_struct_fast(interp, ctx);
    c->pred_offset = pred_offset;
}

/*

=item C<static Parrot_Context * get_context_struct_fast(PARROT_INTERP, PMC
*ctx)>

Fetches Parrot_Context from Context PMC.  This is a static, inlineable function
so it only works within this file.  It also only works if you *know* that ctx
is a valid PMC, so be careful.  This is an encapsulation-breaking optimization
that improves performance measurably.  Use responsibly.  Never export this
function.

=cut

*/


PARROT_INLINE
PARROT_CANNOT_RETURN_NULL
static Parrot_Context *
get_context_struct_fast(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(get_context_struct_fast)

    /* temporarily violate encapsulation; big speedup here */
    return PMC_data_typed(ctx, Parrot_Context *);
}


/*

=back

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

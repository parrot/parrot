/*
Copyright (C) 2009, Parrot Foundation.
$Id$

=head1 NAME

src/context.c - Parrot_Context functions.

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/call.h"


/* HEADERIZER HFILE: include/parrot/call.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<void Parrot_pcc_set_constants(PARROT_INTERP, PMC *ctx, struct
PackFile_Constant **constants)>

Get string constant from context.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
void
Parrot_pcc_set_constants(PARROT_INTERP, ARGIN(PMC *ctx),
        ARGIN_NULLOK(struct PackFile_Constant **constants))
{
    ASSERT_ARGS(Parrot_pcc_set_constants)
    Parrot_Context * c = Parrot_pcc_get_context_struct(interp, ctx);
    c->constants = constants;
}

/*

=item C<INTVAL Parrot_pcc_get_int_constant(PARROT_INTERP, PMC *ctx, INTVAL idx)>

Get FLOATVAL constant from context.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
INTVAL
Parrot_pcc_get_int_constant(PARROT_INTERP, ARGIN(PMC *ctx), INTVAL idx)
{
    ASSERT_ARGS(Parrot_pcc_get_int_constant)
    Parrot_Context const * c = Parrot_pcc_get_context_struct(interp, ctx);
    return c->constants[idx]->u.integer;
}

/*

=item C<FLOATVAL Parrot_pcc_get_num_constant(PARROT_INTERP, PMC *ctx, INTVAL
idx)>

Get PMC constant from context.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
FLOATVAL
Parrot_pcc_get_num_constant(PARROT_INTERP, ARGIN(PMC *ctx), INTVAL idx)
{
    ASSERT_ARGS(Parrot_pcc_get_num_constant)
    Parrot_Context const * c = Parrot_pcc_get_context_struct(interp, ctx);
    return c->constants[idx]->u.number;
}

/*

=item C<STRING* Parrot_pcc_get_string_constant(PARROT_INTERP, PMC *ctx, INTVAL
idx)>

Get string constant from context.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
STRING*
Parrot_pcc_get_string_constant(PARROT_INTERP, ARGIN(PMC *ctx), INTVAL idx)
{
    ASSERT_ARGS(Parrot_pcc_get_string_constant)
    Parrot_Context const * c = Parrot_pcc_get_context_struct(interp, ctx);
    return c->constants[idx]->u.string;
}


/*

=item C<PMC* Parrot_pcc_get_pmc_constant(PARROT_INTERP, PMC *ctx, INTVAL idx)>

Get PMC constant from context.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_pcc_get_pmc_constant(PARROT_INTERP, ARGIN(PMC *ctx), INTVAL idx)
{
    ASSERT_ARGS(Parrot_pcc_get_pmc_constant)
    Parrot_Context const * c = Parrot_pcc_get_context_struct(interp, ctx);
    return c->constants[idx]->u.key;
}


/*

=item C<struct PackFile_Constant ** Parrot_pcc_constants(PARROT_INTERP, PMC
*ctx)>

Get reference to constants.

=cut

*/
PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
struct PackFile_Constant **
Parrot_pcc_constants(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_constants)
    return ((Parrot_Context*)(VTABLE_get_pointer(interp, ctx)))->constants;
}



/*

=item C<Parrot_Context* Parrot_pcc_get_context_struct(PARROT_INTERP, PMC *ctx)>

Fetch Parrot_Context from Context PMC.

=cut

*/
PARROT_EXPORT
PARROT_CAN_RETURN_NULL
Parrot_Context*
Parrot_pcc_get_context_struct(PARROT_INTERP, ARGIN_NULLOK(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_context_struct)

    if (PMC_IS_NULL(ctx))
        return NULL;

    /* temporarily violate encapsulation; big speedup here */
    return PMC_data_typed(ctx, Parrot_Context *);
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
    Parrot_Context const *c = Parrot_pcc_get_context_struct(interp, ctx);
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
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
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
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    return --c->recursion_depth;
}

/*

=item C<PMC* Parrot_pcc_get_caller_ctx(PARROT_INTERP, PMC *ctx)>

Get caller Context.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_pcc_get_caller_ctx(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_caller_ctx)
    Parrot_Context const *c = Parrot_pcc_get_context_struct(interp, ctx);
    return c->caller_ctx;
}


/*

=item C<void Parrot_pcc_set_caller_ctx(PARROT_INTERP, PMC *ctx, PMC
*caller_ctx)>

Set caller Context.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_set_caller_ctx(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN(PMC *caller_ctx))
{
    ASSERT_ARGS(Parrot_pcc_set_caller_ctx)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    c->caller_ctx = caller_ctx;
}

/*

=item C<PMC* Parrot_pcc_get_outer_ctx(PARROT_INTERP, PMC *ctx)>

Get outer Context.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_pcc_get_outer_ctx(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_outer_ctx)
    Parrot_Context const *c = Parrot_pcc_get_context_struct(interp, ctx);
    return c->outer_ctx;
}


/*

=item C<void Parrot_pcc_set_outer_ctx(PARROT_INTERP, PMC *ctx, PMC *outer_ctx)>

Set outer Context.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_set_outer_ctx(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN(PMC *outer_ctx))
{
    ASSERT_ARGS(Parrot_pcc_set_outer_ctx)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    c->outer_ctx = outer_ctx;
}

/*

=item C<PMC* Parrot_pcc_get_lex_pad(PARROT_INTERP, PMC *ctx)>

Get LexPad.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_pcc_get_lex_pad(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_lex_pad)
    Parrot_Context const *c = Parrot_pcc_get_context_struct(interp, ctx);
    return c->lex_pad;
}


/*

=item C<void Parrot_pcc_set_lex_pad(PARROT_INTERP, PMC *ctx, PMC *lex_pad)>

Set LexPad.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_set_lex_pad(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN(PMC *lex_pad))
{
    ASSERT_ARGS(Parrot_pcc_set_lex_pad)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    c->lex_pad = lex_pad;
}

/*

=item C<PMC* Parrot_pcc_get_namespace(PARROT_INTERP, PMC *ctx)>

Get namespace of Context.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_pcc_get_namespace(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_namespace)
    Parrot_Context const *c = Parrot_pcc_get_context_struct(interp, ctx);
    return c->current_namespace;
}


/*

=item C<void Parrot_pcc_set_namespace(PARROT_INTERP, PMC *ctx, PMC *_namespace)>

Set namespace of Context.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_set_namespace(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN_NULLOK(PMC *_namespace))
{
    ASSERT_ARGS(Parrot_pcc_set_namespace)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    c->current_namespace = _namespace;
}

/*

=item C<INTVAL Parrot_pcc_get_HLL(PARROT_INTERP, PMC *ctx)>

Get HLL of Context.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_pcc_get_HLL(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_HLL)
    Parrot_Context const *c = Parrot_pcc_get_context_struct(interp, ctx);
    return c->current_HLL;
}


/*

=item C<void Parrot_pcc_set_HLL(PARROT_INTERP, PMC *ctx, INTVAL hll)>

Set HLL of Context.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_set_HLL(PARROT_INTERP, ARGIN(PMC *ctx), INTVAL hll)
{
    ASSERT_ARGS(Parrot_pcc_set_HLL)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    c->current_HLL = hll;
}

/*

=item C<PMC* Parrot_pcc_get_handlers(PARROT_INTERP, PMC *ctx)>

Get scheduler handlers.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_pcc_get_handlers(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_handlers)
    Parrot_Context const *c = Parrot_pcc_get_context_struct(interp, ctx);
    return c->handlers;
}


/*

=item C<void Parrot_pcc_set_handers(PARROT_INTERP, PMC *ctx, PMC *handlers)>

Set scheduler handlers.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_set_handers(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN(PMC *handlers))
{
    ASSERT_ARGS(Parrot_pcc_set_handers)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    c->handlers = handlers;
}

/*

=item C<PMC* Parrot_pcc_get_continuation(PARROT_INTERP, PMC *ctx)>

Get continuation of Context.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_pcc_get_continuation(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_continuation)
    Parrot_Context const *c = Parrot_pcc_get_context_struct(interp, ctx);
    return c->current_cont;
}


/*

=item C<void Parrot_pcc_set_continuation(PARROT_INTERP, PMC *ctx, PMC
*_continuation)>

Set continuation of Context.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_set_continuation(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN_NULLOK(PMC *_continuation))
{
    ASSERT_ARGS(Parrot_pcc_set_continuation)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    c->current_cont = _continuation;
}

/*

=item C<PMC* Parrot_pcc_get_object(PARROT_INTERP, PMC *ctx)>

Get object of Context (in method call).

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_pcc_get_object(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_object)
    Parrot_Context const *c = Parrot_pcc_get_context_struct(interp, ctx);
    return c->current_object;
}


/*

=item C<void Parrot_pcc_set_object(PARROT_INTERP, PMC *ctx, PMC *object)>

Set object of Context (in method call).

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_set_object(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN_NULLOK(PMC *object))
{
    ASSERT_ARGS(Parrot_pcc_set_object)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    c->current_object = object;
}

/*

=item C<PMC* Parrot_pcc_get_sub(PARROT_INTERP, PMC *ctx)>

Get Sub executed inside Context.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_pcc_get_sub(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_sub)
    Parrot_Context const *c = Parrot_pcc_get_context_struct(interp, ctx);
    return c->current_sub;
}


/*

=item C<void Parrot_pcc_set_sub(PARROT_INTERP, PMC *ctx, PMC *sub)>

Set Sub executed inside Context.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_set_sub(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN_NULLOK(PMC *sub))
{
    ASSERT_ARGS(Parrot_pcc_set_sub)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    c->current_sub = sub;
}

/*

=item C<opcode_t* Parrot_pcc_get_pc(PARROT_INTERP, PMC *ctx)>

Get program counter of Sub invocation.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
opcode_t*
Parrot_pcc_get_pc(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_pc)
    Parrot_Context const *c = Parrot_pcc_get_context_struct(interp, ctx);
    return c->current_pc;
}


/*

=item C<void Parrot_pcc_set_pc(PARROT_INTERP, PMC *ctx, opcode_t *pc)>

Set program counter of Sub invocation.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_set_pc(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN_NULLOK(opcode_t *pc))
{
    ASSERT_ARGS(Parrot_pcc_set_pc)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    c->current_pc = pc;
}

/*

=item C<opcode_t* Parrot_pcc_get_results(PARROT_INTERP, PMC *ctx)>

Set ptr into code with get_results opcode.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
opcode_t*
Parrot_pcc_get_results(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_results)
    Parrot_Context const *c = Parrot_pcc_get_context_struct(interp, ctx);
    return c->current_results;
}


/*

=item C<void Parrot_pcc_set_results(PARROT_INTERP, PMC *ctx, opcode_t *pc)>

Set ptr into code with get_results opcode.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_set_results(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN_NULLOK(opcode_t *pc))
{
    ASSERT_ARGS(Parrot_pcc_set_results)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    c->current_results = pc;
}

/*

=item C<PMC* Parrot_pcc_get_results_signature(PARROT_INTERP, PMC *ctx)>

Set ptr into code with get_results opcode.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_pcc_get_results_signature(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_results_signature)
    Parrot_Context const *c = Parrot_pcc_get_context_struct(interp, ctx);
    return c->results_signature;
}


/*

=item C<void Parrot_pcc_set_results_signature(PARROT_INTERP, PMC *ctx, PMC
*sig)>

Set ptr into code with get_results opcode.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_set_results_signature(PARROT_INTERP, ARGIN(PMC *ctx), ARGIN_NULLOK(PMC *sig))
{
    ASSERT_ARGS(Parrot_pcc_set_results_signature)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    c->results_signature = sig;
}


/*

=item C<size_t Parrot_pcc_get_pred_offset(PARROT_INTERP, PMC *ctx)>

Get pred_offset

=cut

*/

PARROT_EXPORT
size_t
Parrot_pcc_get_pred_offset(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_pcc_get_pred_offset)
    Parrot_Context const *c = Parrot_pcc_get_context_struct(interp, ctx);
    return c->pred_offset;
}


/*

=item C<void Parrot_pcc_set_pred_offset(PARROT_INTERP, PMC *ctx, size_t
pred_offset)>

Set pred_offset

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_set_pred_offset(PARROT_INTERP, ARGIN(PMC *ctx), size_t pred_offset)
{
    ASSERT_ARGS(Parrot_pcc_set_pred_offset)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    c->pred_offset = pred_offset;
}


/*

=item C<UINTVAL Parrot_pcc_warnings_on(PARROT_INTERP, PMC *ctx, UINTVAL flags)>

Set warnings flags.

=cut

*/

PARROT_EXPORT
UINTVAL
Parrot_pcc_warnings_on(PARROT_INTERP, ARGIN(PMC *ctx), UINTVAL flags)
{
    ASSERT_ARGS(Parrot_pcc_warnings_on)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    c->warns |= flags;
    return c->warns;
}


/*

=item C<void Parrot_pcc_warnings_off(PARROT_INTERP, PMC *ctx, UINTVAL flags)>

Clear warnings flags.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_warnings_off(PARROT_INTERP, ARGIN(PMC *ctx), UINTVAL flags)
{
    ASSERT_ARGS(Parrot_pcc_warnings_off)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    c->warns &= ~flags;
}


/*

=item C<UINTVAL Parrot_pcc_warnings_test(PARROT_INTERP, PMC *ctx, UINTVAL
flags)>

Test warnings flags.

=cut

*/

PARROT_EXPORT
UINTVAL
Parrot_pcc_warnings_test(PARROT_INTERP, ARGIN(PMC *ctx), UINTVAL flags)
{
    ASSERT_ARGS(Parrot_pcc_warnings_test)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    return c->warns & flags;
}

/*

=item C<void Parrot_pcc_errors_on(PARROT_INTERP, PMC *ctx, UINTVAL flags)>

Set errors flags.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_errors_on(PARROT_INTERP, ARGIN(PMC *ctx), UINTVAL flags)
{
    ASSERT_ARGS(Parrot_pcc_errors_on)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    c->errors |= flags;
}


/*

=item C<void Parrot_pcc_errors_off(PARROT_INTERP, PMC *ctx, UINTVAL flags)>

Clear errors flags.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_errors_off(PARROT_INTERP, ARGIN(PMC *ctx), UINTVAL flags)
{
    ASSERT_ARGS(Parrot_pcc_errors_off)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    c->errors &= ~flags;
}


/*

=item C<UINTVAL Parrot_pcc_errors_test(PARROT_INTERP, PMC *ctx, UINTVAL flags)>

Test errors flags.

=cut

*/

PARROT_EXPORT
UINTVAL
Parrot_pcc_errors_test(PARROT_INTERP, ARGIN(PMC *ctx), UINTVAL flags)
{
    ASSERT_ARGS(Parrot_pcc_errors_test)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    return c->errors & flags;
}

/*

=item C<void Parrot_pcc_trace_flags_on(PARROT_INTERP, PMC *ctx, UINTVAL flags)>

Set trace flags.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_trace_flags_on(PARROT_INTERP, ARGIN(PMC *ctx), UINTVAL flags)
{
    ASSERT_ARGS(Parrot_pcc_trace_flags_on)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    c->trace_flags |= flags;
}


/*

=item C<void Parrot_pcc_trace_flags_off(PARROT_INTERP, PMC *ctx, UINTVAL flags)>

Clear trace flags.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_trace_flags_off(PARROT_INTERP, ARGIN(PMC *ctx), UINTVAL flags)
{
    ASSERT_ARGS(Parrot_pcc_trace_flags_off)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    c->trace_flags &= ~flags;
}


/*

=item C<UINTVAL Parrot_pcc_trace_flags_test(PARROT_INTERP, PMC *ctx, UINTVAL
flags)>

Test trace flags.

=cut

*/

PARROT_EXPORT
UINTVAL
Parrot_pcc_trace_flags_test(PARROT_INTERP, ARGIN(PMC *ctx), UINTVAL flags)
{
    ASSERT_ARGS(Parrot_pcc_trace_flags_test)
    Parrot_Context *c = Parrot_pcc_get_context_struct(interp, ctx);
    return c->trace_flags & flags;
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

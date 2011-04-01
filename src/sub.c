/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

src/sub.c - Subroutines

=head1 DESCRIPTION

Subroutines, continuations, co-routines and other fun stuff...

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/oplib/ops.h"
#include "sub.str"
#include "pmc/pmc_sub.h"
#include "pmc/pmc_continuation.h"
#include "parrot/oplib/core_ops.h"

/* HEADERIZER HFILE: include/parrot/sub.h */


/*

=item C<void Parrot_sub_mark_context_start(void)>

Indicate that a new round of context marking is about to take place.

=cut

*/

static int context_gc_mark = 0;

void
Parrot_sub_mark_context_start(void)
{
    ASSERT_ARGS(Parrot_sub_mark_context_start)
    if (++context_gc_mark == 0) context_gc_mark = 1;
}


/*

=item C<STRING* Parrot_sub_full_sub_name(PARROT_INTERP, PMC* sub_pmc)>

Return namespace, name, and location of subroutine.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING*
Parrot_sub_full_sub_name(PARROT_INTERP, ARGIN_NULLOK(PMC* sub_pmc))
{
    ASSERT_ARGS(Parrot_sub_full_sub_name)
    if (sub_pmc && VTABLE_defined(interp, sub_pmc)) {
        Parrot_Sub_attributes *sub;

        PMC_get_sub(interp, sub_pmc, sub);

        if (PMC_IS_NULL(sub->namespace_stash)) {
            return sub->name;
        }
        else {
            PMC    *ns_array;
            STRING * const semicolon = CONST_STRING(interp, ";");
            STRING *res;

            /*
             * When running with -t4, the invoke done in
             * Parrot_ns_get_name stomps on settings in interp; we
             * have to save these and restore them to avoid affecting
             * the running program.
             */
            PMC      * const saved_ccont       = interp->current_cont;

            Parrot_block_GC_mark(interp);

            ns_array = Parrot_ns_get_name(interp, sub->namespace_stash);

            /* Restore stuff that might have got overwritten */
            interp->current_cont      = saved_ccont;

            if (sub->name)
                VTABLE_push_string(interp, ns_array, sub->name);

            res = Parrot_str_join(interp, semicolon, ns_array);
            Parrot_unblock_GC_mark(interp);
            return res;
        }
    }
    return NULL;
}

/*

=item C<int Parrot_sub_context_get_info(PARROT_INTERP, PMC *ctx,
Parrot_Context_info *info)>

Takes pointers to a context and its information table.
Populates the table and returns 0 or 1. XXX needs explanation
Used by Parrot_sub_Context_infostr.

=cut

*/

PARROT_EXPORT
int
Parrot_sub_context_get_info(PARROT_INTERP, ARGIN(PMC *ctx),
    ARGOUT(Parrot_Context_info *info))
{
    ASSERT_ARGS(Parrot_sub_context_get_info)
    PMC                   *subpmc;
    Parrot_Sub_attributes *sub;
    opcode_t              *pc;

    /* set file/line/pc defaults */
    info->file     = CONST_STRING(interp, "(unknown file)");
    info->line     = -1;
    info->pc       = -1;
    info->nsname   = NULL;
    info->subname  = NULL;
    info->fullname = NULL;

    subpmc = Parrot_pcc_get_sub(interp, ctx);

    /* is the current sub of the specified context valid? */
    if (PMC_IS_NULL(subpmc)) {
        info->subname  = Parrot_str_new(interp, "???", 3);
        info->nsname   = info->subname;
        info->fullname = Parrot_str_new(interp, "??? :: ???", 10);
        info->pc       = -1;
        return 0;
    }

    /* fetch Parrot_sub of the current sub in the given context */
    if (!VTABLE_isa(interp, subpmc, CONST_STRING(interp, "Sub")))
        return 1;

    PMC_get_sub(interp, subpmc, sub);
    /* set the sub name */
    info->subname = sub->name;

    /* set the namespace name and fullname of the sub */
    if (PMC_IS_NULL(sub->namespace_name)) {
        info->nsname   = CONST_STRING(interp, "");
        info->fullname = info->subname;
    }
    else {
        info->nsname   = VTABLE_get_string(interp, sub->namespace_name);
        info->fullname = Parrot_sub_full_sub_name(interp, subpmc);
    }

    pc = Parrot_pcc_get_pc(interp, ctx);

    /* return here if there is no current pc */
    if (!pc)
        return 1;

    /* calculate the current pc */
    info->pc = pc - sub->seg->base.data;

    /* determine the current source file/line */
    if (pc) {
        const size_t offs = info->pc;
        size_t i, n;
        opcode_t *pc = sub->seg->base.data;
        PackFile_Debug * const debug = sub->seg->debugs;

        if (!debug)
            return 0;
        for (i = n = 0; n < sub->seg->base.size; ++i) {
            op_info_t * const op_info = sub->seg->op_info_table[*pc];
            opcode_t var_args = 0;

            if (i >= debug->base.size)
                return 0;
            if (n >= offs) {
                /* set source line and file */
                info->line = debug->base.data[i];
                info->file = Parrot_debug_pc_to_filename(interp, debug, i);
                break;
            }
            ADD_OP_VAR_PART(interp, sub->seg, pc, var_args);
            n  += op_info->op_count + var_args;
            pc += op_info->op_count + var_args;
        }
    }

    return 1;
}


/*

=item C<INTVAL Parrot_sub_get_line_from_pc(PARROT_INTERP, PMC *subpmc, opcode_t
*pc)>

Given a PMC sub and the current opcode, returns the corresponding PIR line
number.

=cut

*/

INTVAL
Parrot_sub_get_line_from_pc(PARROT_INTERP, ARGIN_NULLOK(PMC *subpmc), ARGIN_NULLOK(opcode_t *pc))
{
    ASSERT_ARGS(Parrot_sub_get_line_from_pc)
    Parrot_Sub_attributes *sub;
    opcode_t              *base_pc, *debug_ops;
    size_t                 i, op, current_annotation, debug_size;

    if (!subpmc || !pc)
        return -1;

    PMC_get_sub(interp, subpmc, sub);

    debug_ops          = sub->seg->debugs->base.data;
    debug_size         = sub->seg->debugs->base.size;
    base_pc            = sub->seg->base.data;
    current_annotation = pc - base_pc;

    /* assert pc is in correct segment */
    PARROT_ASSERT(base_pc <= pc && pc <= base_pc + sub->seg->base.size);

    for (i = op = 0; op < debug_size; ++i) {
        op_info_t * const op_info  = sub->seg->op_info_table[*base_pc];
        opcode_t          var_args = 0;

        if (i >= debug_size)
            return -1;

        if (op >= current_annotation)
            return debug_ops[i];

        ADD_OP_VAR_PART(interp, sub->seg, base_pc, var_args);
        op      += op_info->op_count + var_args;
        base_pc += op_info->op_count + var_args;
    }

    return -1;
}


/*

=item C<STRING * Parrot_sub_get_filename_from_pc(PARROT_INTERP, PMC *subpmc,
opcode_t *pc)>

Given a PMC sub and the current opcode, returns the corresponding PIR file
name.

=cut

*/

PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_sub_get_filename_from_pc(PARROT_INTERP, ARGIN_NULLOK(PMC *subpmc),
        ARGIN_NULLOK(opcode_t *pc))
{
    ASSERT_ARGS(Parrot_sub_get_filename_from_pc)
    Parrot_Sub_attributes *sub;
    PackFile_Debug        *debug;
    int                    position;

    if (!subpmc || !pc)
        return CONST_STRING(interp, "unknown file");

    PMC_get_sub(interp, subpmc, sub);

    debug    = sub->seg->debugs;
    position = pc - sub->seg->base.data;

    return Parrot_debug_pc_to_filename(interp, debug, position);
}

/*

=item C<STRING* Parrot_sub_Context_infostr(PARROT_INTERP, PMC *ctx)>

Formats context information for display.  Takes a context pointer and
returns a pointer to the text.  Used in debug.c and warnings.c

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING*
Parrot_sub_Context_infostr(PARROT_INTERP, ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_sub_Context_infostr)
    Parrot_Context_info info;
    STRING             *res = NULL;
    const char * const  msg = (CURRENT_CONTEXT(interp) == ctx)
        ? "current instr.:"
        : "called from Sub";

    Parrot_block_GC_mark(interp);
    if (Parrot_sub_context_get_info(interp, ctx, &info)) {

        res = Parrot_sprintf_c(interp,
            "%s '%Ss' pc %d (%Ss:%d)", msg,
            info.fullname, info.pc, info.file, info.line);
    }

    Parrot_unblock_GC_mark(interp);
    return res;
}

/*

=item C<PMC* Parrot_sub_find_pad(PARROT_INTERP, STRING *lex_name, PMC *ctx)>

Locate the LexPad containing the given name. Return NULL on failure.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC*
Parrot_sub_find_pad(PARROT_INTERP, ARGIN(STRING *lex_name), ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_sub_find_pad)
    while (1) {
        PMC * const lex_pad = Parrot_pcc_get_lex_pad(interp, ctx);
        PMC * outer         = Parrot_pcc_get_outer_ctx(interp, ctx);

        if (PMC_IS_NULL(outer))
            return lex_pad;

        PARROT_ASSERT(outer->vtable->base_type == enum_class_CallContext);

        if (!PMC_IS_NULL(lex_pad))
            if (VTABLE_exists_keyed_str(interp, lex_pad, lex_name))
                return lex_pad;

        ctx = outer;
    }
}


/*

=item C<PMC* Parrot_sub_find_dynamic_pad(PARROT_INTERP, STRING *lex_name, PMC
*ctx)>

Locate the LexPad containing the given C<lex_name> in C<ctx> and
its caller pads.  Return PMCNULL on failure.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC*
Parrot_sub_find_dynamic_pad(PARROT_INTERP, ARGIN(STRING *lex_name), ARGIN(PMC *ctx))
{
    ASSERT_ARGS(Parrot_sub_find_dynamic_pad)
    while (1) {
        PMC * const lex_pad = Parrot_pcc_get_lex_pad(interp, ctx);
        PMC * caller        = Parrot_pcc_get_caller_ctx(interp, ctx);

        if (PMC_IS_NULL(caller))
            return lex_pad;

        if (!PMC_IS_NULL(lex_pad))
            if (VTABLE_exists_keyed_str(interp, lex_pad, lex_name))
                return lex_pad;

        ctx = caller;
    }
}


/*

=item C<void Parrot_sub_capture_lex(PARROT_INTERP, PMC *sub_pmc)>

Capture the current lexical environment of a sub.

=cut

*/

PARROT_EXPORT
void
Parrot_sub_capture_lex(PARROT_INTERP, ARGMOD(PMC *sub_pmc))
{
    ASSERT_ARGS(Parrot_sub_capture_lex)
    PMC            * const ctx          = CURRENT_CONTEXT(interp);
    Parrot_Sub_attributes *current_sub;
    Parrot_Sub_attributes *sub;

    PMC_get_sub(interp, Parrot_pcc_get_sub(interp, ctx), current_sub);

    /* MultiSub gets special treatment */
    if (VTABLE_isa(interp, sub_pmc, CONST_STRING(interp, "MultiSub"))) {

        PMC * const iter = VTABLE_get_iter(interp, sub_pmc);

        while (VTABLE_get_bool(interp, iter)) {

            PMC        * const child_pmc = VTABLE_shift_pmc(interp, iter);
            Parrot_Sub_attributes *child_sub, *child_outer_sub;

            PMC_get_sub(interp, child_pmc, child_sub);

            if (!PMC_IS_NULL(child_sub->outer_sub)) {
                PMC_get_sub(interp, child_sub->outer_sub, child_outer_sub);
                if (STRING_equal(interp, current_sub->subid,
                                      child_outer_sub->subid)) {
                    PARROT_GC_WRITE_BARRIER(interp, child_pmc);
                    child_sub->outer_ctx = ctx;
                }
            }
        }
        return;
    }

    /* the sub_pmc has to have an outer_sub that is the caller */
    PMC_get_sub(interp, sub_pmc, sub);
    if (PMC_IS_NULL(sub->outer_sub))
        return;

    /* set the sub's outer context to the current context */
    PARROT_GC_WRITE_BARRIER(interp, sub_pmc);
    sub->outer_ctx = ctx;
}


/*

=item C<PMC* Parrot_sub_new_closure(PARROT_INTERP, PMC *sub_pmc)>

Used where? XXX

Creates a new closure, saving the context information.  Takes a pointer
to a subroutine.

Returns a pointer to the closure, (or throws exceptions if invalid).

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC*
Parrot_sub_new_closure(PARROT_INTERP, ARGIN(PMC *sub_pmc))
{
    ASSERT_ARGS(Parrot_sub_new_closure)
    PMC * const clos_pmc = VTABLE_clone(interp, sub_pmc);
    Parrot_sub_capture_lex(interp, clos_pmc);
    return clos_pmc;
}


/*

=item C<void Parrot_sub_continuation_check(PARROT_INTERP, const PMC *pmc)>

Verifies that the provided continuation is sane.

=cut

*/

void
Parrot_sub_continuation_check(PARROT_INTERP, ARGIN(const PMC *pmc))
{
    ASSERT_ARGS(Parrot_sub_continuation_check)
    PMC * const to_ctx       = PARROT_CONTINUATION(pmc)->to_ctx;
    if (PMC_IS_NULL(to_ctx))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                       "Continuation invoked after deactivation.");
}

/*

=item C<void Parrot_sub_continuation_rewind_environment(PARROT_INTERP, PMC
*pmc)>

Restores the appropriate context for the continuation.

=cut

*/

void
Parrot_sub_continuation_rewind_environment(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(Parrot_sub_continuation_rewind_environment)

    PMC * const to_ctx = PARROT_CONTINUATION(pmc)->to_ctx;
    PMC * const sig    = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));

    /* debug print before context is switched */
    if (Interp_trace_TEST(interp, PARROT_TRACE_SUB_CALL_FLAG)) {
        PMC * const sub = Parrot_pcc_get_sub(interp, to_ctx);

        Parrot_io_eprintf(interp, "# Back in sub '%Ss\n",
                    Parrot_sub_full_sub_name(interp, sub));
    }

    /* set context */
    Parrot_pcc_set_context(interp, to_ctx);
    Parrot_pcc_set_signature(interp, to_ctx, sig);
}


/*

=item C<void * Parrot_get_sub_pmc_from_subclass(PARROT_INTERP, PMC *subclass)>

Gets a Parrot_sub structure from something that isn't a Sub PMC, but rather a
subclass.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
void *
Parrot_get_sub_pmc_from_subclass(PARROT_INTERP, ARGIN(PMC *subclass)) {
    ASSERT_ARGS(Parrot_get_sub_pmc_from_subclass)

    /* Ensure we really do have a subclass of sub. */
    if (VTABLE_isa(interp, subclass, CONST_STRING(interp, "Sub"))) {
        PMC *key, *sub_pmc;

        /* If it's actually a PMC still, probably does the same structure
         * underneath. */
        if (!PObj_is_object_TEST(subclass)) {
            return PARROT_SUB(subclass);
        }

        /* Get the Sub PMC itself. */
        key = Parrot_pmc_new(interp, enum_class_String);
        VTABLE_set_string_native(interp, key, CONST_STRING(interp, "Sub"));
        sub_pmc = VTABLE_get_attr_keyed(interp, subclass, key, CONST_STRING(interp, "proxy"));
        if (sub_pmc->vtable->base_type == enum_class_Sub) {
            return PARROT_SUB(sub_pmc);
        }
    }
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Attempting to do sub operation on non-Sub.");
}

/*

=back

=head1 SEE ALSO

F<include/parrot/sub.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

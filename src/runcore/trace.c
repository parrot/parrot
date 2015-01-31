/*
Copyright (C) 2001-2015, Parrot Foundation.

=head1 NAME

src/trace.c - Tracing

=head1 DESCRIPTION

Tracing support for the C<runops_slow_core()> function in
F<src/runcore/cores.c>.

This is turned on with Parrot's C<-t> option.

src/test_main.c

=head2 Functions

=over 4

=cut

*/

#include "parrot/runcore_trace.h"
#include "parrot/oplib/ops.h"
#include "parrot/context.h"
#include "pmc/pmc_sub.h"
#include "pmc/pmc_callcontext.h"
#include "parrot/oplib/core_ops.h"

#define EPRINTF(fmt)                            \
    if (debugger == interp) {                   \
        fprintf(stderr, (fmt));                 \
    }                                           \
    else {                                      \
        Parrot_io_eprintf(debugger, (fmt));     \
    }
#define EPRINTF_1(fmt, a)			\
    if (debugger == interp) {			\
        fprintf(stderr, (fmt), (a));		\
    }                                           \
    else {                                      \
        Parrot_io_eprintf(debugger, (fmt), (a));\
    }
#define EPRINTF_2(fmt, a1, a2)			\
    if (debugger == interp) {			\
        fprintf(stderr, (fmt), (a1), (a2));     \
    }                                           \
    else {                                      \
        Parrot_io_eprintf(debugger, (fmt), (a1), (a2));\
    }
#define EPRINTF_3(fmt, a1, a2, a3)              \
    if (debugger == interp) {			\
        fprintf(stderr, (fmt), (a1), (a2), (a3));\
    }                                           \
    else {                                      \
        Parrot_io_eprintf(debugger, (fmt), (a1), (a2), (a3));\
    }


/* HEADERIZER HFILE: include/parrot/runcore_trace.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
PARROT_INLINE
static Interp * debugger_or_interp(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING* trace_class_name(PARROT_INTERP, ARGIN(const PMC* pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_debugger_or_interp __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_trace_class_name __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<static Interp * debugger_or_interp(PARROT_INTERP)>

Get debugger if available

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_INLINE
static Interp *
debugger_or_interp(PARROT_INTERP)
{
    ASSERT_ARGS(debugger_or_interp)

    return interp && interp->pdb && interp->pdb->debugger
            ? interp->pdb->debugger
            : interp;
}

/*

=item C<static STRING* trace_class_name(PARROT_INTERP, const PMC* pmc)>

Obtains the class name of the PMC.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING*
trace_class_name(PARROT_INTERP, ARGIN(const PMC* pmc))
{
    ASSERT_ARGS(trace_class_name)

    if (PObj_is_class_TEST(pmc)) {
        SLOTTYPE * const class_array    = PMC_data_typed(pmc, SLOTTYPE *);
        PMC      * const class_name_pmc = get_attrib_num(class_array,
                                                    PCD_CLASS_NAME);
        return VTABLE_get_string(interp, class_name_pmc);
    }
    else
        return pmc->vtable->whoami;
}


/*

=item C<void trace_pmc_flags_dump(PARROT_INTERP, PMC *pmc)>

Pretty prints PMC flags to C<stderr>.

=cut

*/

void
trace_pmc_flags_dump(PARROT_INTERP, ARGIN_NULLOK(PMC *pmc))
{
    ASSERT_ARGS(trace_pmc_flags_dump)
    Interp * const debugger = debugger_or_interp(interp);
    UINTVAL i;
    UINTVAL flags = pmc->flags;
    struct flag_names_decl {
        UINTVAL flag;
        const char *name;
    } flags_names[] = {
      { 1<<0, "priv0" },
      { 1<<1, "priv1" },
      { 1<<2, "priv2" },
      { 1<<3, "priv3" },
      { 1<<4, "priv4" },
      { 1<<5, "priv5" },
      { 1<<6, "priv6" },
      { 1<<7, "priv7" },
      { 1<<8, "string" },
      { 1<<9, "PMC" },
      { 1<<10, "string_copy" },
      { 1<<11, "shared" },
      { 1<<12, "const" },
      { 1<<13, "ext" },
      { 1<<14, "sysmem" },
      { 1<<15, "COW" },
      { 1<<16, "live" },
      { 1<<17, "free" },
      { 1<<18, "c_mark" },
      { 1<<19, "c_destroy" },
      { 1<<20, "report" },
      { 1<<21, "new" },
      { 1<<22, "gen0" },
      { 1<<23, "gen1" },
      { 1<<24, "gen2" },
      { 1<<25, "dirty" },
      { 1<<26, "need_wb" },
      { 1<<27, "soil_root" },
      { 1<<28, "needs_early_gc" }, /* timely destruction */
      { 1<<29, "class" },
      { 1<<30, "object" },
    };

    if (!pmc || PMC_IS_NULL(pmc)) {
        return;
    }
    EPRINTF("( ");
    for (i=0; i < sizeof (flags_names) / sizeof (flags_names[0]); i++) {
        if (flags & flags_names[i].flag) {
            EPRINTF_1("%s ", flags_names[i].name);
        }
    }
    EPRINTF(")");
}

/*

=item C<void trace_pmc_dump(PARROT_INTERP, PMC *pmc)>

Prints a PMC to C<stderr>.

=cut

*/

void
trace_pmc_dump(PARROT_INTERP, ARGIN_NULLOK(PMC *pmc))
{
    ASSERT_ARGS(trace_pmc_dump)
    Interp * const debugger = debugger_or_interp(interp);

    if (!pmc) {
        EPRINTF("(null)");
        return;
    }
    if (PMC_IS_NULL(pmc))  {
        EPRINTF("PMCNULL");
        return;
    }
    if (PObj_on_free_list_TEST(pmc)) {
        EPRINTF_1("**************** PMC(%p) is on free list *****\n", pmc);
    }
    if (!pmc->vtable) {
        EPRINTF("<!!no vtable!!>");
        return;
    }
    if (pmc->vtable->pmc_class == pmc) {
        STRING * const name = trace_class_name(interp, pmc);
        EPRINTF_2("Class=%s:PMC(%p)", name->strstart, pmc);
    }
    else if (pmc->vtable->base_type == enum_class_String) {
        const STRING * const s = VTABLE_get_string(interp, pmc);
        if (!s) {
            EPRINTF_1("String=PMC(%p Str:(NULL))", pmc);
        }
        else {
            STRING * const escaped = Parrot_str_escape_truncate(interp, s, 20);
            if (escaped && escaped->strstart) {
                EPRINTF_2("String=PMC(%p Str:\"%s\")", pmc, escaped->strstart);
            }
            else {
                EPRINTF_1("String=PMC(%p Str:\"(null)\")", pmc);
            }
        }
    }
    else if (pmc->vtable->base_type == enum_class_StringBuilder) {
        const STRING * const s = VTABLE_get_string(interp, pmc);
        if (!s) {
            EPRINTF_1("StringBuilder=PMC(%p Str:(NULL))", pmc);
        }
        else {
            STRING * const escaped = Parrot_str_escape_truncate(interp, s, 20);
            if (escaped && escaped->strstart) {
                EPRINTF_2("StringBuilder=PMC(%p Str:\"%s\")", pmc, escaped->strstart);
            }
            else {
                EPRINTF_1("StringBuilder=PMC(%p Str:\"(null)\")", pmc);
            }
        }
    }
    else if (pmc->vtable->base_type == enum_class_Boolean) {
        EPRINTF_2("Boolean=PMC(%p: "INTVAL_FMT")",
                pmc, VTABLE_get_integer(interp, pmc));
    }
    else if (pmc->vtable->base_type == enum_class_Integer) {
        EPRINTF_2("Integer=PMC(%p: "INTVAL_FMT")",
                pmc, VTABLE_get_integer(interp, pmc));
    }
    else if (pmc->vtable->base_type == enum_class_BigInt) {
        STRING * const s = VTABLE_get_string(interp, pmc);
        EPRINTF_2("BigInt=PMC(%p: %s)", pmc, s->strstart);
    }
    else if (pmc->vtable->base_type == enum_class_Complex) {
        STRING * const s = VTABLE_get_string(interp, pmc);
        EPRINTF_2("Complex=PMC(%p: %s)", pmc, s->strstart);
    }
    else if (pmc->vtable->base_type == enum_class_Sub) {
        Parrot_Sub_attributes *sub;
        PMC_get_sub(interp, pmc, sub);
        EPRINTF_3("Sub(%s pc:"SIZE_FMT")=PMC(%p)",
                  (sub->name && sub->name->strstart) ? sub->name->strstart : "",
                  sub->start_offs, pmc);
    }
    else if (pmc->vtable->base_type == enum_class_Coroutine) {
        Parrot_Sub_attributes *sub;
        PMC_get_sub(interp, pmc, sub);
        EPRINTF_3("Coroutine(%s pc:"SIZE_FMT")=PMC(%p)",
                  (sub->name && sub->name->strstart) ? sub->name->strstart : "",
                  sub->start_offs, pmc);
    }
    else if (pmc->vtable->base_type == enum_class_FixedBooleanArray
          || pmc->vtable->base_type == enum_class_FixedFloatArray
          || pmc->vtable->base_type == enum_class_FixedIntegerArray
          || pmc->vtable->base_type == enum_class_FixedPMCArray
          || pmc->vtable->base_type == enum_class_FixedStringArray
          || pmc->vtable->base_type == enum_class_ResizableBooleanArray
          || pmc->vtable->base_type == enum_class_ResizableFloatArray
          || pmc->vtable->base_type == enum_class_ResizableIntegerArray
          || pmc->vtable->base_type == enum_class_ResizablePMCArray
          || pmc->vtable->base_type == enum_class_ResizableStringArray
          || pmc->vtable->base_type == enum_class_MappedByteArray) {
        STRING * const name = VTABLE_name(interp, pmc);
        EPRINTF_3("%s("INTVAL_FMT")=PMC(%p)",
                  name->strstart, VTABLE_elements(interp, pmc), pmc);
    }
    else if (PObj_is_object_TEST(pmc)) {
        STRING * const s = VTABLE_get_string(interp, VTABLE_get_class(interp, pmc));
        EPRINTF_2("Object(%s)=PMC(%p)", s->strstart, pmc);
    }
    else {
        STRING * const name = VTABLE_name(interp, pmc);
        EPRINTF_2("%s=PMC(%p)", name->strstart ? name->strstart : "", pmc);
    }
    if (Interp_trace_TEST(interp, PARROT_TRACE_OPS_PMC_FLAG))
        trace_pmc_flags_dump(interp, pmc);
}

/*

=item C<int trace_key_dump(PARROT_INTERP, const PMC *key)>

Prints a key to C<stderr>, returns the length of the output.

=cut

*/

int
trace_key_dump(PARROT_INTERP, ARGIN(const PMC *key))
{
    ASSERT_ARGS(trace_key_dump)
    Interp * const debugger = debugger_or_interp(interp);

    int len = Parrot_io_eprintf(debugger, "# [");

    while (key) {
        switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
          case KEY_integer_FLAG:
              len += Parrot_io_eprintf(debugger, "%vi",
                  VTABLE_get_integer(interp, (PMC *)key));
            break;
          case KEY_string_FLAG:
            {
            const STRING * const s = Parrot_key_string(interp, (PMC *)key);
            STRING * const escaped = Parrot_str_escape_truncate(interp, s, 20);

            if (escaped)
                len += Parrot_io_eprintf(debugger, "\"%Ss\"", escaped);
            else
                len += Parrot_io_eprintf(debugger, "\"(null)\"");
            }
            break;
          case KEY_integer_FLAG|KEY_register_FLAG:
              len += Parrot_io_eprintf(debugger, "I%vd=%vd",
                  VTABLE_get_integer(interp, (PMC *)key),
                    REG_INT(interp, VTABLE_get_integer(interp, (PMC *)key)));
            break;
          case KEY_string_FLAG|KEY_register_FLAG:
            {
            const UINTVAL keynum = (UINTVAL)VTABLE_get_integer(interp, (PMC *)key);
            if (keynum < PCC_GET_REGS_USED(CURRENT_CONTEXT(interp), REGNO_STR)) {
                const STRING * const s = REG_STR(interp, keynum);
                STRING * const escaped = Parrot_str_escape_truncate(interp, s, 20);
                if (escaped)
                    len += Parrot_io_eprintf(debugger, "S%vd=\"%Ss\"",
                            keynum, escaped);
                else
                    len += Parrot_io_eprintf(debugger, "S%vd=\"(null)\"", keynum);
            }
            else
                len += Parrot_io_eprintf(debugger, "**WRONG KEY STRING REG %d**", keynum);
            }
            break;
          case KEY_pmc_FLAG|KEY_register_FLAG:
              len += Parrot_io_eprintf(debugger, "P%vd=",
                  VTABLE_get_integer(interp, (PMC *)key));
              trace_pmc_dump(debugger, REG_PMC(interp,
                  VTABLE_get_integer(interp, (PMC *)key)));
            break;
          default:
            len += Parrot_io_eprintf(debugger, "??");
            key  = NULL;
            break;
        }

        if (key) {
            key = VTABLE_shift_pmc(interp, (PMC *)key);
            if (key)
                len += Parrot_io_eprintf(debugger, ";");
        }
    }

    len += Parrot_io_eprintf(debugger, "]");
    return len;
}

/*

=item C<void trace_str_dump(PARROT_INTERP, const STRING *str)>

Prints a STRING to C<stderr>.

=cut

*/

void
trace_str_dump(PARROT_INTERP, ARGIN_NULLOK(const STRING *str))
{
    ASSERT_ARGS(trace_str_dump)
    Interp * const debugger = debugger_or_interp(interp);
    STRING * escaped;

    if (!str) {
        EPRINTF("(null)");
        return;
    }
    if (!str->strstart) {
        EPRINTF_1("%p \"\"", str);
        return;
    }
    escaped = Parrot_str_escape_truncate(interp, str, 20);
    if (escaped) {
        if (str->encoding == Parrot_ascii_encoding_ptr
         || str->encoding == Parrot_latin1_encoding_ptr) {
            EPRINTF_2("%p \"%s\"", str, escaped->strstart);
        }
        else {
            EPRINTF_3("%p %s:\"%s\"", str, str->encoding->name, escaped->strstart);
        }
    }
    else {
        EPRINTF_1("%p \"\"", str);
    }
}

/*

=item C<void trace_op_dump(PARROT_INTERP, const opcode_t *code_start, const
opcode_t *pc)>

Prints the PC, OP and ARGS. Used by C<trace_op()>.

I<Not really part of the API.>

=cut

*/

void
trace_op_dump(PARROT_INTERP,
        ARGIN(const opcode_t *code_start),
        ARGIN(const opcode_t *pc))
{
    ASSERT_ARGS(trace_op_dump)
    Interp    * const debugger = debugger_or_interp(interp);
    op_info_t * const info     = interp->code->op_info_table[*pc];
    op_lib_t  *       core_ops = PARROT_GET_CORE_OPLIB(interp);
    PMC *sig                   = PMCNULL;
    INTVAL n                   = info->op_count;
    INTVAL s                   = 1;
    int more                   = 0, type;
    int var_args               = 0;

    int len = Parrot_io_eprintf(debugger, "%04vx ", (UINTVAL)(pc - code_start))
            + Parrot_io_eprintf(debugger, "%s", info->name);

#define ARGS_COLUMN 40

    if (OPCODE_IS(interp, interp->code, *pc, core_ops, PARROT_OP_set_args_pc)
    ||  OPCODE_IS(interp, interp->code, *pc, core_ops, PARROT_OP_get_results_pc)
    ||  OPCODE_IS(interp, interp->code, *pc, core_ops, PARROT_OP_get_params_pc)
    ||  OPCODE_IS(interp, interp->code, *pc, core_ops, PARROT_OP_set_returns_pc)) {
        sig = interp->code->const_table->pmc.constants[pc[1]];

        if (!sig)
            Parrot_ex_throw_from_c_noargs(interp, EXCEPTION_UNEXPECTED_NULL,
                "NULL sig PMC detected in trace_op_dump");

        var_args = VTABLE_elements(interp, sig);
        n       += var_args;
    }

    if (n > 1) {
        INTVAL i;
        len += Parrot_io_eprintf(debugger, " ");
        /* pass 1 print arguments */
        for (i = s; i < n; ++i) {
            const opcode_t o = pc[i];

            if (i < info->op_count)
                type = info->types[i - 1];
            else {
                if (PMC_IS_NULL(sig))
                    Parrot_ex_throw_from_c_noargs(interp, EXCEPTION_UNEXPECTED_NULL,
                        "NULL sig PMC detected in trace_op_dump");

                type = VTABLE_get_integer_keyed_int(interp, sig, i - 2) &
                    (PARROT_ARG_TYPE_MASK|PARROT_ARG_CONSTANT);
            }

            if (i > s
            &&  type != PARROT_ARG_KC
            &&  type != PARROT_ARG_KIC
            &&  type != PARROT_ARG_KI
            &&  type != PARROT_ARG_K)
                len += Parrot_io_eprintf(debugger, ", ");

            switch (type) {
              case PARROT_ARG_IC:
                len += Parrot_io_eprintf(debugger, "%vd", o);
                break;
              case PARROT_ARG_NC:
                len += Parrot_io_eprintf(debugger, "%vg",
                        Parrot_pcc_get_num_constant(interp,
                            CURRENT_CONTEXT(interp), o));
                break;
              case PARROT_ARG_PC:
                if (var_args)
                    len += Parrot_io_eprintf(debugger, "PC%d (%d)",
                                (int)o, var_args);
                else
                    len += Parrot_io_eprintf(debugger, "PC%d", (int)o);
                break;
              case PARROT_ARG_SC:
                {
                    STRING * const escaped = Parrot_str_escape_truncate(
                            interp, Parrot_pcc_get_string_constant(interp,
                                        CURRENT_CONTEXT(interp), o), 20);
                    if (escaped)
                        len += Parrot_io_eprintf(debugger, "\"%Ss\"", escaped);
                    else
                        len += Parrot_io_eprintf(debugger, "\"(null)\"");
                }
                break;
              case PARROT_ARG_KC:
                len += trace_key_dump(interp,
                        Parrot_pcc_get_pmc_constant(interp,
                            CURRENT_CONTEXT(interp), o));
                break;
              case PARROT_ARG_KIC:
                len += Parrot_io_eprintf(debugger, "[%vd]", o);
                break;
              case PARROT_ARG_KI:
                len += Parrot_io_eprintf(debugger, "[I%vd]", o);
                more = 1;
                break;
              case PARROT_ARG_K:
                len += Parrot_io_eprintf(debugger, "[P%vd]", o);
                more = 1;
                break;
              case PARROT_ARG_I:
                len += Parrot_io_eprintf(debugger, "I%vd", o);
                more = 1;
                break;
              case PARROT_ARG_N:
                len += Parrot_io_eprintf(debugger, "N%vd", o);
                more = 1;
                break;
              case PARROT_ARG_P:
                len += Parrot_io_eprintf(debugger, "P%vd", o);
                more = 1;
                break;
              case PARROT_ARG_S:
                len += Parrot_io_eprintf(debugger, "S%vd", o);
                more = 1;
                break;
              default:
                Parrot_ex_throw_from_c_noargs(interp, EXCEPTION_NULL_REG_ACCESS,
                        "unhandled type in trace");
                break;
            }
        }

        if (!more)
            goto done;

        if (len < ARGS_COLUMN)  {
            STRING * const fill = Parrot_str_repeat(debugger,
                    Parrot_str_new_constant(debugger, " "), ARGS_COLUMN - len);
            Parrot_io_write_s(debugger, Parrot_io_STDERR(debugger), fill);
        }
        else
            Parrot_io_eprintf(debugger, "\t");

        /* pass 2 print argument details if needed */
        for (i = 1; i < n; ++i) {
            const opcode_t o = pc[i];
            if (i < info->op_count)
                type = info->types[i - 1];
            else
                type = VTABLE_get_integer_keyed_int(interp, sig, i - 2) &
                    (PARROT_ARG_TYPE_MASK|PARROT_ARG_CONSTANT);

            if (i > s)
                Parrot_io_eprintf(debugger, " ");

            switch (type) {
              case PARROT_ARG_I:
                Parrot_io_eprintf(debugger, "I%vd=%vd", o, REG_INT(interp, o));
                break;
              case PARROT_ARG_N:
                Parrot_io_eprintf(debugger, "N%vd=%vf", o, REG_NUM(interp, o));
                break;
              case PARROT_ARG_PC:
                Parrot_io_eprintf(debugger, "PC%vd=", o);
                trace_pmc_dump(interp, Parrot_pcc_get_pmc_constant(interp,
                                            CURRENT_CONTEXT(interp), o));
                break;
              case PARROT_ARG_P:
                Parrot_io_eprintf(debugger, "P%vd=", o);
                trace_pmc_dump(interp, REG_PMC(interp, o));
                break;
              case PARROT_ARG_S:
                if (REG_STR(interp, o)) {
                    STRING * const escaped = Parrot_str_escape_truncate(
                                interp, REG_STR(interp, o), 20);
                    Parrot_io_eprintf(debugger, "S%vd=\"%Ss\"", o, escaped);
                }
                else
                    Parrot_io_eprintf(debugger, "S%vd=\"(null)\"", o);
                break;
              case PARROT_ARG_K:
                Parrot_io_eprintf(debugger, "P%vd=", o);
                trace_key_dump(interp, REG_PMC(interp, *(pc + i)));
                break;
              case PARROT_ARG_KI:
                Parrot_io_eprintf(debugger, "I%vd=[%vd]", o, REG_INT(interp, o));
                break;
              default:
                break;
            }
        }
    }
done:

    if (interp->code->annotations) {
        PMC * const annot = Parrot_pf_annotations_lookup(interp,
                interp->code->annotations, pc - code_start + 1, NULL);

        if (!PMC_IS_NULL(annot)) {
            PMC * const pfile = VTABLE_get_pmc_keyed_str(interp, annot,
                    Parrot_str_new_constant(interp, "file"));
            PMC * const pline = VTABLE_get_pmc_keyed_str(interp, annot,
                    Parrot_str_new_constant(interp, "line"));

            if ((!PMC_IS_NULL(pfile)) && (!PMC_IS_NULL(pline))) {
                /* The debugger interpreter may not be the same as
                 * the main interpreter, extract values from the
                 * PMC instad of passing them directly */
                STRING * const file = VTABLE_get_string(interp, pfile);
                const INTVAL   line = VTABLE_get_integer(interp, pline);
                Parrot_io_eprintf(debugger, " (%Ss:%li)", file, (long)line);
            }
        }
    }

    Parrot_io_eprintf(debugger, "\n");
}


/*

=item C<void trace_op(PARROT_INTERP, const opcode_t *code_start, const opcode_t
*code_end, const opcode_t *pc)>

Prints the PC, OP and ARGS. Used by C<runops_trace()>. With bounds checking.

I<Not really part of the API.>

=cut

*/

void
trace_op(PARROT_INTERP,
        ARGIN(const opcode_t *code_start),
        ARGIN(const opcode_t *code_end),
        ARGIN_NULLOK(const opcode_t *pc))
{
    ASSERT_ARGS(trace_op)

    if (!pc)
        return;

    if (pc >= code_start && pc < code_end)
        trace_op_dump(interp, code_start, pc);
    else
        Parrot_io_eprintf(interp, "PC=%ld; OP=<err>\n",
        (long)(pc - code_start));
}


/*

=back

=head1 SEE ALSO

F<src/trace.h>

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

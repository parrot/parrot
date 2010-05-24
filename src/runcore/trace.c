/*
Copyright (C) 2001-2010, Parrot Foundation.
$Id$

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

/* HEADERIZER HFILE: include/parrot/runcore_trace.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
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
static Interp *
debugger_or_interp(PARROT_INTERP)
{
    ASSERT_ARGS(debugger_or_interp)

    return interp->pdb && interp->pdb->debugger
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

=item C<void trace_pmc_dump(PARROT_INTERP, PMC *pmc)>

Prints a PMC to C<stderr>.

=cut

*/

void
trace_pmc_dump(PARROT_INTERP, ARGIN_NULLOK(PMC *pmc))
{
    ASSERT_ARGS(trace_pmc_dump)
    Interp * const debugger = debugger_or_interp(interp);
    Parrot_Sub_attributes    *sub;

    if (!pmc) {
        Parrot_io_eprintf(debugger, "(null)");
        return;
    }

    if (PMC_IS_NULL(pmc))  {
        Parrot_io_eprintf(debugger, "PMCNULL");
        return;
    }

    if (!pmc->vtable || (UINTVAL)pmc->vtable == 0xdeadbeef) {
        Parrot_io_eprintf(debugger, "<!!no vtable!!>");
        return;
    }

    if (PObj_on_free_list_TEST(pmc))
        Parrot_io_eprintf(debugger,
            "**************** PMC is on free list *****\n");

    if (pmc->vtable->pmc_class == pmc) {
        STRING * const name = trace_class_name(interp, pmc);
        Parrot_io_eprintf(debugger, "Class=%Ss:PMC(%#p)", name, pmc);
    }
    else if (pmc->vtable->base_type == enum_class_String) {
        const STRING * const s = VTABLE_get_string(interp, pmc);
        if (!s)
            Parrot_io_eprintf(debugger, "%S=PMC(%#p Str:(NULL))",
                    VTABLE_name(interp, pmc), pmc);
        else {
            STRING * const escaped = Parrot_str_escape_truncate(interp, s, 20);
            if (escaped)
                Parrot_io_eprintf(debugger, "%S=PMC(%#p Str:\"%Ss\")",
                    VTABLE_name(interp, pmc), pmc, escaped);
            else
                Parrot_io_eprintf(debugger, "%S=PMC(%#p Str:\"(null)\")",
                    VTABLE_name(interp, pmc), pmc);
        }
    }
    else if (pmc->vtable->base_type == enum_class_Boolean)
        Parrot_io_eprintf(debugger, "Boolean=PMC(%#p: %d)",
                pmc, VTABLE_get_integer(interp, pmc));

    else if (pmc->vtable->base_type == enum_class_Integer)
        Parrot_io_eprintf(debugger, "Integer=PMC(%#p: %d)",
                pmc, VTABLE_get_integer(interp, pmc));

    else if (pmc->vtable->base_type == enum_class_BigInt) {
        STRING * const s = VTABLE_get_string(interp, pmc);
        Parrot_io_eprintf(debugger, "BigInt=PMC(%#p: %Ss)",
                pmc, s);
    }
    else if (pmc->vtable->base_type == enum_class_Complex) {
        STRING * const s = VTABLE_get_string(interp, pmc);
        Parrot_io_eprintf(debugger, "Complex=PMC(%#p: %Ss)", pmc, s);
    }
    else if (pmc->vtable->base_type == enum_class_Sub) {
        PMC_get_sub(interp, pmc, sub);
        Parrot_io_eprintf(debugger, "%S=PMC(%#p pc:%d)",
                VTABLE_name(interp, pmc), pmc, sub->start_offs);
    }
    else if (PObj_is_object_TEST(pmc)) {
        Parrot_io_eprintf(debugger, "Object(%Ss)=PMC(%#p)",
                VTABLE_get_string(interp, VTABLE_get_class(interp, pmc)), pmc);
    }
    else {
        Parrot_io_eprintf(debugger, "%S=PMC(%#p)",
                VTABLE_name(interp, pmc), pmc);
    }
}


/*

=item C<int trace_key_dump(PARROT_INTERP, PMC *key)>

Prints a key to C<stderr>, returns the length of the output.

=cut

*/

int
trace_key_dump(PARROT_INTERP, ARGIN(PMC *key))
{
    ASSERT_ARGS(trace_key_dump)
    Interp * const debugger = debugger_or_interp(interp);

    int len = Parrot_io_eprintf(debugger, "[");

    while (key) {
        switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
          case KEY_integer_FLAG:
              len += Parrot_io_eprintf(debugger, "%vi",
                 VTABLE_get_integer(interp, key));
            break;
          case KEY_number_FLAG:
              len += Parrot_io_eprintf(debugger, "%vg",
                  VTABLE_get_number(interp, key));
            break;
          case KEY_string_FLAG:
            {
            const STRING * const s = key_string(interp, key);
            STRING * const escaped = Parrot_str_escape_truncate(interp, s, 20);

            if (escaped)
                len += Parrot_io_eprintf(debugger, "\"%Ss\"", escaped);
            else
                len += Parrot_io_eprintf(debugger, "\"(null)\"");
            }
            break;
          case KEY_integer_FLAG|KEY_register_FLAG:
              len += Parrot_io_eprintf(debugger, "I%vd=%vd",
                  VTABLE_get_integer(interp, key),
                    REG_INT(interp, VTABLE_get_integer(interp, key)));
            break;
          case KEY_number_FLAG|KEY_register_FLAG:
              len += Parrot_io_eprintf(debugger, "I%vd=%vd",
                  VTABLE_get_integer(interp, key),
                    REG_NUM(interp, VTABLE_get_integer(interp, key)));
            break;
          case KEY_string_FLAG|KEY_register_FLAG:
            {
            const INTVAL keynum = VTABLE_get_integer(interp, key);
            if (keynum < Parrot_pcc_get_regs_used(interp, CURRENT_CONTEXT(interp), REGNO_STR)) {
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
                  VTABLE_get_integer(interp, key));
              trace_pmc_dump(debugger, REG_PMC(interp,
                  VTABLE_get_integer(interp, key)));
            break;
          default:
            len += Parrot_io_eprintf(debugger, "??");
            key  = NULL;
            break;
        }

        if (key) {
            key = VTABLE_shift_pmc(interp, key);
            if (key)
                len += Parrot_io_eprintf(debugger, ";");
        }
    }

    len += Parrot_io_eprintf(debugger, "]");
    return len;
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
    op_info_t * const info     = &interp->op_info_table[*pc];
    PMC *sig                   = PMCNULL;
    INTVAL n                   = info->op_count;
    INTVAL s                   = 1;
    int more                   = 0, type;
    int var_args               = 0;

    int len = Parrot_io_eprintf(debugger, "%04vx ", (UINTVAL)(pc - code_start))
            + Parrot_io_eprintf(debugger, "%s", info->name);

#define ARGS_COLUMN 40

    if (*pc == PARROT_OP_set_args_pc
    ||  *pc == PARROT_OP_get_results_pc
    ||  *pc == PARROT_OP_get_params_pc
    ||  *pc == PARROT_OP_set_returns_pc) {
        sig = interp->code->const_table->constants[pc[1]]->u.key;

        if (!sig)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
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
                if (!sig)
                    Parrot_ex_throw_from_c_args(interp, NULL, 1,
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
                Parrot_ex_throw_from_c_args(interp, NULL, 1,
                        "unhandled type in trace");
                break;
            }
        }

        if (!more)
            goto done;

        if (len < ARGS_COLUMN)  {
            STRING * const fill = Parrot_str_repeat(debugger,
                    Parrot_str_new_constant(debugger, " "), ARGS_COLUMN);
            Parrot_io_putps(debugger, Parrot_io_STDERR(debugger), fill);
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
        PMC * const annot = PackFile_Annotations_lookup(interp,
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
 * vim: expandtab shiftwidth=4:
 */

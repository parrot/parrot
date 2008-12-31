/*
Copyright (C) 2001-2008, The Perl Foundation.
$Id$

=head1 NAME

src/trace.c - Tracing

=head1 DESCRIPTION

Tracing support for the C<runops_slow_core()> function in F<src/runops_cores.c>.

This is turned on with Parrot's C<-t> option.

src/test_main.c

=head2 Functions

=over 4

=cut

*/

#include "trace.h"
#include "parrot/oplib/ops.h"

/* HEADERIZER HFILE: src/trace.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING* trace_class_name(ARGIN(const PMC* pmc))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_trace_class_name assert(pmc);
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<static STRING* trace_class_name>

Obtains the class name of the PMC.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING*
trace_class_name(ARGIN(const PMC* pmc))
{
    STRING *class_name;
    if (PObj_is_class_TEST(pmc)) {
        SLOTTYPE * const class_array = (SLOTTYPE *)PMC_data(pmc);
        PMC * const class_name_pmc = get_attrib_num(class_array,
                                                    PCD_CLASS_NAME);
        class_name = PMC_str_val(class_name_pmc);
    }
    else
        class_name = pmc->vtable->whoami;
    return class_name;
}

/*

=item C<void trace_pmc_dump>

Prints a PMC to C<stderr>.

=cut

*/

void
trace_pmc_dump(PARROT_INTERP, ARGIN_NULLOK(PMC *pmc))
{
    Interp * const debugger = interp->debugger;

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
    if (PObj_on_free_list_TEST(pmc)) {
        Parrot_io_eprintf(debugger, "**************** PMC is on free list *****\n");
    }
    if (pmc->vtable->pmc_class == pmc) {
        STRING * const name = trace_class_name(pmc);
        Parrot_io_eprintf(debugger, "Class=%Ss:PMC(%#p)", name, pmc);
    }
    else if (pmc->vtable->base_type == enum_class_String) {
        const STRING * const s = VTABLE_get_string(interp, pmc);
        if (!s)
            Parrot_io_eprintf(debugger, "%S=PMC(%#p Str:(NULL))",
                    VTABLE_name(interp, pmc), pmc);
        else {
            STRING* const escaped = string_escape_string_delimited(
                            interp, s, 20);
            if (escaped)
                Parrot_io_eprintf(debugger, "%S=PMC(%#p Str:\"%Ss\")",
                    VTABLE_name(interp, pmc), pmc,
                    escaped);
            else
                Parrot_io_eprintf(debugger, "%S=PMC(%#p Str:\"(null)\")",
                    VTABLE_name(interp, pmc), pmc);
        }
    }
    else if (pmc->vtable->base_type == enum_class_Boolean) {
        Parrot_io_eprintf(debugger, "Boolean=PMC(%#p: %d)",
                pmc, PMC_int_val(pmc));
    }
    else if (pmc->vtable->base_type == enum_class_Integer) {
        Parrot_io_eprintf(debugger, "Integer=PMC(%#p: %d)",
                pmc, PMC_int_val(pmc));
    }
    else if (pmc->vtable->base_type == enum_class_BigInt) {
        STRING * const s = VTABLE_get_string(interp, pmc);
        Parrot_io_eprintf(debugger, "BigInt=PMC(%#p: %Ss)",
                pmc, s);
    }
    else if (pmc->vtable->base_type == enum_class_Complex) {
        STRING * const s = VTABLE_get_string(interp, pmc);
        Parrot_io_eprintf(debugger, "Complex=PMC(%#p: %Ss)",
                pmc, s);
    }
    else if (pmc->vtable->base_type == enum_class_RetContinuation
            ||  pmc->vtable->base_type == enum_class_Continuation
            ||  pmc->vtable->base_type == enum_class_Sub) {
        Parrot_io_eprintf(debugger, "%S=PMC(%#p pc:%d)",
                VTABLE_name(interp, pmc), pmc,
                PMC_sub(pmc)->start_offs);
    }
    else if (PObj_is_object_TEST(pmc)) {
        Parrot_io_eprintf(debugger, "Object(%Ss)=PMC(%#p)",
                VTABLE_get_string(interp, VTABLE_get_class(interp, pmc)), pmc);
    }
    else if (pmc->vtable->base_type == enum_class_delegate) {
        Parrot_io_eprintf(debugger, "delegate=PMC(%#p)", pmc);
    }
    else {
        Parrot_io_eprintf(debugger, "%S=PMC(%#p)",
                VTABLE_name(interp, pmc), pmc);
    }
}

/*

=item C<int trace_key_dump>

Prints a key to C<stderr>, returns the length of the output.

=cut

*/

int
trace_key_dump(PARROT_INTERP, ARGIN(const PMC *key))
{
    Interp * const debugger = interp->debugger;

    int len = Parrot_io_eprintf(debugger, "[");

    while (key) {
        switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
        case KEY_integer_FLAG:
            len += Parrot_io_eprintf(debugger, "%vi", PMC_int_val(key));
            break;
        case KEY_number_FLAG:
            len += Parrot_io_eprintf(debugger, "%vg", PMC_num_val(key));
            break;
        case KEY_string_FLAG:
            {
            const STRING * const s = PMC_str_val(key);
            STRING* const escaped = string_escape_string_delimited(
                            interp, s, 20);
            if (escaped)
                len += Parrot_io_eprintf(debugger, "\"%Ss\"", escaped);
            else
                len += Parrot_io_eprintf(debugger, "\"(null)\"");
            }
            break;
        case KEY_integer_FLAG|KEY_register_FLAG:
            len += Parrot_io_eprintf(debugger, "I%vd=%vd", PMC_int_val(key),
                    REG_INT(interp, PMC_int_val(key)));
            break;
        case KEY_number_FLAG|KEY_register_FLAG:
            len += Parrot_io_eprintf(debugger, "I%vd=%vd", PMC_int_val(key),
                    REG_NUM(interp, PMC_int_val(key)));
            break;
        case KEY_string_FLAG|KEY_register_FLAG:
            {
            const STRING * const s = REG_STR(interp, PMC_int_val(key));
            STRING* const escaped = string_escape_string_delimited(
                            interp, s, 20);
            if (escaped)
                len += Parrot_io_eprintf(debugger, "S%vd=\"%Ss\"", PMC_int_val(key),
                        escaped);
            else
                len += Parrot_io_eprintf(debugger, "S%vd=\"(null)\"",
                        PMC_int_val(key));
            }
            break;
        case KEY_pmc_FLAG|KEY_register_FLAG:
            len += Parrot_io_eprintf(debugger, "P%vd=", PMC_int_val(key));
            trace_pmc_dump(debugger, REG_PMC(interp, PMC_int_val(key)));
            break;
        default:
            len += Parrot_io_eprintf(debugger, "??");
            key = NULL;
            break;
        }

        if (key) {
            key = (PMC *)PMC_data(key);
            if (key)
                len += Parrot_io_eprintf(debugger, ";");
        }
    } /* while */

    len += Parrot_io_eprintf(debugger, "]");
    return len;
}

/*

=item C<void trace_op_dump>

TODO: This isn't really part of the API, but here's its documentation.

Prints the PC, OP and ARGS. Used by C<trace_op()>.

=cut

*/

void
trace_op_dump(PARROT_INTERP,
        ARGIN(const opcode_t *code_start),
        ARGIN(const opcode_t *pc))
{
    INTVAL s, n;
    int more = 0, var_args;
    Interp * const debugger = interp->debugger;
    op_info_t * const info = &interp->op_info_table[*pc];
    PMC *sig;
    int type;
    int len;
#define ARGS_COLUMN 40

    PARROT_ASSERT(debugger);
    sig = NULL; /* silence compiler uninit warning */

    s = 1;
    len = Parrot_io_eprintf(debugger, "%6vu ", (UINTVAL)(pc - code_start));
    if (STREQ(info->name, "infix")) {
        /* this should rather be MMD_opcode_name, which doesn't
         * exit yet
         */
        len += Parrot_io_eprintf(debugger, "%s",
                Parrot_MMD_method_name(interp, pc[1]) + 2);
        s = 2;
    }
    else if (STREQ(info->name, "n_infix")) {
        len += Parrot_io_eprintf(debugger, "n_%s",
                Parrot_MMD_method_name(interp, pc[1]) + 2);
        s = 2;
    }
    else
        len += Parrot_io_eprintf(debugger, "%s", info->name);

    n = info->op_count;
    var_args = 0;

    if (*pc == PARROT_OP_set_args_pc ||
            *pc == PARROT_OP_get_results_pc ||
            *pc == PARROT_OP_get_params_pc ||
            *pc == PARROT_OP_set_returns_pc) {
        sig = interp->code->const_table->constants[pc[1]]->u.key;

        if (!sig)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                "NULL sig PMC detected in trace_op_dump");

        var_args = VTABLE_elements(interp, sig);
        n += var_args;
    }

    if (n > 1) {
        INTVAL i;
        len += Parrot_io_eprintf(debugger, " ");
        /* pass 1 print arguments */
        for (i = s; i < n; i++) {
            const opcode_t o = pc[i];
            if (i < info->op_count) {
                type = info->types[i - 1];
            }
            else {
                if (!sig)
                    Parrot_ex_throw_from_c_args(interp, NULL, 1,
                        "NULL sig PMC detected in trace_op_dump");

                type = SIG_ITEM(sig, i - 2) &
                    (PARROT_ARG_TYPE_MASK|PARROT_ARG_CONSTANT);
            }
            if (i > s &&
                    type != PARROT_ARG_KC &&
                    type != PARROT_ARG_KIC &&
                    type != PARROT_ARG_KI &&
                    type != PARROT_ARG_K) {
                len += Parrot_io_eprintf(debugger, ", ");
            }
            switch (type) {
                case PARROT_ARG_IC:
                    len += Parrot_io_eprintf(debugger, "%vd", o);
                    break;
                case PARROT_ARG_NC:
                    len += Parrot_io_eprintf(debugger, "%vg", PCONST(o)->u.number);
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
                    STRING* const escaped = string_escape_string_delimited(
                            interp,
                            PCONST(o)->u.string, 20);
                    if (escaped)
                        len += Parrot_io_eprintf(debugger, "\"%Ss\"", escaped);
                    else
                        len += Parrot_io_eprintf(debugger, "\"(null)\"");
                    }
                    break;
                case PARROT_ARG_KC:
                    len += trace_key_dump(interp, PCONST(o)->u.key);
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
            STRING * const fill = string_repeat(debugger,
                    const_string(debugger, " "),
                    ARGS_COLUMN - len, NULL);
            Parrot_io_putps(debugger, Parrot_io_STDERR(debugger), fill);
        }
        else {
            Parrot_io_eprintf(debugger, "\t");
        }

        /* pass 2 print argument details if needed */
        for (i = 1; i < n; i++) {
            const opcode_t o = pc[i];
            if (i < info->op_count)
                type = info->types[i - 1];
            else
                type = SIG_ITEM(sig, i - 2) &
                    (PARROT_ARG_TYPE_MASK|PARROT_ARG_CONSTANT);
            if (i > s) {
                Parrot_io_eprintf(debugger, " ");
            }
            switch (type) {
                case PARROT_ARG_I:
                    Parrot_io_eprintf(debugger, "I%vd=%vd", o, REG_INT(interp, o));
                    break;
                case PARROT_ARG_N:
                    Parrot_io_eprintf(debugger, "N%vd=%vf", o, REG_NUM(interp, o));
                    break;
                case PARROT_ARG_PC:
                    Parrot_io_eprintf(debugger, "PC%vd=", o);
                    trace_pmc_dump(interp, PCONST(o)->u.key);
                    break;
                case PARROT_ARG_P:
                    Parrot_io_eprintf(debugger, "P%vd=", o);
                    trace_pmc_dump(interp, REG_PMC(interp, o));
                    break;
                case PARROT_ARG_S:
                    if (REG_STR(interp, o)) {
                        STRING* const escaped = string_escape_string_delimited(
                                interp, REG_STR(interp, o), 20);
                        Parrot_io_eprintf(debugger, "S%vd=\"%Ss\"", o,
                                escaped);
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
    Parrot_io_eprintf(debugger, "\n");
}

/*

=item C<void trace_op>

TODO: This isn't really part of the API, but here's its documentation.

Prints the PC, OP and ARGS. Used by C<runops_trace()>. With bounds
checking.

=cut

*/

void
trace_op(PARROT_INTERP,
        ARGIN(const opcode_t *code_start),
        ARGIN(const opcode_t *code_end),
        ARGIN_NULLOK(const opcode_t *pc))
{
    if (!pc) {
        return;
    }

    if (pc >= code_start && pc < code_end)
        trace_op_dump(interp, code_start, pc);
    else
        Parrot_io_eprintf(interp, "PC=%ld; OP=<err>\n", (long)(pc - code_start));
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

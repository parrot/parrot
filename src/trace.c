/*
Copyright (C) 2001-2003, The Perl Foundation.
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

/*

=item C<void
trace_pmc_dump(Interp *interpreter, PMC* pmc)>

Prints a PMC to C<stderr>.

=cut

*/

static STRING*
trace_class_name(Interp *interpreter, PMC* pmc)
{
    STRING *class_name;
    if (PObj_is_class_TEST(pmc)) {
        SLOTTYPE * const class_array = PMC_data(pmc);
        PMC * const class_name_pmc = get_attrib_num(class_array,
                                                    PCD_CLASS_NAME);
        class_name = PMC_str_val(class_name_pmc);
    }
    else
        class_name = pmc->vtable->whoami;
    return class_name;
}

void
trace_pmc_dump(Interp *interpreter, PMC* pmc)
{
    Interp * const debugger = interpreter->debugger;

    if (!pmc) {
        PIO_eprintf(debugger, "(null)");
        return;
    }
    if (pmc == PMCNULL)  {
        PIO_eprintf(debugger, "PMCNULL");
        return;
    }
    if (!pmc->vtable) {
        PIO_eprintf(debugger, "<!!no vtable!!>");
        return;
    }
    if (PObj_on_free_list_TEST(pmc)) {
        PIO_eprintf(debugger, "**************** PMC is on free list *****\n");
    }
    if (pmc->vtable->class == pmc) {
        STRING * const name = trace_class_name(interpreter, pmc);
        PIO_eprintf(debugger, "Class=%Ss:PMC(%#p)", name, pmc);
    }
    else if ( pmc->vtable->base_type == enum_class_String) {
        STRING * const s = VTABLE_get_string(interpreter, pmc);
        if (!s)
            PIO_eprintf(debugger, "%S=PMC(%#p Str:(NULL))",
                    VTABLE_name(interpreter, pmc), pmc);
        else {
            STRING* const escaped = string_escape_string_delimited(
                            interpreter, s, 20);
            if (escaped)
                PIO_eprintf(debugger, "%S=PMC(%#p Str:\"%Ss\")",
                    VTABLE_name(interpreter, pmc), pmc,
                    escaped);
            else
                PIO_eprintf(debugger, "%S=PMC(%#p Str:\"(null)\")",
                    VTABLE_name(interpreter, pmc), pmc);
        }
    }
    else if (pmc->vtable->base_type == enum_class_Boolean) {
        PIO_eprintf(debugger, "Boolean=PMC(%#p: %d)",
                pmc, PMC_int_val(pmc));
    }
    else if (pmc->vtable->base_type == enum_class_Integer) {
        PIO_eprintf(debugger, "Integer=PMC(%#p: %d)",
                pmc, PMC_int_val(pmc));
    }
    else if (pmc->vtable->base_type == enum_class_BigInt) {
        STRING *s = VTABLE_get_string(interpreter, pmc);
        PIO_eprintf(debugger, "BigInt=PMC(%#p: %Ss)",
                pmc, s);
    }
    else if (pmc->vtable->base_type == enum_class_Complex) {
        STRING *s = VTABLE_get_string(interpreter, pmc);
        PIO_eprintf(debugger, "Complex=PMC(%#p: %Ss)",
                pmc, s);
    }
    else if (pmc->vtable->base_type == enum_class_RetContinuation
            ||  pmc->vtable->base_type == enum_class_Continuation
            ||  pmc->vtable->base_type == enum_class_Sub) {
        PIO_eprintf(debugger, "%S=PMC(%#p pc:%d)",
                VTABLE_name(interpreter, pmc), pmc,
                PMC_sub(pmc)->start_offs);
    }
    else if (PObj_is_object_TEST(pmc)) {
        PIO_eprintf(debugger, "Object(%Ss)=PMC(%#p)",
                VTABLE_name(interpreter, pmc), pmc);
    }
    else if (pmc->vtable->base_type == enum_class_delegate) {
        PIO_eprintf(debugger, "delegate=PMC(%#p)", pmc);
    }
    else {
        PIO_eprintf(debugger, "%S=PMC(%#p)",
                VTABLE_name(interpreter, pmc), pmc);
    }
}

/*

=item C<int
trace_key_dump(Interp *interpreter, PMC *key)>

Prints a key to C<stderr>, returns the length of the output.

=cut

*/

int
trace_key_dump(Interp *interpreter, PMC *key)
{
    Interp * const debugger = interpreter->debugger;

    int len = PIO_eprintf(debugger, "[");

    while (key) {
        switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
        case KEY_integer_FLAG:
            len += PIO_eprintf(debugger, "%vi", PMC_int_val(key));
            break;
        case KEY_number_FLAG:
            len += PIO_eprintf(debugger, "%vg", PMC_num_val(key));
            break;
        case KEY_string_FLAG:
            {
            STRING * const s = PMC_str_val(key);
            STRING* const escaped = string_escape_string_delimited(
                            interpreter, s, 20);
            if (escaped)
                len += PIO_eprintf(debugger, "\"%Ss\"", escaped);
            else
                len += PIO_eprintf(debugger, "\"(null)\"");
            }
            break;
        case KEY_integer_FLAG|KEY_register_FLAG:
            len += PIO_eprintf(debugger, "I%vd=%vd", PMC_int_val(key),
                    REG_INT(PMC_int_val(key)));
            break;
        case KEY_number_FLAG|KEY_register_FLAG:
            len += PIO_eprintf(debugger, "I%vd=%vd", PMC_int_val(key),
                    REG_NUM(PMC_int_val(key)));
            break;
        case KEY_string_FLAG|KEY_register_FLAG:
            {
            STRING * const s = REG_STR(PMC_int_val(key));
            STRING* const escaped = string_escape_string_delimited(
                            interpreter, s, 20);
            if (escaped)
                len += PIO_eprintf(debugger, "S%vd=\"%Ss\"", PMC_int_val(key),
                        escaped);
            else
                len += PIO_eprintf(debugger, "S%vd=\"(null)\"",
                        PMC_int_val(key));
            }
            break;
        case KEY_pmc_FLAG|KEY_register_FLAG:
            len += PIO_eprintf(debugger, "P%vd=", PMC_int_val(key));
            trace_pmc_dump(debugger, REG_PMC(PMC_int_val(key)));
            break;
        default:
            len += PIO_eprintf(debugger, "??");
            key = NULL;
            break;
        }

        if (key) {
            key = PMC_data(key);
            if (key)
                len += PIO_eprintf(debugger, ";");
        }
    } /* while */

    len += PIO_eprintf(debugger, "]");
    return len;
}

/*

=item C<void
trace_op_dump(Interp *interpreter, opcode_t *code_start,
              opcode_t *pc)>

TODO: This isn't really part of the API, but here's its documentation.

Prints the PC, OP and ARGS. Used by C<trace_op()>.

=cut

*/

void
trace_op_dump(Interp *interpreter, opcode_t *code_start,
              opcode_t *pc)
{
    INTVAL i, s, n;
    int more = 0, var_args;
    Interp *debugger = interpreter->debugger;
    op_info_t *info = &interpreter->op_info_table[*pc];
    PMC *sig;
    int type;
    int len;
#define ARGS_COLUMN 40

    assert(debugger);
    sig = NULL; /* silence compiler uninit warning */

    s = 1;
    len = PIO_eprintf(debugger, "%6vu ", (UINTVAL)(pc - code_start));
    if (strcmp(info->name, "infix") == 0) {
        /* this should rather be MMD_opcode_name, which doesn't
         * exit yet
         */
        len += PIO_eprintf(debugger, "%s",
                Parrot_MMD_method_name(interpreter, pc[1]) + 2);
        s = 2;
    }
    else if (strcmp(info->name, "n_infix") == 0) {
        len += PIO_eprintf(debugger, "n_%s",
                Parrot_MMD_method_name(interpreter, pc[1]) + 2);
        s = 2;
    }
    else
        len += PIO_eprintf(debugger, "%s", info->name);

    n = info->op_count;
    var_args = 0;

    if (*pc == PARROT_OP_set_args_pc ||
            *pc == PARROT_OP_get_results_pc ||
            *pc == PARROT_OP_get_params_pc ||
            *pc == PARROT_OP_set_returns_pc) {
        sig = interpreter->code->const_table->constants[pc[1]]->u.key;
        var_args = VTABLE_elements(interpreter, sig);
        n += var_args;
    }

    if (n > 1) {
        len += PIO_eprintf(debugger, " ");
        /* pass 1 print arguments */
        for (i = s; i < n; i++) {
            const opcode_t o = pc[i];
            if (i < info->op_count)
                type = info->types[i - 1];
            else
                type = SIG_ITEM(sig, i - 2) &
                    (PARROT_ARG_TYPE_MASK|PARROT_ARG_CONSTANT);
            if (i > s &&
                    type != PARROT_ARG_KC &&
                    type != PARROT_ARG_KIC &&
                    type != PARROT_ARG_KI &&
                    type != PARROT_ARG_K
               ) {
                len += PIO_eprintf(debugger, ", ");
            }
            switch (type) {
                case PARROT_ARG_IC:
                    len += PIO_eprintf(debugger, "%vd", o);
                    break;
                case PARROT_ARG_NC:
                    len += PIO_eprintf(debugger, "%vg", PCONST(o)->u.number);
                    break;
                case PARROT_ARG_PC:
                    if (var_args)
                        len += PIO_eprintf(debugger, "PC%d (%d)",
                                (int)o, var_args);
                    else
                        len += PIO_eprintf(debugger, "PC%d", (int)o);
                    break;
                case PARROT_ARG_SC:
                    {
                    STRING* const escaped = string_escape_string_delimited(
                            interpreter,
                            PCONST(o)->u.string, 20);
                    if (escaped)
                        len += PIO_eprintf(debugger, "\"%Ss\"", escaped);
                    else
                        len += PIO_eprintf(debugger, "\"(null)\"");
                    }
                    break;
                case PARROT_ARG_KC:
                    len += trace_key_dump(interpreter, PCONST(o)->u.key);
                    break;
                case PARROT_ARG_KIC:
                    len += PIO_eprintf(debugger, "[%vd]", o);
                    break;
                case PARROT_ARG_KI:
                    len += PIO_eprintf(debugger, "[I%vd]", o);
                    more = 1;
                    break;
                case PARROT_ARG_K:
                    len += PIO_eprintf(debugger, "[P%vd]",o);
                    more = 1;
                    break;
                case PARROT_ARG_I:
                    len += PIO_eprintf(debugger, "I%vd", o);
                    more = 1;
                    break;
                case PARROT_ARG_N:
                    len += PIO_eprintf(debugger, "N%vd", o);
                    more = 1;
                    break;
                case PARROT_ARG_P:
                    len += PIO_eprintf(debugger, "P%vd", o);
                    more = 1;
                    break;
                case PARROT_ARG_S:
                    len += PIO_eprintf(debugger, "S%vd", o);
                    more = 1;
                    break;
                default:
                    internal_exception(1, "unhandled type in trace");
                    break;
            }
        }
        if (!more)
            goto done;
        if (len < ARGS_COLUMN)  {
            STRING * const fill = string_repeat(debugger,
                    const_string(debugger, " "),
                    ARGS_COLUMN - len, NULL);
            PIO_putps(debugger, PIO_STDERR(debugger), fill);
        }
        else {
            PIO_eprintf(debugger, "\t");
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
                PIO_eprintf(debugger, " ");
            }
            switch (type) {
                case PARROT_ARG_I:
                    PIO_eprintf(debugger, "I%vd=%vd", o, REG_INT(o));
                    break;
                case PARROT_ARG_N:
                    PIO_eprintf(debugger, "N%vd=%vf", o, REG_NUM(o));
                    break;
                case PARROT_ARG_PC:
                    PIO_eprintf(debugger, "PC%vd=", o);
                    trace_pmc_dump(interpreter, PCONST(o)->u.key);
                    break;
                case PARROT_ARG_P:
                    PIO_eprintf(debugger, "P%vd=", o);
                    trace_pmc_dump(interpreter, REG_PMC(o));
                    break;
                case PARROT_ARG_S:
                    if (REG_STR(o)) {
                        STRING* const escaped = string_escape_string_delimited(
                                interpreter, REG_STR(o), 20);
                        PIO_eprintf(debugger, "S%vd=\"%Ss\"", o,
                                escaped);
                    }
                    else
                        PIO_eprintf(debugger, "S%vd=\"(null)\"", o);
                    break;
                case PARROT_ARG_K:
                    PIO_eprintf(debugger, "P%vd=", o);
                    trace_key_dump(interpreter, REG_PMC(*(pc + i)));
                    break;
                case PARROT_ARG_KI:
                    PIO_eprintf(debugger, "I%vd=[%vd]", o, REG_INT(o));
                    break;
                default:
                    break;
            }
        }
    }
done:
    PIO_eprintf(debugger, "\n");
}

/*

=item C<void
trace_op(Interp *interpreter, opcode_t *code_start,
         opcode_t *code_end, opcode_t *pc)>

TODO: This isn't really part of the API, but here's its documentation.

Prints the PC, OP and ARGS. Used by C<runops_trace()>. With bounds
checking.

=cut

*/

void
trace_op(Interp *interpreter, opcode_t *code_start,
         opcode_t *code_end, opcode_t *pc)
{
    if (!pc) {
        return;
    }

    if (pc >= code_start && pc < code_end) {
        trace_op_dump(interpreter, code_start, pc);
    }
    else if (pc) {
        PIO_eprintf(interpreter, "PC=%ld; OP=<err>\n", (long)(pc - code_start));
    }
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

/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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

#include "parrot/trace.h"

/*

=item C<void
trace_pmc_dump(struct Parrot_Interp *interpreter, PMC* pmc)>

Prints a PMC to C<stderr>.

=cut

*/

void
trace_pmc_dump(struct Parrot_Interp *interpreter, PMC* pmc)
{
    if (pmc && pmc != PMCNULL) {
        if(pmc->vtable) {
            if (pmc->vtable->base_type == enum_class_PerlString) {
                PIO_eprintf(interpreter, "%S=PMC(%#p Str:\"%Ps\")",
                        VTABLE_name(interpreter, pmc), pmc, pmc);
            }
            else if (pmc->vtable->base_type == enum_class_PerlUndef
                 ||  pmc->vtable->base_type == enum_class_PerlInt
                 ||  pmc->vtable->base_type == enum_class_PerlNum) {
                PIO_eprintf(interpreter, "%S=PMC(%#p Num:%Pg Int:%Pd)",
                        VTABLE_name(interpreter, pmc), pmc, pmc, pmc);
            }
            else {
                PIO_eprintf(interpreter, "%S=PMC(%#p)",
                        VTABLE_name(interpreter, pmc), pmc);
            }
        }
        else {
            PIO_eprintf(interpreter, "PMC(NULL)");
        }
    }
    else {
        PIO_eprintf(interpreter, "NULL");
    }
}

/*

=item C<void
trace_key_dump(struct Parrot_Interp *interpreter, PMC *key)>

Prints a key to C<stderr>.

=cut

*/

void
trace_key_dump(struct Parrot_Interp *interpreter, PMC *key)
{
    char *escaped;
    STRING *s;

    PIO_eprintf(interpreter, "[");

    while (key) {
        switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
        case 0:
            break;
        case KEY_integer_FLAG:
            PIO_eprintf(interpreter, "%vi", key->cache.int_val);
            break;
        case KEY_number_FLAG:
            PIO_eprintf(interpreter, "%vg", key->cache.num_val);
            break;
        case KEY_string_FLAG:
            s = key->cache.string_val;
            /* XXX do it w/o degrading to C string */
            escaped = PDB_escape(s->bufstart, s->strlen);
            PIO_eprintf(interpreter, "\"%s\"", escaped?escaped:"(null)");
                if (escaped)
                    mem_sys_free(escaped);
            break;
        case KEY_integer_FLAG|KEY_register_FLAG:
            PIO_eprintf(interpreter, "I%vd=%vd", key->cache.int_val,
                    interpreter->int_reg.registers[key->cache.int_val]);
            break;
        case KEY_number_FLAG|KEY_register_FLAG:
            PIO_eprintf(interpreter, "I%vd=%vd", key->cache.int_val,
                    interpreter->num_reg.registers[key->cache.int_val]);
            break;
        case KEY_string_FLAG|KEY_register_FLAG:
            s = interpreter->string_reg.registers[key->cache.int_val];
            escaped = PDB_escape(s->bufstart, s->strlen);
            PIO_eprintf(interpreter, "S%vd=\"%s\"", key->cache.int_val,
                    escaped ? escaped : "(null");
                if (escaped)
                    mem_sys_free(escaped);
            break;
        case KEY_pmc_FLAG|KEY_register_FLAG:
            PIO_eprintf(interpreter, "P%vd=", key->cache.int_val);
            trace_pmc_dump(interpreter, interpreter->pmc_reg.registers[key->cache.int_val]);
            break;
        default:
            PIO_eprintf(interpreter, "??");
        }

        key = PMC_data(key);

        if (key) PIO_eprintf(interpreter, ";");
    }

    PIO_eprintf(interpreter, "]");
}

/*

=item C<void
trace_op_dump(struct Parrot_Interp *interpreter, opcode_t *code_start,
              opcode_t *pc)>

TODO: This isn't really part of the API, but here's its documentation.

Prints the PC, OP and ARGS. Used by C<trace_op()>.

=cut

*/

void
trace_op_dump(struct Parrot_Interp *interpreter, opcode_t *code_start,
              opcode_t *pc)
{
    INTVAL i;
    char *escaped;

    PIO_eprintf(interpreter, "PC=%vu; OP=%Ou (%s)",
                (UINTVAL)(pc - code_start), *pc,
                interpreter->op_info_table[*pc].full_name);

    if (interpreter->op_info_table[*pc].arg_count > 1) {
        PIO_eprintf(interpreter, "; ARGS=(");
        for (i = 1; i < interpreter->op_info_table[*pc].arg_count; i++) {
            if (i > 1) {
                PIO_eprintf(interpreter, ", ");
            }
            switch (interpreter->op_info_table[*pc].types[i]) {
            case PARROT_ARG_IC:
                PIO_eprintf(interpreter, "%vd", *(pc + i));
                break;
            case PARROT_ARG_NC:
                PIO_eprintf(interpreter, "%vg", interpreter->code->const_table->
                        constants[*(pc + i)]->u.number);
                break;
            case PARROT_ARG_PC:
                /* what does a PMC constant look like? */
                PIO_eprintf(interpreter, "PMCc:%vd", *(pc + i));
                break;
            case PARROT_ARG_SC:
                escaped = PDB_escape(interpreter->code->const_table->
                                     constants[*(pc + i)]->u.string->strstart,
                                     interpreter->code->const_table->
                                     constants[*(pc + i)]->u.string->bufused);
                PIO_eprintf(interpreter, "\"%s\"", escaped ? escaped : "(null)");
                if (escaped)
                    mem_sys_free(escaped);
                break;
            case PARROT_ARG_KC:
                trace_key_dump(interpreter, interpreter->code->const_table->
                        constants[*(pc + i)]->u.key);
                break;
            case PARROT_ARG_KIC:
                PIO_eprintf(interpreter, "[%vd]", *(pc + i));
                break;
            case PARROT_ARG_I:
                PIO_eprintf(interpreter, "I%vd=%vd", *(pc + i),
                        interpreter->int_reg.registers[*(pc + i)]);
                break;
            case PARROT_ARG_N:
                PIO_eprintf(interpreter, "N%vd=%vg", *(pc + i),
                        interpreter->num_reg.registers[*(pc + i)]);
                break;
            case PARROT_ARG_P:
                /* what does a PMC register look like? */
                if (i > 1 || interpreter->op_info_table[*pc].dirs[i] ==
                        PARROT_ARGDIR_IN) {
                    PIO_eprintf(interpreter, "P%vd=", *(pc + i));
                    trace_pmc_dump(interpreter,
                            interpreter->pmc_reg.registers[*(pc + i)]);
                }
                else
                    PIO_eprintf(interpreter, "P%vd=PMC(%#p) ",
                            *(pc + i), REG_PMC(*(pc + i)));
                break;
            case PARROT_ARG_S:
                if (interpreter->string_reg.registers[*(pc + i)]) {
                    escaped = PDB_escape(interpreter->string_reg.
                                         registers[*(pc + i)]->strstart,
                                         interpreter->string_reg.
                                         registers[*(pc + i)]->bufused);
                    PIO_eprintf(interpreter, "S%vd=\"%s\"", *(pc + i),
                            escaped ? escaped : "(null)");
                    if (escaped)
                        mem_sys_free(escaped);
                }
                else {
                    PIO_eprintf(interpreter, "S%vd=(null)", *(pc + i));
                }
                break;
            case PARROT_ARG_K:
                PIO_eprintf(interpreter, "P%vd=", *(pc + i));
                trace_key_dump(interpreter, interpreter->pmc_reg.registers[*(pc + i)]);
                break;
            case PARROT_ARG_KI:
                PIO_eprintf(interpreter, "I%vd=[%vd]", *(pc + i),
                        interpreter->int_reg.registers[*(pc + i)]);
                break;
            case PARROT_ARG_OP:
                /* this isn't handled, so at least report the error
                 * instead of silently ignoring the problem */
                internal_exception(ARG_OP_NOT_HANDLED,
                                   "PARROT_ARG_OP in enumeration not handled in switch");
                break;
            default:
                /* -Wall expects us to cover PARROT_ARG_OP somewhere. */
                PIO_eprintf(interpreter, "?(%i)%vd=???",
                        interpreter->op_info_table[*pc].types[i],
                        *(pc + i));
                break;
            }
        }
        PIO_eprintf(interpreter, ")");
    }
    PIO_eprintf(interpreter, "\n");
}

/*

=item C<void
trace_op(struct Parrot_Interp *interpreter, opcode_t *code_start,
         opcode_t *code_end, opcode_t *pc)>

TODO: This isn't really part of the API, but here's its documentation.

Prints the PC, OP and ARGS. Used by C<runops_trace()>. With bounds
checking.

=cut

*/

void
trace_op(struct Parrot_Interp *interpreter, opcode_t *code_start,
         opcode_t *code_end, opcode_t *pc)
{
    if (!pc) {
        return;
    }

    (void)fflush(NULL);    /* Flush *ALL* output before printing trace info */
    if (pc >= code_start && pc < code_end) {
        trace_op_dump(interpreter, code_start, pc);
    }
    else if (pc) {
        PIO_eprintf(interpreter, "PC=%ld; OP=<err>\n", (long)(pc - code_start));
    }

    /* Flush *stderr* now that we've output the trace info */
    PIO_flush(interpreter, PIO_STDERR(interpreter));
}

/*

=back

=head1 SEE ALSO

F<include/parrot/trace.h>

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

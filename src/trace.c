/* trace.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Tracing support for runops_cores.c.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/trace.h"


/*
 *=for api interpreter dump_pmc
 * Prints a PMC to stderr
 */

void
dump_pmc(struct Parrot_Interp *interpreter, PMC* pmc) {
    if(pmc) {
        if(pmc->vtable) {
            if (pmc->vtable == Parrot_base_vtables + enum_class_PerlString) {
                PIO_eprintf(interpreter, "%S=PMC(%#p Str:\"%PS\")",
                        pmc->vtable->name(interpreter, pmc), pmc, pmc);
            }
            else {
                PIO_eprintf(interpreter, "%S=PMC(%#p Num:%Pg Int:%Pd)",
                        pmc->vtable->name(interpreter, pmc), pmc, pmc, pmc);
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
 *=for api interpreter trace_key_dump
 * Prints a key to stderr.
 */

void
trace_key_dump(struct Parrot_Interp *interpreter, PMC *key)
{
    char *escaped;
    STRING *s;

    PIO_eprintf(interpreter, "[");

    while (key) {
        switch (key->flags & KEY_type_FLAGS) {
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
                    free(escaped);
            break;
        case KEY_integer_FLAG|KEY_register_FLAG:
            PIO_eprintf(interpreter, "I%vd=%vd", key->cache.int_val,
                    interpreter->ctx.int_reg.registers[key->cache.int_val]);
            break;
        case KEY_number_FLAG|KEY_register_FLAG:
            PIO_eprintf(interpreter, "I%vd=%vd", key->cache.int_val,
                    interpreter->ctx.num_reg.registers[key->cache.int_val]);
            break;
        case KEY_string_FLAG|KEY_register_FLAG:
            s = interpreter->ctx.string_reg.registers[key->cache.int_val];
            escaped = PDB_escape(s->bufstart, s->strlen);
            PIO_eprintf(interpreter, "S%vd=\"%s\"", key->cache.int_val,
                    escaped ? escaped : "(null");
                if (escaped)
                    free(escaped);
            break;
        case KEY_pmc_FLAG|KEY_register_FLAG:
            PIO_eprintf(interpreter, "P%vd=", key->cache.int_val);
            dump_pmc(interpreter, interpreter->ctx.pmc_reg.registers[key->cache.int_val]);
            break;
        default:
            PIO_eprintf(interpreter, "??");
        }

        key = key->data;

        if (key) PIO_eprintf(interpreter, ";");
    }

    PIO_eprintf(interpreter, "]");
}

/*
 *=for api interpreter trace_op_dump
 * TODO: This isn't really part of the API, but here's its documentation.
 * Prints the PC, OP and ARGS. Used by trace_op
 */
void
trace_op_dump(struct Parrot_Interp *interpreter, opcode_t *code_start,
              opcode_t *pc)
{
    INTVAL i;
    char *escaped;

    PIO_eprintf(interpreter, "PC=%vu; OP=%Ou (%s)", (UINTVAL)(pc - code_start), *pc,
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
                        constants[*(pc + i)]->number);
                break;
            case PARROT_ARG_PC:
                /* what is a PMC constant look like? */
                PIO_eprintf(interpreter, "PMCc:%vd", *(pc + i));
                break;
            case PARROT_ARG_SC:
                escaped = PDB_escape(interpreter->code->const_table->
                                     constants[*(pc + i)]->string->strstart,
                                     interpreter->code->const_table->
                                     constants[*(pc + i)]->string->bufused);
                PIO_eprintf(interpreter, "\"%s\"", escaped ? escaped : "(null)");
                if (escaped)
                    free(escaped);
                break;
            case PARROT_ARG_KC:
                trace_key_dump(interpreter, interpreter->code->const_table->constants[*(pc + i)]->key);
                break;
            case PARROT_ARG_KIC:
                PIO_eprintf(interpreter, "[%vd]", *(pc + i));
                break;
            case PARROT_ARG_I:
                PIO_eprintf(interpreter, "I%vd=%vd", *(pc + i),
                        interpreter->ctx.int_reg.registers[*(pc + i)]);
                break;
            case PARROT_ARG_N:
                PIO_eprintf(interpreter, "N%vd=%vg", *(pc + i),
                        interpreter->ctx.num_reg.registers[*(pc + i)]);
                break;
            case PARROT_ARG_P:
                /* what does a PMC register look like? */
                if (i > 1) {
                    PIO_eprintf(interpreter, "P%vd=", *(pc + i));
                    dump_pmc(interpreter, interpreter->ctx.pmc_reg.registers[*(pc + i)]);
                }
                else
                    PIO_eprintf(interpreter, "P%vd", *(pc + i));
                break;
            case PARROT_ARG_S:
                if (interpreter->ctx.string_reg.registers[*(pc + i)]) {
                    escaped = PDB_escape(interpreter->ctx.string_reg.
                                         registers[*(pc + i)]->strstart,
                                         interpreter->ctx.string_reg.
                                         registers[*(pc + i)]->bufused);
                    PIO_eprintf(interpreter, "S%vd=\"%s\"", *(pc + i),
                            escaped ? escaped : "(null)");
                    if (escaped)
                        free(escaped);
                }
                else {
                    PIO_eprintf(interpreter, "S%vd=(null)", *(pc + i));
                }
                break;
            case PARROT_ARG_K:
                PIO_eprintf(interpreter, "P%vd=", *(pc + i));
                trace_key_dump(interpreter, interpreter->ctx.pmc_reg.registers[*(pc + i)]);
                break;
            case PARROT_ARG_KI:
                PIO_eprintf(interpreter, "I%vd=[%vd]", *(pc + i),
                        interpreter->ctx.int_reg.registers[*(pc + i)]);
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
 *=for api interpreter trace_op
 * TODO: This isn't really part of the API, but here's its documentation.
 * Prints the PC, OP and ARGS. Used by runops_trace.
 *
 * With bounds checking.
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
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

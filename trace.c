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
 *=for api interpreter trace_key_dump
 * TODO: This isn't really part of the API, but here's its documentation. 
 * Prints a key. Used by trace_op_dump
 */
static
void
trace_key_dump(struct Parrot_Interp *interpreter, PMC *key)
{
    char *escaped;
    STRING *s;

    fprintf(stderr, "[");
                
    while (key) {
        switch (key->flags & KEY_type_FLAGS) {
        case 0:
            break;
        case KEY_integer_FLAG:
            fprintf(stderr, INTVAL_FMT, key->cache.int_val);
            break;
        case KEY_number_FLAG:
            fprintf(stderr, FLOATVAL_FMT, key->cache.num_val);
            break;
        case KEY_string_FLAG:
            s = key->cache.string_val;
            escaped = PDB_escape(s->bufstart, s->strlen);
            fprintf(stderr, "\"%s\"", escaped);
            break;
        case KEY_integer_FLAG|KEY_register_FLAG:
            fprintf(stderr, "I" INTVAL_FMT "=" INTVAL_FMT, key->cache.int_val,
                    interpreter->ctx.int_reg.registers[key->cache.int_val]);
            break;
        case KEY_number_FLAG|KEY_register_FLAG:
            fprintf(stderr, "I" INTVAL_FMT "=" FLOATVAL_FMT, key->cache.int_val,
                    interpreter->ctx.num_reg.registers[key->cache.int_val]);
            break;
        case KEY_string_FLAG|KEY_register_FLAG:
            s = interpreter->ctx.string_reg.registers[key->cache.int_val];
            escaped = PDB_escape(s->bufstart, s->strlen);
            fprintf(stderr, "S" INTVAL_FMT "=\"%s\"", key->cache.int_val, escaped);
            break;
        case KEY_pmc_FLAG|KEY_register_FLAG:
            fprintf(stderr, "P" INTVAL_FMT, key->cache.int_val);
            break;
        default:
            fprintf(stderr, "??");
        }
        
        key = key->data;
        
        if (key) fprintf(stderr, ";");
    }
    
    fprintf(stderr, "]");
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

    fprintf(stderr, "PC=%ld; OP=%ld (%s)", (long)(pc - code_start), *pc,
            interpreter->op_info_table[*pc].full_name);

    if (interpreter->op_info_table[*pc].arg_count > 1) {
        fprintf(stderr, "; ARGS=(");
        for (i = 1; i < interpreter->op_info_table[*pc].arg_count; i++) {
            if (i > 1) {
                fprintf(stderr, ", ");
            }
            switch (interpreter->op_info_table[*pc].types[i]) {
            case PARROT_ARG_IC:
                fprintf(stderr, INTVAL_FMT, *(pc + i));
                break;
            case PARROT_ARG_NC:
                fprintf(stderr, FLOATVAL_FMT, interpreter->code->const_table->
                        constants[*(pc + i)]->number);
                break;
            case PARROT_ARG_PC:
                /* what is a PMC constant look like? */
                fprintf(stderr, INTVAL_FMT, *(pc + i));
                break;
            case PARROT_ARG_SC:
                escaped = PDB_escape(interpreter->code->const_table->
                                     constants[*(pc + i)]->string->strstart,
                                     interpreter->code->const_table->
                                     constants[*(pc + i)]->string->strlen);
                fprintf(stderr, "\"%s\"", escaped);
                break;
            case PARROT_ARG_KC:
                trace_key_dump(interpreter, interpreter->code->const_table->constants[*(pc + i)]->key);
                break;
            case PARROT_ARG_KIC:
                fprintf(stderr, "[" INTVAL_FMT "]", *(pc + i));
                break;
            case PARROT_ARG_I:
                fprintf(stderr, "I" INTVAL_FMT "=" INTVAL_FMT, *(pc + i),
                        interpreter->ctx.int_reg.registers[*(pc + i)]);
                break;
            case PARROT_ARG_N:
                fprintf(stderr, "N" INTVAL_FMT "=" FLOATVAL_FMT, *(pc + i),
                        interpreter->ctx.num_reg.registers[*(pc + i)]);
                break;
            case PARROT_ARG_P:
                /* what does a PMC register look like? */
                fprintf(stderr, "P" INTVAL_FMT "=%p", *(pc + i),
                        interpreter->ctx.pmc_reg.registers[*(pc + i)]);
                break;
            case PARROT_ARG_S:
                if (interpreter->ctx.string_reg.registers[*(pc + i)]) {
                    escaped = PDB_escape(interpreter->ctx.string_reg.
                                         registers[*(pc + i)]->strstart,
                                         interpreter->ctx.string_reg.
                                         registers[*(pc + i)]->strlen);
                    fprintf(stderr, "S" INTVAL_FMT "=\"%s\"", *(pc + i),
                            escaped);
                }
                else {
                    fprintf(stderr, "S" INTVAL_FMT "=(null)", *(pc + i));
                }
                break;
            case PARROT_ARG_K:
                fprintf(stderr, "P" INTVAL_FMT "=", *(pc + i));
                trace_key_dump(interpreter, interpreter->ctx.pmc_reg.registers[*(pc + i)]);
                break;
            case PARROT_ARG_KI:
                fprintf(stderr, "[I" INTVAL_FMT "=" INTVAL_FMT "]", *(pc + i),
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
                fprintf(stderr, "?(%i)" INTVAL_FMT "=???",
                        interpreter->op_info_table[*pc].types[i],
                        *(pc + i));
                break;
            }
        }
        fprintf(stderr, ")");
    }
    fprintf(stderr, "\n");
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
        fprintf(stderr, "PC=%ld; OP=<err>\n", (long)(pc - code_start));
    }

    /* Flush *stderr* now that we've output the trace info */
    (void)fflush(stderr);
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

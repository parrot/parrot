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
 *=for api interpreter trace_op_dump
 * TODO: This isn't really part of the API, but here's its documentation. Prints the PC, OP
 * and ARGS. Used by trace_op
 */
void
trace_op_dump(struct Parrot_Interp *interpreter, opcode_t *code_start, opcode_t *pc) {
    INTVAL i;

    fprintf(stderr, "PC=%ld; OP=%ld (%s)", (long)(pc - code_start), *pc,
        interpreter->opcode_info[*pc].full_name);

    if (interpreter->opcode_info[*pc].arg_count > 1) {
        fprintf(stderr, "; ARGS=(");
        for(i = 1; i < interpreter->opcode_info[*pc].arg_count; i++) {
            if (i > 1) { fprintf(stderr, ", "); }
            switch(interpreter->opcode_info[*pc].types[i]) {
            case PARROT_ARG_IC:
                fprintf(stderr, "%ld", (long) *(pc + i));
                break;
            case PARROT_ARG_NC:
                fprintf(stderr, "%f", interpreter->code->const_table->constants[*(pc + i)]->number);
                break;
            case PARROT_ARG_PC:
                /* what is a PMC constant look like? */
                fprintf(stderr, "%ld", (long) *(pc + i));
                break;
            case PARROT_ARG_SC:
                fprintf(stderr, "\"%s\"", (char*)interpreter->code->const_table->constants[*(pc + i)]->string->bufstart);
                break;
            case PARROT_ARG_I:
                fprintf(stderr, "I%ld=%ld", (long) *(pc + i), (long) interpreter->int_reg->registers[*(pc + i)]);
                break;
            case PARROT_ARG_N:
                fprintf(stderr, "N%ld=%f", (long) *(pc + i), interpreter->num_reg->registers[*(pc + i)]);
                break;
            case PARROT_ARG_P:
                /* what does a PMC constant look like? */
                fprintf(stderr, "P%ld=???", (long) *(pc + i));
                break;
            case PARROT_ARG_S:
                if(interpreter->string_reg->registers[*(pc + i)]) {
                    fprintf(stderr, "S%ld=\"%s\"", (long) *(pc + i), (char*)interpreter->string_reg->registers[*(pc + i)]->bufstart);
                } else {
                    fprintf(stderr, "S%ld=(null)", (long) *(pc + i));
                }
                break;
            }
        }
        fprintf(stderr, ")");
    }
    fprintf(stderr, "\n");
}



/*
 *=for api interpreter trace_op
 * TODO: This isn't really part of the API, but here's its documentation. Prints the PC, OP
 * and ARGS. Used by runops_trace.
 *
 * With bounds checking.
 */
void
trace_op(struct Parrot_Interp *interpreter, opcode_t * code_start, opcode_t * code_end, opcode_t *pc) {

    if (!pc) {
        return;
    }

    (void)fflush(NULL); /* Flush *ALL* output before printing trace info */
    if (pc >= code_start && pc < code_end) {
        trace_op_dump(interpreter, code_start, pc);
    }
    else if (pc) {
        fprintf(stderr, "PC=%ld; OP=<err>\n", (long)(pc - code_start));
    }

    (void)fflush(stderr); /* Flush *stderr* now that we've output the trace info */
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

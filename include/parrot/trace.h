/* trace.h
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

#ifndef PARROT_TRACE_H_GUARD
#define PARROT_TRACE_H_GUARD

#include "parrot/parrot.h"

void
trace_op_dump(struct Parrot_Interp *interpreter, opcode_t *code_start, opcode_t *pc);

void
trace_op(struct Parrot_Interp *interpreter, opcode_t * code_start, opcode_t * code_end, opcode_t *pc);

void
trace_op_b0(struct Parrot_Interp *interpreter, opcode_t * code_start, opcode_t *pc);

void
trace_op_b1(struct Parrot_Interp *interpreter, opcode_t * code_start, opcode_t * code_end, opcode_t *pc);

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

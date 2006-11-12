/* trace.h
 *  Copyright (C) 2001-2003, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Tracing support for runops_cores.c.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_TRACE_H_GUARD)
#define PARROT_TRACE_H_GUARD

#include "parrot/parrot.h"

void
trace_pmc_dump(Interp *interp, PMC* pmc);

int trace_key_dump(Interp *interp, PMC *key);

void trace_op_dump(Interp *interp, opcode_t * code_start,
                   opcode_t * pc);

void trace_op(Interp *interp, opcode_t * code_start,
              opcode_t * code_end, opcode_t * pc);

#endif /* PARROT_TRACE_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

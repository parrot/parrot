/* trace.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
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
trace_pmc_dump(struct Parrot_Interp *interpreter, PMC* pmc);

void trace_key_dump(struct Parrot_Interp *interpreter, PMC *key);

void trace_op_dump(struct Parrot_Interp *interpreter, opcode_t * code_start,
                   opcode_t * pc);

void trace_op(struct Parrot_Interp *interpreter, opcode_t * code_start,
              opcode_t * code_end, opcode_t * pc);

#endif /* PARROT_TRACE_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

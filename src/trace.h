/* trace.h
 *  Copyright (C) 2001-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Tracing support for runops_cores.c.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#pragma once
#ifndef PARROT_TRACE_H_GUARD
#define PARROT_TRACE_H_GUARD

#include "parrot/parrot.h"

void
trace_pmc_dump(Interp *interp, PMC* pmc);

int trace_key_dump(Interp *interp, const PMC *key);

void trace_op_dump(Interp *interp, const opcode_t * code_start, const opcode_t * pc);

void trace_op(Interp *interp, const opcode_t * code_start,
              const opcode_t * code_end, const opcode_t * pc);

#endif /* PARROT_TRACE_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

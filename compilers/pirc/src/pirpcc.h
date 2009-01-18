/*
 * $Id$
 * Copyright (C) 2008, The Perl Foundation.
 */

#ifndef PARROT_PIR_PIRPCC_H_GUARD
#define PARROT_PIR_PIRPCC_H_GUARD

#include "pircompunit.h"
#include "pircompiler.h"

void convert_inv_to_instr(struct lexer_state * const lexer, invocation * const inv);
void generate_parameters_instr(struct lexer_state * const lexer, unsigned num_parameters);
void generate_getresults_instr(struct lexer_state * const lexer, target * const targetlist);
void emit_sub_epilogue(struct lexer_state * const lexer);

#endif /* PARROT_PIR_PIRPCC_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


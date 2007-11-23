/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

#include <stdio.h>
#include "pircompunit.h"

#define out stderr

void
set_sub_outer(struct lexer_state *lexer, char *outersub) {

}

void
set_sub_vtable(struct lexer_state *lexer, char *vtablename) {

}

void
set_sub_flag(struct lexer_state *lexer, int flag) {

}

void
new_sub(struct lexer_state *lexer, char *subname) {
    fprintf(out, ".sub %s\n", subname);
}

void
add_param(struct lexer_state *lexer, int type, char *paramname) {

}

void
set_param_named(struct lexer_state *lexer, char *alias) {

}

void
set_param_flag(struct lexer_state *lexer, int flag) {

}


void
add_arg(struct lexer_state *lexer, void *expr) {

}

void
set_arg_named(struct lexer_state *lexer, char *alias) {

}

void
set_arg_flag(struct lexer_state *lexer, int flag) {

}

void
add_instr(struct lexer_state *lexer, char *label, char *instr) {

}

void
load_library(struct lexer_state *lexer, char *library) {

}

void
declare_local(struct lexer_state *lexer, char *id, int use_unique_reg) {

}

void
new_instr(struct lexer_state *lexer, ...) {

}

void
define_const(struct lexer_state *lexer, void *var, int is_globalconst) {

}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


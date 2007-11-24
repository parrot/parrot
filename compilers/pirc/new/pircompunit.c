/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

/*
  back-end of the pir parser.
  first find out the optimal interface, then start implementing the ast construction stuff.

  this is to make the interface as clean as possible; there'll be probably some
  shuffling around, finding out what is needed.

  Possibly, in the end, some of these functions may become macros (#define'd)
  for speed, but that's not a big deal right now.

 */

#include <stdio.h>
#include "pircompunit.h"
#include "pircompiler.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#define out stderr

void
set_sub_outer(struct lexer_state *lexer, char *outersub) {
    lexer->subs->outer_sub = outersub;
    SET_FLAG(lexer->subs->flags, SUB_FLAG_OUTER);
}

void
set_sub_vtable(struct lexer_state *lexer, char *vtablename) {
    lexer->subs->vtable_method = vtablename;
    SET_FLAG(lexer->subs->flags, SUB_FLAG_VTABLE);
}

void
set_sub_flag(struct lexer_state *lexer, int flag) {
    /* set the specified flag in the current subroutine */
    SET_FLAG(lexer->subs->flags, flag);
}

void
new_sub(struct lexer_state *lexer, char *subname) {
    /* fprintf(out, ".sub %s\n", subname);
    */
    subroutine *newsub = (subroutine *)malloc(sizeof (subroutine));
    assert(newsub != NULL);

    newsub->sub_name = subname;
    newsub->next     = lexer->subs;
    lexer->subs      = newsub;

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


static constant *
new_constant(int type, char *name) {
    constant *c = (constant *)malloc(sizeof (constant));
    assert(c != NULL);
    c->name = name;
    c->type = type;
    return c;
}

constant *
new_nconst(char *name, double val) {
    constant *c = new_constant(NUM_TYPE, name);
    c->val.nval = val;
    return c;
}


constant *
new_iconst(char *name, int val) {
   constant *c = new_constant(INT_TYPE, name);
    c->val.nval = val;
    return c;
}

constant *
new_sconst(char *name, char *val) {
    constant *c = new_constant(STRING_TYPE, name);
    c->val.sval = val;
    return c;
}


constant *
new_pconst(char *name, char *val) {
    constant *c = new_constant(PMC_TYPE, name);
    c->val.pval = val;
    return c;
}


void
define_const(struct lexer_state *lexer, constant *var, int is_globalconst) {

}

void
new_invocation(struct lexer_state *lexer) {

}

void
add_target(struct lexer_state *lexer) {

}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


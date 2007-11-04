/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */
#ifndef PARROT_PIR_LEXER_H_GUARD
#define PARROT_PIR_LEXER_H_GUARD



typedef struct lexer_state {
    constant_table *globaldefinitions;
    int errors;
    int flexdebug;
    char *macro_id;
    int line;
    char *currentfile;

} lexer_state;



#endif /* PARROT_PIR_MACRO_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

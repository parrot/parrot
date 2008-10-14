/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */
#ifndef PARROT_PIR_LEXER_H_GUARD
#define PARROT_PIR_LEXER_H_GUARD



typedef struct lexer_state {
    constant_table *globaldefinitions;        /* symbol table */
    char const     *currentfile;              /* file being processed */
    int             errors;                   /* error counter */
    int             flexdebug;                /* debug flag */
    char const     *macro_id;
    int             id_gen;                   /* generator for unique ids */
    int             unique_id;                /* unique number for generated locals and labels */
    int             num_digits;               /* keep track of number of digits in unique_id */
    FILE           *outfile;
    int             line_defined;

} lexer_state;



#endif /* PARROT_PIR_MACRO_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

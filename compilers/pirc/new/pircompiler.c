/*
 * $Id$
 * Copyright (C) 2008, The Perl Foundation.
 */

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>
#include <stdarg.h>

#include "pircompiler.h"
#include "parrot/parrot.h"

/*

=item C<lexer_state *
new_lexer(char * const filename)>

Constructor for a lexer structure. Initializes all fields, creates
a Parrot interpreter structure.

=cut

*/
lexer_state *
new_lexer(char * const filename) {
    lexer_state *lexer   = (lexer_state *)malloc(sizeof (lexer_state));
    assert(lexer != NULL);

    /* clear all fields */
    memset(lexer, 0, sizeof (lexer_state));

    lexer->filename = filename;
    lexer->interp   = Parrot_new(NULL);

    if (!lexer->interp) {
        fprintf(stderr, "Failed to create a Parrot interpreter structure.\n");
        exit(EXIT_FAILURE);
    }

    return lexer;
}

/*

=item C<void
pirerror(lexer_state * const lexer, char const * const message, ...)>

General error function, if C<yyerror()> is not desirable (not a parse
error) or not possible (if no access to the parser's C<yyscanner> object).

Write an error message to C<stderr> and increment number of errors.

=cut

*/
void
pirerror(lexer_state * const lexer, char const * const message, ...) {
    va_list arg_ptr;

    va_start(arg_ptr, message);
    fprintf(stderr, "Error: ");
    vfprintf(stderr, message, arg_ptr);
    fprintf(stderr, "\n");
    va_end(arg_ptr);

    ++lexer->parse_errors;
}


/*

=back

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


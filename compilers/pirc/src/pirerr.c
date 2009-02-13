/*
 * $Id$
 * Copyright (C) 2008-2009, Parrot Foundation.
 */

#include <stdio.h>
#include <stdarg.h>
#include "pircompiler.h"
#include "pirparser.h"
#include "piryy.h"
#include "pirlexer.h"
#include "pirerr.h"

/*

=head1 FUNCTIONS

=over 4


=item C<void
panic(lexer_state * lexer, char const * const message)>

Function to emit a final last cry that something's wrong and exit.

=cut

*/
void
panic(lexer_state * lexer, char const * const message, ...) {
    va_list arg_ptr;
    fprintf(stderr, "Fatal: ");
    va_start(arg_ptr, message);
    vfprintf(stderr, message, arg_ptr);
    va_end(arg_ptr);
    release_resources(lexer);
    exit(EXIT_FAILURE);
}


/*

=item C<int
yypirerror(yyscan_t yyscanner, lexer_state * const lexer, char const * const message, ...)>

Default parse error handling routine, that is invoked when the bison-generated
parser finds a syntax error.

=cut

*/
PARROT_IGNORABLE_RESULT
int
yypirerror(yyscan_t yyscanner, NOTNULL(lexer_state * const lexer),
        NOTNULL(char const * const message), ...)
{
    char const * const current_token = yypirget_text(yyscanner);
    va_list arg_ptr;

    fprintf(stderr, "\nError in file '%s' (line %d)\n\t", lexer->filename,
            yypirget_lineno(yyscanner));

    va_start(arg_ptr, message);
    vfprintf(stderr, message, arg_ptr);
    va_end(arg_ptr);

    /* print current token if it doesn't contain a newline token. */
    if (!strstr(current_token, "\n"))
        fprintf(stderr, "\n\tcurrent token: '%s'", current_token);

    fprintf(stderr, "\n\n");

    ++lexer->parse_errors;

    return 0;
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




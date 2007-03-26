#include "pirout.h"
#include "pirlexer.h"
#include "pirparser.h"
#include <stdio.h>

/* pirout()
 *
 * Prints the current token from the specified parser.
 * NOT COMPLETE YET, and no fancy output as well...
 */
void
pirout(struct parser_state *p) {
    struct lexer_state *l = get_lexer(p);
    token t = get_token(p);

    switch (t) {
        case T_RPAREN:            /* HACK */
            fprintf(stderr, ")"); /* and print newline as well, nec. for macros */
        case T_NEWLINE:
            fprintf(stderr, "\n");
            break;
        case T_IDENTIFIER:
        case T_PASM_PREG:
        case T_PASM_NREG:
        case T_PASM_IREG:
        case T_PASM_SREG:
        case T_PREG:
        case T_NREG:
        case T_SREG:
        case T_IREG:
            fprintf(stderr, " %s ", get_current_token(l));
            break;
        default:
            fprintf(stderr, "%s ", find_keyword(t));
            break;
    }

}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

#include "pirout.h"
#include "pirlexer.h"
#include "pirparser.h"
#include <stdio.h>
#include <malloc.h>

/*

=head1 API

=over 4

=item pirout()

Prints the current token from the specified parser.
NOT COMPLETE YET, and no fancy output as well...

=cut

*/
static void
pirout(struct parser_state *p) {
    struct lexer_state const *l = get_lexer(p);
    token t = get_token(p);

    /*fprintf(stderr, "pirout:\n");
    */

    switch (t) {
        case T_RPAREN:            /* HACK */
            fprintf(stderr, ")"); /* and print newline as well, nec. for macros */
        case T_NEWLINE:
            fprintf(stderr, "\n");
            break;
        case T_INTEGER_CONSTANT:
        case T_NUMBER_CONSTANT:
        case T_DOUBLE_QUOTED_STRING:
        case T_SINGLE_QUOTED_STRING:
        case T_PARROT_OP:
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

static void
pir_name(struct parser_state *p, char *name) {
    fprintf(stderr, " %s ", name);
}


/*

=item init_pir_vtable()

Creates a vtable for the PIR emitting module, and
then this vtable is set into the parser_state struct.

=cut

*/
pirvtable *
init_pir_vtable(void) {
    pirvtable *vtable = (pirvtable *)malloc(sizeof(pirvtable));

    vtable->sub_start = pirout;
    vtable->sub_end   = pirout;
    vtable->name      = pir_name;

    return vtable;
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

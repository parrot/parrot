#include "pirout.h"
#include "pirlexer.h"
#include "pirparser.h"
#include <stdio.h>
#include <malloc.h>


#define OUT stderr

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
    fprintf(OUT, " %s ", name);
}

static void
pir_sub(struct parser_state *p, char *source, int pos) {
    fprintf(OUT, "#character position %d\n", pos);
    fprintf(OUT, ".sub");
}

static void
pir_end(struct parser_state *p) {
    fprintf(OUT, ".end\n");
}

static void
pir_newline(struct parser_state *p) {
    fprintf(OUT, "\n");
}

static void
pir_param(struct parser_state *p) {
    fprintf(OUT, "\t.param ");
}

static void
pir_type(struct parser_state *p, char *type) {
    fprintf(OUT, "%s", type);
}

static void
pir_subflag(struct parser_state *p, int flag) {
    fprintf(OUT, "%s ", find_keyword(flag));
}

static void
pir_subflagarg(struct parser_state *p, int flag, char *arg) {
    fprintf(OUT, "%s(%s) ", find_keyword(flag), arg);
}

static void
pir_expr(struct parser_state *p, char *expr) {
    fprintf(OUT, "%s ", expr);
}

static void
pir_op(struct parser_state *p, char *op) {
    fprintf(OUT, "%s ", op);
}

static void
pir_comma(struct parser_state *p) {
    fprintf(OUT, ", ");
}

/*

=item init_pir_vtable()

Creates a vtable for the PIR emitting module, and
then this vtable is set into the parser_state struct.

=cut

*/
pirvtable *
init_pir_vtable(void) {
    pirvtable *vtable = new_pirvtable();

    /* override the methods that are needed for PIR output */
    vtable->sub_start    = pir_sub;
    vtable->sub_end      = pir_end;
    vtable->name         = pir_name;
    vtable->stmts_start  = pir_newline;
    vtable->param_start  = pir_param;
    vtable->param_end    = pir_newline;
    vtable->type         = pir_type;
    vtable->sub_flag     = pir_subflag;
    vtable->sub_flag_arg = pir_subflagarg;
    vtable->op_start     = pir_op;
    vtable->op_end       = pir_newline;
    vtable->expression   = pir_expr;
    vtable->next_expr    = pir_comma;

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

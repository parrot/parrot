/*

=head1 NAME

pastout.c - routines for emitting PAST

=head1 STATUS

Initial.

=cut

*/

#include "pastout.h"
#include "pirparser.h"
#include <stdio.h>

/* keep outputfile possibility easy */
#define OUT         stderr
#define INDENT      4

/* this is not threadsafe, fix this later */
static int indent = 0;

/* for easy indenting/dedenting */
#define indent()    indent += INDENT
#define dedent()    indent -= INDENT

/*

=head1 PAST VTABLE ENTRIES

=over 4

=item past_init()

Prints initializing PAST: ["past" => PMC 'PAST::Block' {]

=cut

*/
static void
past_init(struct parser_state *p) {
    fprintf(OUT, "\"past\" => PMC 'PAST::Block'  {\n");
    indent();
}

/*

=item past_block()

Prints PAST for a block, including <source> and <pos> attributes.

=cut

*/
static void
past_block(struct parser_state *p, char *source, int pos) {
    fprintf(OUT, "%*sPMC 'PAST::Block'  {\n", indent, " ");
    indent();
    fprintf(OUT, "%*s<source> => \"%s\"\n", indent, " ", source);
    fprintf(OUT, "%*s<pos> => %d\n", indent, " ", pos);
}

/*

=item past_close()

Close down a PAST entity. The closing brace is printed, and the
indention level is decremented.

=cut

*/
static void
past_close(struct parser_state *p) {
    dedent();
    /* check for indent == 0, if so, then print no space, this is
     * so otherwise a single space is printed.
     */
    fprintf(OUT, "%*s}\n", indent, (indent == 0) ? "" : " ");

}

/*

=item past_name()

Prints a PAST <name> entry.

=cut

*/
static void
past_name(struct parser_state *p, char *name) {
    fprintf(OUT, "%*s<name> => \"%s\"\n", indent, " ", name);
}

/*

=item past_init()

Opens a PAST::Stmts node.

=cut

*/
static void
past_stmts(struct parser_state *p) {
    fprintf(OUT, "%*s[%d] => PMC 'PAST::Stmts'  {\n", indent, " ", 0); /* fix array index */
    indent();
}


static void
past_param(struct parser_state *p) {
    fprintf(OUT, "%*sFIXTHIS => PMC 'PAST::Var'  {\n", indent, " ");
    indent();
    fprintf(OUT, "%*s<scope> => \"parameter\"\n", indent, " ");
}

static void
past_type(struct parser_state *p, char *type) {
    fprintf(OUT, "%*s<type> => \"%s\"\n", indent, " ", type);
}

static void
past_subflag(struct parser_state *p, int flag) {
    /* fprintf(OUT, "%*s<???> => \"%s\"\n", indent, " ", type);
    */
}


static void
past_op(struct parser_state *p, char *op) {
    fprintf(OUT, "%*sFIXME => PMC 'PAST::Op'  {\n", indent, " ");
    indent();
    fprintf(OUT, "%*s<pirop> => \"%s\"\n", indent, " ", op);

}

static void
past_expr(struct parser_state *p, char *expr) {
    fprintf(OUT, "%*s[%d] => \"%s\"\n", indent, " ", 0, expr); /* fix index */
}

static void
past_next(struct parser_state *p) {
    /* increment index */
}


/*

=item init_past_vtable()

Creates a vtable for the PAST emitting module, and
then this vtable is set into the parser_state struct.

=cut

*/
pirvtable *
init_past_vtable(void) {
    pirvtable *vtable = new_pirvtable();

    /* override vtable methods */
    vtable->initialize   = past_init;
    vtable->sub_start    = past_block;
    vtable->sub_end      = past_close;
    vtable->name         = past_name;
    vtable->stmts_start  = past_stmts;
    vtable->stmts_end    = past_close;
    vtable->end          = past_close;
    vtable->param_start  = past_param;
    vtable->param_end    = past_close;
    vtable->type         = past_type;
    vtable->sub_flag     = past_subflag;    
    vtable->op_start     = past_op;
    vtable->expression   = past_expr;
    vtable->op_end       = past_close;
    vtable->next_expr    = past_next;

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

/*

=head1 NAME

jsonout.c - JSON backend for PIRC

=cut

*/
#include "jsonout.h"
#include "pirvtable.h"
#include "pirparser.h"
#include <stdio.h>

#define OUT  stdout

/* todo: re-use this code (see pastout.c) , and make it threadsafe: */
static int indent = 0;

#define indent()    indent += 4
#define dedent()    indent -= 4


static void
json_init(struct parser_state *p) {
    fprintf(OUT, "{\n");
    indent();
}


static void
json_end(struct parser_state *p) {
    dedent();
    fprintf(OUT, "%*s}\n", indent, (indent == 0) ? "" : " ");
}

static void
json_sub_start(struct parser_state *p, char *source, int pos) {
    fprintf(OUT, "%*s'sub' : {\n", indent, " ");
    indent();
    fprintf(OUT, "%*s'source' : '%s',\n", indent, " ", source);
    fprintf(OUT, "%*s'pos' : %d,\n", indent, " ", pos);
}

static void
json_name(struct parser_state *p, char *name) {
    fprintf(OUT, "%*s'name' : '%s'\n", indent, " ", name);
}

static void
json_stmts_start(struct parser_state *p) {
    fprintf(OUT, "%*s'instructions' : [\n", indent, " ");
    indent();
}

static void
json_param_start(struct parser_state *p) {
    fprintf(OUT, "%*s'parameters' : [\n", indent, " ");
    indent();
}

static void
json_sub_flag_start(struct parser_state *p) {
    fprintf(OUT, "%*s'subflags' : [\n", indent, " ");
    indent();
}

static void
json_sub_flag_end(struct parser_state *p) {
    dedent();
    fprintf(OUT, "%*s]\n", indent, " ");
}

static void
json_sub_flag(struct parser_state *p, int flag) {
    fprintf(OUT, "%*s{ 'subflag' : '%s' }\n", indent, " ", "TODO");
}

static void
json_list_start(struct parser_state *p) {
    fprintf(OUT, "%*s[\n", indent, " ");
    indent();
}

static void
json_list_end(struct parser_state *p) {
    dedent();
    fprintf(OUT, "%*s]\n", indent, " ");
}
/*
static void
json_next(struct parser_state *p) {
    fprintf(OUT, ", ");
}
*/


pirvtable *
init_json_vtable(void) {
    pirvtable *vtable = new_pirvtable();

    vtable->initialize     = json_init;
    vtable->sub_start      = json_sub_start;
    vtable->sub_end        = json_end;
    vtable->end            = json_end;
    vtable->stmts_start    = json_stmts_start;
    vtable->stmts_end      = json_list_end;
    vtable->name           = json_name;
    vtable->sub_flag       = json_sub_flag;

    vtable->param_start    = json_param_start;
    vtable->param_end      = json_list_end;
    vtable->sub_flag_start = json_sub_flag_start;
    vtable->sub_flag_end   = json_sub_flag_end;
    vtable->list_start     = json_list_start;
    vtable->list_end       = json_list_end;

    /* vtable->next_expr   = json_next; */

    return vtable;
}


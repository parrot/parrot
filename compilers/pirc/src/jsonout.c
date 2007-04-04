/*

=head1 NAME

jsonout.c - JSON backend for PIRC

=cut

*/
#include "jsonout.h"
#include "pirvtable.h"
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

#define OUT          stdout
#define INDENT       4

/* make it look like a function call */
#define indent(D)    D->indent += INDENT
#define dedent(D)    D->indent -= INDENT


/* Private declaration of emit_data.
 *
 *
 */
typedef struct emit_data {
    FILE *outfile;
    int indent;

} emit_data;


/* Implementation of methods */

static void
json_init(emit_data *data) {
    fprintf(OUT, "{\n");
    indent(data);
}


static void
json_end(emit_data *data) {
    dedent(data);
    fprintf(OUT, "%*s}\n", data->indent, (data->indent == 0) ? "" : " ");
}

static void
json_sub_start(emit_data *data, char *source, int pos) {
    fprintf(OUT, "%*s\"sub\" : {\n", data->indent, " ");
    indent(data);
    fprintf(OUT, "%*s\"source\" : \"%s\",\n", data->indent, " ", source);
    fprintf(OUT, "%*s\"pos\" : %d,\n", data->indent, " ", pos);
}

static void
json_name(emit_data *data, char *name) {
    fprintf(OUT, "%*s\"name\" : \"%s\"\n", data->indent, " ", name);
}

static void
json_stmts_start(emit_data *data) {
    fprintf(OUT, "%*s\"instructions\" : [\n", data->indent, " ");
    indent(data);
}

static void
json_param_start(emit_data *data) {
    fprintf(OUT, "%*s\"parameters\" : [\n", data->indent, " ");
    indent(data);
}

static void
json_sub_flag_start(emit_data *data) {
    fprintf(OUT, "%*s\"subflags\" : [\n", data->indent, " ");
    indent(data);
}

static void
json_sub_flag_end(emit_data *data) {
    dedent(data);
    fprintf(OUT, "%*s]\n", data->indent, " ");
}

static void
json_sub_flag(emit_data *data, int flag) {
    fprintf(OUT, "%*s{ \"subflag\" : \"%s\" }\n", data->indent, " ", "TODO");
}

static void
json_list_start(emit_data *data) {
    fprintf(OUT, "%*s[\n", data->indent, " ");
    indent(data);
}

static void
json_list_end(emit_data *data) {
    dedent(data);
    fprintf(OUT, "%*s]\n", data->indent, " ");
}

static void
json_op_start(emit_data *data, char *op) {
    fprintf(OUT, "%*s{ \"op\" : \"%s\",\n", data->indent, " ", op);
    fprintf(OUT, "%*s\"args\" : [\n", data->indent, " ");
    indent(data);
}

static void
json_op_end(emit_data *data) {
    fprintf(OUT, "%*s]\n", data->indent, " ");
    dedent(data);
    fprintf(OUT, "%*s}\n", data->indent, " ");
}

static void
json_expr(emit_data *data, char *expr) {
    fprintf(OUT, "%*s{ \"expr\" : \"%s\" }\n", data->indent, " ", expr);
}

/*

Destructor for emit_data structure

*/
static void
json_destroy(emit_data *data) {
    free(data);
    data = NULL;
}

/*
static void
json_next(void) {
    fprintf(OUT, ", ");
}
*/


pirvtable *
init_json_vtable(void) {
    pirvtable *vtable = new_pirvtable();

    /* set vtable methods to the appropiate implementation */
    vtable->initialize     = json_init;
    vtable->destroy        = json_destroy;
    vtable->sub_start      = json_sub_start;
    vtable->sub_end        = json_end;
    vtable->end            = json_end;
    vtable->stmts_start    = json_stmts_start;
    vtable->stmts_end      = json_list_end;
    vtable->name           = json_name;
    vtable->sub_flag       = json_sub_flag;
    vtable->op_start       = json_op_start;
    vtable->op_end         = json_op_end;
    vtable->param_start    = json_param_start;
    vtable->param_end      = json_list_end;
    vtable->sub_flag_start = json_sub_flag_start;
    vtable->sub_flag_end   = json_sub_flag_end;
    vtable->list_start     = json_list_start;
    vtable->list_end       = json_list_end;
    vtable->expression     = json_expr;


    vtable->data = (emit_data *)malloc(sizeof(emit_data));
    if (vtable->data == NULL) {
        fprintf(stderr, "Failed to allocate memory for vtable data\n");
        exit(1);
    }
    vtable->data->indent = 0;

    /* vtable->next_expr   = json_next; */

    return vtable;
}


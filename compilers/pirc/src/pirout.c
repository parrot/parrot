/*

=head1 NAME

pirout.c - Back-end for outputting PIR.

=cut

*/
#include "pirout.h"
#include "pirvtable.h"
#include "pirlexer.h"
#include <stdio.h>
#include <malloc.h>
#include <malloc.h>
#include <stdlib.h>


/* Private declaration of emit_data.
 *
 *
 */
typedef struct emit_data {
    int indent;

} emit_data;

#define OUT stderr

/*

=head1 API

=cut

*/

static void
pir_name(struct emit_data *data, char *name) {
    fprintf(OUT, " %s ", name);
}

static void
pir_sub(struct emit_data *data) {
    fprintf(OUT, ".sub");
}

static void
pir_end(struct emit_data *data) {
    fprintf(OUT, ".end\n");
}

static void
pir_newline(struct emit_data *data) {
    fprintf(OUT, "\n");
}

static void
pir_param(struct emit_data *data) {
    fprintf(OUT, "  .param ");
}

static void
pir_type(struct emit_data *data, char *type) {
    fprintf(OUT, "%s", type);
}

static void
pir_sub_flag(struct emit_data *data, int flag) {
    fprintf(OUT, "%s ", find_keyword(flag));
}

static void
pir_expr(struct emit_data *data, char *expr) {
    fprintf(OUT, "%s ", expr);
}

static void
pir_op(struct emit_data *data, char *op) {
    fprintf(OUT, "  %s ", op);
}


static void
pir_list_start(struct emit_data *data) {
    fprintf(OUT, "(");
}

static void
pir_list_end(struct emit_data *data) {
    fprintf(OUT, ")");
}

static void
pir_sub_flag_start(struct emit_data *data) {
    fprintf(OUT, "");
}


static void
pir_sub_flag_end(struct emit_data *data) {
    fprintf(OUT, "\n");
}

static void
pir_destroy(emit_data *data) {
    free(data);
    data = NULL;
}

static void
pir_begin_return(emit_data *data) {
    fprintf(OUT, " ");
}

/*

=over 4

=item init_pir_vtable()

Creates a vtable for the PIR emitting module, and
then this vtable is set into the parser_state struct.

=cut

*/
struct pirvtable *
init_pir_vtable(void) {
    pirvtable *vtable = new_pirvtable();

    /* override the methods that are needed for PIR output */
    vtable->destroy        = pir_destroy;
    vtable->sub_start      = pir_sub;
    vtable->sub_end        = pir_end;
    vtable->name           = pir_name;
    vtable->stmts_start    = pir_newline;
    vtable->param_start    = pir_param;
    vtable->param_end      = pir_newline;
    vtable->type           = pir_type;
    vtable->sub_flag       = pir_sub_flag;
    vtable->op_start       = pir_op;
    vtable->op_end         = pir_newline;
    vtable->expression     = pir_expr;
    vtable->list_start     = pir_list_start;
    vtable->list_end       = pir_list_end;
    vtable->sub_flag_start = pir_sub_flag_start;
    vtable->sub_flag_end   = pir_sub_flag_end;

    vtable->data = (emit_data *)malloc(sizeof(emit_data));
    if (vtable->data == NULL) {
        fprintf(stderr, "Failed to allocate memory for vtable data\n");
        exit(1);
    }
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

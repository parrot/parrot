/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

/*

=head1 NAME

pirout.c - Back-end for outputting PIR.

=cut

*/
#include "pirout.h"
#include "pirutil.h"
#include "pirvtable.h"
#include "pirlexer.h"
#include <stdio.h>
#include <stdlib.h>



typedef struct target {
    char *name;
    struct target *next;

} target;

/* Private declaration of emit_data.
 *
 *
 */
typedef struct emit_data {
    char *outputfile;
    FILE *file;
    int need_comma;
    target *targets;

} emit_data;


#define print_comma(D)  fprintf(data->file, ", ")

/*

=over 4

=item C<static target * new_target(char *name)>

RT#48260: Not yet documented!!!

=cut

*/
static target *
new_target(char *name)
{
    target *t = (target *)malloc(sizeof (target));
    t->name = clone_string(name);
    t->next = NULL;
    return t;
}

/*

=item C<static void add_target(emit_data *data, target *t)>

RT#48260: Not yet documented!!!

=back

=cut

*/

static void
add_target(emit_data *data, target *t)
{
    t->next = data->targets;
    data->targets = t;
}

/*

=head1 API

=over 4

=cut

*/

/*

=item C<static void
pir_name(struct emit_data *data, char *name)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_name(struct emit_data *data, char *name)
{
    if (data->need_comma) print_comma(data);
    fprintf(data->file, "%s", name);
    data->need_comma = 1;
}

/*

=item C<static void
pir_sub(struct emit_data *data)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_sub(struct emit_data *data)
{
    fprintf(data->file, "\n.sub ");
    data->need_comma = 0;
}

/*

=item C<static void
pir_end(struct emit_data *data)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_end(struct emit_data *data)
{
    fprintf(data->file, ".end\n");
    data->need_comma = 0;
}

/*

=item C<static void
pir_newline(struct emit_data *data)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_newline(struct emit_data *data)
{
    fprintf(data->file, "\n");
}

/*

=item C<static void
pir_param(struct emit_data *data)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_param(struct emit_data *data)
{
    fprintf(data->file, "  .param ");
}

/*

=item C<static void
pir_type(struct emit_data *data, char *type)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_type(struct emit_data *data, char *type)
{
    fprintf(data->file, "%s ", type);
    data->need_comma = 0;
}

/*

=item C<static void
pir_sub_flag(struct emit_data *data, int flag)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_sub_flag(struct emit_data *data, int flag)
{
    fprintf(data->file, "%s ", find_keyword(flag));
}

/*

=item C<static void
pir_expr(struct emit_data *data, char *expr)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_expr(struct emit_data *data, char *expr)
{
    fprintf(data->file, "%s ", expr);
}

/*

=item C<static void
pir_op(struct emit_data *data, char *op)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_op(struct emit_data *data, char *op)
{
    fprintf(data->file, "  %s ", op);
    data->need_comma = 0;
}


/*

=item C<static void
pir_list_start(struct emit_data *data)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_list_start(struct emit_data *data)
{
    fprintf(data->file, "(");
    data->need_comma = 0;
}

/*

=item C<static void
pir_list_end(struct emit_data *data)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_list_end(struct emit_data *data)
{
    fprintf(data->file, ")");
    data->need_comma = 0;
}

/*

=item C<static void
pir_sub_flag_start(struct emit_data *data)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_sub_flag_start(struct emit_data *data)
{
    fprintf(data->file, "");
}


/*

=item C<static void
pir_sub_flag_end(struct emit_data *data)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_sub_flag_end(struct emit_data *data)
{
    fprintf(data->file, "\n");
}

/*

=item C<static void
pir_destroy(emit_data *data)>

Close the output file, free the emit_data structure.

=cut

*/

static void
pir_destroy(emit_data *data)
{
    if (data->outputfile) fclose(data->file);
    free(data);
    data = NULL;
}

/*

=item C<static void
pir_target(emit_data *data, char *target)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_target(emit_data *data, char *target)
{
    add_target(data, new_target(target));
}

/*

=item C<static void
pir_begin_return(emit_data *data)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_begin_return(emit_data *data)
{
    fprintf(data->file, " ");
}

/*

=item C<static void
pir_init(emit_data *data)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_init(emit_data *data)
{
    if (data->outputfile) data->file = open_file(data->outputfile, "w");
    else data->file = stdout;
}

/*

=item C<static void
print_target(emit_data *data, target *t)>

print the list of targets stored in emit_data. This is done recursively,
and from the end of the list to the front. This is because the items are
added at the front, and the order need to be restored. This also allows
for freeing any resources.

=cut

*/

static void
print_target(emit_data *data, target *t)
{
    if (t->next) print_target(data, t->next);
    fprintf(data->file, "%s", t->name);

    /* name was a cloned string, free it again! */
    /*
    free(t->name);
    t->name = NULL;
    */

}

/*

=item C<static void
pir_assign(emit_data *data)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_assign(emit_data *data)
{
    target *t = data->targets;
    /* XXX does not work correctly yet.
    print_target(data, t);
    */
    fprintf(data->file, " = ");
}

/*

=item C<static void
pir_assign_start(emit_data *data)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_assign_start(emit_data *data)
{
    fprintf(data->file, "  ");
}

/*

=item C<static void
pir_assign_end(emit_data *data)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_assign_end(emit_data *data)
{
    fprintf(data->file, "\n");
}

/*

=item C<static void
pir_comp_op(emit_data *data, char *op)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_comp_op(emit_data *data, char *op)
{
    fprintf(data->file, " %s ", op);
}

/*

=item C<static void
pir_bin_op(emit_data *data, char *op)>

RT#48260: Not yet documented!!!

=cut

*/

static void
pir_bin_op(emit_data *data, char *op)
{
    fprintf(data->file, " %s ", op);
}

/*

=item C<struct pirvtable * init_pir_vtable(char *outputfile)>

Creates a vtable for the PIR emitting module, and
then this vtable is set into the parser_state struct.

=cut

*/
struct pirvtable *
init_pir_vtable(char *outputfile)
{

    pirvtable *vtable = new_pirvtable();

    /* override the methods that are needed for PIR output */
    vtable->initialize     = pir_init;
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
    vtable->assign         = pir_assign;
    vtable->assign_start   = pir_assign_start;
    vtable->assign_end     = pir_assign_end;
    vtable->target         = pir_target;

    vtable->binary_op      = pir_bin_op;
    vtable->comparison_op  = pir_comp_op;

    vtable->data = (emit_data *)malloc(sizeof (emit_data));
    if (vtable->data == NULL) {
        fprintf(stderr, "Failed to allocate memory for vtable data\n");
        exit(EXIT_FAILURE);
    }

    vtable->data->outputfile = outputfile;
    vtable->data->targets = NULL;

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

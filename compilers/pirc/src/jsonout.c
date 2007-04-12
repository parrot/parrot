/*

=head1 NAME

jsonout.c - JSON backend for PIRC

=head1 DESCRIPTION

Each vtable method is implemented by a private (static) function.
This back-end emits a JSON representation of the source. Although JSON
is quite a simple format, it is not very trivial to emit it. Due to some
householding code, it isn't very straightforward (indention and commas).
Some refactoring would be in order, once this back-end is finished.

=cut

*/
#include "jsonout.h"
#include "pirvtable.h"
#include "pirutil.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>



static const int INDENT = 4;


#define print_comma(D)  fprintf(data->file, "%*s,\n", data->indent, " ");




/*

=head1 JSON BACK END INTERNALS



=cut


Structure target holds names of C<target>s so they can be emitted later.
This is necessary in cases like: "(a,b,c) = foo(1,2,3)", where a, b and c
are targets. This might prove not to be necessary later, as I haven't thought
out this back-end completely. It's a bit of trial and error, how to fill in
the vtable methods efficiently.

*/
typedef struct target {
    char *name;
    struct target *next;

} target;

/* Private declaration of emit_data.
 *
 *
 */
typedef struct emit_data {
    /* output file */
    FILE *file;
    char *outputfile;

    int indent; /* keep track of indention */
    /* has the first item in a list already been emitted? If so, we need a comma as separator */
    int need_comma;

    struct target *targets; /* list of targets for temp. storage */

} emit_data;


/*

=head1 HELPER METHODS

=over 4

=cut

*/

/* increase the indention level */
static int
indent(emit_data *data) {
    data->indent += INDENT;
    return data->indent;
}

/* decreate the indention level */
static int
dedent(emit_data *data) {
    data->indent -= INDENT;
    return data->indent;
}


/*

=item new_target()

=cut

*/
static target *
new_target(char *name) {
    target *t = (target *)malloc(sizeof(target));
    t->name = name;
    t->next = NULL;
    return t;
}

/*

=item add_target()

=cut

*/

static void
add_target(emit_data *data, target *t) {
    t->next = data->targets;
    data->targets = t;
}

/*

=back

=head1 VTABLE METHODS

=over 4

=cut

*/

static void
json_start_object(emit_data *data) {
    fprintf(data->file, "%*s{\n", data->indent, data->indent ? " " : "");
    indent(data);
}

static void
json_init(emit_data *data) {
    if (data->outputfile) data->file = open_file(data->outputfile, "w");
    else data->file = stdout;

    fprintf(data->file, "{\n");
    indent(data);
}


static void
json_end(emit_data *data) {
    dedent(data);
    fprintf(data->file, "%*s}\n", data->indent, (data->indent == 0) ? "" : " ");
}

static void
json_sub_start(emit_data *data) {
    if (data->need_comma) print_comma(data);
    fprintf(data->file, "%*s{ \"sub\" :\n", data->indent, " ");
    indent(data);

    fprintf(data->file, "%*s{\n", data->indent, " ");
    indent(data);
}

static void
json_source(emit_data *data, char *source) {
    fprintf(data->file, "%*s{ \"source\" : \"%s\" },\n", data->indent, " ", source);
}

static void
json_position(emit_data *data, int pos) {
    fprintf(data->file, "%*s{ \"pos\" : %d },\n", data->indent, " ", pos);
}

static void
json_sub_end(emit_data *data) {
    dedent(data);
    fprintf(data->file, "%*s}\n", data->indent, " ");

    dedent(data);
    fprintf(data->file, "%*s}\n", data->indent, " ");
    data->need_comma = 1;
}

static void
json_name(emit_data *data, char *name) {
    fprintf(data->file, "%*s{ \"name\" : \"%s\" }\n", data->indent, " ", name);
    data->need_comma = 1;

}

static void
json_stmts_start(emit_data *data) {
    fprintf(data->file, "%*s{ \"instructions\" :\n", data->indent, " ");
    indent(data);
    fprintf(data->file, "%*s[\n", data->indent, " ");
    indent(data);
    data->need_comma = 0;
}

static void
json_param_start(emit_data *data) {
    fprintf(data->file, "%*s{ \"parameters\" :\n", data->indent, " ");
    indent(data);
    fprintf(data->file, "%*s[\n", data->indent, " ");
    indent(data);
    data->need_comma = 0;
}

static void
json_sub_flag_start(emit_data *data) {
    if (data->need_comma) print_comma(data);
    fprintf(data->file, "%*s{ \"subflags\" :\n", data->indent, " ");
    indent(data);
    fprintf(data->file, "%*s[\n", data->indent, " ");
    indent(data);
    data->need_comma = 0;
}

static void
json_sub_flag_end(emit_data *data) {
    dedent(data);
    fprintf(data->file, "%*s]\n", data->indent, " ");
    dedent(data);
    fprintf(data->file, "%*s},\n", data->indent, " ");
}

static void
json_sub_flag(emit_data *data, int flag) {
    if (data->need_comma) print_comma(data);
    fprintf(data->file, "%*s{ \"subflag\" : \"%s\" }\n", data->indent, " ", "TODO");
}

static void
json_list_start(emit_data *data) {
    fprintf(data->file, "%*s[", data->indent, " ");
    indent(data);
    data->need_comma = 0;
}

static void
json_list_end(emit_data *data) {
    dedent(data);
    fprintf(data->file, "%*s]\n", data->indent, " ");
}

static void
json_stmts_end(emit_data *data) {
    dedent(data);
    fprintf(data->file, "%*s]\n", data->indent, " ");
    dedent(data);
    fprintf(data->file, "%*s}\n", data->indent, " ");
}

static void
json_op_start(emit_data *data, char *op) {
    if (data->need_comma) print_comma(data);
    fprintf(data->file, "%*s{ \"op\" : \"%s\" },\n", data->indent, " ", op);
    fprintf(data->file, "%*s{ \"operands\" :\n", data->indent, " ");
    indent(data);
    fprintf(data->file, "%*s[\n", data->indent, " ");
    indent(data);
}

static void
json_op_end(emit_data *data) {
    dedent(data);
    fprintf(data->file, "%*s]\n", data->indent, " ");
    dedent(data);
    fprintf(data->file, "%*s}\n", data->indent, " ");

}

static void
json_expr(emit_data *data, char *expr) {
    if (data->need_comma) print_comma(data);
    fprintf(data->file, "%*s{ \"expr\" : \"%s\" }\n", data->indent, " ", expr);
    data->need_comma = 1;
}




static void
json_method(emit_data *data, char *name) {
    fprintf(data->file, "%*s{ \"method\" : \"%s\" }\n", data->indent, " ", name);
}

static void
json_invocant(emit_data *data, char *invocant) {
    fprintf(data->file, "%*s{ \"invocant\" : \"%s\" }\n", data->indent, " ", invocant);
}

static void
json_args_start(emit_data *data) {
    fprintf(data->file, "%*s{ \"arguments\" :\n", data->indent, " ");
    indent(data);
    fprintf(data->file, "%*s[\n", data->indent, " ");
    indent(data);
}

static void
json_args_end(emit_data *data) {
    dedent(data);
    fprintf(data->file, "%*s]\n", data->indent, " ");
    dedent(data);
    fprintf(data->file, "%*s}\n", data->indent, " ");
}


static void
json_target(emit_data *data, char *name) {
    target *t = new_target(name);
    add_target(data, t);
}



static void
json_invokable(emit_data *data, char *invokable) {
    fprintf(data->file, "%*s{ \"invokable\" : \"%s\" }\n", data->indent, " ", invokable);
}

static void
json_invocation_start(emit_data *data) {
    fprintf(data->file, "%*s{ \"invocation\" :\n%*s{\n", data->indent, " ", data->indent, " ");
    indent(data);
}

static void
json_invocation_end(emit_data *data) {
    dedent(data);
    fprintf(data->file, "%*s}\n", data->indent, " ");
}


/*

=item json_destroy()

Destructor for emit_data structure

=cut

*/
static void
json_destroy(emit_data *data) {
    if (data->outputfile) fclose(data->file);
    free(data);
    data = NULL;
}

/*

=item init_json_vtable()

Initializes a vtable for the JSON back-end. Each of the vtable method slots is
assigned a function address that implements that method.

=cut

*/
pirvtable *
init_json_vtable(char *outputfile) {
    pirvtable *vtable = new_pirvtable();

    /* set vtable methods to the appropiate implementation */
    vtable->initialize       = json_init;
    vtable->destroy          = json_destroy;
    vtable->source           = json_source;
    vtable->position         = json_position;
    vtable->sub_start        = json_sub_start;
    vtable->sub_end          = json_sub_end;
    vtable->end              = json_end;
    vtable->stmts_start      = json_stmts_start;
    vtable->stmts_end        = json_stmts_end;
    vtable->name             = json_name;
    vtable->sub_flag         = json_sub_flag;
    vtable->op_start         = json_op_start;
    vtable->op_end           = json_op_end;
    vtable->param_start      = json_param_start;
    vtable->param_end        = json_stmts_end;
    vtable->sub_flag_start   = json_sub_flag_start;
    vtable->sub_flag_end     = json_sub_flag_end;
    vtable->list_start       = json_list_start;
    vtable->list_end         = json_list_end;
    vtable->expression       = json_expr;
    vtable->invocant         = json_invocant;
    vtable->method_name      = json_method;
    vtable->args_start       = json_args_start;
    vtable->args_end         = json_args_end;
    vtable->target           = json_target;
    vtable->invokable        = json_invokable;
    vtable->invocation_start = json_invocation_start;
    vtable->invocation_end   = json_invocation_end;

    vtable->data = (emit_data *)malloc(sizeof(emit_data));
    if (vtable->data == NULL) {
        fprintf(stderr, "Failed to allocate memory for vtable data\n");
        exit(1);
    }
    vtable->data->indent = 0;
    vtable->data->outputfile = outputfile;



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

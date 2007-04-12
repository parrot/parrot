/*

=head1 NAME

pirvtable.c - implementation of a vtable, that is used by the parser for its semantic actions.

=head1 DESCRIPTION

Using a vtable makes changing the behaviour of the parser easy. The parser calls vtable methods
at certain points, for instance at the start of a subroutine and at the end. Depending on the
type of output that is expected, the appropiate function is invoked. Any output type should
implement all vtable methods for correct behaviour.

=cut

*/
#include "pirvtable.h"
#include <stdlib.h>
#include <stdio.h>



/*

=head1 HELPER METHODS

=over 4

=item not_implemented()

Default entry that is set to all vtable entries. If a particular vtable entry is invoked,
but was never implemented, this method is called. This is usefulS, because not all output
type need all vtable methods. The variable arguments are necessary, you never know how
many args a method has.

=cut

*/
static void
not_implemented(struct emit_data *data, ...) {
    /* do nothing */
}

/*

=back

=head1 PIRVTABLE API

=over 4

=item new_pirvtable()

Constructor for a pir vtable. All entries are set to "not_implemented" function.

=cut

*/
pirvtable *
new_pirvtable(void) {

    pirvtable *vtable = (pirvtable *)malloc(sizeof(pirvtable));

    if (vtable == NULL) {
        fprintf(stderr, "Failed to allocate memory for vtable!\n");
        exit(1);
    }

    /* set all entries to 'default' by default. This way, another output module
     * only needs to override the entries that are interesting for that module.
     */
    vtable->initialize       = not_implemented;
    vtable->destroy          = not_implemented; /* destructor; highly recommended to implement! */
    vtable->source           = not_implemented;
    vtable->position         = not_implemented;
    vtable->name             = not_implemented;
    vtable->sub_start        = not_implemented;
    vtable->sub_end          = not_implemented;
    vtable->stmts_start      = not_implemented;
    vtable->stmts_end        = not_implemented;
    vtable->end              = not_implemented;
    vtable->param_start      = not_implemented;
    vtable->param_end        = not_implemented;
    vtable->type             = not_implemented;
    vtable->sub_flag         = not_implemented;
    vtable->expression       = not_implemented;
    vtable->op_start         = not_implemented;
    vtable->op_end           = not_implemented;
    vtable->list_start       = not_implemented;
    vtable->list_end         = not_implemented;
    vtable->sub_flag_start   = not_implemented;
    vtable->sub_flag_end     = not_implemented;
    vtable->method_name      = not_implemented;
    vtable->invocant         = not_implemented;
    vtable->args_start       = not_implemented;
    vtable->args_end         = not_implemented;
    vtable->target           = not_implemented;
    vtable->invokable        = not_implemented;
    vtable->invocation_start = not_implemented;
    vtable->invocation_end   = not_implemented;
    vtable->assign_start     = not_implemented;
    vtable->assign_end       = not_implemented;
    vtable->assign           = not_implemented;
    vtable->comparison_op    = not_implemented;
    vtable->binary_op        = not_implemented;
    vtable->results_start    = not_implemented;
    vtable->results_end      = not_implemented;

    /* set data to NULL, it's initialized in the backend module */
    vtable->data = NULL;

    return vtable;
}

/*

=item destroy_pirvtable()

Destructor for the pirvtable. It first calls the custome destructor
of the emit_data structure, which is private to each of the back-ends
(so we don't know what memory is allocated for that, only the back-ends
know).

=cut

*/
void
destroy_pirvtable(pirvtable *vtable) {
    /* call custom destructor of the backend */
    (*vtable->destroy)(vtable->data);
    /* free the vtable memory */
    free(vtable);
    vtable = NULL;
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


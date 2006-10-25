/*
Copyright (C) 2001-2006, The Perl Foundation.
$Id$

=head1 NAME

src/exit.c - Exit Handling

=head1 DESCRIPTION

Parrot's version of C<exit()>, C<on_exit()>, and friends.

C<Parrot_on_exit()> allows you register exit handlers which will be
called by C<Parrot_exit()> when the interpreter exits.

=head2 Functions

=over 4

=cut

*/

#include <stdlib.h>

#include <parrot/parrot.h>

/*

=item C<int Parrot_on_exit(Interp *, exit_handler_f func, void *arg)>

Register the specified function to be called on exit.

=cut

*/

int
Parrot_on_exit(Interp *interp, exit_handler_f function, void *arg) {
    /* XXX  we might want locking around the list access.   I'm sure this
     * will be the least of the threading issues. */

    handler_node_t* const new_node = mem_sys_allocate(sizeof(handler_node_t));

    new_node->function = function;
    new_node->arg = arg;
    new_node->next = interp->exit_handler_list;
    interp->exit_handler_list = new_node;
    return 0;
}

/*

=item C<void Parrot_exit(int status)>

Exit, calling any registered exit handlers.

=cut

*/

void
Parrot_exit(Interp *interp, int status) {
    handler_node_t * next, *node;
    /* call all the exit handlers */

    /* we are well "below" the runloop now, where lo_var_ptr
     * is set usually - exit handlers may run some resource-hungry
     * stuff like printing profile stats - a DOD run would kill
     * resources - TODO reset stacktop or better disable GC
     */
    node = interp->exit_handler_list;
    /*
     * we don't allow new exit_handlers being installed inside exit handlers
     * - do we?
     * and: interp->exit_handler_list is gone, after the last exit handler
     *      (Parrot_really_destroy) has run
     */
    while (node) {
        next = node->next;
        (node->function)(interp, status, node->arg);
        mem_sys_free(node);
        node = next;
    }

    exit(status);
}

/*

=back

=head1 SEE ALSO

F<include/parrot/exit.h> and F<t/src/exit.t>.

=head1 HISTORY

Initial version by Josh Wilmes.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

/*
Copyright (C) 2001-2007, The Perl Foundation.
$Id$

=head1 NAME

src/exit.c - Exit Handling

=head1 DESCRIPTION

Parrot's version of C<exit()>, C<on_exit()>, and friends.

C<Parrot_on_exit()> allows you register exit handlers which will be
called by C<Parrot_exit()> when the interpreter exits.

=head2 Functions

*/

#include <stdlib.h>
#include "parrot/parrot.h"

/* HEADERIZER TARGET: include/parrot/exit.h */

/*

FUNCDOC: Parrot_on_exit

Register the specified function to be called on exit.

*/

PARROT_API
int
Parrot_on_exit(Interp *interp /*NN*/, exit_handler_f function /*NN*/, void *arg)
{
    /* XXX  we might want locking around the list access.   I'm sure this
     * will be the least of the threading issues. */

    handler_node_t* const new_node = mem_allocate_typed(handler_node_t);

    new_node->function = function;
    new_node->arg = arg;
    new_node->next = interp->exit_handler_list;
    interp->exit_handler_list = new_node;
    return 0;
}

/*

FUNCDOC: Parrot_exit

Exit, calling any registered exit handlers.

*/

PARROT_API
void
Parrot_exit(Interp *interp /*NN*/, int status)
    /* NORETURN */
{
    /* call all the exit handlers */
    /* we are well "below" the runloop now, where lo_var_ptr
     * is set usually - exit handlers may run some resource-hungry
     * stuff like printing profile stats - a DOD run would kill
     * resources - TODO reset stacktop or better disable GC
     */
    /*
     * we don't allow new exit_handlers being installed inside exit handlers
     * - do we?
     * and: interp->exit_handler_list is gone, after the last exit handler
     *      (Parrot_really_destroy) has run
     */
    handler_node_t *node = interp->exit_handler_list;
    while (node) {
        handler_node_t * const next = node->next;

        (node->function)(interp, status, node->arg);
        mem_sys_free(node);
        node = next;
    }

    exit(status);
}

/*

=head1 SEE ALSO

F<include/parrot/exit.h> and F<t/src/exit.t>.

=head1 HISTORY

Initial version by Josh Wilmes.

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

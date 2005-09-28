/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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

typedef struct _handler_node_t {
    void (*function)(int , void *);
    void *arg;
    struct _handler_node_t *next;
} handler_node_t;


static handler_node_t *exit_handler_list;


/*

=item C<int Parrot_on_exit(void (*function)(int , void *), void *arg)>

Register the specified function to be called on exit.

=cut

*/

int
Parrot_on_exit(void (*function)(int , void *), void *arg) {
    /* XXX  we might want locking around the list access.   I'm sure this
     * will be the least of the threading issues. */

    handler_node_t* new_node = mem_sys_allocate(sizeof(handler_node_t));
    new_node->function = function;
    new_node->arg = arg;
    new_node->next = exit_handler_list;
    exit_handler_list = new_node;
    return 0;
}

/*

=item C<void Parrot_exit(int status)>

Exit, calling any registered exit handlers.

=cut

*/

void Parrot_exit(int status) {
    /* call all the exit handlers */

    /* Must write the loop this way to protect against an exit handler calling
       exit and re-entering this function. */

    /* we are well "below" the runloop now, where lo_var_ptr
     * is set usually - exit handlers may run some resource-hungry
     * stuff like printing profile stats - a DOD run would kill
     * resources - reset stacktop
     *
     * ARGH  --leo: this damned function doesn't have an interpreter arg
     * XXX FIXME - API
     *
     * XXX FIXME - and what about multiple interpreters - the first exit
     *             call would run all exit handlers
     */
    while (exit_handler_list) {
        handler_node_t *node = exit_handler_list;
        exit_handler_list = exit_handler_list->next;
        (node->function)(status, node->arg);
        mem_sys_free(node);
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
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

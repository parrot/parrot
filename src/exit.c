/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

src/exit.c - Exit Handling

=head1 DESCRIPTION

Parrot's version of C<exit()>, C<on_exit()>, and friends.

C<Parrot_x_on_exit()> allows you register exit handlers which will be
called by C<Parrot_x_exit()> when the interpreter exits.

=head2 Functions

=over 4

=cut

*/

#include <stdlib.h>
#include "parrot/parrot.h"

/* HEADERIZER HFILE: include/parrot/exit.h */

/*

=item C<void Parrot_x_on_exit(PARROT_INTERP, exit_handler_f function, void
*arg)>

Register the specified function to be called on interpreter exit.

=cut

*/

PARROT_EXPORT
void
Parrot_x_on_exit(PARROT_INTERP, ARGIN(exit_handler_f function), ARGIN_NULLOK(void *arg))
{
    ASSERT_ARGS(Parrot_x_on_exit)

    handler_node_t * const new_node = mem_internal_allocate_typed(handler_node_t);

    new_node->function        = function;
    new_node->arg             = arg;
    new_node->next            = interp->exit_handler_list;
    interp->exit_handler_list = new_node;
}

/*

=item C<void Parrot_x_jump_out(NULLOK_INTERP, int status)>

Jumps out returning to the caller api function. Do not execute registered
on-exit handlers. If an interpreter is not provided, or if the interpreter
does not have a jump buffer registered, force an exit back to the system
(which may be very bad for the client application).

=cut

*/

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
PARROT_COLD
void
Parrot_x_jump_out(NULLOK_INTERP, int status)
{
    ASSERT_ARGS(Parrot_x_jump_out)

    if (interp && interp->api_jmp_buf)
        longjmp(*(interp->api_jmp_buf), 1);
    else
        PARROT_FORCE_EXIT(status);
}

/*

=item C<void Parrot_x_exit(PARROT_INTERP, int status)>

Normal interpreter exit. Execute any registered exit handlers and jump back
out to the last API call-in routine.

=cut

*/

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
PARROT_COLD
void
Parrot_x_exit(PARROT_INTERP, int status)
{
    ASSERT_ARGS(Parrot_x_exit)
    Parrot_x_execute_on_exit_handlers(interp, status);
    Parrot_x_jump_out(interp, status);
}

/*

=item C<void Parrot_x_execute_on_exit_handlers(PARROT_INTERP, int status)>

Execute all registered on-exit callback functions. This must be done before
the interpreter is destroyed.

=cut

*/

PARROT_COLD
PARROT_NO_ADDRESS_SAFETY_ANALYSIS
void
Parrot_x_execute_on_exit_handlers(PARROT_INTERP, int status)
{
    ASSERT_ARGS(Parrot_x_execute_on_exit_handlers)

    /* call all the exit handlers */
    handler_node_t *node;

    node = interp->exit_handler_list;

    /* Block GC. We don't want any shenanigans while we are executing our
       callbacks */
    Parrot_block_GC_mark(interp);
    Parrot_block_GC_sweep(interp);

    while (node) {
        handler_node_t * const next = node->next;

        (node->function)(interp, status, node->arg);
        mem_internal_free(node);
        node = next;
    }

    /* It could be that the interpreter already is destroyed. See issue 765 */
    interp->exit_handler_list = NULL;

    /* Re-enable GC, which we will want if GC finalizes */
    Parrot_unblock_GC_mark(interp);
    Parrot_unblock_GC_sweep(interp);
}

/*

=item C<void Parrot_x_force_error_exit(NULLOK_INTERP, int exitcode, const char *
format, ...)>

Error handler of last resort, under normal circumstances. Print out an error
message to C<stderr> and exit from the interpreter. If possible attempt to
jump out of libparrot. If not, hard exit back to the system.

=cut

*/

PARROT_DOES_NOT_RETURN
PARROT_COLD
void
Parrot_x_force_error_exit(NULLOK_INTERP, int exitcode, ARGIN(const char * format), ...)
{
    ASSERT_ARGS(Parrot_x_force_error_exit)

    va_list arglist;
    va_start(arglist, format);
    vfprintf(stderr, format, arglist);
    fprintf(stderr, "\n");
    fflush(stderr);
    va_end(arglist);

    Parrot_x_jump_out(interp, exitcode);
}

/*

=item C<void Parrot_x_panic_and_exit(NULLOK_INTERP, const char *message, const
char *file, unsigned int line)>

Panic handler. Things have gone very wrong in an unexpected way. Print out an
error message and instructions for the user to report the error to the
developers. Perform a full core dump and force exit back to the system.

=cut

*/

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
PARROT_COLD
void
Parrot_x_panic_and_exit(NULLOK_INTERP, ARGIN_NULLOK(const char *message),
         ARGIN_NULLOK(const char *file), unsigned int line)
{
    ASSERT_ARGS(Parrot_x_panic_and_exit)
    /* Note: we can't format any floats in here--Parrot_sprintf
    ** may panic because of floats.
    ** and we don't use Parrot_sprintf or such, because we are
    ** already in panic --leo
    */
    fprintf(stderr, "Parrot VM: PANIC: %s!\n",
               message ? message : "(no message available)");

    fprintf(stderr, "C file %s, line %u\n",
               file ? file : "(not available)", line);

    fprintf(stderr, "Parrot file (not available), ");
    fprintf(stderr, "line (not available)\n");

    fprintf(stderr, "\n\
We highly suggest you notify the Parrot team if you have not been working on\n\
Parrot.  Use parrotbug (located in parrot's root directory) or send an\n\
e-mail to parrot-dev@lists.parrot.org.\n\
Include the entire text of this error message and the text of the script that\n\
generated the error.  If you've made any modifications to Parrot, please\n\
describe them as well.\n\n");

    fprintf(stderr, "Version     : %s\n", PARROT_VERSION);
    fprintf(stderr, "Configured  : %s\n", PARROT_CONFIG_DATE);
    fprintf(stderr, "Architecture: %s\n", PARROT_ARCHNAME);
    if (interp)
        fprintf(stderr, "Interp Flags: %#x\n", (unsigned int)interp->flags);
    else
        fprintf(stderr, "Interp Flags: (no interpreter)\n");
    fprintf(stderr, "Exceptions  : %s\n", "(missing from core)");
    fprintf(stderr, "\nDumping Core...\n");

    DUMPCORE();
}


/*

=back

=head1 SEE ALSO

F<include/parrot/exit.h> and F<t/src/exit.t>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

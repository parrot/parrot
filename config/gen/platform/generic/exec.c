/*
 * $Id$
 * Copyright (C) 2004-2010, Parrot Foundation.
 */

/*

=head1 NAME

config/gen/platform/generic/exec.c

=head1 DESCRIPTION

Parrot functions to run operating system commands.

=head2 Functions

=over 4

=cut

*/

#include <sys/types.h>
#include <sys/wait.h>

/*

=item C<INTVAL Parrot_Run_OS_Command(PARROT_INTERP, STRING *command)>

Spawn off a subprocess provided in a string.  Wait for it to complete,
returning the return value of the process.

=cut

*/

INTVAL
Parrot_Run_OS_Command(PARROT_INTERP, STRING *command)
{
    pid_t child;
    child = fork();
    /* Did we fail? */
    if (-1 == child)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_NOSPAWN,
            "Can't spawn child process");

    /* Are we the parent or child? */
    if (child) {
        /* parent */
        int   status;
        waitpid(child, &status, 0);
        return status;
    }
    else {
        /* child */
        char * const cmd    = Parrot_str_to_cstring(interp, command);
        const int    status = execlp("sh", "sh", "-c", cmd, (void *)NULL);

        /* if we get here, something's horribly wrong, but free anyway... */
        Parrot_str_free_cstring(cmd);

        if (status)
            exit(status);
    }

    /* make gcc happy */
    return 1;
}

/*

=item C<INTVAL Parrot_Run_OS_Command_Argv(PARROT_INTERP, PMC *cmdargs)>

Spawn off a subprocess provided in command-line arguments.  Wait for it to
complete, returning the return value of the process.

=cut

*/

INTVAL
Parrot_Run_OS_Command_Argv(PARROT_INTERP, PMC *cmdargs)
{
    pid_t child;
    int len = VTABLE_elements(interp, cmdargs);

    if (len == 0)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_NOSPAWN,
            "Empty argument array for execvp");

    child = fork();
    /* Did we fail? */
    if (-1 == child)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_NOSPAWN,
            "Can't spawn child process");

    /* Are we the parent or child? */
    if (child) {
        /* parent */
        int status;
        pid_t returnstat = waitpid(child, &status, 0);
        UNUSED(returnstat);
        return status;
    }
    else {
        /* child. Be horribly profligate with memory, since we're
           about to be something else */
        int status, i;
        STRING *s;
        char   *cmd;
        char  **argv = mem_gc_allocate_n_typed(interp, (len+1), char*);

        for (i = 0; i < len; ++i) {
            s = VTABLE_get_string_keyed_int(interp, cmdargs, i);
            argv[i] = Parrot_str_to_cstring(interp, s);
        }

        cmd     = argv[0];
        argv[i] = NULL;
        status  = execvp(cmd, argv);
        /* if we get here, something's horribly wrong... */
        if (status) {
            exit(status);
        }
    }
    return 1;    /* make gcc happy */
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

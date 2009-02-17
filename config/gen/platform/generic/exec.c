/*
 * $Id$
 * Copyright (C) 2004-2008, Parrot Foundation.
 */

/*

=head1 NAME

config/gen/platform/generic/exec.c

=head1 DESCRIPTION

system() stuff

=head2 Functions

=over 4

=cut

*/

#include <sys/types.h>
#include <sys/wait.h>

/*

=item C<INTVAL
Parrot_Run_OS_Command(PARROT_INTERP, STRING *command)>

Spawn off a subprocess and wait for the damn thing to complete,
returning the return value of the process

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
        int status;
        pid_t returnstat;
        returnstat = waitpid(child, &status, 0);
        UNUSED(returnstat);
        return status;
    }
    else {
        /* child. Be horribly profligate with memory, since we're
           about to be something else */
        int status;
        status = execlp("sh", "sh", "-c",
            Parrot_str_to_cstring(interp, command), (void *)NULL);
        /* if we get here, something's horribly wrong... */
        if (status) {
            exit(status);
        }
    }
    return 1;    /* make gcc happy */
}

/*

=item C<INTVAL
Parrot_Run_OS_Command_Argv(PARROT_INTERP, PMC *cmdargs)>

RT#48260: Not yet documented!!!

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
        pid_t returnstat;
        returnstat = waitpid(child, &status, 0);
        UNUSED(returnstat);
        return status;
    }
    else {
        /* child. Be horribly profligate with memory, since we're
           about to be something else */
        int status, i;
        char **argv;
        STRING *s;
        char *cmd;

        argv = (char **)mem_sys_allocate((len+1)*sizeof (char *));
        for (i = 0; i < len; ++i) {
            s = VTABLE_get_string_keyed_int(interp, cmdargs, i);
            argv[i] = Parrot_str_to_cstring(interp, s);
        }
        cmd = argv[0];
        argv[i] = NULL;

        status = execvp(cmd, argv);
        /* if we get here, something's horribly wrong... */
        if (status) {
            exit(status);
        }
    }
    return 1;    /* make gcc happy */
}

/*

=item C<void
Parrot_Exec_OS_Command(PARROT_INTERP, STRING *command)>

RT #48260: Not yet documented!!!

=cut

*/

void
Parrot_Exec_OS_Command(PARROT_INTERP, STRING *command)
{
    /* Be horribly profligate with memory, since we're
       about to be something else */
    char *cmd  = Parrot_str_to_cstring(interp, command);
    int status = execlp("sh", "sh", "-c", cmd, (void *)NULL);

    /* if we get here, something's horribly wrong... */
    if (status)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_NOSPAWN,
            "Exec failed, code %i", status);
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

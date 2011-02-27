/*
 * Copyright (C) 2004-2010, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/generic/exec.c

=head1 DESCRIPTION

Parrot functions to run operating system commands.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

/* HEADERIZER HFILE: none */

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

=item C<UINTVAL Parrot_getpid(void)>

Parrot wrapper around standard library C<getpid()> function, returning an UINTVAL.

=cut

*/

UINTVAL
Parrot_getpid(void)
{
    return getpid();
}

/*

=item C<INTVAL Parrot_proc_exec(PARROT_INTERP, STRING *command, INTVAL flags,
PIOHANDLE *handles)>

Execute an external process.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_proc_exec(PARROT_INTERP, ARGIN(STRING *command), INTVAL flags,
        ARGMOD(PIOHANDLE *handles))
{
    /*
     * pipe(), fork() should be defined, if this header is present
     *        if that's not true, we need a test
     */
    int pid;
    int in_fds[2];
    int out_fds[2];
    int err_fds[2];

    if (flags & PARROT_EXEC_STDIN
    &&  pipe(in_fds) < 0)
        goto error_pipe_in;

    if (flags & PARROT_EXEC_STDOUT
    &&  pipe(out_fds) < 0)
        goto error_pipe_out;

    if (flags & PARROT_EXEC_STDERR
    &&  pipe(err_fds) < 0)
        goto error_pipe_err;

    pid = fork();

    if (pid < 0)
        goto error_fork;

    if (pid > 0) {
        if (flags & PARROT_EXEC_STDIN) {
            /* close fd for reading */
            close(in_fds[0]);
            handles[0] = in_fds[1];
        }

        if (flags & PARROT_EXEC_STDOUT) {
            /* close fd for writing */
            close(out_fds[1]);
            handles[1] = out_fds[0];
        }

        if (flags & PARROT_EXEC_STDERR) {
            /* close fd for writing */
            close(err_fds[1]);
            handles[2] = err_fds[0];
        }
    }
    else /* (pid == 0) */ {
        /* Child - exec process */
        char * argv[4];
        /* C strings for the execv call defined without const to avoid
         * const problems without copying them.
         * Please don't change this without testing with a c++ compiler.
         */
        static char auxarg0[] = "/bin/sh";
        static char auxarg1[] = "-c";

        if (flags & PARROT_EXEC_STDIN) {
            /* redirect stdin to pipe */
            close(in_fds[1]);
            close(STDIN_FILENO);

            if (dup(in_fds[0]) != STDIN_FILENO)
                exit(EXIT_FAILURE);
        }

        if (flags & PARROT_EXEC_STDOUT) {
            /* redirect stdin to pipe */
            close(out_fds[0]);
            close(STDOUT_FILENO);

            if (dup(out_fds[1]) != STDOUT_FILENO)
                exit(EXIT_FAILURE);

            if (!(flags & PARROT_EXEC_STDERR)) {
                close(STDERR_FILENO);

                if (dup(out_fds[1]) != STDERR_FILENO)
                    exit(EXIT_FAILURE);
            }
        }

        if (flags & PARROT_EXEC_STDERR) {
            /* redirect stdin to pipe */
            close(err_fds[0]);
            close(STDERR_FILENO);

            if (dup(err_fds[1]) != STDERR_FILENO)
                exit(EXIT_FAILURE);
        }

        argv [0] = auxarg0;
        argv [1] = auxarg1;
        argv [2] = Parrot_str_to_cstring(interp, command);
        argv [3] = NULL;
        execv(argv [0], argv);

        /* Will never reach this unless exec fails.
         * No need to clean up, we're just going to exit */
        perror("execvp");
        exit(EXIT_FAILURE);
    }

    return pid;

  error_fork:
    if (flags & PARROT_EXEC_STDERR) {
        close(err_fds[0]);
        close(err_fds[1]);
    }

  error_pipe_err:
    if (flags & PARROT_EXEC_STDOUT) {
        close(out_fds[0]);
        close(out_fds[1]);
    }

  error_pipe_out:
    if (flags & PARROT_EXEC_STDIN) {
        close(in_fds[0]);
        close(in_fds[1]);
    }

  error_pipe_in:
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
        "Error executing process: %s", strerror(errno));
}

/*

=item C<INTVAL Parrot_proc_waitpid(PARROT_INTERP, INTVAL pid)>

Wait for process with C<pid> to exit.

=cut

*/

INTVAL
Parrot_proc_waitpid(SHIM_INTERP, INTVAL pid)
{
    int status;

    waitpid(pid, &status, 0);

    if (WIFEXITED(status)) {
        status = WEXITSTATUS(status);
    }
    else {
        /* abnormal termination means non-zero exit status */
        status = 1;
    }

    return status;
}

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

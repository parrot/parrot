/*
 * system() stuff
 */

/*
 * Spawn off a subprocess and wait for the damn thing to complete,
 * returning the return value of the process
 *
 */
#include <sys/types.h>
#include <sys/wait.h>

INTVAL
Parrot_Run_OS_Command(Parrot_Interp interpreter, STRING *command)
{
    pid_t child;
    child = fork();
    /* Did we fail? */
    if (-1 == child) {
        internal_exception(NOSPAWN, "Can't spawn child process");
    }
    /* Are we the parent or child? */
    if (child) {
        /* parent */
        int status;
        pid_t returnstat;
        returnstat = waitpid(child, &status, 0);
        return status;
    } else {
        /* child. Be horribly profligate with memory, since we're
           about to be something else */
        int status;
        status = execlp("sh", "sh", "-c",
			string_to_cstring(interpreter, command), NULL);
        /* if we get here, something's horribly wrong... */
        if (status) {
            exit(status);
        }
    }
    return 1;	/* make gcc happy */
}

void
Parrot_Exec_OS_Command(Parrot_Interp interpreter, STRING *command) {
  /* Be horribly profligate with memory, since we're
     about to be something else */
  int status;
  status = execlp("sh", "sh", "-c",
		  string_to_cstring(interpreter, command), NULL);
  /* if we get here, something's horribly wrong... */
  if (status) {
    internal_exception(NOSPAWN, "Exec failed, code %i", status);
  }
}

/*
 * $Id$
 * Copyright (C) 2004-2007, The Perl Foundation.
 */

/*
 * Spawn a subprocess
 *
 */
INTVAL Parrot_Run_OS_Command(Parrot_Interp interp, STRING *command) {
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG,
            "Parrot_Run_OS_Command not implemented");
    return 0;
}

INTVAL
Parrot_Run_OS_Command_Argv(Parrot_Interp interp, PMC *cmdargs)
{
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG,
            "Parrot_Run_OS_Command_Argv not implemented");
    return 0;
}

void Parrot_Exec_OS_Comman(Parrot_Interp interp, STRING *command) {
  real_exception(interp, NULL, NOSPAWN, "Exec not implemented");
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

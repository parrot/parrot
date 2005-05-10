/*
 * Spawn a subprocess
 *
 */
INTVAL Parrot_Run_OS_Command(Parrot_Interp interpreter, STRING *command) {
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG,
	    "Parrot_Run_OS_Command not implemented");
    return 0;
}

INTVAL
Parrot_Run_OS_Command_Argv(Parrot_Interp interpreter, PMC *cmdargs)
{
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG,
	    "Parrot_Run_OS_Command_Argv not implemented");
    return 0;
}

void Parrot_Exec_OS_Comman(Parrot_Interp interpreter, STRING *command) {
  internal_exception(NOSPAWN, "Exec not implemented");
}

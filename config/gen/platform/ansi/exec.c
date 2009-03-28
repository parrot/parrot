/*
 * $Id$
 * Copyright (C) 2004-2008, Parrot Foundation.
 */

/*

=head1 NAME

config/gen/platform/ansi/exec.c

=head1 DESCRIPTION

RT#48264

=head2 Functions

=over 4

=cut

*/

/*

=item C<INTVAL Parrot_Run_OS_Command(PARROT_INTERP, STRING *command)>

Spawn a subprocess

=cut

*/

INTVAL
Parrot_Run_OS_Command(PARROT_INTERP, STRING *command)
{
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG,
            "Parrot_Run_OS_Command not implemented");
    return 0;
}

/*

=item C<INTVAL Parrot_Run_OS_Command_Argv(PARROT_INTERP, PMC *cmdargs)>

=cut

*/

INTVAL
Parrot_Run_OS_Command_Argv(PARROT_INTERP, PMC *cmdargs)
{
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG,
            "Parrot_Run_OS_Command_Argv not implemented");
    return 0;
}

/*

=item C<void Parrot_Exec_OS_Comman(PARROT_INTERP, STRING *command)>

=cut

*/

void
Parrot_Exec_OS_Comman(PARROT_INTERP, STRING *command)
{
  Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_NOSPAWN,
         "Exec not implemented");
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

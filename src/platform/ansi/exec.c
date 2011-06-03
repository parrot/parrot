/*
 * Copyright (C) 2004-2010, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/ansi/exec.c

=head1 DESCRIPTION

Functions for dealing with child processes and Execs. (Currently not implemented on this platform.)

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/* HEADERIZER HFILE: none */

/*

=item C<INTVAL Parrot_Run_OS_Command(PARROT_INTERP, STRING *command)>

B<Not yet implemented on this platform.> Spawn a subprocess.

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

B<Not yet implemented on this platform.>

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

=item C<UINTVAL Parrot_getpid(void)>

Parrot wrapper around standard library C<getpid()> function.

Return 0 in platforms unsupported or without a pid concept.

=cut

*/

UINTVAL
Parrot_getpid(void)
{
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_getpid unuseful in this platform");
    return 0;
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

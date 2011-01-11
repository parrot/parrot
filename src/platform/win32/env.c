/*
 * Copyright (C) 2004-2008, Parrot Foundation.
 */

/*

=head1 NAME

src\platform\win32\env.c

=head1 DESCRIPTION

On Windows there are two ways to access the environment.  Either through the
Windows environment block, using GetEnvironmentVariable,
SetEnvironmentVariable and GetEnvironmentStrings, or the C runtime using
_getenv, _putenv and _environ.

Changes through the C runtime are reflected in the environment block, but
changes in the environment block are NOT reflected in the C runtime!

To keep both in sync we always update environment variables through the C
runtime.  Getting an environment variable can be done either way,
whichever is more convenient.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

#include <windows.h>

/* HEADERIZER HFILE: none */

/*

=item C<void Parrot_setenv(PARROT_INTERP, STRING *str_name, STRING *str_value)>

Sets the environment variable C<str_name> to the value C<str_value>. Creates the
environment variable if it does not exist, and silently overwrite a variable if
it does exist.

=cut

*/

void
Parrot_setenv(PARROT_INTERP, STRING *str_name, STRING *str_value)
{
    char * const name  = Parrot_str_to_cstring(interp, str_name);
    char * const value = Parrot_str_to_cstring(interp, str_value);
    assert(name  != NULL);
    assert(value != NULL);

    {
        const int name_len  = strlen(name);
        const int value_len = strlen(value);

        {
            char * const envstring = (char * const)mem_internal_allocate(
                    name_len     /* name  */
                    + 1          /* '='   */
                    + value_len  /* value */
                    + 1);        /* string terminator */

            /* Save a bit of time, by using the fact we already have the
            lengths, avoiding strcat */
            strcpy(envstring, name);
            strcpy(envstring + name_len, "=");
            strcpy(envstring + name_len + 1, value);

            Parrot_str_free_cstring(name);
            Parrot_str_free_cstring(value);

            if (_putenv(envstring) == 0) {
                /* success */
                mem_sys_free(envstring);
            }
            else {
                mem_sys_free(envstring);
                exit_fatal(1, "Unable to set environment variable %s=%s",
                    name, value);
            }
        }
    }
}

/*

=item C<STRING * Parrot_getenv(PARROT_INTERP, STRING *str_name)>

Gets the environment variable C<str_name>, if it exists.

=cut

*/

STRING *
Parrot_getenv(PARROT_INTERP, ARGIN(STRING *str_name))
{
    char   * const name = Parrot_str_to_cstring(interp, str_name);
    const   DWORD size  = GetEnvironmentVariable(name, NULL, 0);
    char   *buffer      = NULL;
    STRING *retv;

    if (size == 0) {
        Parrot_str_free_cstring(name);
        return NULL;
    }
    buffer = (char *)mem_sys_allocate(size);
    GetEnvironmentVariable(name, buffer, size);
    Parrot_str_free_cstring(name);
    retv = Parrot_str_from_platform_cstring(interp, buffer);
    mem_sys_free(buffer);

    return retv;
}

/*

=item C<void Parrot_unsetenv(PARROT_INTERP, STRING *name)>

Deletes an environment variable by assigning an empty string to the specified variable.

=cut

*/

void
Parrot_unsetenv(PARROT_INTERP, STRING *name)
{
    /* You can remove a variable from the environment by specifying an empty
       string -- in other words, by specifying only varname=.
           -- _putenv, _wputenv (CRT) documentation
    */
    Parrot_setenv(interp, name, Parrot_str_new(interp, "", 0));
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

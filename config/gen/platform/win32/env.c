/*
 * $Id$
 * Copyright (C) 2004-2008, Parrot Foundation.
 */

/*

=head1 NAME

config\gen\platform\win32\env.c

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

/*

=item C<void Parrot_setenv(const char *name, const char *value)>

Sets the environment variable C<name> to the value C<value>. Creates the
environment variable if it does not exist, and silently overwrite a variable if
it does exist.

=cut

*/

void
Parrot_setenv(const char *name, const char *value)
{
    assert(name  != NULL);
    assert(value != NULL);

    {
        const int name_len  = strlen(name);
        const int value_len = strlen(value);

        {
            char * const envstring = mem_internal_allocate(
                    name_len     /* name  */
                    + 1          /* '='   */
                    + value_len  /* value */
                    + 1);        /* string terminator */

            /* Save a bit of time, by using the fact we already have the
            lengths, avoiding strcat */
            strcpy(envstring, name);
            strcpy(envstring + name_len, "=");
            strcpy(envstring + name_len + 1, value);

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

=item C<char * Parrot_getenv(const char *name, int *free_it)>

Gets the environment variable C<name>, if it exists. Returns status in
C<free_it>. C<free_it> must be a non-null pointer to an integer to receive the
status. Status code is 1 on success, 0 on failure. Returns the contents of the
environment variable in a C<malloc>'d memory location that needs to be freed
later.

=cut

*/

char *
Parrot_getenv(ARGIN(const char *name), NOTNULL(int *free_it))
{
    const DWORD size = GetEnvironmentVariable(name, NULL, 0);
    char *buffer     = NULL;

    if (size == 0) {
        *free_it = 0;
        return NULL;
    }
    else {
        *free_it = 1;
    }
    buffer = mem_sys_allocate(size);
    GetEnvironmentVariable(name, buffer, size);

    return buffer;
}

/*

=item C<void Parrot_unsetenv(const char *name)>

Deletes an environment variable by assigning an empty string to the specified variable.

=cut

*/

void
Parrot_unsetenv(const char *name)
{
/* You can remove a variable from the environment by specifying an empty
   string -- in other words, by specifying only varname=.
       -- _putenv, _wputenv (CRT) documentation
*/
    Parrot_setenv(name, "");
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

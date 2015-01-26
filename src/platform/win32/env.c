/*
 * Copyright (C) 2004-2015, Parrot Foundation.
 */

/*

=head1 NAME

src\platform\win32\env.c - getenv/setenv/unsetenv on windows

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

But since Visual Studio 2005 direct access to the _environ symbol is
deprecated and linking to msvcrt will not work.  "Polling _environ in
a Unicode context is meaningless when /MD or /MDd linkage is used"

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

#include <windows.h>

/* HEADERIZER HFILE: none */

/*

=item C<static void win32_setenv_ascii(PARROT_INTERP, char * const name,
char * const value)>

Helper function for ascii keys and values.

=cut

*/

static void
win32_setenv_ascii(PARROT_INTERP, char * const name, char * const value)
{
    {
        int result;
#ifndef PARROT_HAS_PUTENV_S
        const int name_len  = strlen(name);
        const int value_len = strlen(value);
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

        result = _putenv(envstring);
        mem_sys_free(envstring);
#else
        result = _putenv_s(name, value);
#endif

        if (result) {
            Parrot_x_force_error_exit(interp, 1,
                                      "Unable to set environment variable %s=%s",
                                      name, value);
        }
    }
}

/*

=item C<static void win32_setenv_unicode(PARROT_INTERP, wchar_t * const name,
wchar_t * const value)>

Helper function for unicode (ucs-2) keys and values.

=cut

*/

static void
win32_setenv_unicode(PARROT_INTERP, wchar_t * const name, wchar_t * const value)
{
    {
        int result;
#ifndef PARROT_HAS_PUTENV_S
        const int name_len  = wscslen(name);
        const int value_len = wscslen(value);

        char * const envstring = (char * const)mem_internal_allocate(
            2*name_len     /* name  */
            + 2            /* '='   */
            + 2*value_len  /* value */
            + 2);          /* string terminator */

        /* Save a bit of time, by using the fact we already have the
           lengths, avoiding strcat */
        wstrcpy(envstring, name);
        wstrcpy(envstring + name_len, L"=");
        wstrcpy(envstring + name_len + 2, value);

        result = _wputenv(envstring);
        mem_sys_free(envstring);
#else
        result = _wputenv_s(name, value);
#endif

        if (result) {
            fwprintf(stderr, L"Unable to set environment variable %s=%s", name, value);
            Parrot_x_jump_out(interp, 1);
        }
    }
}

/*

=item C<void Parrot_setenv(PARROT_INTERP, const STRING *str_name, const STRING
*str_value)>

Sets the environment variable C<str_name> to the value C<str_value>. Creates the
environment variable if it does not exist, and silently overwrite a variable if
it does exist.

=cut

*/

void
Parrot_setenv(PARROT_INTERP, const STRING *str_name, const STRING *str_value)
{
    if (str_name->encoding->max_bytes_per_codepoint == 1
     && str_value->encoding->max_bytes_per_codepoint == 1) {
        char * const name  = Parrot_str_to_cstring(interp, str_name);
        char * const value = Parrot_str_to_cstring(interp, str_value);
        assert(name  != NULL);
        assert(value != NULL);

        win32_setenv_ascii(interp, name, value);

        Parrot_str_free_cstring(name);
        Parrot_str_free_cstring(value);
    }
    else {
        char * const wname  = Parrot_str_to_encoded_cstring(interp, str_name,
                                                            Parrot_ucs2_encoding_ptr);
        char * const wvalue = Parrot_str_to_encoded_cstring(interp, str_value,
                                                            Parrot_ucs2_encoding_ptr);
        assert(wname != NULL);
        assert(wvalue != NULL);

        win32_setenv_unicode(interp, (wchar_t*)wname, (wchar_t*)wvalue);

        Parrot_str_free_cstring(wname);
        Parrot_str_free_cstring(wvalue);
    }
}

/*

=item C<STRING * Parrot_getenv(PARROT_INTERP, const STRING *str_name)>

Gets the environment variable C<str_name>, if it exists.

=cut

*/

STRING *
Parrot_getenv(PARROT_INTERP, const STRING *str_name)
{
    if (str_name->encoding->max_bytes_per_codepoint == 1) {
        char   * const name = Parrot_str_to_cstring(interp, str_name);
        const   DWORD size  = GetEnvironmentVariableA(name, NULL, 0);
        char   *buffer      = NULL;
        STRING *retv;

        if (size == 0) {
            Parrot_str_free_cstring(name);
            return NULL;
        }
        buffer = (char *)mem_sys_allocate(size);
        GetEnvironmentVariableA(name, buffer, size);
        Parrot_str_free_cstring(name);
        retv = Parrot_str_from_platform_cstring(interp, buffer);
        mem_sys_free(buffer);
        return retv;
    }
    else {
        char * const wname  = Parrot_str_to_encoded_cstring(interp, str_name,
                                  Parrot_ucs2_encoding_ptr);
        const   DWORD size  = GetEnvironmentVariableW((wchar_t*)wname, NULL, 0);
        char   *buffer      = NULL;
        STRING *retv;

        if (size == 0) {
            Parrot_str_free_cstring(wname);
            return NULL;
        }
        buffer = (char *)mem_sys_allocate(size);
        GetEnvironmentVariableW((wchar_t*)wname, (wchar_t*)buffer, size);
        Parrot_str_free_cstring(wname);
        retv = Parrot_str_from_platform_cstring(interp, buffer);
        mem_sys_free(buffer);
        return retv;
    }
}

/*

=item C<void Parrot_unsetenv(PARROT_INTERP, const STRING *str_name)>

Deletes an environment variable by assigning an empty string to the specified variable.

=cut

*/

void
Parrot_unsetenv(PARROT_INTERP, const STRING *str_name)
{
    /* You can remove a variable from the environment by specifying an empty
       string -- in other words, by specifying only varname=.
           -- _putenv, _wputenv (CRT) documentation
    */
    if (str_name->encoding->max_bytes_per_codepoint == 1) {
        char * const name  = Parrot_str_to_cstring(interp, str_name);
        assert(name  != NULL);
        win32_setenv_ascii(interp, name, NULL);
    }
    else {
        char * const wname  = Parrot_str_to_encoded_cstring(interp, str_name,
                                  Parrot_ucs2_encoding_ptr);
        assert(wname  != NULL);
        win32_setenv_unicode(interp, (wchar_t*)wname, NULL);
    }
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

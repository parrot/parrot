/*
 * Copyright (C) 2004-2010, Parrot Foundation.
 */

/*

=head1 NAME

config/gen/platform/generic/env.c

=head1 DESCRIPTION

Environment manipulation stuff

=head2 Functions

=over 4

=cut

*/

#include <stdlib.h>
#include <string.h>

/*

=item C<void Parrot_setenv(PARROT_INTERP, STRING *str_name, STRING *str_value)>

Set up Environment vars

=cut

*/

void
Parrot_setenv(PARROT_INTERP, STRING *str_name, STRING *str_value)
{
#ifdef PARROT_HAS_SETENV
    char * const name  = Parrot_str_to_platform_cstring(interp, str_name);
    char * const value = Parrot_str_to_platform_cstring(interp, str_value);
    setenv(name, value, 1);
    Parrot_str_free_cstring(name);
    Parrot_str_free_cstring(value);
#else
    STRING *str_eq   = Parrot_str_new_constant(interp, "=");
    STRING *str_envs = Parrot_str_concat(interp,
                            Parrot_str_concat(interp, str_name, str_eq),
                            str_value);
    char *envs = Parrot_str_to_platform_cstring(interp, str_envs);
    putenv(envs);
    Parrot_str_free_cstring(envs);
#endif
}

/*

=item C<void Parrot_unsetenv(PARROT_INTERP, STRING *str_name)>

UnSet Environment vars

=cut

*/

void
Parrot_unsetenv(PARROT_INTERP, STRING *str_name)
{
#ifdef PARROT_HAS_UNSETENV
    char * const name = Parrot_str_to_platform_cstring(interp, str_name);
    unsetenv(name);
    Parrot_str_free_cstring(name);
#else
    Parrot_setenv(interp, str_name, Parrot_str_new(interp, "", 0));
#endif
}

/*

=item C<char * Parrot_getenv(PARROT_INTERP, STRING *str_name)>

Get Environment vars

=cut

*/

char *
Parrot_getenv(PARROT_INTERP, STRING *str_name)
{
    char * const name  = Parrot_str_to_platform_cstring(interp, str_name);
    char        *value = getenv(name);
    Parrot_str_free_cstring(name);
    return value;
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

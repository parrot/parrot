/*
 * $Id$
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
    char *name  = Parrot_str_to_cstring(interp, str_name);
    char *value = Parrot_str_to_cstring(interp, str_value);
#ifdef PARROT_HAS_SETENV
    setenv(name, value, 1);
#else
    int name_len = strlen(name);
    int val_len = strlen(value);

    char *envs = malloc(name_len + 1 + val_len + 1);
    if (envs == NULL)
        return;

    /* Save a bit of time, by using the fact we already have the
       lengths, avoiding strcat */
    strcpy(envs, name);
    strcpy(envs + name_len, "=");
    strcpy(envs + name_len + 1, value);

    putenv(envs);
#endif
    Parrot_str_free_cstring(name);
    Parrot_str_free_cstring(value);
}

/*

=item C<void Parrot_unsetenv(PARROT_INTERP, STRING *str_name)>

UnSet Environment vars

=cut

*/

void
Parrot_unsetenv(PARROT_INTERP, STRING *str_name)
{
    char * const name = Parrot_str_to_cstring(interp, str_name);
#ifdef PARROT_HAS_UNSETENV
    unsetenv(name);
#else
    Parrot_setenv(name, "");
#endif
    Parrot_str_free_cstring(name);
}

/*

=item C<char * Parrot_getenv(PARROT_INTERP, STRING *str_name)>

Get Environment vars

=cut

*/

char *
Parrot_getenv(PARROT_INTERP, STRING *str_name)
{
    char *name  = Parrot_str_to_cstring(interp, str_name);
    char *value = getenv(name);
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
 * vim: expandtab shiftwidth=4:
 */

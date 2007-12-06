/*
 * $Id$
 * Copyright (C) 2004-2006, The Perl Foundation.
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

=item C<void
Parrot_setenv(const char *name, const char *value)>

RT#48260: Not yet documented!!!

=cut

*/

void
Parrot_setenv(const char *name, const char *value)
{
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

    /* The buffer is intentionally not freed! */
#endif
}

/*

=item C<void
Parrot_unsetenv(const char *name)>

RT#48260: Not yet documented!!!

=cut

*/

void
Parrot_unsetenv(const char *name)
{
#ifdef PARROT_HAS_UNSETENV
    unsetenv(name);
#else
    Parrot_setenv(name, "");
#endif
}

/*

=item C<char *
Parrot_getenv(const char *name, int *free_it)>

RT#48260: Not yet documented!!!

=cut

*/

char *
Parrot_getenv(const char *name, int *free_it)
{
    *free_it = 0;
    return getenv(name);
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

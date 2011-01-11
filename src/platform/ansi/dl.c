/*
 * Copyright (C) 2007-2010, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/ansi/dl.c

=head1 DESCRIPTION

Parrot functions -- B<none yet implemented> -- which wrap around standard
library functions for handling dynamic libraries.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/* HEADERIZER HFILE: none */

/*

=item C<void * Parrot_dlopen(const char *filename, Parrot_dlopen_flags flags)>

Parrot wrapper around C<dlopen>.  B<Not yet implemented.>

=cut

*/

void *
Parrot_dlopen(const char *filename, SHIM(Parrot_dlopen_flags flags))
{
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_dlopen not implemented");
    return NULL;
}


/*

=item C<const char * Parrot_dlerror(void)>

Parrot wrapper around C<dlerror>.  B<Not yet implemented.>

=cut

*/

const char *
Parrot_dlerror(void)
{
    return "Parrot_dlerror not implemented";
}


/*

=item C<void * Parrot_dlsym(void *handle, const char *symbol)>

Parrot wrapper around C<dlsym>.  B<Not yet implemented.>

=cut

*/

void *
Parrot_dlsym(void *handle, const char *symbol)
{
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_dlsym not implemented");
    return NULL;
}


/*

=item C<int Parrot_dlclose(void *handle)>

Parrot wrapper around C<dlclose>.  B<Not yet implemented.>

=cut

*/

int
Parrot_dlclose(void *handle)
{
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_dlclose not implemented");
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

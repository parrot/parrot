/*
 * $Id$
 * Copyright (C) 2007, Parrot Foundation.
 */

/*

=head1 NAME

config/gen/platform/ansi/dl.c

=head1 DESCRIPTION

Dynlib stuff.  (Currently, just placeholders.)

=head2 Functions

=over 4

=cut

*/

/*

=item C<void * Parrot_dlopen(const char *filename, SHIM(Parrot_dlopen_flags
flags)>

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

=cut

*/

const char *
Parrot_dlerror(void)
{
    return "Parrot_dlerror not implemented";
}


/*

=item C<void * Parrot_dlsym(void *handle, const char *symbol)>

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
 * vim: expandtab shiftwidth=4:
 */

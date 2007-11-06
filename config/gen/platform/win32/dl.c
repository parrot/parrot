/*
 * $Id$
 * Copyright (C) 2004-2006, The Perl Foundation.
 */

/*

=head1 NAME

config\gen\platform\win32\dl.c

=head1 DESCRIPTION

TODO

=head2 Functions

=over 4

=cut

*/

/*

=item C<void * Parrot_dlopen(const char *filename)>

TODO: Not yet documented!!!

=cut

*/

void *
Parrot_dlopen(const char *filename)
{
    return LoadLibrary(filename);
}

/*

=item C<const char * Parrot_dlerror(void)>

TODO: Not yet documented!!!

=cut

*/

const char *
Parrot_dlerror(void)
{
    return NULL;
}

/*

=item C<void * Parrot_dlsym(void *handle, const char *symbol)>

TODO: Not yet documented!!!

=cut

*/

void *
Parrot_dlsym(void *handle, const char *symbol)
{
    return (void *)GetProcAddress(handle, symbol);
}

/*

=item C<int Parrot_dlclose(void *handle)>

TODO: Not yet documented!!!

=cut

*/

int
Parrot_dlclose(void *handle)
{
    return FreeLibrary(handle)? 0: 1;
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


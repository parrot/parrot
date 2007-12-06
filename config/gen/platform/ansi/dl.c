/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

/*

=head1 NAME

config/gen/platform/ansi/dl.c

=head1 DESCRIPTION

RT#48264

=head2 Functions

=over 4

=cut

*/

/*

=item C<void * Parrot_dlopen(const char *filename)>

RT#48260: Not yet documented!!!

=cut

*/

void *
Parrot_dlopen(const char *filename)
{
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_dlopen not implemented");
    return NULL;
}


/*

=item C<const char * Parrot_dlerror(void)>

RT#48260: Not yet documented!!!

=cut

*/

const char *
Parrot_dlerror(void)
{
    return "Parrot_dlerror not implemented";
}


/*

=item C<void * Parrot_dlsym(void *handle, const char *symbol)>

RT#48260: Not yet documented!!!

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

RT#48260: Not yet documented!!!

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

/*
 * $Id$
 * Copyright (C) 2004-2006, Parrot Foundation.
 */

/*

=head1 NAME

config/gen/platform/generic/dl.c

=head1 DESCRIPTION

Dynlib stuff

=head2 Functions

=over 4

=cut

*/

#ifdef PARROT_HAS_HEADER_DLFCN
#  include <dlfcn.h>
#endif

#define PARROT_DLOPEN_FLAGS RTLD_LAZY

/*

=item C<void * Parrot_dlopen(const char *filename, Parrot_dlopen_flags flags)>

=cut

*/

void *
Parrot_dlopen(const char *filename, Parrot_dlopen_flags flags)
{
#ifdef PARROT_HAS_HEADER_DLFCN
    return dlopen(filename, PARROT_DLOPEN_FLAGS
                    | ((flags & Parrot_dlopen_global_FLAG) ? RTLD_GLOBAL : 0));
#else
    return 0;
#endif
}

/*

=item C<const char * Parrot_dlerror(void)>

=cut

*/

const char *
Parrot_dlerror(void)
{
#ifdef PARROT_HAS_HEADER_DLFCN
    return dlerror();
#else
    return 0;
#endif
}

/*

=item C<void * Parrot_dlsym(void *handle, const char *symbol)>

=cut

*/

void *
Parrot_dlsym(void *handle, const char *symbol)
{
#ifdef PARROT_HAS_HEADER_DLFCN
    return dlsym(handle, symbol);
#else
    return 0;
#endif
}

/*

=item C<int Parrot_dlclose(void *handle)>

=cut

*/

int
Parrot_dlclose(void *handle)
{
#ifdef PARROT_HAS_HEADER_DLFCN
    return dlclose(handle);
#else
    return -1;
#endif
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

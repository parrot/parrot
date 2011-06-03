/*
 * Copyright (C) 2004-2010, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/generic/dl.c

=head1 DESCRIPTION

Parrot functions which wrap around standard library functions for handling dynamic libraries.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

#ifdef PARROT_HAS_HEADER_DLFCN
#  include <dlfcn.h>
#endif

#define PARROT_DLOPEN_FLAGS RTLD_LAZY

/* HEADERIZER HFILE: none */

/*

=item C<void * Parrot_dlopen(const char *filename, Parrot_dlopen_flags flags)>

Parrot wrapper around C<dlopen>.  Loads dynamic library file named by first
argument and returns a handle to it.

=cut

*/

PARROT_CAN_RETURN_NULL
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

Wrapper around C<dlerror>.  System-dependent string that indicates most recent
failure in use of C<Parrot_dlopen>, C<Parrot_dlclose> or C<Parrot_dlsym>.

=cut

*/

PARROT_CAN_RETURN_NULL
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

Wrapper around C<dlysm>.  Takes a handle returned by C<Parrot_dlopen> and
returns address where symbol is located.

=cut

*/

PARROT_CAN_RETURN_NULL
void *
Parrot_dlsym(void *handle, const char *symbol)
{
#ifdef PARROT_HAS_HEADER_DLFCN
    if (!handle)
        handle = RTLD_DEFAULT;
    return dlsym(handle, symbol);
#else
    return NULL;
#endif
}

/*

=item C<int Parrot_dlclose(void *handle)>

Wrapper around C<dlclose>.  Releases reference to dynamic library specified
by argument.  Returns C<0> on success and C<-1> on failure.

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
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

/*
 * Copyright (C) 2004-2008, Parrot Foundation.
 */

/*

=head1 NAME

src\platform\win32\dl.c

=head1 DESCRIPTION

Functions for working with dynamic libraries under windows.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

#include <windows.h>

/* HEADERIZER HFILE: none */

/*

=item C<void * Parrot_dlopen(const char *filename, Parrot_dlopen_flags flags)>

Opens a dynamic library, and returns a system handle to that library.
Returns Parrot_dlerror() on failure.

=cut

*/

void *
Parrot_dlopen(const char *filename, SHIM(Parrot_dlopen_flags flags))
{
    return LoadLibrary(filename);
}

/*

=item C<const char * Parrot_dlerror(void)>

System-dependent error code that indicates failure in opening a DL.

=cut

*/

const char *
Parrot_dlerror(void)
{
    return NULL;
}

/*

=item C<void * Parrot_dlsym(void *handle, const char *symbol)>

Returns a pointer to the specified function in the given library.
The library must have been opened already with Parrot_dlopen().
To call the function "int Foo(int)" from the library "Bar",
you would write something similar to:

    void *lib;
    int (*Foo_ptr)(int);
    lib = Parrot_dlopen("Bar");
    if(lib != Parrot_dlerror())
    {
        Foo_ptr = Parrot_dlsym(lib, "Foo");
    }

=item C<static void* find_hmodule_from_func(void * func)>

Attempt a lookup of an owning HMODULE with nothing but the address of an
exported function pointer from that HMODULE. This relies on a trick where the
HMODULE value is the pointer to the base address of allocated memory for that
module. This relationship appears to hold for almost all non-ancient 32- and
64-bit versions of windows. There is no guarantee that this relationship will
hold on future versions of windows. Passing tests, expecially t/pmc/nci.t and
t/library/nciutils.t are a good indicator that this code is working as
expected

IF NCI-RELATED THINGS START BREAKING WHEN YOU UPDATE WINDOWS, THIS IS A VERY
GOOD PLACE TO LOOK FOR THE CAUSE OF THE FAILURES.

Visit TT #2150 to register a complaint.

=cut

*/

static void*
find_hmodule_from_func(void * func)
{
    MEMORY_BASIC_INFORMATION mbi;
    if (VirtualQuery(func, &mbi, sizeof(mbi)))
        return mbi.AllocationBase;
    return NULL;
}

void *
Parrot_dlsym(void *handle, const char *symbol)
{
    /* This is a hack, but it appears to work well enough and should be
       compatible for most versions of windows. It's not pretty, however, and
       it would be awesome if we could find a better, documented way to
       perform module lookups.
       See TT #2150 for more insults about this code. */
    if (handle == NULL) {
        void * proc = NULL;
        handle = find_hmodule_from_func(Parrot_dlsym);
        proc = (void *)GetProcAddress((HINSTANCE)handle, symbol);
        if (proc)
            return proc;
        handle = find_hmodule_from_func(atoi);
        return (void *)GetProcAddress((HINSTANCE)handle, symbol);
    }
    return (void *)GetProcAddress((HINSTANCE)handle, symbol);
}


/*

=item C<int Parrot_dlclose(void *handle)>

Closes a dynamic library handle.

    void *lib;
    lib = Parrot_dlopen("Foo");
    if(lib != Parrot_dlerror())
    {
        ...
        Parrot_dlclose(lib);
    }

=cut

*/

int
Parrot_dlclose(void *handle)
{
    return FreeLibrary((HMODULE)handle)? 0: 1;
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


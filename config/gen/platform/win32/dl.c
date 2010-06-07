/*
 * $Id$
 * Copyright (C) 2004-2008, Parrot Foundation.
 */

/*

=head1 NAME

config\gen\platform\win32\dl.c

=head1 DESCRIPTION

Functions for working with dynamic libraries under windows.

=head2 Functions

=over 4

=cut

*/

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

=cut

*/

void *
Parrot_dlsym(void *handle, const char *symbol)
{
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
 * vim: expandtab shiftwidth=4:
 */


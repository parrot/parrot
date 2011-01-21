/*
Copyright (C) 2011, Parrot Foundation.

=head1 NAME

src/platform/win32/file.c - Generic UNIX file functions

=head1 DESCRIPTION

This file implements OS-specific file functions for generic UNIX platforms.

=head2 Functions

=over 4

=cut

*/

#include <dirent.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

#include "parrot/parrot.h"

#define THROW(msg) Parrot_ex_throw_from_c_args(interp, NULL, \
    EXCEPTION_EXTERNAL_ERROR, "%s: %s", msg, strerror(errno))

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* HEADERIZER END: static */

/*

=item C<void Parrot_file_getcwd(STRING *path, STRING *mode)>

Returns the current working directory.

=cut

*/

STRING *
Parrot_file_getcwd(PARROT_INTERP)
{
    STRING *result;
    char   *c_str;

#ifdef PATH_MAX
    c_str = getcwd(NULL, PATH_MAX+1);
#else
    c_str = getcwd(NULL, 0);
#endif

    if (c_str == NULL)
        THROW("getcwd");

    result = Parrot_str_from_platform_cstring(interp, c_str);

    free(c_str);

    return result;
}

/*

=item C<void Parrot_file_mkdir(STRING *path, STRING *mode)>

Creates a directory specified by C<path> with mode C<mode>.

=cut

*/

void
Parrot_file_mkdir(PARROT_INTERP, ARGIN(STRING *path), INTVAL mode)
{
    char *c_str  = Parrot_str_to_platform_cstring(interp, path);
    int   result = mkdir(c_str, mode);

    Parrot_str_free_cstring(c_str);

    if (result)
        THROW("mkdir");
}

/*

=item C<void Parrot_file_chdir(STRING *path, STRING *mode)>

Changes the current working directory to the one specified by C<path>.

=cut

*/

void
Parrot_file_chdir(PARROT_INTERP, ARGIN(STRING *path))
{
    char *c_str  = Parrot_str_to_platform_cstring(interp, path);
    int   result = chdir(c_str);

    Parrot_str_free_cstring(c_str);

    if (result)
        THROW("chdir");
}

/*

=item C<void Parrot_file_rmdir(STRING *path, STRING *mode)>

Removes a directory specified by C<path>.

=cut

*/

void
Parrot_file_rmdir(PARROT_INTERP, ARGIN(STRING *path))
{
    char *c_str  = Parrot_str_to_platform_cstring(interp, path);
    int   result = rmdir(c_str);

    Parrot_str_free_cstring(c_str);

    if (result)
        THROW("rmdir");
}

/*

=item C<void Parrot_file_unlink(STRING *path, STRING *mode)>

Removes a directory specified by C<path>.

=cut

*/

void
Parrot_file_unlink(PARROT_INTERP, ARGIN(STRING *path))
{
    char *c_str  = Parrot_str_to_platform_cstring(interp, path);
    int   result = unlink(c_str);

    Parrot_str_free_cstring(c_str);

    if (result)
        THROW("unlink");
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

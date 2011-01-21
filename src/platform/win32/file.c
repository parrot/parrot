/*
Copyright (C) 2011, Parrot Foundation.

=head1 NAME

src/platform/win32/file.c - Win32 file functions

=head1 DESCRIPTION

This file implements OS-specific file functions for Win32 platforms.

=head2 Functions

=over 4

=cut

*/

#include <direct.h>
#include <io.h>
#include <tchar.h>
#include <windows.h>

#include "parrot/parrot.h"

#define THROW(msg) Parrot_ex_throw_from_c_args(interp, NULL, \
    EXCEPTION_EXTERNAL_ERROR, "%s: Error %d", msg, GetLastError())

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
    DWORD   len = GetCurrentDirectoryW(0, NULL);
    STRING *result;
    char   *c_str;

    if (!len)
        THROW("getcwd");

    c_str = mem_gc_allocate_n_typed(interp, (len + 1) * 2, char);
    len   = GetCurrentDirectoryW(len, (LPWSTR)c_str);

    if (!len) {
        mem_gc_free(interp, c_str);
        THROW("getcwd");
    }

    result = Parrot_str_new_init(interp, c_str, len * 2,
                    Parrot_utf16_encoding_ptr, 0);

    mem_gc_free(interp, c_str);

    return result;
}

/*

=item C<void Parrot_file_chdir(STRING *path, STRING *mode)>

Changes the current working directory to the one specified by C<path>.

=cut

*/

void
Parrot_file_chdir(PARROT_INTERP, ARGIN(STRING *path))
{
    char *c_str  = Parrot_str_to_encoded_cstring(interp, path,
                        Parrot_utf16_encoding_ptr);
    BOOL  result = SetCurrentDirectoryW((LPWSTR)c_str);

    Parrot_str_free_cstring(c_str);

    if (!result)
        THROW("chdir");
}

/*

=item C<void Parrot_file_mkdir(STRING *path, STRING *mode)>

Creates a directory specified by C<path> with mode C<mode>.

=cut

*/

void
Parrot_file_mkdir(PARROT_INTERP, ARGIN(STRING *path), INTVAL mode)
{
    char *c_str  = Parrot_str_to_encoded_cstring(interp, path,
                        Parrot_utf16_encoding_ptr);
    BOOL  result = CreateDirectoryW((LPWSTR)c_str, NULL);

    Parrot_str_free_cstring(c_str);

    if (!result)
        THROW("mkdir");
}

/*

=item C<void Parrot_file_rmdir(STRING *path, STRING *mode)>

Removes a directory specified by C<path>.

=cut

*/

void
Parrot_file_rmdir(PARROT_INTERP, ARGIN(STRING *path))
{
    char *c_str  = Parrot_str_to_encoded_cstring(interp, path,
                        Parrot_utf16_encoding_ptr);
    BOOL  result = RemoveDirectoryW((LPWSTR)c_str);

    Parrot_str_free_cstring(c_str);

    if (!result)
        THROW("rmdir");
}

/*

=item C<void Parrot_file_unlink(STRING *path, STRING *mode)>

Removes a file specified by C<path>.

=cut

*/

void
Parrot_file_unlink(PARROT_INTERP, ARGIN(STRING *path))
{
    char *c_str  = Parrot_str_to_encoded_cstring(interp, path,
                        Parrot_utf16_encoding_ptr);
    BOOL  result = DeleteFileW((LPWSTR)c_str);

    Parrot_str_free_cstring(c_str);

    if (!result)
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

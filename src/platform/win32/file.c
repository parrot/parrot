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
    EXCEPTION_EXTERNAL_ERROR, "%s failed: Error %d", (msg), GetLastError())

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static INTVAL by_handle_file_info_intval(PARROT_INTERP,
    ARGIN(BY_HANDLE_FILE_INFORMATION *file_info),
    INTVAL thing)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL file_attribute_intval(PARROT_INTERP,
    ARGIN(WIN32_FILE_ATTRIBUTE_DATA *attr_data),
    INTVAL thing)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL filetime_to_unix(ARGIN(FILETIME *file_time))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_by_handle_file_info_intval __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(file_info))
#define ASSERT_ARGS_file_attribute_intval __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(attr_data))
#define ASSERT_ARGS_filetime_to_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(file_time))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<STRING * Parrot_file_getcwd(PARROT_INTERP)>

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

=item C<void Parrot_file_chdir(PARROT_INTERP, STRING *path)>

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

=item C<void Parrot_file_mkdir(PARROT_INTERP, STRING *path, INTVAL mode)>

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

=item C<void Parrot_file_rmdir(PARROT_INTERP, STRING *path)>

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

=item C<void Parrot_file_unlink(PARROT_INTERP, STRING *path)>

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

=item C<static INTVAL filetime_to_unix(FILETIME *file_time)>

Converts a Win32 FILETIME to UNIX timestamp.

=cut

*/

static INTVAL
filetime_to_unix(ARGIN(FILETIME *file_time))
{
    ASSERT_ARGS(filetime_to_unix)
    LARGE_INTEGER large_int;

    large_int.HighPart = file_time->dwHighDateTime;
    large_int.LowPart  = file_time->dwLowDateTime;

    /* ((1970 - 1601) * 365 + 89) * (24 * 60 * 60) * (10 * 1000 * 1000) */
    large_int.QuadPart -= 116444736000000000LL;

    if (large_int.QuadPart <= 0)
        return 0;

    return (INTVAL)(large_int.QuadPart / 10000000);
}


/*

=item C<static INTVAL file_attribute_intval(PARROT_INTERP,
WIN32_FILE_ATTRIBUTE_DATA *attr_data, INTVAL thing)>

Returns a field from the WIN32_FILE_ATTRIBUTE_DATA struct as INTVAL.

=cut

*/

static INTVAL
file_attribute_intval(PARROT_INTERP,
        ARGIN(WIN32_FILE_ATTRIBUTE_DATA *attr_data), INTVAL thing)
{
    ASSERT_ARGS(file_attribute_intval)
    INTVAL result = -1;

    switch (thing) {
      case STAT_FILESIZE:
        /* TODO: 64 bit file size */
        result = attr_data->nFileSizeLow;
        break;
      case STAT_ISDIR:
        result = attr_data->dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY
               ? 1 : 0;
        break;
      case STAT_ISREG:
        result = attr_data->dwFileAttributes
               & (FILE_ATTRIBUTE_DIRECTORY | FILE_ATTRIBUTE_DEVICE)
               ? 0 : 1;
        break;
      case STAT_ISDEV:
        result = attr_data->dwFileAttributes & FILE_ATTRIBUTE_DEVICE
               ? 1 : 0;
        break;
      case STAT_CREATETIME:
        result = filetime_to_unix(&attr_data->ftCreationTime);
        break;
      case STAT_ACCESSTIME:
        result = filetime_to_unix(&attr_data->ftLastAccessTime);
        break;
      case STAT_MODIFYTIME:
        result = filetime_to_unix(&attr_data->ftLastWriteTime);
        break;
      case STAT_CHANGETIME:
        result = filetime_to_unix(&attr_data->ftLastWriteTime);
        break;
      default:
        break;
    }

    return result;
}

/*

=item C<INTVAL Parrot_file_stat_intval(PARROT_INTERP, STRING *file, INTVAL
thing)>

Returns the stat field given by C<thing> of file C<file>.

=cut

*/

INTVAL
Parrot_file_stat_intval(PARROT_INTERP, STRING *file, INTVAL thing)
{
    ASSERT_ARGS(stat_common)
    INTVAL result = -1;

    switch (thing) {
      case STAT_EXISTS:
      case STAT_FILESIZE:
      case STAT_ISDIR:
      case STAT_ISREG:
      case STAT_ISDEV:
      case STAT_CREATETIME:
      case STAT_ACCESSTIME:
      case STAT_MODIFYTIME:
      case STAT_CHANGETIME: {
            WIN32_FILE_ATTRIBUTE_DATA attr_data;
            char *c_str = Parrot_str_to_encoded_cstring(interp, file,
                                Parrot_utf16_encoding_ptr);
            BOOL  success;

            success = GetFileAttributesExW((LPWSTR)c_str,
                            GetFileExInfoStandard, &attr_data);

            Parrot_str_free_cstring(c_str);

            if (thing == STAT_EXISTS) {
                result = success;
            }
            else {
                if (!success)
                    THROW("stat");

                result = file_attribute_intval(interp, &attr_data, thing);
            }
        }
        break;
      case STAT_ISLNK:
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "STAT_ISLNK not supported");
        break;
      case STAT_BACKUPTIME:
        result = -1;
        break;
      case STAT_UID:
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "STAT_UID not supported");
        break;
      case STAT_GID:
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "STAT_GID not supported");
        break;
      case STAT_PLATFORM_DEV:
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "STAT_PLATFORM_DEV not supported");
        break;
      case STAT_PLATFORM_INODE:
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "STAT_PLATFORM_INODE not supported");
        break;
      case STAT_PLATFORM_MODE:
        result = 0777;
        break;
      case STAT_PLATFORM_NLINKS:
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "STAT_PLATFORM_NLINKS not supported");
        break;
      case STAT_PLATFORM_DEVTYPE:
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "STAT_PLATFORM_DEVTYPE not supported");
        break;
      case STAT_PLATFORM_BLOCKSIZE:
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "STAT_PLATFORM_BLOCKSIZE not supported");
        break;
      case STAT_PLATFORM_BLOCKS:
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "STAT_PLATFORM_BLOCKS not supported");
        break;
      default:
        break;
    }

    return result;
}

/*

=item C<INTVAL Parrot_file_lstat_intval(PARROT_INTERP, STRING *file, INTVAL
thing)>

Returns the lstat field given by C<thing> of file C<file>.

=cut

*/

INTVAL
Parrot_file_lstat_intval(PARROT_INTERP, STRING *file, INTVAL thing)
{
    return Parrot_file_stat_intval(interp, file, thing);
}

/*

=item C<static INTVAL by_handle_file_info_intval(PARROT_INTERP,
BY_HANDLE_FILE_INFORMATION *file_info, INTVAL thing)>

Returns a field from the BY_HANDLE_FILE_INFORMATION struct as INTVAL.

=cut

*/

static INTVAL
by_handle_file_info_intval(PARROT_INTERP,
        ARGIN(BY_HANDLE_FILE_INFORMATION *file_info), INTVAL thing)
{
    ASSERT_ARGS(by_handle_file_info_intval)
    INTVAL result = -1;

    switch (thing) {
      case STAT_FILESIZE:
        /* TODO: 64 bit file size */
        result = file_info->nFileSizeLow;
        break;
      case STAT_ISDIR:
        result = file_info->dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY
               ? 1 : 0;
        break;
      case STAT_ISREG:
        result = file_info->dwFileAttributes
               & (FILE_ATTRIBUTE_DIRECTORY | FILE_ATTRIBUTE_DEVICE)
               ? 0 : 1;
        break;
      case STAT_ISDEV:
        result = file_info->dwFileAttributes & FILE_ATTRIBUTE_DEVICE
               ? 1 : 0;
        break;
      case STAT_CREATETIME:
        result = filetime_to_unix(&file_info->ftCreationTime);
        break;
      case STAT_ACCESSTIME:
        result = filetime_to_unix(&file_info->ftLastAccessTime);
        break;
      case STAT_MODIFYTIME:
        result = filetime_to_unix(&file_info->ftLastWriteTime);
        break;
      case STAT_CHANGETIME:
        result = filetime_to_unix(&file_info->ftLastWriteTime);
        break;
      case STAT_PLATFORM_DEV:
        result = file_info->dwVolumeSerialNumber;
        break;
      case STAT_PLATFORM_INODE:
        result = file_info->nFileIndexLow;
        break;
      case STAT_PLATFORM_NLINKS:
        result = file_info->nNumberOfLinks;
        break;
      default:
        break;
    }

    return result;
}

/*

=item C<INTVAL Parrot_file_fstat_intval(PARROT_INTERP, PIOHANDLE os_handle,
INTVAL thing)>

Returns the fstat field given by C<thing> from file handle C<os_handle>.

=cut

*/

INTVAL
Parrot_file_fstat_intval(PARROT_INTERP, PIOHANDLE os_handle, INTVAL thing)
{
    ASSERT_ARGS(stat_common)
    INTVAL result = -1;

    if (thing == STAT_EXISTS)
        return 1;

    switch (thing) {
      case STAT_FILESIZE:
      case STAT_ISDIR:
      case STAT_ISREG:
      case STAT_ISDEV:
      case STAT_CREATETIME:
      case STAT_ACCESSTIME:
      case STAT_MODIFYTIME:
      case STAT_CHANGETIME:
      case STAT_PLATFORM_DEV:
      case STAT_PLATFORM_INODE:
      case STAT_PLATFORM_NLINKS: {
            BY_HANDLE_FILE_INFORMATION file_info;

            if (!GetFileInformationByHandle(os_handle, &file_info))
                THROW("fstat");

            result = by_handle_file_info_intval(interp, &file_info, thing);
        }
        break;
      case STAT_ISLNK:
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "STAT_ISLNK not supported");
        break;
      case STAT_BACKUPTIME:
        result = -1;
        break;
      case STAT_UID:
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "STAT_UID not supported");
        break;
      case STAT_GID:
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "STAT_GID not supported");
        break;
      case STAT_PLATFORM_MODE:
        result = 0777;
        break;
      case STAT_PLATFORM_DEVTYPE:
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "STAT_PLATFORM_DEVTYPE not supported");
        break;
      case STAT_PLATFORM_BLOCKSIZE:
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "STAT_PLATFORM_BLOCKSIZE not supported");
        break;
      case STAT_PLATFORM_BLOCKS:
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "STAT_PLATFORM_BLOCKS not supported");
        break;
      default:
        break;
    }

    return result;
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

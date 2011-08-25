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

#ifdef __MINGW32__
#  include <w32api.h>
#  if WINVER < Windows2000
#    error Minimum requirement for Parrot on Windows is Windows 2000 - might want to check windef.h
#  endif
#endif

#include <windows.h>
#include <wchar.h>
#include "parrot/parrot.h"
#include "../../io/io_private.h"
#include "path.h"

#ifdef __MSYS__
#define SLASH "/"
#else
#define SLASH "\\"
#endif

#define THROW(msg) Parrot_ex_throw_from_c_args(interp, NULL, \
    EXCEPTION_EXTERNAL_ERROR, "%s failed: %Ss", (msg), \
    Parrot_platform_strerror(interp, GetLastError()))

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

static void filetime_to_timespec(
    ARGIN(FILETIME *ft),
    ARGOUT(struct timespec *ts))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*ts);

static INTVAL filetime_to_unix(ARGIN(FILETIME *ft))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_by_handle_file_info_intval __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(file_info))
#define ASSERT_ARGS_file_attribute_intval __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(attr_data))
#define ASSERT_ARGS_filetime_to_timespec __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ft) \
    , PARROT_ASSERT_ARG(ts))
#define ASSERT_ARGS_filetime_to_unix __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ft))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<STRING * Parrot_file_getcwd(PARROT_INTERP)>

Returns the current working directory.

=cut

*/

PARROT_CANNOT_RETURN_NULL
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
    LPWSTR wp_path = PARROT_WIN32_PATH(interp, path);
    BOOL   result  = SetCurrentDirectoryW(wp_path);

    PARROT_WIN32_FREE_PATH(wp_path);

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
    LPWSTR wp_path = PARROT_WIN32_PATH(interp, path);
    BOOL   result  = CreateDirectoryW(wp_path, NULL);

    PARROT_WIN32_FREE_PATH(wp_path);

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
    LPWSTR wp_path = PARROT_WIN32_PATH(interp, path);
    BOOL   result  = RemoveDirectoryW(wp_path);

    PARROT_WIN32_FREE_PATH(wp_path);

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
    LPWSTR wp_path = PARROT_WIN32_PATH(interp, path);
    BOOL   result  = DeleteFileW(wp_path);

    PARROT_WIN32_FREE_PATH(wp_path);

    if (!result)
        THROW("unlink");
}

/*

=item C<static void filetime_to_timespec(FILETIME *ft, struct timespec *ts)>

Converts a Win32 FILETIME to a struct timespec.

=cut

*/

static void
filetime_to_timespec(ARGIN(FILETIME *ft), ARGOUT(struct timespec *ts))
{
    ASSERT_ARGS(filetime_to_timespec)
    LARGE_INTEGER large_int;

    large_int.HighPart = ft->dwHighDateTime;
    large_int.LowPart  = ft->dwLowDateTime;

    /*
     * A Windows FILETIME is the number of 100 nanosecond ticks since
     * January 1st, 1601. So the offset to the Unix epoch is
     * ((1970 - 1601) * 365 + 89) * (24 * 60 * 60) * (10 * 1000 * 1000)
     */
    large_int.QuadPart -= 116444736000000000LL;

    if (large_int.QuadPart <= 0) {
        /* A file time before the Unix epoch */
        ts->tv_sec  = 0;
        ts->tv_nsec = 0;
    }
    else {
        ts->tv_sec  = (time_t)(large_int.QuadPart / 10000000);
        ts->tv_nsec = 100 * (long)(large_int.QuadPart % 10000000);
    }
}

/*

=item C<static INTVAL filetime_to_unix(FILETIME *ft)>

Converts a Win32 FILETIME to UNIX timestamp.

=cut

*/

static INTVAL
filetime_to_unix(ARGIN(FILETIME *ft))
{
    ASSERT_ARGS(filetime_to_unix)
    struct timespec ts;

    filetime_to_timespec(ft, &ts);

    return (INTVAL)ts.tv_sec;
}

/*

=item C<void Parrot_file_stat(PARROT_INTERP, STRING *file, Parrot_Stat_Buf
*buf)>

Stats file C<file>.

=cut

*/

void
Parrot_file_stat(PARROT_INTERP, ARGIN(STRING *file),
        ARGOUT(Parrot_Stat_Buf *buf))
{
    WIN32_FILE_ATTRIBUTE_DATA attr_data;
    LPWSTR wp_file = PARROT_WIN32_PATH(interp, file);
    BOOL   success;
    INTVAL type;

    success = GetFileAttributesExW(wp_file,
                    GetFileExInfoStandard, &attr_data);

    PARROT_WIN32_FREE_PATH(wp_file);

    if (!success)
        THROW("stat");

    if (attr_data.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) {
        type = STAT_TYPE_DIRECTORY;
    }
    else if (attr_data.dwFileAttributes & FILE_ATTRIBUTE_DEVICE) {
        type = STAT_TYPE_DEVICE;
    }
    else {
        type = STAT_TYPE_FILE;
    }

    buf->type        = type;
    buf->size        = ((HUGEINTVAL)attr_data.nFileSizeHigh << 32)
                     | attr_data.nFileSizeLow;
    buf->uid         = 0;
    buf->gid         = 0;
    buf->dev         = 0;
    buf->inode       = 0;
    buf->mode        = 0777;
    buf->n_links     = 0;
    buf->block_size  = 0;
    buf->blocks      = (INTVAL)(buf->size / 512);

    filetime_to_timespec(&attr_data.ftCreationTime,   &buf->create_time);
    filetime_to_timespec(&attr_data.ftLastAccessTime, &buf->access_time);
    filetime_to_timespec(&attr_data.ftLastWriteTime,  &buf->modify_time);

    buf->change_time = buf->modify_time;
}

/*

=item C<void Parrot_file_lstat(PARROT_INTERP, STRING *file, Parrot_Stat_Buf
*buf)>

lstats file C<file>.

=cut

*/

void
Parrot_file_lstat(PARROT_INTERP, ARGIN(STRING *file),
        ARGOUT(Parrot_Stat_Buf *buf))
{
    Parrot_file_stat(interp, file, buf);
}

/*

=item C<void Parrot_file_fstat(PARROT_INTERP, PIOHANDLE os_handle,
Parrot_Stat_Buf *buf)>

fstats file C<file>.

=cut

*/

void
Parrot_file_fstat(PARROT_INTERP, PIOHANDLE os_handle,
        ARGOUT(Parrot_Stat_Buf *buf))
{
    BY_HANDLE_FILE_INFORMATION file_info;
    INTVAL type;

    if (!GetFileInformationByHandle(os_handle, &file_info))
        THROW("fstat");

    if (file_info.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) {
        type = STAT_TYPE_DIRECTORY;
    }
    else if (file_info.dwFileAttributes & FILE_ATTRIBUTE_DEVICE) {
        type = STAT_TYPE_DEVICE;
    }
    else {
        type = STAT_TYPE_FILE;
    }

    buf->type        = type;
    buf->size        = ((HUGEINTVAL)file_info.nFileSizeHigh << 32)
                     | file_info.nFileSizeLow;
    buf->uid         = 0;
    buf->gid         = 0;
    buf->dev         = file_info.dwVolumeSerialNumber;
    buf->inode       = ((HUGEINTVAL)file_info.nFileIndexHigh << 32)
                     | file_info.nFileIndexLow;
    buf->mode        = 0777;
    buf->n_links     = file_info.nNumberOfLinks;
    buf->block_size  = 0;
    buf->blocks      = (INTVAL)(buf->size / 512);

    filetime_to_timespec(&file_info.ftCreationTime,   &buf->create_time);
    filetime_to_timespec(&file_info.ftLastAccessTime, &buf->access_time);
    filetime_to_timespec(&file_info.ftLastWriteTime,  &buf->modify_time);

    buf->change_time = buf->modify_time;
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
            LPWSTR wp_path = PARROT_WIN32_PATH(interp, file);
            BOOL  success;

            success = GetFileAttributesExW(wp_path,
                            GetFileExInfoStandard, &attr_data);

            PARROT_WIN32_FREE_PATH(wp_path);

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
        Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
                "STAT_ISLNK not supported");
        break;
      case STAT_BACKUPTIME:
        result = -1;
        break;
      case STAT_UID:
        Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
                "STAT_UID not supported");
        break;
      case STAT_GID:
        Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
                "STAT_GID not supported");
        break;
      case STAT_PLATFORM_DEV:
        Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
                "STAT_PLATFORM_DEV not supported");
        break;
      case STAT_PLATFORM_INODE:
        Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
                "STAT_PLATFORM_INODE not supported");
        break;
      case STAT_PLATFORM_MODE:
        result = 0777;
        break;
      case STAT_PLATFORM_NLINKS:
        Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
                "STAT_PLATFORM_NLINKS not supported");
        break;
      case STAT_PLATFORM_DEVTYPE:
        Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
                "STAT_PLATFORM_DEVTYPE not supported");
        break;
      case STAT_PLATFORM_BLOCKSIZE:
        Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
                "STAT_PLATFORM_BLOCKSIZE not supported");
        break;
      case STAT_PLATFORM_BLOCKS:
        Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
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
        Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
                "STAT_ISLNK not supported");
        break;
      case STAT_BACKUPTIME:
        result = -1;
        break;
      case STAT_UID:
        Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
                "STAT_UID not supported");
        break;
      case STAT_GID:
        Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
                "STAT_GID not supported");
        break;
      case STAT_PLATFORM_MODE:
        result = 0777;
        break;
      case STAT_PLATFORM_DEVTYPE:
        Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
                "STAT_PLATFORM_DEVTYPE not supported");
        break;
      case STAT_PLATFORM_BLOCKSIZE:
        Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
                "STAT_PLATFORM_BLOCKSIZE not supported");
        break;
      case STAT_PLATFORM_BLOCKS:
        Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
                "STAT_PLATFORM_BLOCKS not supported");
        break;
      default:
        break;
    }

    return result;
}

/*

=item C<void Parrot_file_symlink(PARROT_INTERP, STRING *from, STRING *to)>

Creates a symlink

=cut

*/

typedef BOOLEAN (WINAPI *csl_func_t)(LPWSTR, LPWSTR, DWORD);

void
Parrot_file_symlink(PARROT_INTERP, ARGIN(STRING *from), ARGIN(STRING *to))
{
    static csl_func_t csl;
    static int        initialized = 0;

    LPWSTR  wp_from = PARROT_WIN32_PATH(interp, from);
    LPWSTR  wp_to   = PARROT_WIN32_PATH(interp, to);
    DWORD   attrs   = GetFileAttributesW(wp_from);
    BOOLEAN result  = 0; /* BOOLEAN, not BOOL */

    if (!initialized) {
        csl = (csl_func_t)GetProcAddress(GetModuleHandle(TEXT("kernel32.dll")),
                                "CreateSymbolicLinkW");
        initialized = 1;
    }

    if (csl == NULL)
        Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
                "CreateSymbolicLink not supported");

    if (attrs != INVALID_FILE_ATTRIBUTES) {
        DWORD flags = attrs & FILE_ATTRIBUTE_DIRECTORY
                    ? 0x1    /* SYMBOLIC_LINK_FLAG_DIRECTORY */
                    : 0x0;

        result = csl(wp_to, wp_from, flags);
    }

    PARROT_WIN32_FREE_PATH(wp_from);
    PARROT_WIN32_FREE_PATH(wp_to);

    if (!result)
        THROW("symlink");
}

/*

=item C<void Parrot_file_link(PARROT_INTERP, STRING *from, STRING *to)>

Creates a symlink

=cut

*/

void
Parrot_file_link(PARROT_INTERP, ARGIN(STRING *from), ARGIN(STRING *to))
{
    LPWSTR wp_from = PARROT_WIN32_PATH(interp, from);
    LPWSTR wp_to   = PARROT_WIN32_PATH(interp, to);
    BOOL   result  = CreateHardLinkW(wp_to, wp_from, NULL);

    PARROT_WIN32_FREE_PATH(wp_from);
    PARROT_WIN32_FREE_PATH(wp_to);

    if (!result)
        THROW("link");
}

/*

=item C<INTVAL Parrot_file_umask(PARROT_INTERP, INTVAL mask)>

Changes umask and return previous one

=cut

*/

INTVAL
Parrot_file_umask(PARROT_INTERP, INTVAL mask)
{
    Parrot_ex_throw_from_c_args(interp, NULL,
            EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
            "umask not implemented on Win32");
}

/*

=item C<void Parrot_file_chroot(PARROT_INTERP, STRING *path)>

Change root directory

=cut

*/

void
Parrot_file_chroot(PARROT_INTERP, ARGIN(STRING *path))
{
    Parrot_ex_throw_from_c_args(interp, NULL,
            EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
            "chroot not implemented on Win32");
}

/*

=item C<PMC * Parrot_file_readdir(PARROT_INTERP, STRING *path)>

Reads entries from a directory.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_file_readdir(PARROT_INTERP, ARGIN(STRING *path))
{
    PMC    *array = Parrot_pmc_new(interp, enum_class_ResizableStringArray);
    LPWSTR  wp_path;
    LPCSTR  suffix;
    INTVAL  last_char;
    HANDLE  handle;

    WIN32_FIND_DATAW find_data;

    /* Add \* to the directory name and start search. */
    last_char = STRING_ord(interp, path, -1);
    suffix    = last_char == '\\' || last_char == '/' ? "*" : SLASH "*";
    path      = Parrot_str_concat(interp, path,
                        string_from_literal(interp, suffix));
    wp_path   = PARROT_WIN32_PATH(interp, path);
    handle    = FindFirstFileW(wp_path, &find_data);

    PARROT_WIN32_FREE_PATH(wp_path);

    if (handle == INVALID_HANDLE_VALUE)
        THROW("readdir");

    /* Loop over all directories and add to result array. */
    do {
        STRING *entry = Parrot_str_new_init(interp, (char *)find_data.cFileName,
                            wcslen(find_data.cFileName) * 2,
                            Parrot_utf16_encoding_ptr, 0);

        VTABLE_push_string(interp, array, entry);
    } while (FindNextFileW(handle, &find_data) != 0);

    if (GetLastError() != ERROR_NO_MORE_FILES)
        THROW("readdir");

    FindClose(handle);

    return array;
}

/*

=item C<void Parrot_file_rename(PARROT_INTERP, STRING *from, STRING *to)>

Renames a file

=cut

*/

void
Parrot_file_rename(PARROT_INTERP, ARGIN(STRING *from), ARGIN(STRING *to))
{
    LPWSTR wp_from = PARROT_WIN32_PATH(interp, from);
    LPWSTR wp_to   = PARROT_WIN32_PATH(interp, to);
    BOOL   result  = MoveFileW(wp_from, wp_to);

    PARROT_WIN32_FREE_PATH(wp_from);
    PARROT_WIN32_FREE_PATH(wp_to);

    if (!result)
        THROW("rename");
}

/*

=item C<void Parrot_file_chmod(PARROT_INTERP, STRING *path, INTVAL mode)>

Changes permissions of file C<path>

=cut

*/

void
Parrot_file_chmod(PARROT_INTERP, ARGIN(STRING *path), INTVAL mode)
{
    Parrot_ex_throw_from_c_args(interp, NULL,
            EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
            "chmod not implemented on Win32");
}

/*

=item C<INTVAL Parrot_file_can_read(PARROT_INTERP, STRING *path)>

Tests whether a file can be read. TODO: We only check if the file exists
and don't look at the ACLs.

=cut

*/

INTVAL
Parrot_file_can_read(PARROT_INTERP, ARGIN(STRING *path))
{
    LPWSTR wp_path = PARROT_WIN32_PATH(interp, path);
    DWORD  attrs   = GetFileAttributesW(wp_path);

    PARROT_WIN32_FREE_PATH(wp_path);

    return attrs != INVALID_FILE_ATTRIBUTES;
}

/*

=item C<INTVAL Parrot_file_can_write(PARROT_INTERP, STRING *path)>

Tests whether a file can be read. TODO: We only check if the file exists
and is not read-only. We should look at the ACLs.


=cut

*/

INTVAL
Parrot_file_can_write(PARROT_INTERP, ARGIN(STRING *path))
{
    LPWSTR wp_path = PARROT_WIN32_PATH(interp, path);
    DWORD  attrs   = GetFileAttributesW(wp_path);

    PARROT_WIN32_FREE_PATH(wp_path);

    return attrs != INVALID_FILE_ATTRIBUTES
    &&    (attrs & FILE_ATTRIBUTE_READONLY) == 0;
}

/*

=item C<INTVAL Parrot_file_can_execute(PARROT_INTERP, STRING *path)>

Tests whether a file can be executed

=cut

*/

INTVAL
Parrot_file_can_execute(PARROT_INTERP, ARGIN(STRING *path))
{
    PMC * const    env         = Parrot_pmc_new(interp, enum_class_Env);
    STRING * const pathext_str = Parrot_str_new(interp, "PATHEXT", 7);
    STRING * const pathext_sep = Parrot_str_new(interp, ";", 1);
    STRING * const dot         = Parrot_str_new(interp, ".", 1);
    STRING * const pathext     = VTABLE_get_string_keyed_str(interp, env, pathext_str);
    PMC * const    pathext_pmc = Parrot_str_split(interp, pathext_sep, pathext);
    const INTVAL   elems       = VTABLE_elements(interp, pathext_pmc);
    INTVAL i;
    STRING *wo_stem = NULL;
    STRING *ext     = NULL;

    parrot_split_path_ext(interp, path, &wo_stem, &ext);
    if (STRING_IS_NULL(ext) || Parrot_str_length(interp, ext) == 0)
        return 0;
    ext = Parrot_str_upcase(interp, ext);
    ext = Parrot_str_concat(interp, dot, ext);

    for (i = 0; i < elems; i++) {
        STRING * const test_ext = VTABLE_get_string_keyed_int(interp, pathext_pmc, i);
        if (Parrot_str_equal(interp, ext, test_ext))
            return 1;
    }

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
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

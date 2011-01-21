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
    EXCEPTION_EXTERNAL_ERROR, "%s failed: %s", (msg), strerror(errno))

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static INTVAL stat_common(PARROT_INTERP,
    ARGIN(struct stat *statbuf),
    INTVAL thing,
    int status)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_stat_common __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(statbuf))
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

=item C<void Parrot_file_mkdir(PARROT_INTERP, STRING *path, INTVAL mode)>

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

=item C<void Parrot_file_chdir(PARROT_INTERP, STRING *path)>

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

=item C<void Parrot_file_rmdir(PARROT_INTERP, STRING *path)>

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

=item C<void Parrot_file_unlink(PARROT_INTERP, STRING *path)>

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

=item C<static INTVAL stat_common(PARROT_INTERP, struct stat *statbuf, INTVAL
thing, int status)>

Stats the file, and returns the information specified by C<thing>. C<thing> can
be one of:

=over 4

=item * C<STAT_EXISTS>

=item * C<STAT_FILESIZE>

=item * C<STAT_ISDIR>

=item * C<STAT_ISREG>

=item * C<STAT_ISDEV>

=item * C<STAT_ACCESSTIME>

=item * C<STAT_MODIFYTIME>

=item * C<STAT_CHANGETIME>

=item * C<STAT_UID>

=item * C<STAT_GID>

=item * C<STAT_PLATFORM_DEV>

=item * C<STAT_PLATFORM_INODE>

=item * C<STAT_PLATFORM_MODE>

=item * C<STAT_PLATFORM_NLINKS>

=item * C<STAT_PLATFORM_DEVTYPE>

=item * C<STAT_PLATFORM_MODE>

=item * C<STAT_PLATFORM_NLINKS>

=item * C<STAT_PLATFORM_DEVTYPE>

=item * C<STAT_PLATFORM_BLOCKSIZE>

=item * C<STAT_PLATFORM_BLOCKS>

=back

C<STAT_CREATETIME> and C<STAT_BACKUPTIME> are not supported and will return C<-1>.

=cut

*/

static INTVAL
stat_common(PARROT_INTERP, ARGIN(struct stat *statbuf), INTVAL thing, int status)
{
    ASSERT_ARGS(stat_common)
    INTVAL result = -1;

    if (thing == STAT_EXISTS)
        return status == 0;

    if (status)
        THROW("stat");

    switch (thing) {
      case STAT_FILESIZE:
        result = statbuf->st_size;
        break;
      case STAT_ISDIR:
        result = S_ISDIR(statbuf->st_mode);
        break;
      case STAT_ISREG:
        result = S_ISREG(statbuf->st_mode);
        break;
      case STAT_ISDEV:
        result = S_ISCHR(statbuf->st_mode) || S_ISBLK(statbuf->st_mode);
        break;
      case STAT_ISLNK:
#ifdef S_ISLNK
        result = S_ISLNK(statbuf->st_mode);
#else
        result = 0;
#endif
        break;
      case STAT_CREATETIME:
        result = -1;
        break;
      case STAT_ACCESSTIME:
        result = statbuf->st_atime;
        break;
      case STAT_MODIFYTIME:
        result = statbuf->st_mtime;
        break;
      case STAT_CHANGETIME:
        result = statbuf->st_ctime;
        break;
      case STAT_BACKUPTIME:
        result = -1;
        break;
      case STAT_UID:
        result = statbuf->st_uid;
        break;
      case STAT_GID:
        result = statbuf->st_gid;
        break;
      case STAT_PLATFORM_DEV:
        result = statbuf->st_dev;
        break;
      case STAT_PLATFORM_INODE:
        result = statbuf->st_ino;
        break;
      case STAT_PLATFORM_MODE:
        result = statbuf->st_mode;
        break;
      case STAT_PLATFORM_NLINKS:
        result = statbuf->st_nlink;
        break;
      case STAT_PLATFORM_DEVTYPE:
        result = statbuf->st_rdev;
        break;
      case STAT_PLATFORM_BLOCKSIZE:
#ifdef PARROT_HAS_BSD_STAT_EXTN
        result = statbuf->st_blksize;
#else
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "STAT_PLATFORM_BLOCKSIZE not supported");
#endif
        break;
      case STAT_PLATFORM_BLOCKS:
#ifdef PARROT_HAS_BSD_STAT_EXTN
        result = statbuf->st_blocks;
#else
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "STAT_PLATFORM_BLOCKS not supported");
#endif
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
    struct stat statbuf;

    /* Get the name of the file as something we can use */
    char * const filename = Parrot_str_to_cstring(interp, file);

    /* Everything needs the result of stat, so just go do it */
    const int status = stat(filename, &statbuf);
    Parrot_str_free_cstring(filename);
    return stat_common(interp, &statbuf, thing, status);
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
    struct stat statbuf;

    /* Get the name of the file as something we can use */
    char * const filename = Parrot_str_to_cstring(interp, file);

    /* Everything needs the result of stat, so just go do it */
    const int status = lstat(filename, &statbuf);
    Parrot_str_free_cstring(filename);
    return stat_common(interp, &statbuf, thing, status);
}

/*

=item C<INTVAL Parrot_file_fstat_intval(PARROT_INTERP, PIOHANDLE file, INTVAL
thing)>

Returns the fstat field given by C<thing> from file handle C<file>.

=cut

*/

INTVAL
Parrot_file_fstat_intval(PARROT_INTERP, PIOHANDLE file, INTVAL thing)
{
    struct stat statbuf;
    int status;

    /* Everything needs the result of stat, so just go do it */
    status = fstat(file, &statbuf);
    return stat_common(interp, &statbuf, thing, status);
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

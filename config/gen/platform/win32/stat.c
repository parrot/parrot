/*
 * $Id$
 * Copyright (C) 2007-2008, Parrot Foundation.
 */

/*

=head1 NAME

config/gen/platform/win32/stat.c

=head1 DESCRIPTION

File stat stuff

=head2 Functions

=over 4

=cut

*/


/*

=item C<PMC * Parrot_stat_file(PARROT_INTERP, STRING *filename)>

Stat a file. On Win32 this is not yet implemented, so we return a
C<NULL> PMC, not C<PMCNULL>.

=cut

*/

PMC *
Parrot_stat_file(PARROT_INTERP, STRING *filename)
{
    return NULL;
}

/*

=item C<PMC * Parrot_stat_info_pmc(PARROT_INTERP, STRING *filename, INTVAL
thing)>

Return stat info on a file as a PMC. Not implemented on Win32, so we
return C<NULL>, not C<PMCNULL>.

=cut

*/

PMC *
Parrot_stat_info_pmc(PARROT_INTERP, STRING *filename, INTVAL thing)
{
    return NULL;
}

/*

=item C<static INTVAL stat_common(PARROT_INTERP, struct stat *statbuf, INTVAL
thing, int status)>

Stats the file, and returns the information specified by C<thing>. C<thing> can
be one of: C<STAT_EXISTS>, C<STAT_FILESIZE>, C<STAT_ISDIR>, C<STAT_ISDEV>,
C<STAT_ACCESSTIME>, C<STAT_MODIFYTIME>, C<STAT_CHANGETIME>, C<STAT_UID>,
C<STAT_GID>, C<STAT_PLATFORM_DEV>, C<STAT_PLATFORM_INODE>,
C<STAT_PLATFORM_NLINKS>, C<STAT_PLATFORM_DEVTYPE>.

C<STAT_BACKUPTIME> and C<STAT_CREATETIME> are not supported on Win32, so will
return -1.

C<STAT_PLATFORM_BLOCKS> and C<STAT_PLATFORM_BLOCKSIZE> are not supported by
Win32 and will throw an exception.

=cut

*/

static INTVAL
stat_common(PARROT_INTERP, struct stat *statbuf, INTVAL thing, int status)
{
    INTVAL result = -1;

    if (thing == STAT_EXISTS)
        return status == 0;

    if (status == -1) {
        const char *err = strerror(errno);
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
            "stat failed: %s", err);
    }

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

=item C<INTVAL Parrot_stat_info_intval(PARROT_INTERP, STRING *file, INTVAL
thing)>

Returns the stat field given by C<thing> of file C<file>.

=cut

*/

INTVAL
Parrot_stat_info_intval(PARROT_INTERP, STRING *file, INTVAL thing)
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

=item C<INTVAL Parrot_fstat_info_intval(PARROT_INTERP, INTVAL file, INTVAL
thing)>

Returns the fstat field given by C<thing> from file identifier C<file>.

=cut

*/

INTVAL
Parrot_fstat_info_intval(PARROT_INTERP, INTVAL file, INTVAL thing)
{
    struct stat statbuf;
    int status;

    /* Everything needs the result of stat, so just go do it */
    status = fstat(file, &statbuf);
    return stat_common(interp, &statbuf, thing, status);
}

/*

=item C<FLOATVAL Parrot_stat_info_floatval(PARROT_INTERP, STRING *filename,
INTVAL thing)>

Currently returns C<-1.0> and has no side effects.

=cut

*/

FLOATVAL
Parrot_stat_info_floatval(PARROT_INTERP, STRING *filename, INTVAL thing)
{
    return (FLOATVAL)-1;
}

/*

=item C<STRING * Parrot_stat_info_string(PARROT_INTERP, STRING *filename, INTVAL
thing)>

Not implemented. Returns C<NULL>.

=cut

*/

STRING *
Parrot_stat_info_string(PARROT_INTERP, STRING *filename, INTVAL thing)
{
    return NULL;
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

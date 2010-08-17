/*
 * $Id$
 * Copyright (C) 2007-2010, Parrot Foundation.
 */

/*

=head1 NAME

config/gen/platform/generic/stat.c

=head1 DESCRIPTION

File stat stuff

=head2 Functions

=over 4

=cut

*/


/*

=item C<PMC * Parrot_stat_file(PARROT_INTERP, STRING *filename)>

B<Not implemented.>  Returns C<NULL>.

=cut

*/

PMC *
Parrot_stat_file(SHIM_INTERP, SHIM(STRING *filename))
{
    return NULL;
}

/*

=item C<PMC * Parrot_stat_info_pmc(PARROT_INTERP, STRING *filename, INTVAL
thing)>

B<Not implemented.>  Returns C<NULL>.

=cut

*/

PMC *
Parrot_stat_info_pmc(SHIM_INTERP, SHIM(STRING *filename), SHIM(INTVAL thing))
{
    return NULL;
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
stat_common(PARROT_INTERP, struct stat *statbuf, INTVAL thing, int status)
{
    INTVAL result = -1;

    if (thing == STAT_EXISTS)
        return status == 0;

    if (status == -1) {
        const char *err = strerror(errno);
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_EXTERNAL_ERROR,
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
        result = statbuf->st_blksize;
        break;
      case STAT_PLATFORM_BLOCKS:
        result = statbuf->st_blocks;
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
Parrot_stat_info_floatval(SHIM_INTERP, SHIM(STRING *filename), SHIM(INTVAL thing))
{
    return (FLOATVAL)-1;
}

/*

=item C<STRING * Parrot_stat_info_string(PARROT_INTERP, STRING *filename, INTVAL
thing)>

B<Not implemented.> Returns C<NULL>.

=cut

*/

STRING *
Parrot_stat_info_string(SHIM_INTERP, SHIM(STRING *filename), SHIM(INTVAL thing))
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

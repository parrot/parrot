/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

/*

=head1 NAME

config\gen\platform\win32\stat.c

=head1 DESCRIPTION

File stat stuff

=head2 Functions

=over 4

=cut

*/

/*

=item C<PMC * Parrot_stat_file(Parrot_Interp interp, STRING *filename)>

RT#48260: Not yet documented!!!

=cut

*/

PMC *
Parrot_stat_file(Parrot_Interp interp, STRING *filename)
{
  return NULL;
}

/*

=item C<PMC *
Parrot_stat_info_pmc(Parrot_Interp interp, STRING *filename, INTVAL thing)>

RT#48260: Not yet documented!!!

=cut

*/

PMC *
Parrot_stat_info_pmc(Parrot_Interp interp, STRING *filename, INTVAL thing)
{
  return NULL;
}

/*

=item C<INTVAL
Parrot_stat_info_intval(Parrot_Interp interp, STRING *file, INTVAL thing)>

RT#48260: Not yet documented!!!

=cut

*/

INTVAL
Parrot_stat_info_intval(Parrot_Interp interp, STRING *file, INTVAL thing)
{
  struct stat statbuf;
  char *filename;
  INTVAL result = -1;
  int status;

  /* Get the name of the file as something we can use */
  filename = string_to_cstring(interp, file);

  /* Everything needs the result of stat, so just go do it */
  status = stat(filename, &statbuf);

  switch (thing) {
  case STAT_EXISTS:
    result = (status == 0);
    break;
  case STAT_FILESIZE:
    result = statbuf.st_size;
    break;
  case STAT_ISDIR:
    result = S_ISDIR(statbuf.st_mode);
    break;
  case STAT_ISDEV:
    result = S_ISCHR(statbuf.st_mode) || S_ISBLK(statbuf.st_mode);
    break;
  case STAT_CREATETIME:
    result = -1;
    break;
  case STAT_ACCESSTIME:
    result = (INTVAL)statbuf.st_atime;
    break;
  case STAT_MODIFYTIME:
    result = (INTVAL)statbuf.st_mtime;
    break;
  case STAT_CHANGETIME:
    result = (INTVAL)statbuf.st_ctime;
    break;
  case STAT_BACKUPTIME:
    result = -1;
    break;
  case STAT_UID:
    result = statbuf.st_uid;
    break;
  case STAT_GID:
    result = statbuf.st_gid;
    break;
  case STAT_PLATFORM_DEV:
    result = statbuf.st_dev;
    break;
  case STAT_PLATFORM_INODE:
    result = statbuf.st_ino;
    break;
  case STAT_PLATFORM_MODE:
    result = statbuf.st_mode;
    break;
  case STAT_PLATFORM_NLINKS:
    result = statbuf.st_nlink;
    break;
  case STAT_PLATFORM_DEVTYPE:
    result = statbuf.st_rdev;
    break;
  case STAT_PLATFORM_BLOCKSIZE:
    real_exception(interp, NULL, 1, "STAT_PLATFORM_BLOCKSIZE not supported");
    break;
  case STAT_PLATFORM_BLOCKS:
    real_exception(interp, NULL, 1, "STAT_PLATFORM_BLOCKS not supported");
    break;
  default:
    break;
  }

  string_cstring_free(filename);
  return result;
}

/*

=item C<INTVAL
Parrot_fstat_info_intval(Parrot_Interp interp, INTVAL file, INTVAL thing)>

RT#48260: Not yet documented!!!

=cut

*/

INTVAL
Parrot_fstat_info_intval(Parrot_Interp interp, INTVAL file, INTVAL thing)
{
  struct stat statbuf;
  INTVAL result = -1;
  int status;

  /* Everything needs the result of stat, so just go do it */
  status = fstat(file, &statbuf);

  switch (thing) {
  case STAT_EXISTS:
    result = (status == 0);
    break;
  case STAT_FILESIZE:
    result = statbuf.st_size;
    break;
  case STAT_ISDIR:
    result = S_ISDIR(statbuf.st_mode);
    break;
  case STAT_ISDEV:
    result = S_ISCHR(statbuf.st_mode) || S_ISBLK(statbuf.st_mode);
    break;
  case STAT_CREATETIME:
    result = -1;
    break;
  case STAT_ACCESSTIME:
    result = (INTVAL)statbuf.st_atime;
    break;
  case STAT_MODIFYTIME:
    result = (INTVAL)statbuf.st_mtime;
    break;
  case STAT_CHANGETIME:
    result = (INTVAL)statbuf.st_ctime;
    break;
  case STAT_BACKUPTIME:
    result = -1;
    break;
  case STAT_UID:
    result = statbuf.st_uid;
    break;
  case STAT_GID:
    result = statbuf.st_gid;
    break;
  case STAT_PLATFORM_DEV:
    result = statbuf.st_dev;
    break;
  case STAT_PLATFORM_INODE:
    result = statbuf.st_ino;
    break;
  case STAT_PLATFORM_MODE:
    result = statbuf.st_mode;
    break;
  case STAT_PLATFORM_NLINKS:
    result = statbuf.st_nlink;
    break;
  case STAT_PLATFORM_DEVTYPE:
    result = statbuf.st_rdev;
    break;
  case STAT_PLATFORM_BLOCKSIZE:
    real_exception(interp, NULL, 1, "STAT_PLATFORM_BLOCKSIZE not supported");
    break;
  case STAT_PLATFORM_BLOCKS:
    real_exception(interp, NULL, 1, "STAT_PLATFORM_BLOCKS not supported");
    break;
  default:
    break;
  }

  return result;
}

/*

=item C<FLOATVAL
Parrot_stat_info_floatval(Parrot_Interp interp, STRING *filename, INTVAL thing)>

RT#48260: Not yet documented!!!

=cut

*/

FLOATVAL
Parrot_stat_info_floatval(Parrot_Interp interp, STRING *filename, INTVAL thing)
{
  return -1;
}

/*

=item C<STRING *
Parrot_stat_info_string(Parrot_Interp interp, STRING *filename, INTVAL thing)>

RT#48260: Not yet documented!!!

=cut

*/

STRING *
Parrot_stat_info_string(Parrot_Interp interp, STRING *filename, INTVAL thing)
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

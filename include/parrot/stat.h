/* stat.h
 *  Copyright (C) 2001-2008, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the api header for abstracting stat calls
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_STAT_H_GUARD
#define PARROT_STAT_H_GUARD

#include "parrot/config.h"

/* &gen_from_def(stat.pasm) */

#define STAT_EXISTS               0
#define STAT_FILESIZE             1
#define STAT_ISDIR                2
#define STAT_ISREG                3
#define STAT_ISDEV                4
#define STAT_CREATETIME           5
#define STAT_ACCESSTIME           6
#define STAT_MODIFYTIME           7
#define STAT_CHANGETIME           8
#define STAT_BACKUPTIME           9
#define STAT_UID                 10
#define STAT_GID                 11
#define STAT_PLATFORM_DEV        -1
#define STAT_PLATFORM_INODE      -2
#define STAT_PLATFORM_MODE       -3
#define STAT_PLATFORM_NLINKS     -4
#define STAT_PLATFORM_DEVTYPE    -5
#define STAT_PLATFORM_BLOCKSIZE  -6
#define STAT_PLATFORM_BLOCKS     -7

/* &end_gen */

PARROT_EXPORT PMC *Parrot_stat_file(Parrot_Interp, STRING *);
PARROT_EXPORT PMC *Parrot_stat_info_pmc(Parrot_Interp, STRING *, INTVAL);
PARROT_EXPORT STRING *Parrot_stat_info_string(Parrot_Interp, STRING *, INTVAL);
PARROT_EXPORT INTVAL Parrot_stat_info_intval(Parrot_Interp, STRING *, INTVAL);
PARROT_EXPORT INTVAL Parrot_fstat_info_intval(Parrot_Interp, INTVAL, INTVAL);
PARROT_EXPORT FLOATVAL Parrot_stat_info_floatval(Parrot_Interp, STRING *, INTVAL);

#endif /* PARROT_STAT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

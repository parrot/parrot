/* string.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api header for the string subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_STAT_H_GUARD)
#define PARROT_STAT_H_GUARD

#include "parrot/config.h"

/* &gen_from_def(stat.pasm) */

#define STAT_EXISTS     0
#define STAT_FILESIZE   1
#define STAT_ISDIR      2
#define STAT_ISDEV      3
#define STAT_CREATETIME 4
#define STAT_ACCESSTIME 5
#define STAT_MODIFYTIME 6
#define STAT_CHANGETIME 7
#define STAT_BACKUPTIME 8
#define STAT_UID        9
#define STAT_GID        10
#define STAT_PLATFORM_DEV -1
#define STAT_PLATFORM_INODE -2
#define STAT_PLATFORM_MODE -3
#define STAT_PLATFORM_NLINKS -4
#define STAT_PLATFORM_DEVTYPE -5
#define STAT_PLATFORM_BLOCKSIZE -6
#define STAT_PLATFORM_BLOCKS -7

/* &end_gen */

PMC *Parrot_stat_file(Parrot_Interp, STRING *);
PMC *Parrot_stat_info_pmc(Parrot_Interp, STRING *, INTVAL);
STRING *Parrot_stat_info_string(Parrot_Interp, STRING *, INTVAL);
INTVAL Parrot_stat_info_intval(Parrot_Interp, STRING *, INTVAL);
INTVAL Parrot_fstat_info_intval(Parrot_Interp, INTVAL, INTVAL);
FLOATVAL Parrot_stat_info_floatval(Parrot_Interp, STRING *, INTVAL);

#endif /* PARROT_STRING_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

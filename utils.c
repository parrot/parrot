/*  utils.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Some utility functions
 *  Data Structure and Algorithms:
 *  History:
 *     Initial version by leo 2003.09.09
 *  Notes:
 *     Prototypes are in misc.h
 *  References:
 */

#include "parrot/parrot.h"

/*
 * s. the comments in math.ops
 */

INTVAL
intval_mod(INTVAL i2, INTVAL i3)
{
    INTVAL y;
    INTVAL z = i3;
    int s = 0;
    INTVAL r;

    if (z == 0)
	return i2;

    y = i2;

    if (y < 0) { s += 2; y = -y; }
    if (z < 0) { s += 1; z = -z; }

    r = y % z;

    switch (s) {
	case 0 + 0:            break;
	case 0 + 1: r = r - z; break;
	case 2 + 0: r = z - r; break;
	case 2 + 1: r = -r;    break;
    }

    return r;
}

FLOATVAL
floatval_mod(FLOATVAL n2, FLOATVAL n3)
{
#ifdef __LCC__

  /* Another workaround for buggy code generation in the lcc compiler-
   * adding a temporary variable makes it pass the test.
   */
  FLOATVAL temp = n3 * floor(n2 / n3);

  return n3
     ? (n2 - temp)
     : n2;
#else
  return n3
     ? (n2 - n3 * floor(n2 / n3))
     : n2;
#endif
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */

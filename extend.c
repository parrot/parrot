/* embed.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     The Parrot extension interface. These are the functions that
 *     parrot extensions (i.e. parrot subroutines written in C, or
 *     some other compiled language, rather than in parrot bytecode)
 *     may access. 
 *
 *     There is a deliberate distancing from the internals here. Don't
 *     go peeking inside -- you've as much access as bytecode does,
 *     but no more, so we can provide backwards compatibility for as
 *     long as we possibly can.
 *  Data Structure and Algorithms:
 *     See include/parrot/extend.h and docs/extend.pod.
 *  History:
 *     Initial version by Dan Sugalski
 *  Notes:
 *  References:
 */


#include "parrot/parrot.h"
#include "parrot/extend.h"

/*=for api extend Parrot_PMC_get_string
 *
 * Return an opaque string that represents the string contained in the
 * PMC.
 */

Parrot_STRING Parrot_PMC_get_string(Parrot_INTERP interp, Parrot_PMC pmc) {
  return VTABLE_get_string(interp, pmc);
}

/*=for api extend Parrot_PMC_get_intval
 *
 * Return the signed integer value of the value in the PMC
 */

Parrot_Int Parrot_PMC_get_intval(Parrot_INTERP interp, Parrot_PMC pmc) {
  return VTABLE_get_integer(interp, pmc);
}

/*=for api extend Parrot_PMC_get_numval
 *
 * Return the floating-point value of the PMC
 */

Parrot_Float Parrot_PMC_get_numval(Parrot_INTERP interp, Parrot_PMC pmc) {
  return VTABLE_get_number(interp, pmc);
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

/*
 * $Id$
 * Copyright (C) 2001-2007, The Perl Foundation.
 */

/*
** interp_guts.h
*/

#ifndef PARROT_INTERP_GUTS_H_GUARD
#define PARROT_INTERP_GUTS_H_GUARD

#  define DO_OP(PC, INTERP) ((PC) = (((INTERP)->op_func_table)[*(PC)])((PC), (INTERP)))

#endif /* PARROT_INTERP_GUTS_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

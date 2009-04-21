/* runcore_api.h
 *  Copyright (C) 2001-2009, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Functions and macros to dispatch opcodes.
 */

#ifndef PARROT_RUNCORE_API_H_GUARD
#define PARROT_RUNCORE_API_H_GUARD

#  define DO_OP(PC, INTERP) ((PC) = (((INTERP)->op_func_table)[*(PC)])((PC), (INTERP)))

#endif /* PARROT_RUNCORE_API_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

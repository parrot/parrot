/* extend.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the Parrot extension mechanism, the face we present to
 *     extension modules and whatnot
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 *      extend.c, docs/extend.pod.
 */

#if !defined(PARROT_EXTEND_H_GUARD)
#define PARROT_EXTEND_H_GUARD

#include "parrot/config.h"      /* PARROT_VERSION, PARROT_JIT_CAPABLE... */
#include "parrot/interpreter.h" /* give us the interpreter flags */
#include "parrot/warnings.h"    /* give us the warnings flags    */

typedef void * Parrot_INTERP;
typedef void * Parrot_STRING;
typedef void * Parrot_PMC;
typedef INTVAL Parrot_INTVAL;
typedef NUMVAL Parrot_NUMVAL;

Parrot_STRING Parrot_PMC_get_string(Parrot_INTERP, Parrot_PMC);
Parrot_INTVAL Parrot_PMC_get_intval(Parrot_INTERP, Parrot_PMC);
Parrot_NUMVAL Parrot_PMC_get_numval(Parrot_INTERP, Parrot_PMC);
char *Parrot_PMC_get_cstring(Parrot_INTERP, Parrot_PMC);
char *Parrot_PMC_get_cstringn(Parrot_INTERP, Parrot_PMC, Parrot_INTVAL *);

void Parrot_PMC_set_string(Parrot_INTERP, Parrot_PMC, Parrot_STRING);
void Parrot_PMC_set_cstring(Parrot_INTERP, Parrot_PMC, char *);
void Parrot_PMC_set_cstringn(Parrot_INTERP, Parrot_PMC, char *, Parrot_INTVAL);
void Parrot_PMC_set_intval(Parrot_INTERP, Parrot_PMC, Parrot_INTVAL);
void Parrot_PMC_set_numval(Parrot_INTERP, Parrot_PMC, Parrot_NUMVAL);

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */

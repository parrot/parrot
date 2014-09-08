/* namealias.h
Copyright (C) 2014, Parrot Foundation.

gperf generated icu control character namealias lookup

*/

#ifndef PARROT_NAMEALIAS_H_GUARD
#define PARROT_NAMEALIAS_H_GUARD

#include "parrot/parrot.h"

#ifdef PARROT_IN_CORE

/* HEADERIZER STOP */

struct Parrot_namealias { int name; const INTVAL codepoint; };

const struct Parrot_namealias *
Parrot_namealias_lookup(register const char *str, register unsigned int len);

#endif /* PARROT_IN_CORE */
#endif /* PARROT_NAMEALIAS_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

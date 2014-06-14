/* namealias.h
 Copyright (C) 2014, Parrot Foundation.

 gperf generated icu control character namealias lookup

=item C<struct Parrot_namealias>

Generated hash table with name and key.

=cut
*/

#ifndef PARROT_NAMEALIAS_H_GUARD
#define PARROT_NAMEALIAS_H_GUARD

#include "parrot/config.h"

#ifdef PARROT_IN_CORE

struct Parrot_namealias { int name; const int key; };

PARROT_INLINE
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

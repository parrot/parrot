/* embed.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the Parrot embedding system--the only part of Parrot that
 *     the outside world should see.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_EMBED_H_GUARD)
#define PARROT_EMBED_H_GUARD

#include "parrot/config.h"      /* PARROT_VERSION, PARROT_JIT_CAPABLE... */
#include "parrot/interpreter.h" /* give us the interpreter flags */
#include "parrot/warnings.h"    /* give us the warnings flags    */

typedef int Parrot_flag;
typedef int Parrot_warnclass;
typedef void * Parrot_flag_val;

Parrot Parrot_new(void);

void Parrot_init(Parrot);

void Parrot_setflag(Parrot, Parrot_flag, Parrot_flag_val);

void Parrot_setwarnings(Parrot, Parrot_warnclass);

Parrot_PackFile Parrot_readbc(Parrot, char *);

void Parrot_setwarnings(Parrot, Parrot_warnclass);

void Parrot_loadbc(Parrot, Parrot_PackFile);

void Parrot_runcode(Parrot, int argc, char *argv[]);

void Parrot_destroy(Parrot);

#endif

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

#include "parrot/config.h"		/* PARROT_VERSION, PARROT_JIT_CAPABLE... */
#include "parrot/interpreter.h" /* give us the interpreter flags */
#include "parrot/warnings.h"	/* give us the warnings flags    */

typedef int Parrot_flag;
typedef int Parrot_warnclass;
typedef void * Parrot_flag_val;


/* These two are basically Magic Cookies to the outside world. */
struct Parrot_Interp;
struct PackFile;

struct Parrot_Interp *Parrot_new(void);

void Parrot_init(struct Parrot_Interp *);

void Parrot_setflag(struct Parrot_Interp *, Parrot_flag, Parrot_flag_val);

void Parrot_setwarnings(struct Parrot_Interp *, Parrot_warnclass);

struct PackFile * Parrot_readbc(struct Parrot_Interp *, char *);

void Parrot_loadbc(struct Parrot_Interp *, struct PackFile *);

void Parrot_runcode(struct Parrot_Interp *, int argc, char *argv[]);

void Parrot_destroy(struct Parrot_Interp *);

#endif

/* embed.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the Parrot embedding system--the only part of Parrot that
 *     the outside world should see.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 *      embed.c, docs/embed.pod.
 */

#if !defined(PARROT_EMBED_H_GUARD)
#define PARROT_EMBED_H_GUARD

#include "parrot/config.h"      /* PARROT_VERSION, PARROT_JIT_CAPABLE... */
#include "parrot/interpreter.h" /* give us the interpreter flags */
#include "parrot/warnings.h"    /* give us the warnings flags    */

typedef int Parrot_warnclass;
typedef void *Parrot_Interp_flag_val;

Parrot_Interp Parrot_new(void);

void Parrot_init(Parrot_Interp, void*);

void Parrot_setflag(Parrot_Interp, Parrot_Interp_flag, Parrot_Interp_flag_val);

void Parrot_setwarnings(Parrot_Interp, Parrot_warnclass);

Parrot_PackFile Parrot_readbc(Parrot_Interp, char *);

void Parrot_loadbc(Parrot_Interp, Parrot_PackFile);

void Parrot_setup_argv(Parrot_Interp, int argc, char ** argv);

void Parrot_setup_opt(Parrot_Interp, int n, char *argv);

void Parrot_runcode(Parrot_Interp, int argc, char *argv[]);

void Parrot_destroy(Parrot_Interp);

void Parrot_debug(Parrot_Interp, int argc, char ** argv);

void Parrot_disassemble(Parrot_Interp);

void Parrot_exit(int status);

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

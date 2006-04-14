/* embed.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  SVN Info
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

PARROT_API Parrot_Interp Parrot_new(Parrot_Interp parent);

/* XXX Parrot_init() should be removed, no longer required for embedders */
PARROT_API void Parrot_init(Parrot_Interp);
PARROT_API void Parrot_init_stacktop(Parrot_Interp, void *);

PARROT_API void Parrot_set_flag(Parrot_Interp, Parrot_Interp_flag);
PARROT_API void Parrot_clear_flag(Parrot_Interp, Parrot_Interp_flag);
PARROT_API Parrot_Int Parrot_test_flag(Parrot_Interp, Parrot_Interp_flag);

PARROT_API void Parrot_set_trace(Parrot_Interp, Parrot_UInt);
PARROT_API void Parrot_clear_trace(Parrot_Interp, Parrot_UInt);
PARROT_API Parrot_UInt Parrot_test_trace(Parrot_Interp, Parrot_UInt);

PARROT_API void Parrot_set_debug(Parrot_Interp, Parrot_UInt);
PARROT_API void Parrot_clear_debug(Parrot_Interp, Parrot_UInt);
PARROT_API Parrot_UInt Parrot_test_debug(Parrot_Interp, Parrot_UInt);

PARROT_API void Parrot_set_run_core( Parrot_Interp, Parrot_Run_core_t core);

PARROT_API void Parrot_setwarnings(Parrot_Interp, Parrot_warnclass);

PARROT_API Parrot_PackFile Parrot_readbc(Parrot_Interp, const char *);

PARROT_API void Parrot_loadbc(Parrot_Interp, Parrot_PackFile);

PARROT_API void Parrot_setup_argv(Parrot_Interp, int argc, char ** argv);

PARROT_API void Parrot_setup_opt(Parrot_Interp, int n, char *argv);

PARROT_API void Parrot_runcode(Parrot_Interp, int argc, char *argv[]);

PARROT_API void Parrot_destroy(Parrot_Interp);

PARROT_API Parrot_Opcode * Parrot_debug(Parrot_Interp, Parrot_Opcode* pc);

PARROT_API void Parrot_disassemble(Parrot_Interp);

PARROT_API void Parrot_exit(int status);

PARROT_API void Parrot_run_native(Parrot_Interp interpreter, native_func_t func);

/* Parrot_set_config_hash exists in *_config.o (e.g install_config.o),
   so if you make this call then you will need to link with it in
   addition to libparrot */
void Parrot_set_config_hash(void);

int Parrot_revision(void);

#endif /* PARROT_EMBED_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */

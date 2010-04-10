/* embed.h
 *  Copyright (C) 2001-2003, Parrot Foundation.
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

#ifndef PARROT_EMBED_H_GUARD
#define PARROT_EMBED_H_GUARD

#include "parrot/core_types.h"  /* types used */
#include "parrot/compiler.h"    /* compiler capabilities */
#include "parrot/config.h"      /* PARROT_VERSION, PARROT_JIT_CAPABLE... */
#include "parrot/interpreter.h" /* give us the interpreter flags */
#include "parrot/warnings.h"    /* give us the warnings flags    */

typedef int Parrot_warnclass;

typedef enum {
    enum_DIS_BARE      = 1,
    enum_DIS_HEADER    = 2
} Parrot_disassemble_options;

PARROT_EXPORT Parrot_Interp Parrot_new(Parrot_Interp parent);

PARROT_EXPORT void Parrot_init_stacktop(Parrot_Interp, void *);

PARROT_EXPORT void Parrot_set_flag(Parrot_Interp, Parrot_Int);
PARROT_EXPORT void Parrot_clear_flag(Parrot_Interp, Parrot_Int);
PARROT_EXPORT Parrot_Int Parrot_test_flag(Parrot_Interp, Parrot_Int);

PARROT_EXPORT void Parrot_set_trace(Parrot_Interp, Parrot_UInt);
PARROT_EXPORT void Parrot_clear_trace(Parrot_Interp, Parrot_UInt);
PARROT_EXPORT Parrot_UInt Parrot_test_trace(Parrot_Interp, Parrot_UInt);

PARROT_EXPORT void Parrot_set_debug(Parrot_Interp, Parrot_UInt);
PARROT_EXPORT void Parrot_clear_debug(Parrot_Interp, Parrot_UInt);
PARROT_EXPORT Parrot_UInt Parrot_test_debug(Parrot_Interp, Parrot_UInt);

PARROT_EXPORT void Parrot_set_executable_name(Parrot_Interp, Parrot_String);

PARROT_EXPORT void Parrot_set_run_core(Parrot_Interp, Parrot_Run_core_t core);

PARROT_EXPORT void Parrot_setwarnings(Parrot_Interp, Parrot_warnclass);

PARROT_EXPORT Parrot_PackFile Parrot_pbc_read(Parrot_Interp, const char *, const int);

PARROT_EXPORT void Parrot_pbc_load(Parrot_Interp, Parrot_PackFile);

PARROT_EXPORT void Parrot_pbc_fixup_loaded(Parrot_Interp);

PARROT_EXPORT void Parrot_runcode(Parrot_Interp, int argc, char **argv);

PARROT_EXPORT Parrot_PMC Parrot_compile_string(Parrot_Interp,
        Parrot_String type, const char *code, Parrot_String *error);

PARROT_EXPORT void Parrot_destroy(Parrot_Interp);

PARROT_EXPORT Parrot_Opcode * Parrot_debug(Parrot_Interp, Parrot_Interp, Parrot_Opcode *pc);

PARROT_EXPORT void Parrot_disassemble(Parrot_Interp, const char *outfile, Parrot_disassemble_options options);

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
void Parrot_exit(Parrot_Interp, int status);

PARROT_EXPORT void Parrot_run_native(PARROT_INTERP, native_func_t func);

/* Parrot_set_config_hash exists in *_config.o (e.g install_config.o),
   so if you make this call then you will need to link with it in
   addition to libparrot */
void Parrot_set_config_hash(void);

#endif /* PARROT_EMBED_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

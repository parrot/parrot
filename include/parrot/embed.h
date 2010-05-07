/* embed.h
 *  Copyright (C) 2001-2003, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the Parrot embedding system--the only part of Parrot that
 *     the outside world should see.
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

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
Parrot_Interp Parrot_new(ARGIN_NULLOK(Parrot_Interp parent));

PARROT_EXPORT void Parrot_init_stacktop(PARROT_INTERP, void *);

PARROT_EXPORT void Parrot_set_flag(PARROT_INTERP, Parrot_Int);
PARROT_EXPORT void Parrot_clear_flag(PARROT_INTERP, Parrot_Int);
PARROT_EXPORT Parrot_Int Parrot_test_flag(PARROT_INTERP, Parrot_Int);

PARROT_EXPORT void Parrot_set_trace(PARROT_INTERP, Parrot_UInt);
PARROT_EXPORT void Parrot_clear_trace(PARROT_INTERP, Parrot_UInt);
PARROT_EXPORT Parrot_UInt Parrot_test_trace(PARROT_INTERP, Parrot_UInt);

PARROT_EXPORT void Parrot_set_debug(PARROT_INTERP, Parrot_UInt);
PARROT_EXPORT void Parrot_clear_debug(PARROT_INTERP, Parrot_UInt);
PARROT_EXPORT Parrot_UInt Parrot_test_debug(PARROT_INTERP, Parrot_UInt);

PARROT_EXPORT void Parrot_set_executable_name(PARROT_INTERP, Parrot_String);

PARROT_EXPORT void Parrot_set_run_core(PARROT_INTERP, Parrot_Run_core_t core);

PARROT_EXPORT void Parrot_setwarnings(PARROT_INTERP, Parrot_warnclass);

PARROT_EXPORT Parrot_PackFile Parrot_pbc_read(PARROT_INTERP, ARGIN_NULLOK(const char *), int);

PARROT_EXPORT void Parrot_pbc_load(PARROT_INTERP, Parrot_PackFile);

PARROT_EXPORT void Parrot_pbc_fixup_loaded(PARROT_INTERP);

PARROT_EXPORT void Parrot_runcode(PARROT_INTERP, int argc, ARGIN(const char **argv));

PARROT_EXPORT Parrot_PMC Parrot_compile_string(PARROT_INTERP,
        Parrot_String type, ARGIN(const char *code), ARGOUT(Parrot_String *error));

PARROT_EXPORT void Parrot_destroy(PARROT_INTERP);

PARROT_EXPORT Parrot_Opcode * Parrot_debug(PARROT_INTERP, ARGIN(Parrot_Interp debugger), ARGIN(Parrot_Opcode *pc));

PARROT_EXPORT void Parrot_disassemble(PARROT_INTERP, ARGIN(const char *outfile),
        Parrot_disassemble_options options);

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
void Parrot_exit(PARROT_INTERP, int status);

PARROT_EXPORT void Parrot_run_native(PARROT_INTERP, native_func_t func);

PARROT_EXPORT void Parrot_load_bytecode(PARROT_INTERP, Parrot_String file_str);

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

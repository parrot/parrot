/* embed.h
 *  Copyright (C) 2001-2010, Parrot Foundation.
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

/* Parrot_set_config_hash exists in *_config.o (e.g install_config.o),
   so if you make this call then you will need to link with it in
   addition to libparrot */
void Parrot_set_config_hash(void);

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
PARROT_COLD
void
Parrot_exit(PARROT_INTERP, int status);

PARROT_EXPORT
void Parrot_destroy(PARROT_INTERP)
        __attribute__nonnull__(1);


/* HEADERIZER BEGIN: src/embed.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void Parrot_clear_debug(PARROT_INTERP, Parrot_UInt flag)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_clear_flag(PARROT_INTERP, Parrot_Int flag)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_clear_trace(PARROT_INTERP, Parrot_UInt flag)
        __attribute__nonnull__(1);

PARROT_EXPORT
Parrot_PMC Parrot_compile_string(PARROT_INTERP,
    Parrot_String type,
    ARGIN(const char *code),
    ARGOUT(Parrot_String *error))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*error);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
Parrot_Opcode * Parrot_debug(PARROT_INTERP,
    ARGIN(Parrot_Interp debugger),
    ARGIN(Parrot_Opcode *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_disassemble(PARROT_INTERP,
    ARGIN_NULLOK(const char *outfile),
    Parrot_disassemble_options options)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_init_stacktop(PARROT_INTERP, ARGIN(void *stack_top))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
Parrot_Interp Parrot_new(ARGIN_NULLOK(Parrot_Interp parent));

PARROT_EXPORT
void Parrot_pbc_fixup_loaded(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_pbc_load(PARROT_INTERP, ARGIN(Parrot_PackFile pf))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
Parrot_PackFile Parrot_pbc_read(PARROT_INTERP,
    ARGIN_NULLOK(const char *fullname),
    const int debug)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_run_native(PARROT_INTERP, native_func_t func)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_runcode(PARROT_INTERP, int argc, ARGIN(const char **argv))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_set_debug(PARROT_INTERP, Parrot_UInt flag)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_set_executable_name(PARROT_INTERP, Parrot_String name)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_set_flag(PARROT_INTERP, Parrot_Int flag)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_set_run_core(PARROT_INTERP, Parrot_Run_core_t core)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_set_trace(PARROT_INTERP, Parrot_UInt flag)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_setwarnings(PARROT_INTERP, Parrot_warnclass wc)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_PURE_FUNCTION
Parrot_UInt Parrot_test_debug(PARROT_INTERP, Parrot_UInt flag)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_PURE_FUNCTION
Parrot_Int Parrot_test_flag(PARROT_INTERP, Parrot_Int flag)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_PURE_FUNCTION
Parrot_UInt Parrot_test_trace(PARROT_INTERP, Parrot_UInt flag)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Parrot_clear_debug __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_clear_flag __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_clear_trace __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_compile_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(code) \
    , PARROT_ASSERT_ARG(error))
#define ASSERT_ARGS_Parrot_debug __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(debugger) \
    , PARROT_ASSERT_ARG(pc))
#define ASSERT_ARGS_Parrot_disassemble __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_init_stacktop __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(stack_top))
#define ASSERT_ARGS_Parrot_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_pbc_fixup_loaded __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pbc_load __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pf))
#define ASSERT_ARGS_Parrot_pbc_read __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_run_native __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_runcode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(argv))
#define ASSERT_ARGS_Parrot_set_debug __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_set_executable_name __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_set_flag __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_set_run_core __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_set_trace __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_setwarnings __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_test_debug __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_test_flag __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_test_trace __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/embed.c */


#endif /* PARROT_EMBED_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

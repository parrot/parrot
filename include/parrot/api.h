/* api.h
 *  Copyright (C) 2001-2010, Parrot Foundation.
 *  Overview:
 *     Parrot's external embedding API. This functionality is only to be used
 *     by embedding applications, and only this functionality may be used by
 *     them.
 */

#ifndef PARROT_API_H_GUARD
#define PARROT_API_H_GUARD

#include "parrot/config.h"
#include "parrot/core_types.h"
#include "pmc/pmc_parrotinterpreter.h"

#define PARROT_API PARROT_EXPORT

typedef struct _Parrot_Init_Args {
    void *stacktop;
    char * gc_system;
    INTVAL gc_threshold;
    INTVAL hash_seed;
} Parrot_Init_Args;

/* HEADERIZER BEGIN: src/embed/api.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_API
INTVAL Parrot_api_build_argv_array(
    ARGMOD(PMC *interp_pmc),
    INTVAL argc,
    ARGIN(char **argv),
    ARGOUT(PMC **args))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*interp_pmc)
        FUNC_MODIFIES(*args);

PARROT_API
INTVAL Parrot_api_destroy_interpreter(ARGIN(PMC *interp_pmc))
        __attribute__nonnull__(1);

PARROT_API
INTVAL Parrot_api_exit_interpreter(ARGIN(PMC *interp_pmc))
        __attribute__nonnull__(1);

PARROT_API
INTVAL Parrot_api_load_bytecode_file(
    ARGMOD(PMC *interp_pmc),
    ARGIN(const char *filename),
    ARGOUT(PMC **pbc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*interp_pmc)
        FUNC_MODIFIES(*pbc);

PARROT_API
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
INTVAL Parrot_api_make_interpreter(
    ARGIN_NULLOK(PMC *parent),
    INTVAL flags,
    ARGIN_NULLOK(Parrot_Init_Args *args),
    ARGOUT(PMC **interp))
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*interp);

PARROT_API
INTVAL Parrot_api_run_bytecode(
    ARGMOD(PMC *interp_pmc),
    ARGIN(PMC *pbc),
    ARGIN(PMC *mainargs))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*interp_pmc);

PARROT_API
INTVAL Parrot_api_set_executable_name(
    ARGIN(PMC *interp_pmc),
    ARGIN(Parrot_String) name)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
INTVAL Parrot_api_set_output_file(
    ARGMOD(PMC *interp_pmc),
    ARGIN(const char * filename))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*interp_pmc);

PARROT_API
INTVAL Parrot_api_set_runcore(
    ARGIN(PMC *interp_pmc),
    Parrot_Run_core_t core,
    Parrot_UInt trace)
        __attribute__nonnull__(1);

PARROT_API
INTVAL Parrot_api_set_stdhandles(
    ARGIN(PMC *interp_pmc),
    INTVAL stdin,
    INTVAL stdout,
    INTVAL stderr)
        __attribute__nonnull__(1);

PARROT_API
INTVAL Parrot_api_set_warnings(ARGMOD(PMC *interp_pmc), INTVAL flags)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*interp_pmc);

PARROT_API
INTVAL Parrt_api_add_dynext_search_path(
    ARGMOD(PMC *interp_pmc),
    ARGIN(const char *path))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*interp_pmc);

PARROT_API
INTVAL Parrt_api_add_include_search_path(
    ARGMOD(PMC *interp_pmc),
    ARGIN(const char *path))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*interp_pmc);

PARROT_API
INTVAL Parrt_api_add_library_search_path(
    ARGMOD(PMC *interp_pmc),
    ARGIN(const char *path))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*interp_pmc);

#define ASSERT_ARGS_Parrot_api_build_argv_array __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc) \
    , PARROT_ASSERT_ARG(argv) \
    , PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_Parrot_api_destroy_interpreter \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc))
#define ASSERT_ARGS_Parrot_api_exit_interpreter __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc))
#define ASSERT_ARGS_Parrot_api_load_bytecode_file __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc) \
    , PARROT_ASSERT_ARG(filename) \
    , PARROT_ASSERT_ARG(pbc))
#define ASSERT_ARGS_Parrot_api_make_interpreter __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_api_run_bytecode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc) \
    , PARROT_ASSERT_ARG(pbc) \
    , PARROT_ASSERT_ARG(mainargs))
#define ASSERT_ARGS_Parrot_api_set_executable_name \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc) \
    , PARROT_ASSERT_ARG(Parrot_String))
#define ASSERT_ARGS_Parrot_api_set_output_file __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc) \
    , PARROT_ASSERT_ARG(filename))
#define ASSERT_ARGS_Parrot_api_set_runcore __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc))
#define ASSERT_ARGS_Parrot_api_set_stdhandles __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc))
#define ASSERT_ARGS_Parrot_api_set_warnings __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc))
#define ASSERT_ARGS_Parrt_api_add_dynext_search_path \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc) \
    , PARROT_ASSERT_ARG(path))
#define ASSERT_ARGS_Parrt_api_add_include_search_path \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc) \
    , PARROT_ASSERT_ARG(path))
#define ASSERT_ARGS_Parrt_api_add_library_search_path \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc) \
    , PARROT_ASSERT_ARG(path))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/embed/api.c */

#endif /* PARROT_API_H_GUARD */

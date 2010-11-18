/* api.h
 *  Copyright (C) 2001-2010, Parrot Foundation.
 *  Overview:
 *     Parrot's external embedding API. This functionality is only to be used
 *     by embedding applications, and only this functionality may be used by
 *     them.
 */

#ifndef PARROT_API_H_GUARD
#define PARROT_API_H_GUARD

#include "parrot/compiler.h"
#include "parrot/config.h"
#include "parrot/core_types.h"

#define PARROT_API PARROT_EXPORT

/* having a modified version of PARROT_ASSERT which resolves as an integer
 * rvalue lets us put ASSERT_ARGS() at the top of the list of local variables.
 * Thus, we can catch bad pointers before any of the local initialization
 * logic is run.  And it always returns 0, so headerizer can chain them in
 * ASSERT_ARGS_* macros like:
 * int _ASSERT_ARGS = PARROT_ASSERT_ARG(a) || PARROT_ASSERT_ARG(b) || ...
 */
#ifdef NDEBUG
#  define PARROT_ASSERT(x) /*@-noeffect@*/((void)0)/*@=noeffect@*/
#  define PARROT_ASSERT_ARG(x) (0)
#  define PARROT_FAILURE(x) /*@-noeffect@*/((void)0)/*@=noeffect@*/
#  define PARROT_ASSERT_MSG(x, s) /*@-noeffect@*/((void)0)/*@=noeffect@*/
#  define ASSERT_ARGS(a)
#else
#  define PARROT_ASSERT(x) (x) ? ((void)0) : Parrot_confess(#x, __FILE__, __LINE__)
#  define PARROT_ASSERT_ARG(x) ((x) ? (0) : (Parrot_confess(#x, __FILE__, __LINE__), 0))
#  define PARROT_FAILURE(x) Parrot_confess((x), __FILE__, __LINE__)
#  define PARROT_ASSERT_MSG(x, s) ((x) ? (0) : (Parrot_confess(s, __FILE__, __LINE__), 0))

#  ifdef __GNUC__
#    define ASSERT_ARGS(a) ASSERT_ARGS_ ## a ;
#  else
#    define ASSERT_ARGS(a)
#  endif /* __GNUC__ */

#endif /* NDEBUG */


typedef struct _Parrot_Init_Args {
    void *stacktop;
    char * gc_system;
    Parrot_Int gc_threshold;
    Parrot_Int hash_seed;
} Parrot_Init_Args;

/* HEADERIZER BEGIN: src/embed/api.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_API
Parrot_Int Parrot_api_add_dynext_search_path(
    ARGMOD(PMC *interp_pmc),
    ARGIN(const char *path))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*interp_pmc);

PARROT_API
Parrot_Int Parrot_api_add_include_search_path(
    ARGMOD(PMC *interp_pmc),
    ARGIN(const char *path))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*interp_pmc);

PARROT_API
Parrot_Int Parrot_api_add_library_search_path(
    ARGMOD(PMC *interp_pmc),
    ARGIN(const char *path))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*interp_pmc);

PARROT_API
Parrot_Int Parrot_api_build_argv_array(
    ARGMOD(PMC *interp_pmc),
    Parrot_Int argc,
    ARGIN(char **argv),
    ARGOUT(PMC **args))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*interp_pmc)
        FUNC_MODIFIES(*args);

PARROT_API
Parrot_Int Parrot_api_debug_flag(
    ARGMOD(PMC *interp_pmc),
    Parrot_Int flags,
    Parrot_Int set)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*interp_pmc);

PARROT_API
Parrot_Int Parrot_api_destroy_interpreter(ARGIN(PMC *interp_pmc))
        __attribute__nonnull__(1);

PARROT_API
Parrot_Int Parrot_api_flag(
    ARGMOD(PMC *interp_pmc),
    Parrot_Int flags,
    Parrot_Int set)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*interp_pmc);

PARROT_API
Parrot_Int Parrot_api_get_last_error(
    ARGMOD(PMC * interp_pmc),
    ARGOUT(Parrot_String * errmsg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* interp_pmc)
        FUNC_MODIFIES(* errmsg);

PARROT_API
Parrot_Int Parrot_api_get_runtime_path(
    Parrot_PMC interp_pmc,
    ARGOUT(Parrot_String *runtime))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*runtime);

PARROT_API
Parrot_Int Parrot_api_load_bytecode_file(
    ARGMOD(PMC *interp_pmc),
    ARGIN(const char *filename),
    ARGOUT(PMC **pbc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*interp_pmc)
        FUNC_MODIFIES(*pbc);

PARROT_API
Parrot_Int Parrot_api_make_interpreter(
    ARGIN_NULLOK(PMC *parent),
    Parrot_Int flags,
    ARGIN_NULLOK(Parrot_Init_Args *args),
    ARGOUT(PMC **interp))
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*interp);

PARROT_API
Parrot_Int Parrot_api_run_bytecode(
    ARGMOD(PMC *interp_pmc),
    ARGIN(PMC *pbc),
    ARGIN(PMC *mainargs))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*interp_pmc);

PARROT_API
Parrot_Int Parrot_api_set_executable_name(
    ARGMOD(PMC *interp_pmc),
    ARGIN(const char * name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*interp_pmc);

PARROT_API
Parrot_Int Parrot_api_set_output_file(
    ARGMOD(PMC *interp_pmc),
    ARGIN_NULLOK(const char * filename))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*interp_pmc);

PARROT_API
Parrot_Int Parrot_api_set_runcore(
    ARGIN(PMC *interp_pmc),
    const char * corename,
    Parrot_UInt trace)
        __attribute__nonnull__(1);

PARROT_API
Parrot_Int Parrot_api_set_stdhandles(
    ARGIN(PMC *interp_pmc),
    Parrot_Int stdin,
    Parrot_Int stdout,
    Parrot_Int stderr)
        __attribute__nonnull__(1);

PARROT_API
Parrot_Int Parrot_api_set_warnings(
    ARGMOD(PMC *interp_pmc),
    Parrot_Int flags)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*interp_pmc);

#define ASSERT_ARGS_Parrot_api_add_dynext_search_path \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc) \
    , PARROT_ASSERT_ARG(path))
#define ASSERT_ARGS_Parrot_api_add_include_search_path \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc) \
    , PARROT_ASSERT_ARG(path))
#define ASSERT_ARGS_Parrot_api_add_library_search_path \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc) \
    , PARROT_ASSERT_ARG(path))
#define ASSERT_ARGS_Parrot_api_build_argv_array __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc) \
    , PARROT_ASSERT_ARG(argv) \
    , PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_Parrot_api_debug_flag __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc))
#define ASSERT_ARGS_Parrot_api_destroy_interpreter \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc))
#define ASSERT_ARGS_Parrot_api_flag __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc))
#define ASSERT_ARGS_Parrot_api_get_last_error __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc) \
    , PARROT_ASSERT_ARG(errmsg))
#define ASSERT_ARGS_Parrot_api_get_runtime_path __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(runtime))
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
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_Parrot_api_set_output_file __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc))
#define ASSERT_ARGS_Parrot_api_set_runcore __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc))
#define ASSERT_ARGS_Parrot_api_set_stdhandles __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc))
#define ASSERT_ARGS_Parrot_api_set_warnings __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp_pmc))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/embed/api.c */

/* HEADERIZER BEGIN: src/embed/strings.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_API
Parrot_Int Parrot_api_string_export_ascii(
    Parrot_PMC interp_pmc,
    ARGIN(Parrot_String string),
    ARGOUT(char ** strout))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* strout);

PARROT_API
Parrot_Int Parrot_api_string_free_exported_ascii(
    Parrot_PMC interp_pmc,
    ARGIN(char * const str))
        __attribute__nonnull__(2);

PARROT_API
Parrot_Int Parrot_api_string_import_ascii(
    Parrot_PMC interp_pmc,
    ARGIN(const char * str),
    ARGOUT(Parrot_String * out))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* out);

#define ASSERT_ARGS_Parrot_api_string_export_ascii \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(string) \
    , PARROT_ASSERT_ARG(strout))
#define ASSERT_ARGS_Parrot_api_string_free_exported_ascii \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(str))
#define ASSERT_ARGS_Parrot_api_string_import_ascii \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(str) \
    , PARROT_ASSERT_ARG(out))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/embed/strings.c */

/* Forward declaration because IMCC is still part of libparrot, but we don't
   want to include parrot/imcc.h */

PARROT_API
int
imcc_run_api(ARGMOD(Parrot_PMC interp_pmc), ARGIN(const char *sourcefile), int argc,
        ARGIN(const char **argv), ARGOUT(PMC **pbcpmc));

#endif /* PARROT_API_H_GUARD */


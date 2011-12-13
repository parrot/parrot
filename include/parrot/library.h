/* library.h
 *  Copyright (C) 2004, Parrot Foundation.
 *  Overview:
 *      Contains accessor functions for the _parrotlib bytecode interface
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_LIBRARY_H_GUARD
#define PARROT_LIBRARY_H_GUARD

typedef enum {
    PARROT_RUNTIME_FT_LIBRARY = 0x0001,
    PARROT_RUNTIME_FT_INCLUDE = 0x0002,
    PARROT_RUNTIME_FT_DYNEXT  = 0x0004,
    PARROT_RUNTIME_FT_LANG    = 0x0010,
    PARROT_RUNTIME_FT_PBC     = 0x0020,
    PARROT_RUNTIME_FT_PASM    = 0x0100,
    PARROT_RUNTIME_FT_PIR     = 0x0200,
    PARROT_RUNTIME_FT_PAST    = 0x0400,
    PARROT_RUNTIME_FT_SOURCE  = 0x0F00
} enum_runtime_ft;

/* &gen_from_enum(libpaths.pasm) */
typedef enum {
    PARROT_LIB_PATH_INCLUDE,            /* .include "foo" */
    PARROT_LIB_PATH_LIBRARY,            /* load_bytecode "bar" */
    PARROT_LIB_PATH_DYNEXT,             /* loadlib "baz" */
    PARROT_LIB_PATH_LANG,               /* load_language "buz" */
    PARROT_LIB_DYN_EXTS,                /* ".so", ".dylib" .. */
    /* must be last: */
    PARROT_LIB_PATH_SIZE
} enum_lib_paths;
/* &end_gen */

/* HEADERIZER BEGIN: src/library.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_get_runtime_path(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_lib_add_path(PARROT_INTERP,
    ARGIN(STRING *path_str),
    enum_lib_paths which)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_lib_add_path_from_cstring(PARROT_INTERP,
    ARGIN(const char *path),
    enum_lib_paths which)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING* Parrot_lib_search_paths_as_string(PARROT_INTERP,
    enum_runtime_ft type)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_lib_update_paths_from_config_hash(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PARROT_MALLOC
char* Parrot_locate_runtime_file(PARROT_INTERP,
    ARGIN(const char *file_name),
    enum_runtime_ft type)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING* Parrot_locate_runtime_file_str(PARROT_INTERP,
    ARGIN(STRING *file),
    enum_runtime_ft type)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * parrot_split_path_ext(PARROT_INTERP,
    ARGIN(STRING *in),
    ARGOUT(STRING **wo_ext),
    ARGOUT(STRING **ext))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*wo_ext)
        FUNC_MODIFIES(*ext);

void parrot_init_library_paths(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Parrot_get_runtime_path __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_lib_add_path __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(path_str))
#define ASSERT_ARGS_Parrot_lib_add_path_from_cstring \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(path))
#define ASSERT_ARGS_Parrot_lib_search_paths_as_string \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_lib_update_paths_from_config_hash \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_locate_runtime_file __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(file_name))
#define ASSERT_ARGS_Parrot_locate_runtime_file_str \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(file))
#define ASSERT_ARGS_parrot_split_path_ext __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(in) \
    , PARROT_ASSERT_ARG(wo_ext) \
    , PARROT_ASSERT_ARG(ext))
#define ASSERT_ARGS_parrot_init_library_paths __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/library.c */

#endif /* PARROT_LIBRARY_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

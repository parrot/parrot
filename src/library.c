/*
Copyright (C) 2004-2011, Parrot Foundation.

=head1 NAME

src/library.c - Interface to Parrot's bytecode library

=head1 DESCRIPTION

This file contains C functions to access Parrot's bytecode library functions,
for include files (via C<.include>), library files (via C<load_bytecode>), and
dynext files (via C<loadlib>).

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/dynext.h"
#include "library.str"

/* HEADERIZER HFILE: include/parrot/library.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * cnv_to_win32_filesep(PARROT_INTERP,
    ARGIN(const STRING *path))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC* get_search_paths(PARROT_INTERP, enum_lib_paths which)
        __attribute__nonnull__(1);

PARROT_PURE_FUNCTION
static int is_abs_path(PARROT_INTERP, ARGIN(const STRING *file))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING* path_concat(PARROT_INTERP,
    ARGIN(STRING *l_path),
    ARGIN(const STRING *r_path))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING* path_guarantee_trailing_separator(PARROT_INTERP,
    ARGIN(STRING *path))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static STRING* try_bytecode_extensions(PARROT_INTERP, ARGIN(STRING* path))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static STRING* try_load_path(PARROT_INTERP, ARGIN(STRING* path))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_cnv_to_win32_filesep __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(path))
#define ASSERT_ARGS_get_search_paths __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_is_abs_path __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(file))
#define ASSERT_ARGS_path_concat __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(l_path) \
    , PARROT_ASSERT_ARG(r_path))
#define ASSERT_ARGS_path_guarantee_trailing_separator \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(path))
#define ASSERT_ARGS_try_bytecode_extensions __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(path))
#define ASSERT_ARGS_try_load_path __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(path))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<void parrot_init_library_paths(PARROT_INTERP)>

Create an array of StringArrays with library searchpaths and shared
extension used for loading various files at runtime. The created
structures looks like this:

  lib_paths = [
    [ "runtime/parrot/include", ... ],   # paths for .include 'file'
    [ "runtime/parrot/library", ... ],   # paths for load_bytecode
    [ "runtime/parrot/dynext", ... ],    # paths for loadlib
    [ "languages", ... ],                # paths for languages
    [ ".so", ... ]                       # list of shared extensions
  ]

If the platform defines

  #define PARROT_PLATFORM_LIB_PATH_INIT_HOOK the_init_hook

it will be called as a function with this prototype:

  void the_init_hook(PARROT_INTERP, PMC *lib_paths);

Platform code may add, delete, or replace search path entries as needed. See
also F<include/parrot/library.h> for C<enum_lib_paths>.

=cut

*/

void
parrot_init_library_paths(PARROT_INTERP)
{
    ASSERT_ARGS(parrot_init_library_paths)
    PMC    *paths;
    STRING *entry;
    PMC * const iglobals    = interp->iglobals;

    /* create the lib_paths array */
    PMC * const lib_paths   = Parrot_pmc_new_init_int(interp,
            enum_class_FixedPMCArray, PARROT_LIB_PATH_SIZE);
    VTABLE_set_pmc_keyed_int(interp, iglobals,
            IGLOBALS_LIB_PATHS, lib_paths);

    /* each is an array of strings */
    /* define include paths */
    paths = Parrot_pmc_new(interp, enum_class_ResizableStringArray);
    VTABLE_set_pmc_keyed_int(interp, lib_paths,
            PARROT_LIB_PATH_INCLUDE, paths);
    { /* EXPERIMENTAL: add include path from environment */
        STRING *envvar = Parrot_getenv(interp, CONST_STRING(interp, "PARROT_INCLUDE"));
        Parrot_warn_experimental(interp, "PARROT_INCLUDE environment variable is experimental");
        if (!STRING_IS_NULL(envvar) && !STRING_IS_EMPTY(envvar))
            VTABLE_push_string(interp, paths, envvar);
    }
    entry = CONST_STRING(interp, "./");
    VTABLE_push_string(interp, paths, entry);

    /* define library paths */
    paths = Parrot_pmc_new(interp, enum_class_ResizableStringArray);
    VTABLE_set_pmc_keyed_int(interp, lib_paths,
            PARROT_LIB_PATH_LIBRARY, paths);
    { /* EXPERIMENTAL: add library path from environment */
        STRING *envvar = Parrot_getenv(interp, CONST_STRING(interp, "PARROT_LIBRARY"));
        Parrot_warn_experimental(interp, "PARROT_LIBRARY environment variable is experimental");
        if (!STRING_IS_NULL(envvar) && !STRING_IS_EMPTY(envvar))
            VTABLE_push_string(interp, paths, envvar);
    }
    entry = CONST_STRING(interp, "./");
    VTABLE_push_string(interp, paths, entry);

    /* define languages paths */
    paths = Parrot_pmc_new(interp, enum_class_ResizableStringArray);
    VTABLE_set_pmc_keyed_int(interp, lib_paths,
            PARROT_LIB_PATH_LANG, paths);
    entry = CONST_STRING(interp, "./");
    VTABLE_push_string(interp, paths, entry);

    /* define dynext paths */
    paths = Parrot_pmc_new(interp, enum_class_ResizableStringArray);
    VTABLE_set_pmc_keyed_int(interp, lib_paths,
            PARROT_LIB_PATH_DYNEXT, paths);
    entry = CONST_STRING(interp, "dynext/");
    VTABLE_push_string(interp, paths, entry);

    /* shared exts */
    paths = Parrot_pmc_new(interp, enum_class_ResizableStringArray);
    VTABLE_set_pmc_keyed_int(interp, lib_paths,
            PARROT_LIB_DYN_EXTS, paths);
    /* no CONST_STRING here - the c2str.pl preprocessor needs "real strs" */
    entry = Parrot_str_new_constant(interp, PARROT_LOAD_EXT);
    VTABLE_push_string(interp, paths, entry);
    /* OS/X has .dylib and .bundle */
    if (!STREQ(PARROT_LOAD_EXT, PARROT_SHARE_EXT)) {
        entry = Parrot_str_new_constant(interp, PARROT_SHARE_EXT);
        VTABLE_push_string(interp, paths, entry);
    }

#ifdef PARROT_PLATFORM_LIB_PATH_INIT_HOOK
    PARROT_PLATFORM_LIB_PATH_INIT_HOOK(interp, lib_paths);
#endif
}

/*

=item C<void Parrot_lib_update_paths_from_config_hash(PARROT_INTERP)>

Updates library paths from the config hash stored in the interpreter.

=cut

*/

PARROT_EXPORT
void
Parrot_lib_update_paths_from_config_hash(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_lib_update_paths_from_config_hash)
    STRING * versionlib = NULL;
    STRING * entry = NULL;
    STRING * builddir = NULL;
    PMC * const lib_paths =
        VTABLE_get_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_LIB_PATHS);
    PMC * const config_hash =
        VTABLE_get_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_CONFIG_HASH);
    PMC * paths;

    if (VTABLE_elements(interp, config_hash)) {
        STRING * const libkey      = CONST_STRING(interp, "libdir");
        STRING * const verkey      = CONST_STRING(interp, "versiondir");
        STRING * const builddirkey = CONST_STRING(interp, "build_dir");
        STRING * const installed   = CONST_STRING(interp, "installed");

        versionlib = VTABLE_get_string_keyed_str(interp, config_hash, libkey);
        entry      = VTABLE_get_string_keyed_str(interp, config_hash, verkey);
        versionlib = Parrot_str_concat(interp, versionlib, entry);

        if (!VTABLE_get_integer_keyed_str(interp, config_hash, installed))
            builddir = VTABLE_get_string_keyed_str(interp,
                                config_hash, builddirkey);
    }

    paths = VTABLE_get_pmc_keyed_int(interp, lib_paths, PARROT_LIB_PATH_INCLUDE);
    if (!STRING_IS_NULL(builddir)) {
        entry = Parrot_str_concat(interp, builddir, CONST_STRING(interp, "/"));
        VTABLE_push_string(interp, paths, entry);
        entry = Parrot_str_concat(interp, builddir, CONST_STRING(interp, "/runtime/parrot/include/"));
        VTABLE_push_string(interp, paths, entry);
    }
    if (!STRING_IS_NULL(versionlib)) {
        entry = Parrot_str_concat(interp, versionlib, CONST_STRING(interp, "/include/"));
        VTABLE_push_string(interp, paths, entry);
    }

    paths = VTABLE_get_pmc_keyed_int(interp, lib_paths, PARROT_LIB_PATH_LIBRARY);
    if (!STRING_IS_NULL(builddir)) {
        entry = Parrot_str_concat(interp, builddir, CONST_STRING(interp, "/runtime/parrot/library/"));
        VTABLE_push_string(interp, paths, entry);
    }
    if (!STRING_IS_NULL(versionlib)) {
        entry = Parrot_str_concat(interp, versionlib, CONST_STRING(interp, "/library/"));
        VTABLE_push_string(interp, paths, entry);
    }

    paths = VTABLE_get_pmc_keyed_int(interp, lib_paths, PARROT_LIB_PATH_LANG);
    if (!STRING_IS_NULL(builddir)) {
        entry = Parrot_str_concat(interp, builddir, CONST_STRING(interp, "/runtime/parrot/languages/"));
        VTABLE_push_string(interp, paths, entry);
    }
    if (!STRING_IS_NULL(versionlib)) {
        entry = Parrot_str_concat(interp, versionlib, CONST_STRING(interp, "/languages/"));
        VTABLE_push_string(interp, paths, entry);
    }

    paths = VTABLE_get_pmc_keyed_int(interp, lib_paths, PARROT_LIB_PATH_DYNEXT);
    if (!STRING_IS_NULL(builddir)) {
        entry = Parrot_str_concat(interp, builddir, CONST_STRING(interp, "/runtime/parrot/dynext/"));
        VTABLE_push_string(interp, paths, entry);
    }
    if (!STRING_IS_NULL(versionlib)) {
        entry = Parrot_str_concat(interp, versionlib, CONST_STRING(interp, "/dynext/"));
        VTABLE_push_string(interp, paths, entry);
    }
}


/*

=item C<static PMC* get_search_paths(PARROT_INTERP, enum_lib_paths which)>

Return lib_paths as array of StringArrays with library searchpaths and shared
extension used for loading various files at runtime.
The structure looks like this:

  lib_paths = [
    [ "runtime/parrot/include", ... ],   # paths for .include 'file'
    [ "runtime/parrot/library", ... ],   # paths for load_bytecode
    [ "runtime/parrot/dynext", ... ],    # paths for loadlib
    [ "languages", ... ],                # paths for languages
    [ ".so", ... ]                       # list of shared extensions
  ]

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC*
get_search_paths(PARROT_INTERP, enum_lib_paths which)
{
    ASSERT_ARGS(get_search_paths)
    PMC * const iglobals = interp->iglobals;
    PMC * const lib_paths = VTABLE_get_pmc_keyed_int(interp, iglobals,
            IGLOBALS_LIB_PATHS);
    return VTABLE_get_pmc_keyed_int(interp, lib_paths, which);
}

static const int path_separator = '/';

#ifdef WIN32

static const int win32_path_separator = '\\';

#endif

/*

=item C<static int is_abs_path(PARROT_INTERP, const STRING *file)>

Determines whether a file name given by a fixed-8 or utf8 C<STRING> is an
absolute file name. Returns C<1> if the filename is absolute, returns C<0>
otherwise.

=cut

*/

PARROT_PURE_FUNCTION
static int
is_abs_path(PARROT_INTERP, ARGIN(const STRING *file))
{
    ASSERT_ARGS(is_abs_path)
    UINTVAL len = STRING_length(file);
    INTVAL  c;

    if (len <= 1)
        return 0;

    c = STRING_ord(interp, file, 0);

    /* XXX  ../foo, ./bar */
#ifdef WIN32
    if (c == path_separator || c == win32_path_separator)
        return 1;

    if (len >= 3
    &&  isalpha((unsigned char)c)
    &&  STRING_ord(interp, file, 1) == ':') {
        const INTVAL c2 = STRING_ord(interp, file, 2);
        if (c2 == path_separator || c2 == win32_path_separator)
            return 1;
    }
#else
    if (c == path_separator)
        return 1;
#endif

    return 0;
}


#ifdef WIN32

/*

=item C<static STRING * cnv_to_win32_filesep(PARROT_INTERP, const STRING *path)>

Converts a path with forward slashes to one with backward slashes.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
cnv_to_win32_filesep(PARROT_INTERP, ARGIN(const STRING *path))
{
    ASSERT_ARGS(cnv_to_win32_filesep)
    const UINTVAL  len = STRING_length(path);
    STRING        *res = Parrot_str_new_noinit(interp, path->bufused);
    String_iter    src, dst;

    res->encoding = path->encoding;

    STRING_ITER_INIT(interp, &src);
    STRING_ITER_INIT(interp, &dst);

    while (src.charpos < len) {
        INTVAL c = STRING_iter_get_and_advance(interp, path, &src);

        if (c == path_separator)
            c = win32_path_separator;

        STRING_iter_set_and_advance(interp, res, &dst, c);
    }

    res->bufused = dst.bytepos;
    res->strlen  = dst.charpos;

    return res;
}

#endif

/*

=item C<static STRING* path_guarantee_trailing_separator(PARROT_INTERP, STRING
*path)>

unary path argument. the path string will have a
trailing path-separator appended if it is not
there already.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING*
path_guarantee_trailing_separator(PARROT_INTERP, ARGIN(STRING *path))
{
    ASSERT_ARGS(path_guarantee_trailing_separator)

    /* make sure the path has a trailing slash before appending the file */
    if (STRING_ord(interp, path, -1) != (UINTVAL)path_separator)
        path = Parrot_str_concat(interp, path,
                Parrot_str_chr(interp, path_separator));

    return path;
}

/*

=item C<static STRING* path_concat(PARROT_INTERP, STRING *l_path, const STRING
*r_path)>

binary path arguments. A new string is created
that is the concatenation of the two path components
with a path-separator.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING*
path_concat(PARROT_INTERP, ARGIN(STRING *l_path),
        ARGIN(const STRING *r_path))
{
    ASSERT_ARGS(path_concat)
    STRING* join;

    join = path_guarantee_trailing_separator(interp, l_path);
    join = Parrot_str_concat(interp, join, r_path);

    return join;
}

/*

=item C<static STRING* try_load_path(PARROT_INTERP, STRING* path)>

Attempts to load a file with name C<path>. If the file is successfully located,
the finalized name of the file is returned as a STRING. Otherwise, returns
NULL.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static STRING*
try_load_path(PARROT_INTERP, ARGIN(STRING* path))
{
    ASSERT_ARGS(try_load_path)

#ifdef WIN32
    path = cnv_to_win32_filesep(interp, path);
#endif

    if (Parrot_file_stat_intval(interp, path, STAT_EXISTS)) {
        return path;
    }

    return NULL;
}

/*

=item C<static STRING* try_bytecode_extensions(PARROT_INTERP, STRING* path)>

Guess extensions, so that the user can drop the extensions
leaving it up to the build process/install whether or not
a .pbc, .pasm or a .pir file is used.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static STRING*
try_bytecode_extensions(PARROT_INTERP, ARGIN(STRING* path))
{
    ASSERT_ARGS(try_bytecode_extensions)
    STRING *test_path, *result;
    STRING * const bytecode_extension = CONST_STRING(interp, ".pbc");
    STRING * const pir_extension      = CONST_STRING(interp, ".pir");
    STRING * const pasm_extension     = CONST_STRING(interp, ".pasm");

    test_path = path;

    /* First try the path as given. */
    result = try_load_path(interp, test_path);
    if (result)
        return result;

    /*
      If the original requested file doesn't exist, try it with a
      different extension. A requested PIR or PASM file will check for a
      corresponding bytecode file. A requested bytecode file will check
      first for a corresponding PIR file, then for a PASM file.
    */

    if (!STRING_IS_NULL(test_path)) {
        if (STRING_length(test_path) > 4) {
            STRING * const orig_ext = STRING_substr(interp, test_path, -4, 4);
            /* First try substituting .pbc for the .pir extension */
            if (STRING_equal(interp, orig_ext, pir_extension)) {
                STRING * const without_ext = Parrot_str_chopn(interp, test_path, 4);
                test_path = Parrot_str_concat(interp, without_ext, bytecode_extension);
                result = try_load_path(interp, test_path);
                if (result)
                    return result;
            }
            /* Next try substituting .pir, then .pasm for the .pbc extension */
            else if (STRING_equal(interp, orig_ext, bytecode_extension)) {
                STRING * const without_ext = Parrot_str_chopn(interp, test_path, 4);
                test_path = Parrot_str_concat(interp, without_ext, pir_extension);
                result = try_load_path(interp, test_path);
                if (result)
                    return result;

                test_path = Parrot_str_concat(interp, without_ext, pasm_extension);
                result = try_load_path(interp, test_path);
                if (result)
                    return result;
            }

        }

        /* Finally, try substituting .pbc for the .pasm extension. */
        if (STRING_length(test_path) > 5) {
            STRING * const orig_ext = STRING_substr(interp, test_path, -5, 5);
            if (STRING_equal(interp, orig_ext, pasm_extension)) {
                STRING * const without_ext = Parrot_str_chopn(interp, test_path, 5);
                test_path = Parrot_str_concat(interp, without_ext, bytecode_extension);
                result = try_load_path(interp, test_path);
                if (result)
                    return result;
            }
        }
    }

    return NULL;
}

/*

=item C<void Parrot_lib_add_path(PARROT_INTERP, STRING *path_str, enum_lib_paths
which)>

Add a path to the library searchpath of the given type (passing in a STRING).

=cut

*/

PARROT_EXPORT
void
Parrot_lib_add_path(PARROT_INTERP,
        ARGIN(STRING *path_str),
        enum_lib_paths which)
{
    ASSERT_ARGS(Parrot_lib_add_path)
    PMC * const iglobals = interp->iglobals;
    PMC * const lib_paths = VTABLE_get_pmc_keyed_int(interp, iglobals,
        IGLOBALS_LIB_PATHS);
    PMC * const paths = VTABLE_get_pmc_keyed_int(interp, lib_paths, which);
    VTABLE_unshift_string(interp, paths, path_str);
}

/*

=item C<void Parrot_lib_add_path_from_cstring(PARROT_INTERP, const char *path,
enum_lib_paths which)>

Add a path to the library searchpath of the given type (passing in a C string).

=cut

*/

PARROT_EXPORT
void
Parrot_lib_add_path_from_cstring(PARROT_INTERP,
        ARGIN(const char *path),
        enum_lib_paths which)
{
    ASSERT_ARGS(Parrot_lib_add_path_from_cstring)
    STRING * const path_str = Parrot_str_new(interp, path, 0);
    Parrot_lib_add_path(interp, path_str, which);
}

/*

=item C<STRING* Parrot_locate_runtime_file_str(PARROT_INTERP, STRING *file,
enum_runtime_ft type)>

Locate the full path for C<file_name> and the given file type(s).

The C<enum_runtime_ft type> is one or more of the types defined in
F<include/parrot/library.h>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING*
Parrot_locate_runtime_file_str(PARROT_INTERP, ARGIN(STRING *file),
        enum_runtime_ft type)
{
    ASSERT_ARGS(Parrot_locate_runtime_file_str)
    STRING *prefix;
    STRING *full_name;
    PMC    *paths;
    INTVAL  i, n;

    /* if this is an absolute path return it as is */
    if (is_abs_path(interp, file))
        return file;

    if (type & PARROT_RUNTIME_FT_LANG)
        paths = get_search_paths(interp, PARROT_LIB_PATH_LANG);
    else if (type & PARROT_RUNTIME_FT_DYNEXT)
        paths = get_search_paths(interp, PARROT_LIB_PATH_DYNEXT);
    else if (type & (PARROT_RUNTIME_FT_PBC | PARROT_RUNTIME_FT_SOURCE))
        paths = get_search_paths(interp, PARROT_LIB_PATH_LIBRARY);
    else
        paths = get_search_paths(interp, PARROT_LIB_PATH_INCLUDE);

    prefix = Parrot_get_runtime_path(interp);
    n = VTABLE_elements(interp, paths);

    for (i = 0; i < n; ++i) {
        STRING * const path = VTABLE_get_string_keyed_int(interp, paths, i);
        STRING *found_name;

        full_name = path_concat(interp, path, file);

        found_name =
            (type & PARROT_RUNTIME_FT_DYNEXT)
                ? try_load_path(interp, full_name)
                : try_bytecode_extensions(interp, full_name);

        if (found_name)
            return found_name;

        if (STRING_length(prefix) && !is_abs_path(interp, path)) {
            full_name = path_concat(interp, prefix, full_name);

            found_name =
                (type & PARROT_RUNTIME_FT_DYNEXT)
                    ? try_load_path(interp, full_name)
                    : try_bytecode_extensions(interp, full_name);

            if (found_name)
                return found_name;
        }
    }

    full_name =
        (type & PARROT_RUNTIME_FT_DYNEXT)
            ? try_load_path(interp, file)
            : try_bytecode_extensions(interp, file);

    return full_name;
}

/*

=item C<char* Parrot_locate_runtime_file(PARROT_INTERP, const char *file_name,
enum_runtime_ft type)>

Locate the full path for C<file_name> and the given file type(s). If
successful, returns a C-string allocated with C<Parrot_str_to_cstring> or
NULL otherwise.  Remember to free the string with C<Parrot_str_free_cstring()>.

If successful, the returned STRING is 0-terminated so that
C<result-E<gt>strstart> is usable as B<const char*> c-string for C library
functions like fopen(3).  This is the preferred API function.

The C<enum_runtime_ft type> is one or more of the types defined in
F<include/parrot/library.h>.

=cut

*/


PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PARROT_MALLOC
char*
Parrot_locate_runtime_file(PARROT_INTERP, ARGIN(const char *file_name),
        enum_runtime_ft type)
{
    ASSERT_ARGS(Parrot_locate_runtime_file)
    STRING * const file   = Parrot_str_new(interp, file_name, 0);
    STRING * const result = Parrot_locate_runtime_file_str(interp, file, type);
    /*
     * XXX valgrind shows e.g.
     *     invalid read of size 8 inside a string of length 69
     *     at position 64
     *     it seems that dlopen accesses words beyond the string end
     *
     *     see also the log at #37814
     */
    return result ? Parrot_str_to_cstring(interp, result) : NULL;
}

/*

=item C<STRING * Parrot_get_runtime_path(PARROT_INTERP)>

Return a string for the runtime prefix.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_get_runtime_path(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_get_runtime_path)
    STRING * const env = Parrot_getenv(interp, CONST_STRING(interp, "PARROT_RUNTIME"));
    STRING *result;

    if (!STRING_IS_NULL(env)) {
        result = env;
    }
    else {
        PMC    * const config_hash =
            VTABLE_get_pmc_keyed_int(interp, interp->iglobals, (INTVAL) IGLOBALS_CONFIG_HASH);

        if (VTABLE_elements(interp, config_hash)) {
            STRING * const key = CONST_STRING(interp, "prefix");
            result = VTABLE_get_string_keyed_str(interp, config_hash, key);
        }
        else
            result = CONST_STRING(interp, ".");
    }
    return result;
}

/*

=item C<STRING * parrot_split_path_ext(PARROT_INTERP, STRING *in, STRING
**wo_ext, STRING **ext)>

Split the pathstring C<in> into <path><filestem><ext>. Return the
C<filestem> of the pathstring. Set C<wo_ext> to the part without
extension and C<ext> to the extension or NULL.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
parrot_split_path_ext(PARROT_INTERP, ARGIN(STRING *in),
        ARGOUT(STRING **wo_ext), ARGOUT(STRING **ext))
{
    ASSERT_ARGS(parrot_split_path_ext)

    /* This is a quick fix for TT #65
     * TODO: redo it with the string reimplementation
     */
    STRING * const slash1 = CONST_STRING(interp, "/");
    STRING * const slash2 = CONST_STRING(interp, "\\");
    STRING * const dot    = CONST_STRING(interp, ".");

    const INTVAL len = STRING_length(in);
    STRING *stem;
    INTVAL pos_sl, pos_dot;

    pos_sl = STRING_rindex(interp, in, slash1, len);
    if (pos_sl == -1)
        pos_sl = STRING_rindex(interp, in, slash2, len);
    pos_dot = STRING_rindex(interp, in, dot, len);

    /* ignore dot in directory name */
    if (pos_dot != -1 && pos_dot < pos_sl)
        pos_dot = -1;

    ++pos_dot;
    ++pos_sl;
    if (pos_sl && pos_dot) {
        stem = STRING_substr(interp, in, pos_sl, pos_dot - pos_sl - 1);
        *wo_ext = STRING_substr(interp, in, 0, pos_dot - 1);
        *ext = STRING_substr(interp, in, pos_dot, len - pos_dot);
    }
    else if (pos_dot) {
        stem = STRING_substr(interp, in, 0, pos_dot - 1);
        *wo_ext = stem;
        *ext = STRING_substr(interp, in, pos_dot, len - pos_dot);
    }
    else if (pos_sl) {
        stem = STRING_substr(interp, in, pos_sl, len - pos_sl);
        *wo_ext = in;
        *ext = STRINGNULL;
    }
    else {
        stem = in;
        *wo_ext = stem;
        *ext = STRINGNULL;
    }
    return stem;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/library.h>

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

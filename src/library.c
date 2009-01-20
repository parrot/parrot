/*
Copyright (C) 2004-2007, The Perl Foundation.
$Id$

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

static void cnv_to_win32_filesep(ARGMOD(STRING *path))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*path);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC* get_search_paths(PARROT_INTERP, enum_lib_paths which)
        __attribute__nonnull__(1);

PARROT_PURE_FUNCTION
static int is_abs_path(ARGIN(const STRING *file))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING* path_append(PARROT_INTERP,
    ARGMOD(STRING *l_path),
    ARGMOD(STRING *r_path))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*l_path)
        FUNC_MODIFIES(*r_path);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING* path_concat(PARROT_INTERP,
    ARGMOD(STRING *l_path),
    ARGMOD(STRING *r_path))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*l_path)
        FUNC_MODIFIES(*r_path);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING* path_finalize(PARROT_INTERP, ARGMOD(STRING *path))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*path);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING* path_guarantee_trailing_separator(PARROT_INTERP,
    ARGMOD(STRING *path))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*path);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static STRING* try_bytecode_extensions(PARROT_INTERP, ARGMOD(STRING* path))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* path);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static STRING* try_load_path(PARROT_INTERP, ARGMOD(STRING* path))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* path);

#define ASSERT_ARGS_cnv_to_win32_filesep __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(path)
#define ASSERT_ARGS_get_search_paths __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_is_abs_path __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(file)
#define ASSERT_ARGS_path_append __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(l_path) \
    || PARROT_ASSERT_ARG(r_path)
#define ASSERT_ARGS_path_concat __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(l_path) \
    || PARROT_ASSERT_ARG(r_path)
#define ASSERT_ARGS_path_finalize __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(path)
#define ASSERT_ARGS_path_guarantee_trailing_separator \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(path)
#define ASSERT_ARGS_try_bytecode_extensions __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(path)
#define ASSERT_ARGS_try_load_path __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(path)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<void parrot_init_library_paths>

Create an array of StringArrays with library searchpaths and shared
extension used for loading various files at runtime. The created
structures looks like this:

  lib_paths = [
    [ "runtime/parrot/include", ... ],   # paths for .include 'file'
    [ "runtime/parrot/library", ... ],   # paths for load_bytecode
    [ "runtime/parrot/dynext", ... ],    # paths for loadlib
    [ ".so", ... ]                       # list of shared extensions
  ]

If the platform defines

  #define PARROT_PLATFORM_LIB_PATH_INIT_HOOK the_init_hook

if will be called as a function with this prototype:

  void the_init_hook(PARROT_INTERP, PMC *lib_paths);

Platform code may add, delete, or replace search path entries as needed. See
also F<include/parrot/library.h> for C<enum_lib_paths>.

=cut

*/

void
parrot_init_library_paths(PARROT_INTERP)
{
    ASSERT_ARGS(parrot_init_library_paths)
    PMC *paths;
    STRING *entry;

    PMC * const iglobals = interp->iglobals;
    PMC * const config_hash =
            VTABLE_get_pmc_keyed_int(interp, iglobals, (INTVAL) IGLOBALS_CONFIG_HASH);

    /* create the lib_paths array */
    PMC * const lib_paths = pmc_new(interp, enum_class_FixedPMCArray);
    VTABLE_set_integer_native(interp, lib_paths, PARROT_LIB_PATH_SIZE);
    VTABLE_set_pmc_keyed_int(interp, iglobals,
            IGLOBALS_LIB_PATHS, lib_paths);
    
    /* each is an array of strings */
    /* define include paths */
    paths = pmc_new(interp, enum_class_ResizableStringArray);
    VTABLE_set_pmc_keyed_int(interp, lib_paths,
            PARROT_LIB_PATH_INCLUDE, paths);
    entry = CONST_STRING(interp, "runtime/parrot/include/");
    VTABLE_push_string(interp, paths, entry);
    entry = CONST_STRING(interp, "runtime/parrot/");
    VTABLE_push_string(interp, paths, entry);
    entry = CONST_STRING(interp, "./");
    VTABLE_push_string(interp, paths, entry);
    if (VTABLE_elements(interp, config_hash)) {
        STRING * const key = CONST_STRING(interp, "includedir");
        entry = VTABLE_get_string_keyed_str(interp, config_hash, key);
        VTABLE_push_string(interp, paths, entry);
    }
    entry = CONST_STRING(interp, "lib/parrot/include/");
    VTABLE_push_string(interp, paths, entry);
    entry = CONST_STRING(interp, "lib/parrot/");
    VTABLE_push_string(interp, paths, entry);

    /* define library paths */
    paths = pmc_new(interp, enum_class_ResizableStringArray);
    VTABLE_set_pmc_keyed_int(interp, lib_paths,
            PARROT_LIB_PATH_LIBRARY, paths);
    entry = CONST_STRING(interp, "runtime/parrot/library/");
    VTABLE_push_string(interp, paths, entry);
    entry = CONST_STRING(interp, "runtime/parrot/");
    VTABLE_push_string(interp, paths, entry);
    entry = CONST_STRING(interp, "./");
    VTABLE_push_string(interp, paths, entry);
    if (VTABLE_elements(interp, config_hash)) {
        STRING * const key = CONST_STRING(interp, "libdir");
        entry = VTABLE_get_string_keyed_str(interp, config_hash, key);
        VTABLE_push_string(interp, paths, entry);
    }
    entry = CONST_STRING(interp, "lib/parrot/library/");
    VTABLE_push_string(interp, paths, entry);
    entry = CONST_STRING(interp, "lib/parrot/");
    VTABLE_push_string(interp, paths, entry);

    /* define dynext paths */
    paths = pmc_new(interp, enum_class_ResizableStringArray);
    VTABLE_set_pmc_keyed_int(interp, lib_paths,
            PARROT_LIB_PATH_DYNEXT, paths);
    entry = CONST_STRING(interp, "runtime/parrot/dynext/");
    VTABLE_push_string(interp, paths, entry);
    entry = CONST_STRING(interp, "");
    VTABLE_push_string(interp, paths, entry);
    entry = CONST_STRING(interp, "lib/parrot/dynext/");
    VTABLE_push_string(interp, paths, entry);

    /* shared exts */
    paths = pmc_new(interp, enum_class_ResizableStringArray);
    VTABLE_set_pmc_keyed_int(interp, lib_paths,
            PARROT_LIB_DYN_EXTS, paths);
    /* no CONST_STRING here - the c2str.pl preprocessor needs "real strs" */
    entry = const_string(interp, PARROT_LOAD_EXT);
    VTABLE_push_string(interp, paths, entry);
    /* OS/X has .dylib and .bundle */
    if (!STREQ(PARROT_LOAD_EXT, PARROT_SHARE_EXT)) {
        entry = const_string(interp, PARROT_SHARE_EXT);
        VTABLE_push_string(interp, paths, entry);
    }

#ifdef PARROT_PLATFORM_LIB_PATH_INIT_HOOK
    PARROT_PLATFORM_LIB_PATH_INIT_HOOK(interp, lib_paths);
#endif
}

/*

=item C<static PMC* get_search_paths>

Return lib_paths as array of StringArrays with library searchpaths and shared
extension used for loading various files at runtime.
The structure looks like this:

  lib_paths = [
    [ "runtime/parrot/include", ... ],   # paths for .include 'file'
    [ "runtime/parrot/library", ... ],   # paths for load_bytecode
    [ "runtime/parrot/dynext", ... ],    # paths for loadlib
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

/*

=item C<static int is_abs_path>

Determines whether a file name given by a fixed-8 or utf8 C<STRING> is an
absolute file name. Returns C<1> if the filename is absolute, returns C<0>
otherwise.

=cut

*/

PARROT_PURE_FUNCTION
static int
is_abs_path(ARGIN(const STRING *file))
{
    ASSERT_ARGS(is_abs_path)
    const char * const file_name = file->strstart;
    if (file->strlen <= 1)
        return 0;
    PARROT_ASSERT(file->encoding == Parrot_fixed_8_encoding_ptr ||
            file->encoding == Parrot_utf8_encoding_ptr);
#ifdef WIN32
    if (file_name[0] == '\\' || file_name[0] == '/' ||
            (isalpha((unsigned char)file_name[0]) && file->strlen > 2 &&
             (strncmp(file_name+1, ":\\", 2) == 0 ||
              strncmp(file_name+1, ":/",  2) == 0)))
#else
    if (file_name[0] == '/')     /* XXX  ../foo, ./bar */
#endif
        {
            return 1;
        }
    return 0;
}

static const char path_separator = '/';

#ifdef WIN32

static const char win32_path_separator = '\\';

/*

=item C<static void cnv_to_win32_filesep>

Converts a path with forward slashes to one with backward slashes.

=cut

*/

static void
cnv_to_win32_filesep(ARGMOD(STRING *path))
{
    ASSERT_ARGS(cnv_to_win32_filesep)
    char* cnv;

    PARROT_ASSERT(path->encoding == Parrot_fixed_8_encoding_ptr ||
        path->encoding == Parrot_utf8_encoding_ptr);

    cnv = path->strstart;
    while ((cnv = strchr(cnv, path_separator)) != NULL)
        *cnv = win32_path_separator;
}

#endif

/*

=item C<static STRING* path_finalize>

Ensures the given STRING C<path> has a C-style NULL character at the end. The
length of the string is not increased to account for this NULL, however. In
WIN32 systems, the path separator is switched from the unix-style "/" to the
Windows-style "\".

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING*
path_finalize(PARROT_INTERP, ARGMOD(STRING *path))
{
    ASSERT_ARGS(path_finalize)

    /* TODO create a string API that just does that
     *      a lot of ICU lib functions also need 0-terminated strings
     *      the goal is just to have for sure an invisible 0 at end
     */

    STRING * const nul = string_chr(interp, '\0');

    path = string_append(interp, path, nul);
    path->bufused--;
    path->strlen--;

#ifdef WIN32
    cnv_to_win32_filesep(path);
#endif

    return path;
}

/*

=item C<static STRING* path_guarantee_trailing_separator>

unary path argument. the path string will have a
trailing path-separator appended if it is not
there already.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING*
path_guarantee_trailing_separator(PARROT_INTERP, ARGMOD(STRING *path))
{
    ASSERT_ARGS(path_guarantee_trailing_separator)
    STRING * const path_separator_string = string_chr(interp, path_separator);

    /* make sure the path has a trailing slash before appending the file */
    if (string_index(interp, path , path->strlen - 1)
         != string_index(interp, path_separator_string, 0))
        path = string_append(interp, path , path_separator_string);

    return path;
}

/*

=item C<static STRING* path_append>

binary path arguments, the left arg is modified.
a trailing separator is guaranteed for the left
argument and the right argument is appended

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING*
path_append(PARROT_INTERP, ARGMOD(STRING *l_path), ARGMOD(STRING *r_path))
{
    ASSERT_ARGS(path_append)
    l_path = path_guarantee_trailing_separator(interp, l_path);
    l_path = string_append(interp, l_path, r_path);

    return l_path;
}

/*

=item C<static STRING* path_concat>

binary path arguments. A new string is created
that is the concatenation of the two path components
with a path-separator.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING*
path_concat(PARROT_INTERP, ARGMOD(STRING *l_path), ARGMOD(STRING *r_path))
{
    ASSERT_ARGS(path_concat)
    STRING* join;

    join = string_copy(interp, l_path);
    join = path_guarantee_trailing_separator(interp, join);
    join = string_append(interp, join, r_path);

    return join;
}

#define LOAD_EXT_CODE_LAST 2

static const char* load_ext_code[ LOAD_EXT_CODE_LAST + 1 ] = {
    ".pbc",

    /* source level files */

    ".pasm",
    ".pir",
};

/*

=item C<static STRING* try_load_path>

Attempts to load a file with name C<path>. If the file is successfully located,
the finalized name of the file is returned as a STRING. Otherwise, returns
NULL.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static STRING*
try_load_path(PARROT_INTERP, ARGMOD(STRING* path))
{
    ASSERT_ARGS(try_load_path)
    STRING *final;

    final = string_copy(interp, path);

    final = path_finalize(interp, final);

    if (Parrot_stat_info_intval(interp, final, STAT_EXISTS)) {
        return final;
    }

    return NULL;
}

/*

=item C<static STRING* try_bytecode_extensions>

Guess extensions, so that the user can drop the extensions
leaving it up to the build process/install whether or not
a .pbc, .pasm or a .pir file is used.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static STRING*
try_bytecode_extensions(PARROT_INTERP, ARGMOD(STRING* path))
{
    ASSERT_ARGS(try_bytecode_extensions)
    STRING *with_ext, *result;

    int guess;

    /*
      First try the path without guessing the extension to ensure compatibility
      with existing code.
     */

    with_ext = string_copy(interp, path);

    result = try_load_path(interp, with_ext);
    if (result)
        return result;

    /*
      Start guessing now. This version tries to find the lowest form of the
      code, starting with bytecode and working up to PIR. Note the atypical
      loop control. This is so the array can easily be processed in reverse.
     */

    for (guess = 0 ; guess <= LOAD_EXT_CODE_LAST ; guess++) {
        with_ext = string_copy(interp, path);
        with_ext = string_append(interp,
                                 with_ext, const_string(interp, load_ext_code[guess]));

        result = try_load_path(interp, with_ext);
        if (result)
            return result;
    }

    return NULL;
}

/*

=item C<void Parrot_add_library_path>

Add a path to the library searchpath of the given type.

TODO:
  - allow path to be a list of paths.

=cut

*/

PARROT_EXPORT
void
Parrot_add_library_path(PARROT_INTERP,
        ARGIN(const char *path),
        enum_lib_paths which)
{
    ASSERT_ARGS(Parrot_add_library_path)
    PMC * const iglobals = interp->iglobals;
    PMC * const lib_paths = VTABLE_get_pmc_keyed_int(interp, iglobals,
        IGLOBALS_LIB_PATHS);
    PMC * paths = VTABLE_get_pmc_keyed_int(interp, lib_paths, which);
    STRING * const path_str = string_from_cstring(interp, path, 0);
    VTABLE_push_string(interp, paths, path_str);
}

/*

=item C<char* Parrot_locate_runtime_file>

Locate the full path for C<file_name> and the given file type(s). If
successful, returns a C-string allocated with C<string_to_cstring> or
NULL otherwise.  Remember to free the string with C<string_cstring_free()>.

=item C<STRING* Parrot_locate_runtime_file_str>

Like above but use and return STRINGs. If successful, the returned STRING
is 0-terminated so that C<result-E<gt>strstart> is usable as B<const char*>
c-string for C library functions like fopen(3).
This is the preferred API function.

The C<enum_runtime_ft type> is one or more of the types defined in
F<include/parrot/library.h>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING*
Parrot_locate_runtime_file_str(PARROT_INTERP, ARGMOD(STRING *file),
        enum_runtime_ft type)
{
    ASSERT_ARGS(Parrot_locate_runtime_file_str)
    STRING *prefix;
    STRING *full_name;
    PMC    *paths;
    INTVAL  i, n;

    /* if this is an absolute path return it as is */
    if (is_abs_path(file))
        return file;

    if (type & PARROT_RUNTIME_FT_DYNEXT)
        paths = get_search_paths(interp, PARROT_LIB_PATH_DYNEXT);
    else if (type & (PARROT_RUNTIME_FT_PBC | PARROT_RUNTIME_FT_SOURCE))
        paths = get_search_paths(interp, PARROT_LIB_PATH_LIBRARY);
    else
        paths = get_search_paths(interp, PARROT_LIB_PATH_INCLUDE);

    prefix = Parrot_get_runtime_path(interp);
    n = VTABLE_elements(interp, paths);

    for (i = 0; i < n; ++i) {
        STRING * const path = VTABLE_get_string_keyed_int(interp, paths, i);

        if (string_length(interp, prefix) && !is_abs_path(path))
            full_name = path_concat(interp, prefix, path);
        else
            full_name = string_copy(interp, path);

        full_name = path_append(interp, full_name, file);

        full_name =
            (type & PARROT_RUNTIME_FT_DYNEXT)
                ? try_load_path(interp, full_name)
                : try_bytecode_extensions(interp, full_name);

        if (full_name)
            return full_name;
    }

    full_name =
        (type & PARROT_RUNTIME_FT_DYNEXT)
            ? try_load_path(interp, file)
            : try_bytecode_extensions(interp, file);

    return full_name;
}

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PARROT_MALLOC
char*
Parrot_locate_runtime_file(PARROT_INTERP, ARGIN(const char *file_name),
        enum_runtime_ft type)
{
    ASSERT_ARGS(Parrot_locate_runtime_file)
    STRING * const file   = string_from_cstring(interp, file_name, 0);
    STRING * const result = Parrot_locate_runtime_file_str(interp, file, type);
    /*
     * XXX valgrind shows e.g.
     *     invalid read of size 8 inside a string of length 69
     *     at position 64
     *     it seems that dlopen accesses words beyond the string end
     *
     *     see also the log at #37814
     */
    return result ? string_to_cstring(interp, result) : NULL;
}

/*

=item C<char* Parrot_get_runtime_prefix>

Return a malloced C-string for the runtime prefix.  The calling function
must free it.

This function is deprecated, use Parrot_get_runtime_path instead.
See RT#58988

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
char*
Parrot_get_runtime_prefix(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_get_runtime_prefix)
    int     free_it;
    char * const env = Parrot_getenv("PARROT_RUNTIME", &free_it);

    if (env)
        return free_it ? env : str_dup(env);
    else {
        PMC    * const config_hash =
            VTABLE_get_pmc_keyed_int(interp, interp->iglobals, (INTVAL) IGLOBALS_CONFIG_HASH);

        if (VTABLE_elements(interp, config_hash)) {
            STRING * const key = CONST_STRING(interp, "prefix");
            STRING * const s   = VTABLE_get_string_keyed_str(interp, config_hash, key);
            return string_to_cstring(interp, s);
        }
        else
            return str_dup(".");
    }
}

/*

=item C<STRING * Parrot_get_runtime_path>

Return a string for the runtime prefix.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_get_runtime_path(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_get_runtime_path)
    int     free_it;
    char * const env = Parrot_getenv("PARROT_RUNTIME", &free_it);
    STRING *result;

    if (env)
    {
        result = string_from_cstring(interp, env, 0);
        if (free_it)
             free(env);
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

=item C<STRING * parrot_split_path_ext>

Split the pathstring C<in> into <path><filestem><ext>. Return the
C<filestem> of the pathstring. Set C<wo_ext> to the part without
extension and C<ext> to the extension or NULL.

=cut

*/

PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
parrot_split_path_ext(PARROT_INTERP, ARGMOD(STRING *in),
        ARGOUT(STRING **wo_ext), ARGOUT(STRING **ext))
{
    ASSERT_ARGS(parrot_split_path_ext)
    STRING * const slash1 = CONST_STRING(interp, "/");
    STRING * const slash2 = CONST_STRING(interp, "\\");
    STRING * const dot    = CONST_STRING(interp, ".");
    const INTVAL len = string_length(interp, in);
    STRING *stem;
    INTVAL pos_sl, pos_dot;

    pos_sl = CHARSET_RINDEX(interp, in, slash1, len);
    if (pos_sl == -1)
        pos_sl = CHARSET_RINDEX(interp, in, slash2, len);
    pos_dot = CHARSET_RINDEX(interp, in, dot, len);

    /* XXX directory parrot-0.4.1 or such */
    if (pos_dot != -1 && isdigit((unsigned char)((char*)in->strstart)[pos_dot+1]))
        pos_dot = -1;

    ++pos_dot;
    ++pos_sl;
    if (pos_sl && pos_dot) {
        stem = string_substr(interp, in, pos_sl, pos_dot - pos_sl - 1,
                NULL, 0);
        *wo_ext = string_substr(interp, in, 0, pos_dot - 1, NULL, 0);
        *ext = string_substr(interp, in, pos_dot, len - pos_dot, NULL, 0);
    }
    else if (pos_dot) {
        stem = string_substr(interp, in, 0, pos_dot - 1, NULL, 0);
        *wo_ext = stem;
        *ext = string_substr(interp, in, pos_dot, len - pos_dot, NULL, 0);
    }
    else if (pos_sl) {
        stem = string_substr(interp, in, pos_sl, len - pos_sl, NULL, 0);
        *wo_ext = string_copy(interp, in);
        *ext = NULL;
    }
    else {
        stem = string_copy(interp, in);
        *wo_ext = stem;
        *ext = NULL;
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
 * vim: expandtab shiftwidth=4:
 */

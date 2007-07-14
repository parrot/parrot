/*
Copyright (C) 2004-2007, The Perl Foundation.
$Id$

=head1 NAME

src/library.c - Interface to Parrot's bytecode library

=head1 DESCRIPTION

This file contains a C function to access Parrot's bytecode library functions.

=head2 Functions

*/

#include "parrot/parrot.h"
#include "parrot/dynext.h"
#include <assert.h>
#include "library.str"

/* HEADERIZER HFILE: include/parrot/library.h */

/* HEADERIZER BEGIN: static */

static void cnv_to_win32_filesep( NOTNULL(STRING *path) )
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static PMC* get_search_paths( PARROT_INTERP, enum_lib_paths which )
        __attribute__nonnull__(1);

PARROT_PURE_FUNCTION
static int is_abs_path( NOTNULL(const STRING *file) )
        __attribute__nonnull__(1);

static STRING* path_append( PARROT_INTERP,
    NOTNULL(STRING *l_path),
    NOTNULL(STRING *r_path) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static STRING* path_concat( PARROT_INTERP,
    NOTNULL(STRING *l_path),
    NOTNULL(STRING *r_path) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static STRING* path_finalize( PARROT_INTERP, NOTNULL(STRING *path) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static STRING* path_guarantee_trailing_separator( PARROT_INTERP,
    NOTNULL(STRING *path) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static STRING* try_bytecode_extensions( PARROT_INTERP, NOTNULL(STRING* path) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static STRING* try_load_path( PARROT_INTERP, NOTNULL(STRING* path) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: static */


/*

FUNCDOC: parrot_init_library_paths

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

*/

void
parrot_init_library_paths(PARROT_INTERP)
{
    PMC *paths;
    STRING *entry;

    PMC * const iglobals = interp->iglobals;
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
    if (strcmp(PARROT_LOAD_EXT, PARROT_SHARE_EXT)) {
        entry = const_string(interp, PARROT_SHARE_EXT);
        VTABLE_push_string(interp, paths, entry);
    }

#ifdef PARROT_PLATFORM_LIB_PATH_INIT_HOOK
    PARROT_PLATFORM_LIB_PATH_INIT_HOOK(interp, lib_paths);
#endif
}

PARROT_WARN_UNUSED_RESULT
static PMC*
get_search_paths(PARROT_INTERP, enum_lib_paths which)
{
    PMC * const iglobals = interp->iglobals;
    PMC * const lib_paths = VTABLE_get_pmc_keyed_int(interp, iglobals,
            IGLOBALS_LIB_PATHS);
    return VTABLE_get_pmc_keyed_int(interp, lib_paths, which);
}

PARROT_PURE_FUNCTION
static int
is_abs_path(NOTNULL(const STRING *file))
{
    const char * const file_name = file->strstart;
    if (file->strlen <= 1)
        return 0;
    assert(file->encoding == Parrot_fixed_8_encoding_ptr ||
            file->encoding == Parrot_utf8_encoding_ptr);
#ifdef WIN32
    if (file_name[0] == '\\' || file_name[0] == '/' ||
            (isalpha(file_name[0]) && file->strlen > 2 &&
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
   Converts a path with forward slashes to one with backward slashes.
*/
static void
cnv_to_win32_filesep(NOTNULL(STRING *path))
{
    char* cnv;

    assert(path->encoding == Parrot_fixed_8_encoding_ptr ||
        path->encoding == Parrot_utf8_encoding_ptr);

    cnv = path->strstart;
    while ((cnv = strchr(cnv, path_separator)) != NULL)
        *cnv = win32_path_separator;
}

#endif

static STRING*
path_finalize(PARROT_INTERP, NOTNULL(STRING *path))
{

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
  unary path argument. the path string will have a
  trailing path-separator appended if it is not
  there already.
 */

static STRING*
path_guarantee_trailing_separator(PARROT_INTERP, NOTNULL(STRING *path))
{
    STRING * const path_separator_string = string_chr(interp, path_separator);

    /* make sure the path has a trailing slash before appending the file */
    if (string_index(interp, path , path->strlen - 1)
         != string_index(interp, path_separator_string, 0))
        path = string_append(interp, path , path_separator_string);

    return path;
}

/*
  binary path arguments, the left arg is modified.
  a trailing separator is guaranteed for the left
  argument and the right argument is appended
 */

static STRING*
path_append(PARROT_INTERP, NOTNULL(STRING *l_path), NOTNULL(STRING *r_path))
{
    l_path = path_guarantee_trailing_separator(interp, l_path);
    l_path = string_append(interp, l_path, r_path);

    return l_path;
}

/*
  binary path arguments. A new string is created
  that is the concatenation of the two path components
  with a path-separator.
 */

static STRING*
path_concat(PARROT_INTERP, NOTNULL(STRING *l_path), NOTNULL(STRING *r_path))
{
    STRING* join;

    join = string_copy(interp, l_path);
    join = path_guarantee_trailing_separator(interp, join);
    join = string_append(interp, join, r_path);

    return join;
}

#define LOAD_EXT_CODE_LAST 3

static const char* load_ext_code[ LOAD_EXT_CODE_LAST + 1 ] = {
    ".pbc",

    /* source level files */

    ".pasm",
    ".past",
    ".pir",
};

PARROT_WARN_UNUSED_RESULT
static STRING*
try_load_path(PARROT_INTERP, NOTNULL(STRING* path))
{
    STRING *final;

    final = string_copy(interp, path);

#if 0
    printf("path is \"%s\"\n",
           string_to_cstring(interp, final ));
#endif

    final = path_finalize(interp, final);

    if (Parrot_stat_info_intval(interp, final, STAT_EXISTS)) {
        return final;
    }

    return NULL;
}

/*
  guess extensions, so that the user can drop the extensions
  leaving it up to the build process/install whether or not
  a .pbc or a .pir file is used.
 */

PARROT_WARN_UNUSED_RESULT
static STRING*
try_bytecode_extensions(PARROT_INTERP, NOTNULL(STRING* path))
{
    STRING *with_ext, *result;

    int guess;

    /*
      first try the path without guessing to ensure compatibility with
      existing code.
     */

    with_ext = string_copy(interp, path);

    if ( (result = try_load_path(interp, with_ext) ) )
        return result;

    /*
      start guessing now. this version tries to find the lowest form of the
      code, starting with bytecode and working up to PIR. note the atypical
      loop control. This is so the array can easily be processed in reverse.
     */

    for( guess = 0 ; guess <= LOAD_EXT_CODE_LAST ; guess++ ) {
        with_ext = string_copy(interp, path);
        with_ext = string_append(interp,
                                 with_ext, const_string(interp, load_ext_code[guess]));

        if ( (result = try_load_path(interp, with_ext)) )
            return result;
    }

    return NULL;
}

/*

FUNCDOC: Parrot_locate_runtime_file

Locate the full path for C<file_name> and the given file type(s). If
successful, returns a C-string allocated with C<string_to_cstring> or
NULL otherwise.  Remember to free the string with C<string_cstring_free()>.

FUNCDOC: Parrot_locate_runtime_file_str

Like above but use and return STRINGs. If successful, the returned STRING
is 0-terminated so that C<result-E<gt>strstart> is usable as B<const char*>
c-string for C library functions like fopen(3).
This is the preferred API function.

The C<enum_runtime_ft type> is one or more of the types defined in
F<include/parrot/library.h>.

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
STRING*
Parrot_locate_runtime_file_str(PARROT_INTERP, NOTNULL(STRING *file),
        enum_runtime_ft type)
{
    STRING *prefix;
    STRING *full_name;
    INTVAL i, n;
    PMC *paths;

#if 0
    printf("requesting path: \"%s\"\n",
           string_to_cstring(interp, file ));
#endif

    /* if this is an absolute path return it as is */
    if (is_abs_path(file))
        return file;

    if (type & PARROT_RUNTIME_FT_DYNEXT)
        paths = get_search_paths(interp, PARROT_LIB_PATH_DYNEXT);
    else if (type & (PARROT_RUNTIME_FT_PBC | PARROT_RUNTIME_FT_SOURCE))
        paths = get_search_paths(interp, PARROT_LIB_PATH_LIBRARY);
    else
        paths = get_search_paths(interp, PARROT_LIB_PATH_INCLUDE);

    Parrot_get_runtime_prefix(interp, &prefix);
    n = VTABLE_elements(interp, paths);
    for (i = 0; i < n; ++i) {
        STRING * const path = VTABLE_get_string_keyed_int(interp, paths, i);

        if (string_length(interp, prefix) &&
           !is_abs_path(path)) {
            full_name = path_concat(interp, prefix , path);
        }
        else
            full_name = string_copy(interp, path);

        full_name = path_append(interp, full_name , file);

        full_name = ( type & PARROT_RUNTIME_FT_DYNEXT )
            ? try_load_path(interp, full_name)
            : try_bytecode_extensions(interp, full_name);

        if ( full_name )
            return full_name;
    }

     full_name = ( type & PARROT_RUNTIME_FT_DYNEXT )
        ? try_load_path(interp, file)
        : try_bytecode_extensions(interp, file);

     if ( full_name )
         return full_name;

    return NULL;
}

PARROT_API
PARROT_WARN_UNUSED_RESULT
char*
Parrot_locate_runtime_file(PARROT_INTERP, NOTNULL(const char *file_name),
        enum_runtime_ft type)
{
    STRING * const file = string_from_cstring(interp, file_name, 0);
    STRING * const result = Parrot_locate_runtime_file_str(interp,
            file, type);
    /*
     * XXX valgrind shows e.g.
     *     invalid read of size 8 inside a string of length 69
     *     at position 64
     *     it seems that dlopen accesses words beyond the string end
     *
     *     see also the log at #37814
     */
    return string_to_cstring(interp, result);
}

/*

FUNCDOC: Parrot_get_runtime_prefix

If C<prefix_str> is not NULL, set it to the prefix, else return a malloced
c-string for the runtime prefix.  Remember to free the string with
C<string_cstring_free()>.

XXX This is suboptimal.  We should have two funcs, so it's explicit
whether we're searching for a STRING or a cstring.

*/

PARROT_API
char*
Parrot_get_runtime_prefix(PARROT_INTERP, NULLOK(STRING **prefix_str))
{
    STRING *s, *key;
    PMC    *config_hash;
    int     free_it;
    char   *env;

    env = Parrot_getenv("PARROT_RUNTIME", &free_it);
    if (env) {
        if (prefix_str) {
            *prefix_str = string_from_cstring(interp, env, 0);
            if (free_it)
                mem_sys_free(env);
            return NULL;
        }
        if (!free_it)
            env = strdup(env);
        return env;
    }

    config_hash = VTABLE_get_pmc_keyed_int(interp, interp->iglobals,
            (INTVAL) IGLOBALS_CONFIG_HASH);
    key         = CONST_STRING(interp, "prefix");

    if (!VTABLE_elements(interp, config_hash)) {
        const char *pwd = ".";
        char *ret;

        if (prefix_str) {
            *prefix_str = const_string(interp, pwd);
            return NULL;
        }
        ret = (char *)mem_sys_allocate(3);
        strcpy(ret, pwd);
        return ret;
    }

    s = VTABLE_get_string_keyed_str(interp, config_hash, key);

    if (prefix_str) {
        *prefix_str = s;
        return NULL;
    }

    return string_to_cstring(interp, s);
}

/*

FUNCDOC: parrot_split_path_ext

Split the pathstring C<in> into <path><filestem><ext>. Return the
C<filestem> of the pathstring. Set C<wo_ext> to the part without
extension and C<ext> to the extension or NULL.

*/

STRING *
parrot_split_path_ext(PARROT_INTERP, STRING *in,
        NOTNULL(STRING **wo_ext), NOTNULL(STRING **ext))
{
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
    if (pos_dot != -1 && isdigit(((char*)in->strstart)[pos_dot+1]))
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
        *ext = 0;
    }
    else {
        stem = string_copy(interp, in);
        *wo_ext = stem;
        *ext = NULL;
    }
    return stem;
}

/*

=head1 SEE ALSO

F<include/parrot/library.h>

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

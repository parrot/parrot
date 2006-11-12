/*
Copyright (C) 2004, The Perl Foundation.
$Id$

=head1 NAME

src/library.c - Interface to Parrot's bytecode library

=head1 DESCRIPTION

This file contains a C function to access parrot's bytecode library functions.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/dynext.h"
#include <assert.h>
#include "library.str"

/*

=item C<void parrot_init_library_paths(Interp *)>

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

  void the_init_hook(Interp*, PMC *lib_paths);

Platform code may add, delete, or replace search path entries as needed. See
also F<include/parrot/library.h> for C<enum_lib_paths>.

=cut

*/

void
parrot_init_library_paths(Interp *interp)
{
    PMC *iglobals, *lib_paths, *paths;
    STRING *entry;

    iglobals = interp->iglobals;
    /* create the lib_paths array */
    lib_paths = pmc_new(interp, enum_class_FixedPMCArray);
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

static PMC*
get_search_paths(Interp *interp, enum_lib_paths which)
{
    PMC *iglobals, *lib_paths;

    iglobals = interp->iglobals;
    lib_paths = VTABLE_get_pmc_keyed_int(interp, iglobals,
            IGLOBALS_LIB_PATHS);
    return VTABLE_get_pmc_keyed_int(interp, lib_paths, which);
}

static int
is_abs_path(Interp* interp, STRING *file)
{
    char *file_name;

    file_name = file->strstart;
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

/*

=item C<char* Parrot_locate_runtime_file(Interp *, const char *file_name,
        enum_runtime_ft type)>

Locate the full path for C<file_name> and the given file type(s). If
successful, returns a C-string allocated with C<string_to_cstring> or
NULL otherwise.

=item C<STRING* Parrot_locate_runtime_file_str(Interp *, STRING  *file_name,
        enum_runtime_ft type)>

Like above but use and return STRINGs. If successful, the returned STRING
is 0-terminated so that C<result-E<gt>strstart> is usable as B<const char*>
c-string for C library functions like fopen(3).
This is the prefered API function.

The C<enum_runtime_ft type> is one or more of the types defined in
F<include/parrot/library.h>.

=cut

*/

STRING*
Parrot_locate_runtime_file_str(Interp *interp, STRING *file,
        enum_runtime_ft type)
{
    STRING *prefix, *path, *full_name, *slash, *nul;
    INTVAL i, n;
    PMC *paths;

    /* if this is an absolute path return it as is */
    if (is_abs_path(interp, file))
        return file;

    if (type & PARROT_RUNTIME_FT_DYNEXT)
        paths = get_search_paths(interp, PARROT_LIB_PATH_DYNEXT);
    else if (type & (PARROT_RUNTIME_FT_PBC | PARROT_RUNTIME_FT_SOURCE))
        paths = get_search_paths(interp, PARROT_LIB_PATH_LIBRARY);
    else
        paths = get_search_paths(interp, PARROT_LIB_PATH_INCLUDE);

#ifdef WIN32
    slash = CONST_STRING(interp, "\\");
#else
    slash = CONST_STRING(interp, "/");
#endif

    nul = string_from_const_cstring(interp, "\0", 1);
    Parrot_get_runtime_prefix(interp, &prefix);
    n = VTABLE_elements(interp, paths);
    for (i = 0; i < n; ++i) {
        path = VTABLE_get_string_keyed_int(interp, paths, i);
        if (string_length(interp, prefix) &&
           !is_abs_path(interp,path)) {
            full_name = string_concat(interp, prefix, slash, 0);
            full_name = string_append(interp, full_name, path);
        }
        else
            full_name = string_copy(interp, path);

        /* make sure this path has a trailing slash before appending the file */
        if (   string_index(interp, full_name, full_name->strlen - 1)
            != string_index(interp, slash, 0))
            full_name = string_append(interp, full_name, slash);

        full_name = string_append(interp, full_name, file);
        /* TODO create a string API that just does that
         *      a lot of ICU lib functions also need 0-terminated strings
         *      the goal is just to have for sure an invisible 0 at end
         */
        full_name = string_append(interp, full_name, nul);
        full_name->bufused--;
        full_name->strlen--;
#ifdef WIN32
        {
            char *p;
            assert(full_name->encoding == Parrot_fixed_8_encoding_ptr ||
                   full_name->encoding == Parrot_utf8_encoding_ptr);
            while ( (p = strchr(full_name->strstart, '/')) )
                *p = '\\';
        }
#endif
        if (Parrot_stat_info_intval(interp, full_name, STAT_EXISTS)) {
            return full_name;
        }
    }
    /* finally try as is */
    full_name = string_append(interp, file, nul);
    full_name->bufused--;
    full_name->strlen--;
#ifdef WIN32
    {
        char *p;
        assert(full_name->encoding == Parrot_fixed_8_encoding_ptr ||
                full_name->encoding == Parrot_utf8_encoding_ptr);
        while ( (p = strchr(full_name->strstart, '/')) )
            *p = '\\';
    }
#endif
    if (Parrot_stat_info_intval(interp, full_name, STAT_EXISTS)) {
        return full_name;
    }
    return NULL;
}

char*
Parrot_locate_runtime_file(Interp *interp, const char *file_name,
        enum_runtime_ft type)
{
    STRING *file = string_from_cstring(interp, file_name, 0);
    STRING *result = Parrot_locate_runtime_file_str(interp,
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

=item C<const char* Parrot_get_runtime_prefix(Interp *, STRING **prefix_str)>

If C<prefix_str> is not NULL, set it to the prefix, else
return a malloced c-string for the runtime prefix.

=cut

*/

const char*
Parrot_get_runtime_prefix(Interp *interp, STRING **prefix_str)
{
    STRING *s, *key;
    PMC *config_hash;
    int free_it;
    char *env;

    env = Parrot_getenv("PARROT_RUNTIME", &free_it);
    if (env) {
        if (prefix_str) {
            *prefix_str = string_from_cstring(interp, env, 0);
            if (free_it)
                free(env);
            return NULL;
        }
        if (!free_it)
            env = strdup(env);
        return env;
    }

    config_hash = VTABLE_get_pmc_keyed_int(interp, interp->iglobals,
            (INTVAL) IGLOBALS_CONFIG_HASH);
    key = CONST_STRING(interp, "prefix");
    if (!VTABLE_elements(interp, config_hash)) {
        const char *pwd = ".";
        char *ret;

        if (prefix_str) {
            *prefix_str = const_string(interp, pwd);
            return NULL;
        }
        ret = mem_sys_allocate(3);
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

=item C<STRING *
parrot_split_path_ext(Interp*, STRING *in, STRING **wo_ext, STRING **ext)>

Split the pathstring C<in> into <path><filestem><ext>. Return the
C<filestem> of the pathstring. Set C<wo_ext> to the part without
extension and C<ext> to the extension or NULL.

=cut

*/

STRING *
parrot_split_path_ext(Interp* interp, STRING *in,
        STRING **wo_ext, STRING **ext)
{
    STRING *slash1, *slash2, *dot, *stem;
    INTVAL pos_sl, pos_dot, len;
    slash1 = CONST_STRING(interp, "/");
    slash2 = CONST_STRING(interp, "\\");
    dot    = CONST_STRING(interp, ".");
    len = string_length(interp, in);
    pos_sl = CHARSET_RINDEX(interp, in, slash1, len);
    if (pos_sl == -1)
        pos_sl = CHARSET_RINDEX(interp, in, slash2, len);
    pos_dot = CHARSET_RINDEX(interp, in, dot, len);

    /* XXX directory parrot-0.4.1 or such */
    if (pos_dot != -1 && isdigit( ((char*)in->strstart)[pos_dot+1]))
        pos_dot = -1;

    ++pos_dot;
    ++pos_sl;
    if (pos_sl && pos_dot ) {
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

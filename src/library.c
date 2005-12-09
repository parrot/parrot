/*
Copyright: 2004 The Perl Foundation.  All Rights Reserved.
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
parrot_init_library_paths(Interp *interpreter)
{
    PMC *iglobals, *lib_paths, *paths;
    STRING *entry;
    
    iglobals = interpreter->iglobals;
    /* create the lib_paths array */
    lib_paths = pmc_new(interpreter, enum_class_FixedPMCArray);
    VTABLE_set_integer_native(interpreter, lib_paths, PARROT_LIB_PATH_SIZE);
    VTABLE_set_pmc_keyed_int(interpreter, iglobals,
            IGLOBALS_LIB_PATHS, lib_paths);
    /* each is an array of strings */
    /* define include paths */
    paths = pmc_new(interpreter, enum_class_ResizableStringArray);
    VTABLE_set_pmc_keyed_int(interpreter, lib_paths,
            PARROT_LIB_PATH_INCLUDE, paths);
    entry = CONST_STRING(interpreter, "runtime/parrot/include/");
    VTABLE_push_string(interpreter, paths, entry);
    entry = CONST_STRING(interpreter, "runtime/parrot/");
    VTABLE_push_string(interpreter, paths, entry);
    entry = CONST_STRING(interpreter, "./");
    VTABLE_push_string(interpreter, paths, entry);
    entry = CONST_STRING(interpreter, "lib/parrot/runtime/include/");
    VTABLE_push_string(interpreter, paths, entry);
    entry = CONST_STRING(interpreter, "lib/parrot/runtime/");
    VTABLE_push_string(interpreter, paths, entry);

    /* define library paths */
    paths = pmc_new(interpreter, enum_class_ResizableStringArray);
    VTABLE_set_pmc_keyed_int(interpreter, lib_paths,
            PARROT_LIB_PATH_LIBRARY, paths);
    entry = CONST_STRING(interpreter, "runtime/parrot/library/");
    VTABLE_push_string(interpreter, paths, entry);
    entry = CONST_STRING(interpreter, "runtime/parrot/");
    VTABLE_push_string(interpreter, paths, entry);
    entry = CONST_STRING(interpreter, "./");
    VTABLE_push_string(interpreter, paths, entry);
    entry = CONST_STRING(interpreter, "lib/parrot/runtime/library/");
    VTABLE_push_string(interpreter, paths, entry);
    entry = CONST_STRING(interpreter, "lib/parrot/runtime/");
    VTABLE_push_string(interpreter, paths, entry);

    /* define dynext paths */
    paths = pmc_new(interpreter, enum_class_ResizableStringArray);
    VTABLE_set_pmc_keyed_int(interpreter, lib_paths,
            PARROT_LIB_PATH_DYNEXT, paths);
    entry = CONST_STRING(interpreter, "runtime/parrot/dynext/");
    VTABLE_push_string(interpreter, paths, entry);
    entry = CONST_STRING(interpreter, "");
    VTABLE_push_string(interpreter, paths, entry);
    entry = CONST_STRING(interpreter, "lib/parrot/runtime/dynext/");
    VTABLE_push_string(interpreter, paths, entry);

    /* shared exts */
    paths = pmc_new(interpreter, enum_class_ResizableStringArray);
    VTABLE_set_pmc_keyed_int(interpreter, lib_paths,
            PARROT_LIB_DYN_EXTS, paths);
    entry = CONST_STRING(interpreter, PARROT_LOAD_EXT);
    VTABLE_push_string(interpreter, paths, entry);
    if (strcmp(PARROT_LOAD_EXT, PARROT_SHARE_EXT)) {
        entry = CONST_STRING(interpreter, PARROT_SHARE_EXT);
        VTABLE_push_string(interpreter, paths, entry);
    }

#ifdef PARROT_PLATFORM_LIB_PATH_INIT_HOOK
    PARROT_PLATFORM_LIB_PATH_INIT_HOOK(interpreter, lib_paths);
#endif
}

static PMC* 
get_search_paths(Interp *interpreter, enum_lib_paths which)
{
    PMC *iglobals, *lib_paths;
    
    iglobals = interpreter->iglobals;
    lib_paths = VTABLE_get_pmc_keyed_int(interpreter, iglobals,
            IGLOBALS_LIB_PATHS);
    return VTABLE_get_pmc_keyed_int(interpreter, lib_paths, which);
}

static int
is_abs_path(Interp* interpreter, STRING *file)
{
    size_t length;
    char *file_name;
    
    file_name = file->strstart;
    if (file->strlen <= 1)
        return 0;
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
Parrot_locate_runtime_file_str(Interp *interpreter, STRING *file,
        enum_runtime_ft type)
{
    STRING *prefix, *path, *full_name, *slash, *nul;
    INTVAL i, n;
    PMC *paths;

    /* if this is an absolute path return it as is */
    if (is_abs_path(interpreter, file))
        return file;

    if (type & PARROT_RUNTIME_FT_DYNEXT)
        paths = get_search_paths(interpreter, PARROT_LIB_PATH_DYNEXT);
    else if (type & (PARROT_RUNTIME_FT_PBC | PARROT_RUNTIME_FT_SOURCE))
        paths = get_search_paths(interpreter, PARROT_LIB_PATH_LIBRARY);
    else
        paths = get_search_paths(interpreter, PARROT_LIB_PATH_INCLUDE);

#ifdef WIN32
    slash = CONST_STRING(interpreter, "\\");
#else
    slash = CONST_STRING(interpreter, "/");
#endif

    nul = string_from_const_cstring(interpreter, "\0", 1);
    Parrot_get_runtime_prefix(interpreter, &prefix);
    n = VTABLE_elements(interpreter, paths);
    for (i = 0; i < n; ++i) {
        path = VTABLE_get_string_keyed_int(interpreter, paths, i);
        if (string_length(interpreter, prefix)) {
            full_name = string_concat(interpreter, prefix, slash, 0);
            full_name = string_append(interpreter, full_name, path, 0);
        }
        else
            full_name = string_copy(interpreter, path);
        full_name = string_append(interpreter, full_name, file, 0);
        full_name = string_append(interpreter, full_name, nul, 0);
#ifdef WIN32
        {
            char *p;
            while ( (p = strchr(full_name->strstart, '/')) )
                *p = '\\';
        }
#endif
        if (Parrot_stat_info_intval(interpreter, full_name, STAT_EXISTS)) {
            return full_name;
        }
    }
    /* finally try as is */
    full_name = string_append(interpreter, file, nul, 0);
#ifdef WIN32
    {
        char *p;
        while ( (p = strchr(full_name->strstart, '/')) )
            *p = '\\';
    }
#endif
    if (Parrot_stat_info_intval(interpreter, full_name, STAT_EXISTS)) {
        return full_name;
    }
    return NULL;
}

char*
Parrot_locate_runtime_file(Interp *interpreter, const char *file_name,
        enum_runtime_ft type)
{
    STRING *file = string_from_cstring(interpreter, file_name, 0);
    STRING *result = Parrot_locate_runtime_file_str(interpreter,
            file, type);
    /*
     * XXX valgrind shows e.g. 
     *     invalid read of size 8 inside a string of length 69
     *     at position 64
     *     it seems that dlopen accesses words beyond the string end
     *
     *     see also the log at #37814
     */
    return string_to_cstring(interpreter, result);
}
/*

=item C<const char* Parrot_get_runtime_prefix(Interp *, STRING **prefix_str)>

If C<prefix_str> is not NULL, set it to the prefix, else
return a malloced c-string for the runtime prefix.

=cut

*/

const char*
Parrot_get_runtime_prefix(Interp *interpreter, STRING **prefix_str)
{
    STRING *s, *key;
    PMC *config_hash;
    int free_it;
    char *env;

    env = Parrot_getenv("PARROT_RUNTIME", &free_it);
    if (env) {
        if (prefix_str) {
            *prefix_str = string_from_cstring(interpreter, env, 0);
            if (free_it)
                free(env);
            return NULL;
        }
        if (!free_it)
            env = strdup(env);
        return env;
    }

    config_hash = VTABLE_get_pmc_keyed_int(interpreter, interpreter->iglobals,
            (INTVAL) IGLOBALS_CONFIG_HASH);
    key = CONST_STRING(interpreter, "prefix");
    if (!VTABLE_elements(interpreter, config_hash)) {
        const char *pwd = ".";
        char *ret;

        if (prefix_str) {
            *prefix_str = CONST_STRING(interpreter, pwd);
            return NULL;
        }
        ret = mem_sys_allocate(3);
        strcpy(ret, pwd);
        return ret;
    }
    s = VTABLE_get_string_keyed_str(interpreter, config_hash, key);
    if (prefix_str) {
        *prefix_str = s;
        return NULL;
    }
    return string_to_cstring(interpreter, s);
}

/*

=item C<void Parrot_autoload_class(Interp *, STRING *class)>

Try to load a library that holds the PMC class.

XXX Check if this is still needed with HLL type mappings.

=cut

*/
void
Parrot_autoload_class(Interp *interpreter, STRING *class)
{
    static const struct {
        const char *prefix;
        const char *lib;
    } mappings[] = {
        { "Py", "python_group" },
        { "Tcl", "tcl_group" }
    };
    size_t i;
    char *cclass;

    cclass = string_to_cstring(interpreter, class);
    for (i = 0; i < sizeof(mappings)/sizeof(mappings[0]); ++i) {
        if (!memcmp(mappings[i].prefix, cclass, strlen(mappings[i].prefix))) {
            STRING *slib = const_string(interpreter, mappings[i].lib);
            Parrot_load_lib(interpreter, slib, NULL);
            break;
        }
    }
    string_cstring_free(cclass);

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
parrot_split_path_ext(Interp* interpreter, STRING *in, 
        STRING **wo_ext, STRING **ext)
{
    STRING *slash1, *slash2, *dot, *stem;
    INTVAL pos_sl, pos_dot, len;
    slash1 = CONST_STRING(interpreter, "/");
    slash2 = CONST_STRING(interpreter, "\\");
    dot    = CONST_STRING(interpreter, ".");
    len = string_length(interpreter, in);
    pos_sl = CHARSET_RINDEX(interpreter, in, slash1, len);
    if (pos_sl == -1)
        pos_sl = CHARSET_RINDEX(interpreter, in, slash2, len);
    pos_dot = CHARSET_RINDEX(interpreter, in, dot, len);
    ++pos_dot;
    ++pos_sl;
    if (pos_sl && pos_dot ) {
        stem = string_substr(interpreter, in, pos_sl, pos_dot - pos_sl - 1,
                NULL, 0);
        *wo_ext = string_substr(interpreter, in, 0, pos_dot - 1, NULL, 0);
        *ext = string_substr(interpreter, in, pos_dot, len - pos_dot, NULL, 0);
    }
    else if (pos_dot) {
        stem = string_substr(interpreter, in, 0, pos_dot - 1, NULL, 0);
        *wo_ext = stem;
        *ext = string_substr(interpreter, in, pos_dot, len - pos_dot, NULL, 0);
    }
    else {
        stem = string_copy(interpreter, in);
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
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

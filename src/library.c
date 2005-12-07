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

static char*
is_abs_path(const char *file_name)
{
    size_t length;
    char *full_name;
    
    /* use absolute paths as is */
#ifdef WIN32
    if (file_name[0] == '\\' || file_name[0] == '/' ||
        (isalpha(file_name[0]) &&
            (strncmp(file_name+1, ":\\", 2) == 0 ||
             strncmp(file_name+1, ":/",  2) == 0)))
#else
    if (file_name[0] == '/')     /* XXX  ../foo, ./bar */
#endif
    {
        length = strlen(file_name) + 1;
        full_name = mem_sys_allocate(length);
        strcpy(full_name, file_name);
        return full_name;
    }
    return NULL;
}

/*

=item C<char* Parrot_locate_runtime_file(Interp *, const char *file_name,
        enum_runtime_ft type)>

Locate the full path for C<file_name> and the given file type(s). If
successful, returns a mem_sys_allocate()ed string or NULL otherwise.

The C<enum_runtime_ft type> is one or more of the types defined in
F<include/parrot/library.h>.

*/

char*
Parrot_locate_runtime_file(Interp *interpreter, const char *file_name,
        enum_runtime_ft type)
{
    STRING *prefix, *path, *file, *full_name, *slash, *nul;
    INTVAL i, n;
    PMC *paths;
    char *absp;

    /* if this is an absolute path return it as is */
    absp = is_abs_path(file_name);
    if (absp)
        return absp;

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
       file = string_from_const_cstring(interpreter, file_name, 0);

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
            /*
             * XXX valgrind shows e.g. 
             *     invalid read of size 8 inside a string of length 69
             *     at position 64
             *     it seems that dlopen accesses words beyond the string end
             *
             *     see also the log at #37814
             */
            return string_to_cstring(interpreter, full_name);
        }
    }
    return NULL;
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

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
    char *full_name, *ext;
    char *parrot_path = NULL;
    const char **ptr;
    const char *prefix;
    int free_prefix = 0;
    STRING *str;
    const char *include_paths[] = {
        "runtime/parrot/include/",
        "runtime/parrot/",
        "./",
        "lib/parrot/runtime/include/",
        "lib/parrot/runtime/",
        NULL
    };
    const char *library_paths[] = {
        "runtime/parrot/library/",
        "runtime/parrot/",
        "./",
        "lib/parrot/runtime/library/",
        "lib/parrot/runtime/",
        NULL
    };
    const char *dynext_paths[] = {
        "runtime/parrot/dynext/",
        "",
        "lib/parrot/runtime/dynext/",
        NULL
    };
    const char **paths;
    size_t length;

    union {
        const void * __c_ptr;
        void * __ptr;
    } __ptr_u;
    if (type & PARROT_RUNTIME_FT_DYNEXT)
        paths = dynext_paths;
    else if (type & (PARROT_RUNTIME_FT_PBC | PARROT_RUNTIME_FT_SOURCE))
        paths = library_paths;
    else
        paths = include_paths;

    prefix = Parrot_get_runtime_prefix(interpreter, NULL);
    /* note: free prefix or better use the STRING interface */
    if (!prefix)
        prefix = "";
    else
        free_prefix = 1;

    ext = strchr(file_name, '.');
    /*
     * if the extension is given use it
     * TODO if not try extensions according to type
     */
    /* let the failure propagate back for better error handling
    if (!ext) {
        internal_exception(UNIMPLEMENTED, "no extension: file '%s'", file_name);
    }
    */

    /* use absolute paths as is */
#ifdef WIN32
    if (file_name[0] == '\\' || file_name[0] == '/' ||
        (isalpha(file_name[0]) &&
            (strncmp(file_name+1, ":\\", 2) == 0 ||
             strncmp(file_name+1, ":/",  2) == 0)))
#else
    if (file_name[0] == '/')
#endif
    {
        length = strlen(file_name) + 1;
        full_name = mem_sys_allocate(length);
        strcpy(full_name, file_name);
        return full_name;
    }

    /* Otherwise look at possible library paths. */
    length = 0;
    for (ptr = paths; *ptr; ++ptr) {
        size_t len = strlen(*ptr);
        length = (len > length) ? len : length;
    }
    length += strlen(prefix) + strlen(file_name) + 2;
    full_name = mem_sys_allocate(length);

    /* If we're on Win32, the current path to the Parrot install will feature in our search. */
#ifdef WIN32
        {
            int parrot_path_len;
            parrot_path = mem_sys_allocate(256 + length);
            if ((parrot_path_len = GetModuleFileName(NULL, parrot_path, 256)) > 0)
            {
                /* Snip off executable name. */
                char *c = parrot_path + parrot_path_len;
                while (*c != '\\' && c >= parrot_path)
                    c--;
                *c = 0;

                /* If parrot is in a bin directory, runtime will be above that. */
                if (c - 4 > parrot_path && strcmp(c - 4, "\\bin") == 0)
                    *(c - 4) = 0;

                /* Put on a \. */
                strcat(parrot_path, "\\");
            }
            else
            {
                string_cstring_free(parrot_path);
                parrot_path = NULL;
            }
        }
#endif

    for (ptr = paths; *ptr; ++ptr) {
        /* Add prefix and suggested path. */
        strcpy(full_name, prefix);
        if (*prefix) {
#ifdef WIN32
            strcat(full_name, "\\");
#else
            strcat(full_name, "/");
#endif
        }
        strcat(full_name, *ptr);
        strcat(full_name, file_name);
        assert(strlen(full_name) < length);
#ifdef WIN32
        {
            char *p;
            while ( (p = strchr(full_name, '/')) )
                *p = '\\';
        }
#endif
        str = string_from_cstring(interpreter, full_name, strlen(full_name));
        if (Parrot_stat_info_intval(interpreter, str, STAT_EXISTS)) {
            if (free_prefix)
                string_cstring_free(const_cast(prefix));
            return full_name;
        }

        /* If we are on Win32, we'll also look relative to the executable. */
#ifdef WIN32
        {
            if (parrot_path)
            {
                /* Save current string length. */
                int old_parrot_path_len = strlen(parrot_path);
                char *p;

                /* Pop library path and file name on it. */
                strcat(parrot_path, *ptr);
                strcat(parrot_path, file_name);

                /* Fix up any forward slashes. */
                while ((p = strchr(parrot_path, '/')))
                    *p = '\\';

                /* And try it. */
                str = string_from_cstring(interpreter, parrot_path, strlen(parrot_path));
                if (Parrot_stat_info_intval(interpreter, str, STAT_EXISTS)) {
                    if (free_prefix)
                        string_cstring_free(const_cast(prefix));
                    return parrot_path;
                }
                else
                {
                    *(parrot_path + old_parrot_path_len) = 0;
                }
            }
        }
#endif
    }

    /*
     * finally if prefix is set, try current location
     */
    if (*prefix) {
        strcpy(full_name, file_name);
#ifdef WIN32
        {
            char *p;
            while ( (p = strchr(full_name, '/')) )
                *p = '\\';
        }
#endif
        str = string_from_cstring(interpreter, full_name, strlen(full_name));
        if (Parrot_stat_info_intval(interpreter, str, STAT_EXISTS)) {
            if (free_prefix)
                string_cstring_free(const_cast(prefix));
            return full_name;
        }
    }
    if (free_prefix)
        string_cstring_free(const_cast(prefix));
    return NULL;
}

/*

=item C<const char* Parrot_get_runtime_prefix(Interp *, STRING **prefix_str)>

Returns a malloced string for the runtime prefix.

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
        if (!free_it)
            env = strdup(env);
        if (prefix_str)
            *prefix_str = string_from_cstring(interpreter, env, 0);
        return env;
    }

    config_hash = VTABLE_get_pmc_keyed_int(interpreter, interpreter->iglobals,
            (INTVAL) IGLOBALS_CONFIG_HASH);
    key = CONST_STRING(interpreter, "prefix");
    if (!VTABLE_elements(interpreter, config_hash)) {
        const char *pwd = "./";
        char *ret;

        if (prefix_str)
            *prefix_str = CONST_STRING(interpreter, pwd);
        ret = mem_sys_allocate(3);
        strcpy(ret, pwd);
        return ret;
    }
    s = VTABLE_get_string_keyed_str(interpreter, config_hash, key);
    if (prefix_str)
	*prefix_str = s;
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

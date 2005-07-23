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

#if 0
/*

=item C<static void
library_init(Parrot_Interp interpreter)>

internal helper function - loads the parrotlib bytecode

=cut

*/

static void
library_init(Parrot_Interp interpreter)
{
    /* XXX TODO: file location not known at runtime, should
       be linked with parrot (or use the upcoming config system) */
    Parrot_load_bytecode(interpreter, "runtime/parrot/include/parrotlib.pbc");
}

/*

=item C<void*
Parrot_library_query(Parrot_Interp, const char *func_name, ...)>

Runs the library function with the specified function name and returns
the result.

=cut

*/

void*
Parrot_library_query(Parrot_Interp interpreter, const char *func_name, ...)
{
    static int init_done = 0;
    va_list args;
    void *ret;
    PMC *sub, *prop;
    STRING *str, *name;
    char *csig;
    INTVAL resume = interpreter->resume_flag;

    if (!init_done) {
	library_init(interpreter);

        init_done = 1;
    }

    name = string_from_cstring(interpreter, func_name, strlen(func_name));

    /* get the sub pmc */
    str = CONST_STRING(interpreter, "_parrotlib");
    sub = Parrot_find_global(interpreter, str, name);
    if (!sub) {
        interpreter->resume_flag = resume;
	internal_exception(1, "unknown parrotlib method '%s'", func_name);
	abort();
    }

    /* get the signature */
    str = CONST_STRING(interpreter, "signature");
    prop = VTABLE_getprop(interpreter, sub, str);
    if (!prop) {
        interpreter->resume_flag = resume;
	internal_exception(1, "parrotlib method '%s' has no signature", func_name);
	abort();
    }
    str = VTABLE_get_string(interpreter, prop);
    csig = string_to_cstring(interpreter, str);

    /* call the bytecode method */
    va_start(args, func_name);
    ret = Parrot_runops_fromc_arglist_save(interpreter, sub, csig, args);
    va_end(args);

    string_cstring_free(csig);

    /* done */
    interpreter->resume_flag = resume;
    return ret;
}

STRING*
Parrot_library_fallback_locate(Parrot_Interp interp, const char *file_name, const char **incl)
{
    char *s;
    const char** ptr;
    int length = 0;
    int i, ok = 0;
    STRING *str = NULL; /* gcc uninit warn */

    /* calculate the length of the largest include directory */
    for( ptr = incl; *ptr != 0; ++ptr ) {
        i = strlen(*ptr);
        length = (i > length) ? i : length;
    }

    s = malloc(strlen(file_name) + length + 1);

    for( ptr = incl; (!ok) && (*ptr != 0); ++ptr ) {
        strcpy(s, *ptr);
        strcat(s, file_name);

#ifdef WIN32
        {
            char *p;
            while ( (p = strchr(s, '/')) )
                *p = '\\';
        }
#endif
	str = string_from_cstring(interp, s, strlen(s));
	ok = Parrot_stat_info_intval(interp, str, STAT_EXISTS);
    }
    if (!ok) {
	str = NULL;
    }
    free( s );
    return str;
}

#endif

/*

=item C<char* Parrot_locate_runtime_file(Interp *, const char *file_name,
        enum_runtime_ft type)>

Locate the full patch for C<file_name> and the given file type(s). If
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
        NULL
    };
    const char *library_paths[] = {
        "runtime/parrot/library/",
        "runtime/parrot/",
        "./",
        NULL
    };
    const char *dynext_paths[] = {
        "runtime/parrot/dynext/",
        "",
        NULL
    };
    const char **paths;
    int length;

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
    if (!ext) {
        internal_exception(UNIMPLEMENTED, "no extension: file '%s'", file_name);
    }

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
        int len = strlen(*ptr);
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
                string_cstring_free(prefix);
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
                        string_cstring_free(prefix);
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
                string_cstring_free(prefix);
            return full_name;
        }
    }
    if (free_prefix)
        string_cstring_free(prefix);
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

/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/dynext.c - Dynamic extensions to Parrot

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/dynext.h"

/* _PARROTLIB is now the default */
/*#define _PARROTLIB not working: "make testr" */

/*

=item C<static void
set_cstring_prop(Parrot_Interp interpreter, PMC *lib_pmc, const char *what,
        STRING *name)>

Set a property C<name> with value C<what> on the C<ParrotLibrary>
C<lib_pmc>.

=cut

*/

static void
set_cstring_prop(Parrot_Interp interpreter, PMC *lib_pmc, const char *what,
        STRING *name)
{
    PMC *prop;
    STRING *key;

    prop = pmc_new(interpreter, enum_class_String);
    VTABLE_set_string_native(interpreter, prop, name);
    key = const_string(interpreter, what);
    VTABLE_setprop(interpreter, lib_pmc, key, prop);
}

/*

=item C<static void
store_lib_pmc(Parrot_Interp interpreter, PMC* lib_pmc, STRING *path,
        STRING *type)>

Store a C<ParrotLibrary> PMC in the interpreter's C<iglobals>.

=cut

*/

static void
store_lib_pmc(Parrot_Interp interpreter, PMC* lib_pmc, STRING *path,
        STRING *type)
{
    PMC *iglobals, *dyn_libs;

    iglobals = interpreter->iglobals;
    dyn_libs = VTABLE_get_pmc_keyed_int(interpreter, iglobals,
            IGLOBALS_DYN_LIBS);
    if (!dyn_libs) {
        dyn_libs = pmc_new(interpreter, enum_class_ResizablePMCArray);
        VTABLE_set_pmc_keyed_int(interpreter, iglobals,
                IGLOBALS_DYN_LIBS, dyn_libs);
    }
    /*
     * remember path/file in props
     */
    set_cstring_prop(interpreter, lib_pmc, "_filename", path);
    set_cstring_prop(interpreter, lib_pmc, "_type", type);
    VTABLE_push_pmc(interpreter, dyn_libs, lib_pmc);
}

/*

=item C<static PMC*
is_loaded(Parrot_Interp interpreter, STRING *path)>

Check if a C<ParrotLibrary> PMC with the filename path exists. 
If it does, return it. Otherwise, return NULL.

=cut

*/

static PMC*
is_loaded(Parrot_Interp interpreter, STRING *path)
{
    PMC *iglobals, *dyn_libs, *prop, *lib_pmc;
    STRING *key;
    INTVAL i, n;

    iglobals = interpreter->iglobals;
    dyn_libs = VTABLE_get_pmc_keyed_int(interpreter, iglobals,
            IGLOBALS_DYN_LIBS);
    if (!dyn_libs) {
        return NULL;
    }
    n = VTABLE_elements(interpreter, dyn_libs);
    key = const_string(interpreter, "_filename");
    /* we could use an ordered hash for faster lookup here */
    for (i = 0; i < n; i++) {
        lib_pmc = VTABLE_get_pmc_keyed_int(interpreter, dyn_libs, i);
        prop = VTABLE_getprop(interpreter, lib_pmc, key);
        if (!string_compare(interpreter,
                    VTABLE_get_string(interpreter, prop), path))
            return lib_pmc;
    }
    return NULL;
}

/*

=item C<static STRING *
get_path(Interp *interpreter, STRING *lib, void **handle)>

Return path and handle of a dynamic lib.

=cut

*/

static STRING *
get_path(Interp *interpreter, STRING *lib, void **handle)
{
    STRING *path;
    char *full_name, *file_name, *file_w_ext = NULL;
    const char *err;

    /*
     * first try file with extension if it got none
     */
    file_name = string_to_cstring(interpreter, lib);
    if (!strchr(file_name, '.')) {
        file_w_ext = malloc(strlen(file_name) +
                strlen(PARROT_LOAD_EXT) + 1);
        strcpy(file_w_ext, file_name);
        strcat(file_w_ext, PARROT_LOAD_EXT);
        full_name = Parrot_locate_runtime_file(interpreter, file_w_ext,
                PARROT_RUNTIME_FT_DYNEXT);
        if (full_name) {
            *handle = Parrot_dlopen(full_name);
            if (*handle) {
                path = string_from_cstring(interpreter, full_name, 0);
                string_cstring_free(file_name);
                string_cstring_free(file_w_ext);
                return path;
            }
            err = Parrot_dlerror();
            fprintf(stderr, "Couldn't load '%s': %s\n",
                    full_name, err ? err : "unknown reason");
            return NULL;
        }
        /*
         * then file.extension w/o prefix
         */
        *handle = Parrot_dlopen(file_w_ext);
        if (*handle) {
            path = string_from_cstring(interpreter, file_w_ext, 0);
            string_cstring_free(file_name);
            string_cstring_free(file_w_ext);
            return path;
        }
        string_cstring_free(file_w_ext);
        if (strcmp(PARROT_LOAD_EXT, PARROT_SHARE_EXT)) {
            file_w_ext = malloc(strlen(file_name) +
                    strlen(PARROT_SHARE_EXT) + 1);
            strcpy(file_w_ext, file_name);
            strcat(file_w_ext, PARROT_SHARE_EXT);
            full_name = Parrot_locate_runtime_file(interpreter, file_w_ext,
                    PARROT_RUNTIME_FT_DYNEXT);
            if (full_name) {
                *handle = Parrot_dlopen(full_name);
                if (*handle) {
                    path = string_from_cstring(interpreter, full_name, 0);
                    string_cstring_free(file_name);
                    string_cstring_free(file_w_ext);
                    return path;
                }
                err = Parrot_dlerror();
                fprintf(stderr, "Couldn't load '%s': %s\n",
                        full_name, err ? err : "unknown reason");
                return NULL;
            }
            /*
             * then file.extension w/o prefix
             */
            *handle = Parrot_dlopen(file_w_ext);
            if (*handle) {
                path = string_from_cstring(interpreter, file_w_ext, 0);
                string_cstring_free(file_name);
                string_cstring_free(file_w_ext);
                return path;
            }
            string_cstring_free(file_w_ext);
        }
    }
    /*
     * then the given file name as is
     */
    *handle = Parrot_dlopen(file_name);
    if (*handle) {
        path = string_from_cstring(interpreter, file_name, 0);
        string_cstring_free(file_name);
        return path;
    }
    err = Parrot_dlerror();
    fprintf(stderr, "Couldn't load '%s': %s\n",
            file_name, err ? err : "unknown reason");
    return NULL;
}

/*

=item C<PMC *
Parrot_load_lib(Interp *interpreter, STRING *lib, PMC *initializer)>

Dynamic library loader.

C<initializer> is currently unused.

Calls C<Parrot_lib_%s_load()> which performs the registration of the lib
once C<Parrot_lib_%s_init()> gets called (if exists) to perform thread
specific setup. In both functions C<%s> is the name of the library.

If Parrot_lib_%s_load() succeeds, it should either return a
ParrotLibrary PMC, which is then used as the handle for this library
or NULL, in which case parrot creates a handle for the library.

If either Parrot_lib_%s_load() or Parrot_lib_%s_init() detects an error
condition, an exception should be thrown.

TODO: fetch Parrot_lib load/init handler exceptions

=cut

*/

PMC *
Parrot_init_lib(Interp *interpreter,
                PMC *(*load_func)(Interp *),
                void (*init_func)(Interp *, PMC *))
{
    PMC *lib_pmc = NULL;

    if (load_func)
        lib_pmc = (*load_func)(interpreter);

    if (!load_func || !lib_pmc) {
        /* seems to be a native/NCI lib */
        /*
         * this PMC should better be constant, but then all the contents
         * and the metadata have to be constant too
         * s. also build_tools/ops2c.pl and lib/Parrot/Pmc2c.pm
         */
        lib_pmc = pmc_new(interpreter, enum_class_ParrotLibrary);
    }
    /*
     *  call init, if it exists
     */
    if (init_func)
        (init_func)(interpreter, lib_pmc);

    return lib_pmc;
}

PMC *
Parrot_load_lib(Interp *interpreter, STRING *lib, PMC *initializer)
{
    STRING *path, *load_func_name, *init_func_name, *type;
    void * handle;
    PMC *(*load_func)(Interp *);
    void (*init_func)(Interp *, PMC *);
    char *cinit_func_name, *cload_func_name;
    PMC *lib_pmc;

    UNUSED(initializer);
    path = get_path(interpreter, lib, &handle);
    if (!path || !handle) {
        /*
         * XXX internal_exception? return PMCNULL?
         * PMC Undef seems convenient, because it can be queried with get_bool()
         */
        return pmc_new(interpreter, enum_class_Undef);
    }

    /*
     * TODO move the class_count_mutex here
     *
     * LOCK()
     */
    lib_pmc = is_loaded(interpreter, path);
    if (lib_pmc) {
        Parrot_dlclose(handle);
        /* UNLOCK */
        return lib_pmc;
    }
    /* get load_func */
    load_func_name = Parrot_sprintf_c(interpreter, "Parrot_lib_%Ss_load", lib);
    cload_func_name = string_to_cstring(interpreter, load_func_name);
    load_func = (PMC * (*)(Interp *))D2FPTR(Parrot_dlsym(handle,
                cload_func_name));
    string_cstring_free(cload_func_name);
    /* get init_func */
    init_func_name = Parrot_sprintf_c(interpreter, "Parrot_lib_%Ss_init", lib);
    cinit_func_name = string_to_cstring(interpreter, init_func_name);
    init_func = (void (*)(Interp *, PMC *))D2FPTR(Parrot_dlsym(handle,
                cinit_func_name));
    string_cstring_free(cinit_func_name);

    lib_pmc = Parrot_init_lib(interpreter, load_func, init_func);

    PMC_data(lib_pmc) = handle;
    if (!load_func)
        type = const_string(interpreter, "NCI");
    else {
        /* we could set a private flag in the PMC header too
         * but currently only ops files have struct_val set
         */
        type = const_string(interpreter,
                               PMC_struct_val(lib_pmc) ? "Ops" : "PMC");
    }
    /*
     * remember lib_pmc in iglobals
     */
    store_lib_pmc(interpreter, lib_pmc, path, type);
    /* UNLOCK */
    return lib_pmc;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/dynext.h> and F<classes/parrotlibrary.pmc>.

=head1 HISTORY

Initial rev by leo 2003.08.06.

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

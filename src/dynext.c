/* dynext.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Dynamic extension stuff
 *  Data Structure and Algorithms:
 *  History:
 *     Initial rev by leo 2003.08.06
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"
#include "parrot/dynext.h"


/*
 * dynamic library loader
 * the initializer is currently unused
 *
 * calls Parrot_lib_load_%s which performs the registration of the lib once
 *       Parrot_lib_init_%s gets called (if exists) to perform thread specific setup
 */

PMC *
Parrot_load_lib(Interp *interpreter, STRING *lib, PMC *initializer)
{
    STRING *path, *load_func_name, *init_func_name;
    void * handle;
    PMC *(*load_func)(Interp *);
    void (*init_func)(Interp *, PMC *);
    char *cpath, *cinit_func_name, *cload_func_name;
    PMC *lib_pmc;

    UNUSED(initializer);
    /* TODO runtime path for dynamic extensions */
    /* TODO $SO extension */
#ifndef RUNTIME_DYNEXT
#  define RUNTIME_DYNEXT "runtime/parrot/dynext/"
#endif
#ifndef SO_EXTENSION
#  define SO_EXTENSION ".so"
#endif

    path = Parrot_sprintf_c(interpreter, "%s%Ss%s",
            RUNTIME_DYNEXT,
            lib,
            SO_EXTENSION);
    cpath = string_to_cstring(interpreter, path);
    handle = Parrot_dlopen(cpath);
    if (!handle) {
        const char * err = Parrot_dlerror();
        fprintf(stderr, "Couldn't load '%s': %s\n", cpath, err ? err : "unknow reason");
        return NULL;
    }
    string_cstring_free(cpath);
    load_func_name = Parrot_sprintf_c(interpreter, "Parrot_lib_%Ss_load", lib);
    cload_func_name = string_to_cstring(interpreter, load_func_name);
    load_func = (PMC * (*)(Interp *))D2FPTR(Parrot_dlsym(handle, cload_func_name));
    if (!load_func) {
        fprintf(stderr, "Failed to find symbol '%s' in native library\n",
                cload_func_name);
        return NULL;
    }
    string_cstring_free(cload_func_name);
    lib_pmc = (*load_func)(interpreter);
    /*
     * TODO call init, if it exists
     */
    return lib_pmc;
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

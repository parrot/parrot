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
 * if this pmc class isn't already in our global vtable
 * reallocate it and assign class enum
 */
int
Parrot_dynext_setup_pmc(Interp *interp, dynext_pmc_info_t *info)
{
    int i;

    for (i = 1; i < (int)enum_class_max; i++) {
        if (!string_compare(interp, info->class_name,
                    Parrot_base_vtables[i].name(interp, NULL))) {
            info->class_enum = i;
            return DYNEXT_INIT_OK;
        }
    }
#if 0
    Parrot_base_vtables = mem_sys_realloc(
            Parrot_base_vtables, sizeof(VTABLE) * (enum_class_max + 1));
#endif
    info->class_enum = (*info->class_max)++;

    return DYNEXT_INIT_OK;
}

/*
 * register a dynamic class pmc in the interpreter's registry
 */
int
Parrot_dynext_init_pmc (Interp *interp, dynext_pmc_info_t *info)
{
    PMC *classname_hash;
    PMC *key;

    classname_hash = VTABLE_get_pmc_keyed_int(interp,
            interp->iglobals, (INTVAL)IGLOBALS_CLASSNAME_HASH);
    key = key_new_string(interp, info->class_name);
    VTABLE_set_integer_keyed(interp, classname_hash, key, info->class_enum);
    return DYNEXT_INIT_OK;
}

int
Parrot_load_pmc(Interp *interpreter, STRING *lib, PMC *initializer)
{
    STRING *path, *init_func;
    void * handle;
    void (*func)(Interp *, int, void *);
    char *cpath, *cinit_func;
    dynext_pmc_info_t info;

    /* TODO runtime path for dynamic extensions */
    /* TODO $SO extension */
#ifndef RUNTIME_DYNEXT
#  define RUNTIME_DYNEXT "runtime/parrot/dynext/"
#endif
#ifndef SO_EXTENSION
#  define SO_EXTENSION ".so"
#endif

    path = Parrot_sprintf_c(interpreter, "%s%Ss_pmc%s",
            RUNTIME_DYNEXT,
            lib,
            SO_EXTENSION);
    cpath = string_to_cstring(interpreter, path);
    handle = Parrot_dlopen(cpath);
    if (!handle) {
        const char * err = Parrot_dlerror();
        fprintf(stderr, "%s\n", err);
        return -1;
    }
    string_cstring_free(cpath);
    init_func = Parrot_sprintf_c(interpreter, "Parrot_dynext_%Ss_init", lib);
    cinit_func = string_to_cstring(interpreter, init_func);
    func = Parrot_dlsym(handle, cinit_func);
    if (NULL == func) {
        fprintf(stderr, "Failed to find symbol '%s' in native library\n",
                cinit_func);
        return -1;
    }
    string_cstring_free(cinit_func);
    /*
     * setup init info structure */
    info.class_name = lib;
    info.initializer = initializer;
    info.class_max = &enum_class_max;
    info.base_vtable = Parrot_base_vtables;
    /* TODO error checks */
    (*func)(interpreter, DYNEXT_SETUP_PMC, (void *) &info);
    (*func)(interpreter, DYNEXT_INIT_PMC, (void *) &info);
    return 0;
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

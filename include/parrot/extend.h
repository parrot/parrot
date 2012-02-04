/* extend.h
 *  Copyright (C) 2001-2008, Parrot Foundation.
 *  Overview:
 *     This is the Parrot extension mechanism, the face we present to
 *     extension modules and whatnot
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 *      extend.c, docs/pdds/pdd11_extending.pod.
 */

#ifndef PARROT_EXTEND_H_GUARD
#define PARROT_EXTEND_H_GUARD

#include <stdarg.h>
#include "parrot/parrot.h"
#include "parrot/core_types.h"
#include "parrot/config.h"      /* PARROT_VERSION... */
#include "parrot/interpreter.h" /* give us the interpreter flags */
#include "parrot/warnings.h"    /* give us the warnings flags    */

/* Two versions of each routine, one for when we're building the core
   and one for when people are writing extensions. If this gets abused
   we'll split this into two pieces and not install the core version,
   but that would be really annoying */
#if defined(PARROT_IN_CORE)

#else

typedef Parrot_Int Parrot_Language;
typedef void * Parrot_Encoding;
typedef void * Parrot_CharType;
typedef const void * Parrot_Const_Encoding;
typedef const void * Parrot_Const_CharType;

#endif

#include "parrot/extend_vtable.h" /* the auto-generated prototypes    */

/* HEADERIZER BEGIN: src/extend.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void Parrot_ext_call(PARROT_INTERP,
    ARGIN(Parrot_PMC sub_pmc),
    ARGIN(const char *signature),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_ext_try(PARROT_INTERP,
    ARGIN_NULLOK(void (*cfunction)(Parrot_Interp,
    ARGIN_NULLOK(void *))),
    ARGIN_NULLOK(void (*chandler)(Parrot_Interp,
    ARGIN_NULLOK(PMC *),
    ARGIN_NULLOK(void *))),
    ARGIN_NULLOK(void *data))
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_free_cstring(ARGFREE(char *string));

PARROT_EXPORT
Parrot_Int Parrot_PMC_typenum(PARROT_INTERP,
    ARGIN_NULLOK(const char *_class))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Parrot_ext_call __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sub_pmc) \
    , PARROT_ASSERT_ARG(signature))
#define ASSERT_ARGS_Parrot_ext_try __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_free_cstring __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_PMC_typenum __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/extend.c */

#endif /* PARROT_EXTEND_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

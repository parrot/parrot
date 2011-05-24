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
#include "parrot/core_types.h"
#include "parrot/config.h"      /* PARROT_VERSION... */
#include "parrot/interpreter.h" /* give us the interpreter flags */
#include "parrot/warnings.h"    /* give us the warnings flags    */

/* Two versions of each routine, one for when we're building the core
   and one for when people are writing extensions. If this gets abused
   we'll split this into two pieces and not install the core version,
   but that would be really annoying */
#if defined(PARROT_IN_CORE)

#define Parrot_Language Parrot_Int

/* Macro to save off the original stack pointer for GC scanning. If
   the stacktop was NULL, then set it to the address of the cached
   pointer, which is on the stack and as good a thing as any to use as
   an anchor */
#define PARROT_CALLIN_START(x) void *oldtop = (x)->lo_var_ptr; \
                               if (oldtop) {} else (x)->lo_var_ptr = &oldtop
/* Put the stack top back, if what we cached was NULL. Otherwise we
   leave it alone and assume it's OK */
#define PARROT_CALLIN_END(x)   do {\
                if (!oldtop) {\
                    PARROT_ASSERT((x)->lo_var_ptr == &oldtop);\
                    (x)->lo_var_ptr = NULL;\
                }\
            } while (0)

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
int Parrot_eprintf(NULLOK_INTERP, ARGIN(const char *s), ...)
        __attribute__nonnull__(2);

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
    void *)),
    ARGIN_NULLOK(void (*chandler)(Parrot_Interp,
    PMC *,
    void *)),
    ARGIN_NULLOK(void *data))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
Parrot_Language Parrot_find_language(PARROT_INTERP,
    ARGIN(const char *language))
        __attribute__nonnull__(2);

PARROT_EXPORT
int Parrot_fprintf(PARROT_INTERP,
    ARGIN(Parrot_PMC pio),
    ARGIN(const char *s),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_free_cstring(ARGFREE(char *string));

PARROT_EXPORT
PARROT_PURE_FUNCTION
Parrot_Int Parrot_get_intreg(PARROT_INTERP, Parrot_Int regnum)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_PURE_FUNCTION
Parrot_Float Parrot_get_numreg(PARROT_INTERP, Parrot_Int regnum)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_PURE_FUNCTION
Parrot_PMC Parrot_get_pmcreg(PARROT_INTERP, Parrot_Int regnum)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_PURE_FUNCTION
Parrot_PMC Parrot_get_root_namespace(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_PURE_FUNCTION
Parrot_String Parrot_get_strreg(PARROT_INTERP, Parrot_Int regnum)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Parrot_String Parrot_new_string(PARROT_INTERP,
    ARGIN_NULLOK(const char *buffer),
    Parrot_UInt length,
    ARGIN_NULLOK(const char * const encoding_name),
    Parrot_UInt flags)
        __attribute__nonnull__(1);

PARROT_EXPORT
Parrot_PMC Parrot_PMC_new(PARROT_INTERP, Parrot_Int type)
        __attribute__nonnull__(1);

PARROT_EXPORT
Parrot_PMC Parrot_PMC_newclass(PARROT_INTERP, Parrot_PMC classtype)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
Parrot_PMC Parrot_PMC_null(void);

PARROT_EXPORT
Parrot_Int Parrot_PMC_typenum(PARROT_INTERP,
    ARGIN_NULLOK(const char *_class))
        __attribute__nonnull__(1);

PARROT_EXPORT
int Parrot_printf(NULLOK_INTERP, ARGIN(const char *s), ...)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_register_pmc(PARROT_INTERP, Parrot_PMC pmc)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_register_string(PARROT_INTERP, Parrot_String s)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_set_intreg(PARROT_INTERP, Parrot_Int regnum, Parrot_Int value)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_set_numreg(PARROT_INTERP, Parrot_Int regnum, Parrot_Float value)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_set_pmcreg(PARROT_INTERP, Parrot_Int regnum, Parrot_PMC value)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_set_strreg(PARROT_INTERP,
    Parrot_Int regnum,
    Parrot_String value)
        __attribute__nonnull__(1);

PARROT_EXPORT
Parrot_PMC Parrot_sub_new_from_c_func(PARROT_INTERP,
    ARGIN(void (*func)(void)),
    ARGIN(const char * signature))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_unregister_pmc(PARROT_INTERP, Parrot_PMC pmc)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_unregister_string(PARROT_INTERP, Parrot_String s)
        __attribute__nonnull__(1);

PARROT_EXPORT
int Parrot_vfprintf(PARROT_INTERP,
    ARGIN(Parrot_PMC pio),
    ARGIN(const char *s),
    va_list args)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_Parrot_eprintf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_ext_call __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sub_pmc) \
    , PARROT_ASSERT_ARG(signature))
#define ASSERT_ARGS_Parrot_ext_try __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_find_language __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(language_unused))
#define ASSERT_ARGS_Parrot_fprintf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pio) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_free_cstring __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_get_intreg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_get_numreg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_get_pmcreg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_get_root_namespace __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_get_strreg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_new_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_PMC_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_PMC_newclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_PMC_null __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_PMC_typenum __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_printf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_Parrot_register_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_register_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_set_intreg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_set_numreg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_set_pmcreg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_set_strreg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_sub_new_from_c_func __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(func) \
    , PARROT_ASSERT_ARG(signature))
#define ASSERT_ARGS_Parrot_unregister_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_unregister_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_vfprintf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pio) \
    , PARROT_ASSERT_ARG(s))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/extend.c */

#endif /* PARROT_EXTEND_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

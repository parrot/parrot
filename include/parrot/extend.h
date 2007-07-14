/* extend.h
 *  Copyright (C) 2001-2003, The Perl Foundation.
 *  SVN Info
 *     $Id$
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

#include "parrot/config.h"      /* PARROT_VERSION, PARROT_JIT_CAPABLE... */
#include "parrot/interpreter.h" /* give us the interpreter flags */
#include "parrot/warnings.h"    /* give us the warnings flags    */

/* Two versions of each routine, one for when we're building the core
   and one for when people are writing extensions. If this gets abused
   we'll split this into two pieces and not install the core version,
   but that would be really annoying */
#if defined(PARROT_IN_CORE)

#define Parrot_String STRING *
#define Parrot_PMC PMC *
#define Parrot_Language Parrot_Int
#define Parrot_VTABLE VTABLE *

/* Macro to save off the original stack pointer for DOD scanning. If
   the stacktop was NULL, then set it to the address of the cached
   pointer, which is on the stack and as good a thing as any to use as
   an anchor */
#define PARROT_CALLIN_START(x) void *oldtop = x->lo_var_ptr; \
                               if (!oldtop) x->lo_var_ptr = &oldtop;
/* Put the stack top back, if what we cached was NULL. Otherwise we
   leave it alone and assume it's OK */
#define PARROT_CALLIN_END(x)   if (!oldtop) x->lo_var_ptr = NULL;

#else

typedef void * Parrot_String;
typedef void * Parrot_PMC;
typedef Parrot_Int Parrot_Language;
typedef void * Parrot_Encoding;
typedef void * Parrot_CharType;
typedef const void * Parrot_Const_Encoding;
typedef const void * Parrot_Const_CharType;
typedef const void * Parrot_VTABLE;

#endif

#include "parrot/extend_vtable.h" /* the auto-generated prototypes    */

/* HEADERIZER BEGIN: src/extend.c */

PARROT_API
void * Parrot_call_method(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC sub,
    Parrot_PMC obj,
    Parrot_String method,
    const char *signature,
    ... )
        __attribute__nonnull__(1);

PARROT_API
Parrot_Float Parrot_call_method_ret_float(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC sub,
    Parrot_PMC obj,
    Parrot_String method,
    const char *signature,
    ... )
        __attribute__nonnull__(1);

PARROT_API
Parrot_Int Parrot_call_method_ret_int(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC sub,
    Parrot_PMC obj,
    Parrot_String method,
    const char *signature,
    ... )
        __attribute__nonnull__(1);

PARROT_API
void* Parrot_call_sub(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC sub,
    const char *signature,
    ... )
        __attribute__nonnull__(1);

PARROT_API
Parrot_Float Parrot_call_sub_ret_float(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC sub,
    const char *signature,
    ... )
        __attribute__nonnull__(1);

PARROT_API
Parrot_Int Parrot_call_sub_ret_int(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC sub,
    const char *signature,
    ... )
        __attribute__nonnull__(1);

PARROT_API
Parrot_Language Parrot_find_language(
    NOTNULL(Parrot_Interp interp),
    char *language )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_free_cstring( char *string );

PARROT_API
Parrot_PMC Parrot_get_dod_registry( NOTNULL(Parrot_Interp interp) )
        __attribute__nonnull__(1);

PARROT_API
Parrot_Int Parrot_get_intreg(
    NOTNULL(Parrot_Interp interp),
    Parrot_Int regnum )
        __attribute__nonnull__(1);

PARROT_API
Parrot_Float Parrot_get_numreg(
    NOTNULL(Parrot_Interp interp),
    Parrot_Int regnum )
        __attribute__nonnull__(1);

PARROT_API
Parrot_PMC Parrot_get_pmcreg(
    NOTNULL(Parrot_Interp interp),
    Parrot_Int regnum )
        __attribute__nonnull__(1);

PARROT_API
Parrot_String Parrot_get_strreg(
    NOTNULL(Parrot_Interp interp),
    Parrot_Int regnum )
        __attribute__nonnull__(1);

PARROT_API
PARROT_PURE_FUNCTION
Parrot_VTABLE Parrot_get_vtable(
    NOTNULL(const Parrot_Interp interp),
    Parrot_Int id )
        __attribute__nonnull__(1);

PARROT_API
Parrot_String Parrot_new_string(
    NOTNULL(Parrot_Interp interp),
    char *buffer,
    int length,
    const char * const encoding_name,
    Parrot_Int flags )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_PMC_delete_pmckey(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_PMC key )
        __attribute__nonnull__(1);

PARROT_API
PARROT_MALLOC
char * Parrot_PMC_get_cstring( NOTNULL(Parrot_Interp interp), Parrot_PMC pmc )
        __attribute__nonnull__(1);

PARROT_API
PARROT_MALLOC
char * Parrot_PMC_get_cstring_intkey(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_Int key )
        __attribute__nonnull__(1);

PARROT_API
PARROT_MALLOC
char * Parrot_PMC_get_cstringn(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    NOTNULL(Parrot_Int *length) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_API
PARROT_MALLOC
char * Parrot_PMC_get_cstringn_intkey(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    NOTNULL(Parrot_Int *length),
    Parrot_Int key )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_API
Parrot_Int Parrot_PMC_get_intval(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc )
        __attribute__nonnull__(1);

PARROT_API
Parrot_Int Parrot_PMC_get_intval_intkey(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_Int key )
        __attribute__nonnull__(1);

PARROT_API
Parrot_Int Parrot_PMC_get_intval_pmckey(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_PMC key )
        __attribute__nonnull__(1);

PARROT_API
Parrot_Float Parrot_PMC_get_numval(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc )
        __attribute__nonnull__(1);

PARROT_API
Parrot_Float Parrot_PMC_get_numval_intkey(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_Int key )
        __attribute__nonnull__(1);

PARROT_API
Parrot_PMC Parrot_PMC_get_pmc_intkey(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_Int key )
        __attribute__nonnull__(1);

PARROT_API
void * Parrot_PMC_get_pointer_intkey(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_Int key )
        __attribute__nonnull__(1);

PARROT_API
Parrot_String Parrot_PMC_get_string_intkey(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_Int key )
        __attribute__nonnull__(1);

PARROT_API
Parrot_PMC Parrot_PMC_new( NOTNULL(Parrot_Interp interp), Parrot_Int type )
        __attribute__nonnull__(1);

PARROT_API
Parrot_PMC Parrot_PMC_null( void );

PARROT_API
void Parrot_PMC_push_intval(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_Int value )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_PMC_push_numval(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_Float value )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_PMC_set_cstring(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    const char *value )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_PMC_set_cstring_intkey(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_Int key,
    NOTNULL(const char *value) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(4);

PARROT_API
void Parrot_PMC_set_cstringn(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    const char *value,
    Parrot_Int length )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_PMC_set_cstringn_intkey(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_Int key,
    const char *value,
    Parrot_Int length )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_PMC_set_intval(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_Int value )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_PMC_set_intval_intkey(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_Int key,
    Parrot_Int value )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_PMC_set_numval(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_Float value )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_PMC_set_numval_intkey(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_Int key,
    Parrot_Float value )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_PMC_set_pmc_intkey(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_Int key,
    Parrot_PMC value )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_PMC_set_pmc_pmckey(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_PMC key,
    Parrot_PMC value )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_PMC_set_pointer_intkey(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_Int key,
    void *value )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_PMC_set_string(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_String value )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_PMC_set_string_intkey(
    NOTNULL(Parrot_Interp interp),
    Parrot_PMC pmc,
    Parrot_Int key,
    Parrot_String value )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_PMC_set_vtable(
    Parrot_Interp interp,
    Parrot_PMC pmc,
    Parrot_VTABLE vtable );

PARROT_API
Parrot_Int Parrot_PMC_typenum(
    NOTNULL(Parrot_Interp interp),
    const char *_class )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_register_pmc( NOTNULL(Parrot_Interp interp), Parrot_PMC pmc )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_set_intreg(
    NOTNULL(Parrot_Interp interp),
    Parrot_Int regnum,
    Parrot_Int value )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_set_numreg(
    NOTNULL(Parrot_Interp interp),
    Parrot_Int regnum,
    Parrot_Float value )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_set_pmcreg(
    NOTNULL(Parrot_Interp interp),
    Parrot_Int regnum,
    Parrot_PMC value )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_set_strreg(
    NOTNULL(Parrot_Interp interp),
    Parrot_Int regnum,
    Parrot_String value )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_unregister_pmc( NOTNULL(Parrot_Interp interp), Parrot_PMC pmc )
        __attribute__nonnull__(1);

/* HEADERIZER END: src/extend.c */

#endif /* PARROT_EXTEND_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

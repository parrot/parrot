/* extend.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
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

#if !defined(PARROT_EXTEND_H_GUARD)
#define PARROT_EXTEND_H_GUARD

#include "parrot/config.h"      /* PARROT_VERSION, PARROT_JIT_CAPABLE... */
#include "parrot/interpreter.h" /* give us the interpreter flags */
#include "parrot/warnings.h"    /* give us the warnings flags    */

/* Two versions of each routine, one for when we're building the core
   and one for when people are writing extensions. If this gets abused
   we'll split this into two pieces and not install the core version,
   but that would be really annoying */
#if defined(PARROT_IN_CORE)

#define Parrot_INTERP Interp *
#define Parrot_STRING STRING *
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

typedef void * Parrot_INTERP;
typedef void * Parrot_STRING;
typedef void * Parrot_PMC;
typedef Parrot_Int Parrot_Language;
typedef void * Parrot_Encoding;
typedef void * Parrot_CharType;
typedef const void * Parrot_Const_Encoding;
typedef const void * Parrot_Const_CharType;
typedef const void * Parrot_VTABLE;

#endif

Parrot_VTABLE Parrot_get_vtable(Parrot_INTERP, Parrot_Int);
Parrot_PMC Parrot_PMC_get_pmc_intkey(Parrot_INTERP, Parrot_PMC, Parrot_Int);
Parrot_STRING Parrot_PMC_get_string(Parrot_INTERP, Parrot_PMC);
Parrot_STRING Parrot_PMC_get_string_intkey(Parrot_INTERP, Parrot_PMC, Parrot_Int);
void *Parrot_PMC_get_pointer(Parrot_INTERP, Parrot_PMC);
void *Parrot_PMC_get_pointer_intkey(Parrot_INTERP, Parrot_PMC, Parrot_Int);
Parrot_Int Parrot_PMC_get_intval(Parrot_INTERP, Parrot_PMC);
Parrot_Int Parrot_PMC_get_intval_intkey(Parrot_INTERP, Parrot_PMC, Parrot_Int);
Parrot_Float Parrot_PMC_get_numval(Parrot_INTERP, Parrot_PMC);
Parrot_Float Parrot_PMC_get_numval_intkey(Parrot_INTERP, Parrot_PMC, Parrot_Int);
char *Parrot_PMC_get_cstring(Parrot_INTERP, Parrot_PMC);
char *Parrot_PMC_get_cstring_intkey(Parrot_INTERP, Parrot_PMC, Parrot_Int);
char *Parrot_PMC_get_cstringn(Parrot_INTERP, Parrot_PMC, Parrot_Int *);
char *Parrot_PMC_get_cstringn_intkey(Parrot_INTERP, Parrot_PMC, Parrot_Int *, Parrot_Int);

void Parrot_PMC_set_vtable(Parrot_INTERP, Parrot_PMC, Parrot_VTABLE);
void Parrot_PMC_set_pmc_intkey(Parrot_INTERP, Parrot_PMC, Parrot_Int, Parrot_PMC);
void Parrot_PMC_set_string(Parrot_INTERP, Parrot_PMC, Parrot_STRING);
void Parrot_PMC_set_string_intkey(Parrot_INTERP, Parrot_PMC, Parrot_Int, Parrot_STRING);
void Parrot_PMC_set_pointer(Parrot_INTERP, Parrot_PMC, void *);
void Parrot_PMC_set_pointer_intkey(Parrot_INTERP, Parrot_PMC, Parrot_Int, void *);
void Parrot_PMC_set_cstring(Parrot_INTERP, Parrot_PMC, const char *);
void Parrot_PMC_set_cstring_intkey(Parrot_INTERP, Parrot_PMC, Parrot_Int, const char *);
void Parrot_PMC_set_cstringn(Parrot_INTERP, Parrot_PMC, const char *, Parrot_Int);
void Parrot_PMC_set_cstringn_intkey(Parrot_INTERP, Parrot_PMC, Parrot_Int, const char *, Parrot_Int);
void Parrot_PMC_set_intval(Parrot_INTERP, Parrot_PMC, Parrot_Int);
void Parrot_PMC_set_intval_intkey(Parrot_INTERP, Parrot_PMC, Parrot_Int, Parrot_Int);
void Parrot_PMC_set_numval(Parrot_INTERP, Parrot_PMC, Parrot_Float);
void Parrot_PMC_set_numval_intkey(Parrot_INTERP, Parrot_PMC, Parrot_Int, Parrot_Float);

Parrot_PMC Parrot_PMC_new(Parrot_INTERP, Parrot_Int);
Parrot_PMC Parrot_PMC_null(void);
Parrot_Int Parrot_PMC_typenum(Parrot_INTERP, const char *);

void Parrot_free_cstring(char *);

void Parrot_call(Parrot_INTERP, Parrot_PMC, Parrot_Int, ...);
void Parrot_call_method(Parrot_INTERP, Parrot_PMC, Parrot_STRING, Parrot_Int, ...);

Parrot_Int    Parrot_get_intreg(Parrot_INTERP, Parrot_Int);
Parrot_Float  Parrot_get_numreg(Parrot_INTERP, Parrot_Int);
Parrot_STRING Parrot_get_strreg(Parrot_INTERP, Parrot_Int);
Parrot_PMC    Parrot_get_pmcreg(Parrot_INTERP, Parrot_Int);

void Parrot_set_intreg(Parrot_INTERP, Parrot_Int, Parrot_Int);
void Parrot_set_numreg(Parrot_INTERP, Parrot_Int, Parrot_Float);
void Parrot_set_strreg(Parrot_INTERP, Parrot_Int, Parrot_STRING);
void Parrot_set_pmcreg(Parrot_INTERP, Parrot_Int, Parrot_PMC);

Parrot_STRING Parrot_new_string(Parrot_INTERP, char *, int, const char * const, Parrot_Int);

Parrot_Language Parrot_find_language(Parrot_INTERP, char*);

void Parrot_register_pmc(Parrot_INTERP, Parrot_PMC);
void Parrot_unregister_pmc(Parrot_INTERP, Parrot_PMC);

#endif /* PARROT_EXTEND_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */

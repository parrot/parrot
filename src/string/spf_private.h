/*
Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

src/string/spf_private.h - private header file of the string/sprintf subsystem

=head1 DESCRIPTION

This is the private header file for the sprintf implementation.
*/

#ifndef PARROT_SPF_PRIVATE_H_GUARD
#define PARROT_SPF_PRIVATE_H_GUARD

/* The size of all our buffers (and the maximum width of a float
 * field).
 */
#define PARROT_SPRINTF_BUFFER_SIZE 4096

/* The maximum floating-point precision--hopefully this and the
 * width cap will help head off buffer overruns.
 */
#define PARROT_SPRINTF_MAX_PREC 3 * PARROT_SPRINTF_BUFFER_SIZE / 4

/* Floats formatted in exponent notation should have this number
 * of exponent digits unless they need more.
 */
#define PARROT_SPRINTF_EXP_DIGITS 2

#define cstr2pstr(cstr) Parrot_str_new_init(interp, (cstr), strlen(cstr), \
        Parrot_ascii_encoding_ptr, 0)
#define char2pstr(ch)   Parrot_str_new_init(interp, &(ch), 1, \
        Parrot_ascii_encoding_ptr, 0)

/* SPRINTF DATA STRUCTURE AND FLAGS */

typedef enum {
    SIZE_REG = 0,
    SIZE_SHORT,
    SIZE_LONG,
    SIZE_HUGE,
    SIZE_XVAL,
    SIZE_OPCODE,
    SIZE_PMC,
    SIZE_PSTR
} spf_type_t;

/* SPRINTF ARGUMENT OBJECT */

typedef struct sprintf_obj SPRINTF_OBJ;

typedef STRING *(*sprintf_getchar_t)       (PARROT_INTERP, INTVAL, ARGIN(SPRINTF_OBJ *));
typedef HUGEINTVAL(*sprintf_getint_t)      (PARROT_INTERP, INTVAL, ARGIN(SPRINTF_OBJ *));
typedef UHUGEINTVAL(*sprintf_getuint_t)    (PARROT_INTERP, INTVAL, ARGIN(SPRINTF_OBJ *));
typedef HUGEFLOATVAL(*sprintf_getfloat_t)  (PARROT_INTERP, INTVAL, ARGIN(SPRINTF_OBJ *));
typedef STRING *(*sprintf_getstring_t)     (PARROT_INTERP, INTVAL, ARGIN(SPRINTF_OBJ *));
typedef void *(*sprintf_getptr_t)          (PARROT_INTERP, INTVAL, ARGIN(SPRINTF_OBJ *));

struct sprintf_obj {
    void *data;
    INTVAL index;

    sprintf_getchar_t getchr;
    sprintf_getint_t getint;
    sprintf_getuint_t getuint;
    sprintf_getfloat_t getfloat;
    sprintf_getstring_t getstring;
    sprintf_getptr_t getptr;
};

extern SPRINTF_OBJ pmc_core;
extern const SPRINTF_OBJ va_core;

/* HEADERIZER BEGIN: src/string/spf_render.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_sprintf_format(PARROT_INTERP,
    ARGIN(const STRING *pat),
    ARGMOD(SPRINTF_OBJ *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*obj);

#define ASSERT_ARGS_Parrot_sprintf_format __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pat) \
    , PARROT_ASSERT_ARG(obj))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/string/spf_render.c */

#endif /* PARROT_SPF_PRIVATE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

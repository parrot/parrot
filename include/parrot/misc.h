/* misc.h
 *  Copyright (C) 2001-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Miscellaneous functions, mainly the Parrot_sprintf family
 *  Data Structure and Algorithms:
 *     Uses a generalized formatting algorithm (spf_render.c) with
 *     a specialized vtable (spf_vtable.c) to handle argument extraction.
 *  History:
 *     This file used to be a simple one, with just a few function prototypes
 *     in it.  When misc.c was split in three, this file took on the job of
 *     being the internal header as well.
 *     To expose the guts of Parrot_sprintf, define IN_SPF_SYSTEM before
 *     including this file.
 *  Notes:
 *  References: misc.c, spf_vtable.c, spf_render.c
 */

#ifndef PARROT_MISC_H_GUARD
#define PARROT_MISC_H_GUARD

#include "parrot/parrot.h"

/*
 * utils.c
 */
typedef int (*reg_move_func)(Interp*, unsigned char d, unsigned char s, void *);

/* HEADERIZER BEGIN: src/utils.c */

PARROT_API
INTVAL Parrot_byte_index(
    SHIM_INTERP,
    const STRING *base /*NN*/,
    const STRING *search /*NN*/,
    UINTVAL start_offset )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
INTVAL Parrot_byte_rindex(
    SHIM_INTERP,
    const STRING *base /*NN*/,
    const STRING *search /*NN*/,
    UINTVAL start_offset )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

PARROT_API
void Parrot_destroy_cpa( char **array /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_destroy_la( long *array );

PARROT_API
FLOATVAL Parrot_float_rand( INTVAL how_random );

PARROT_API
INTVAL Parrot_int_rand( INTVAL how_random );

PARROT_API
void * Parrot_make_cpa( PARROT_INTERP, PMC *array )
        __attribute__nonnull__(1);

PARROT_API
void * Parrot_make_la( PARROT_INTERP, PMC *array /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API
INTVAL Parrot_range_rand( INTVAL from, INTVAL to, INTVAL how_random );

PARROT_API
void Parrot_register_move( PARROT_INTERP,
    int n_regs,
    unsigned char *dest_regs /*NN*/,
    unsigned char *src_regs /*NN*/,
    unsigned char temp_reg,
    reg_move_func mov,
    reg_move_func mov_alt,
    void *info )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

PARROT_API
void Parrot_srand( INTVAL seed );

PARROT_API
INTVAL Parrot_uint_rand( INTVAL how_random );

PARROT_API
PMC* tm_to_array( PARROT_INTERP, const struct tm *tm /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

FLOATVAL floatval_mod( FLOATVAL n2, FLOATVAL n3 )
        __attribute__const__
        __attribute__warn_unused_result__;

INTVAL intval_mod( INTVAL i2, INTVAL i3 )
        __attribute__const__
        __attribute__warn_unused_result__;

/* HEADERIZER END: src/utils.c */


/*
 * IMCC API
 * XXX These should go into another file, not seen by libparrot
 */
void *IMCC_compile_file_s(Parrot_Interp interp, const char *s,
        STRING **error_message);
void * IMCC_compile_file(Parrot_Interp interp, const char *s);
PMC * IMCC_compile_pir_s(Parrot_Interp interp, const char *s,
        STRING **error_message);
PMC * IMCC_compile_pasm_s(Parrot_Interp interp, const char *s,
        STRING **error_message);


/* HEADERIZER BEGIN: src/misc.c */

PARROT_API
PARROT_WARN_UNUSED_RESULT
STRING * Parrot_psprintf( PARROT_INTERP, STRING *pat /*NN*/, PMC *ary /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
void Parrot_snprintf( PARROT_INTERP,
    char *targ /*NN*/,
    size_t len,
    const char *pat /*NN*/,
    ... )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4);

PARROT_API
PARROT_WARN_UNUSED_RESULT
STRING * Parrot_sprintf_c( PARROT_INTERP, NOTNULL(const char *pat), ... )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PARROT_WARN_UNUSED_RESULT
STRING * Parrot_sprintf_s( PARROT_INTERP, STRING *pat /*NN*/, ... )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
void Parrot_vsnprintf( PARROT_INTERP,
    char *targ /*NN*/,
    size_t len,
    const char *pat /*NN*/,
    va_list args )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4);

PARROT_API
STRING * Parrot_vsprintf_c( PARROT_INTERP,
    const char *pat /*NN*/,
    va_list args )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PARROT_WARN_UNUSED_RESULT
STRING * Parrot_vsprintf_s( PARROT_INTERP, STRING *pat /*NN*/, va_list args )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: src/misc.c */


#ifdef IN_SPF_SYSTEM

    /* The size of all our buffers (and the maximum width of a float
     * field).
     */
#  define PARROT_SPRINTF_BUFFER_SIZE 4096

    /* The maximum floating-point precision--hopefully this and the
     * width cap will help head off buffer overruns.
     */
#  define PARROT_SPRINTF_MAX_PREC 3 * PARROT_SPRINTF_BUFFER_SIZE / 4

#  define cstr2pstr(cstr) string_make(interp, cstr, strlen(cstr), "ascii", 0)
#  define char2pstr(ch)   string_make(interp, &ch , 1, "ascii", 0)

    /* SPRINTF DATA STRUCTURE AND FLAGS */

    typedef enum spf_phase_t {
        PHASE_FLAGS = 0,
        PHASE_WIDTH,
        PHASE_PREC,
        PHASE_TYPE,
        PHASE_TERM,
        PHASE_DONE
    } PHASE;

    typedef enum spf_flag_t {
        FLAG_MINUS = 1,
        FLAG_PLUS = 2,
        FLAG_ZERO = 4,
        FLAG_SPACE = 8,
        FLAG_SHARP = 16,
        FLAG_WIDTH = 32,
        FLAG_PREC = 64
    } FLAG;

    typedef enum spf_type_t {
        SIZE_REG = 0,
        SIZE_SHORT,
        SIZE_LONG,
        SIZE_HUGE,
        SIZE_XVAL,
        SIZE_OPCODE,
        SIZE_PMC,
        SIZE_PSTR
    } TYPE;

    typedef struct spfinfo_t {
        UINTVAL width;
        UINTVAL prec;
        INTVAL flags;
        INTVAL type;
        INTVAL phase;
    } *SpfInfo;

    /* SPRINTF ARGUMENT OBJECT */

    typedef struct sprintf_obj SPRINTF_OBJ;

    typedef STRING *(*sprintf_getchar_t) (Interp *, INTVAL,
                                          SPRINTF_OBJ *);
    typedef HUGEINTVAL(*sprintf_getint_t) (Interp *, INTVAL,
                                           SPRINTF_OBJ *);
    typedef UHUGEINTVAL(*sprintf_getuint_t) (Interp *, INTVAL,
                                             SPRINTF_OBJ *);
    typedef HUGEFLOATVAL(*sprintf_getfloat_t) (Interp *, INTVAL,
                                               SPRINTF_OBJ *);
    typedef STRING *(*sprintf_getstring_t) (Interp *, INTVAL,
                                            SPRINTF_OBJ *);
    typedef void *(*sprintf_getptr_t) (Interp *, INTVAL,
                                       SPRINTF_OBJ *);

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
    extern SPRINTF_OBJ va_core;

/* HEADERIZER BEGIN: src/spf_render.c */

STRING * Parrot_sprintf_format( PARROT_INTERP,
    STRING *pat /*NN*/,
    SPRINTF_OBJ *obj /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

/* HEADERIZER END: src/spf_render.c */

#endif /* IN_SPF_SYSTEM */


/*
 * generated src/revision.c
 */
PARROT_API int Parrot_config_revision(void);

#endif /* PARROT_MISC_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

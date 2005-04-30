/* misc.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
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

#if !defined(PARROT_MISC_H_GUARD)
#define PARROT_MISC_H_GUARD

#include "parrot/parrot.h"

/*
 * utils.c
 */

INTVAL   intval_mod(INTVAL i2, INTVAL i3);
FLOATVAL floatval_mod(FLOATVAL n2, FLOATVAL n3);
PMC*     foldup(Parrot_Interp, INTVAL start);

FLOATVAL Parrot_float_rand(INTVAL how_random);
INTVAL Parrot_uint_rand(INTVAL how_random);
INTVAL Parrot_int_rand(INTVAL how_random);
INTVAL Parrot_range_rand(INTVAL from, INTVAL to, INTVAL how_random);
void Parrot_srand(INTVAL seed);

void *Parrot_make_la(Interp *, PMC *);
void *Parrot_make_cpa(Interp *, PMC *);
void Parrot_destroy_la(long *);
void Parrot_destroy_cpa(char **);
PMC* tm_to_array(Parrot_Interp interpreter, struct tm *tm);
INTVAL Parrot_byte_index(Interp *interpreter, const STRING *base,
        const STRING *search, UINTVAL start_offset);
INTVAL Parrot_byte_rindex(Interp *interpreter, const STRING *base,
        const STRING *search, UINTVAL start_offset);
/*
 * misc.c
 */

STRING *Parrot_vsprintf_s(Interp *, STRING *pat, va_list);

STRING *Parrot_vsprintf_c(Interp *, const char *pat, va_list);

void Parrot_vsprintf(Interp *, char *targ, const char *pat,
                     va_list);

void Parrot_vsnprintf(Interp *, char *targ, size_t len,
                      const char *pat, va_list);

STRING *Parrot_sprintf_s(Interp *, STRING *pat, ...);

STRING *Parrot_sprintf_c(Interp *, const char *pat, ...);

void Parrot_sprintf(Interp *, char *targ, const char *pat, ...);

void Parrot_snprintf(Interp *, char *targ, size_t len,
                     const char *pat, ...);

STRING *Parrot_psprintf(Interp *interpreter, STRING *pat,
                        PMC * ary);


#ifdef IN_SPF_SYSTEM

    /* The size of all our buffers (and the maximum width of a float
     * field).
     */
#  define PARROT_SPRINTF_BUFFER_SIZE 4096

    /* The maximum floating-point precision--hopefully this and the
     * width cap will help head off buffer overruns.
     */
#  define PARROT_SPRINTF_MAX_PREC 3 * PARROT_SPRINTF_BUFFER_SIZE / 4

#  define cstr2pstr(cstr) string_make(interpreter, cstr, strlen(cstr), "ascii", 0)
#  define char2pstr(ch)   string_make(interpreter, &ch , 1, "ascii", 0)

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
        FLAG flags;
        TYPE type;
        PHASE phase;
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

    STRING *Parrot_sprintf_format(Interp *interpreter,
                                  STRING *pat, SPRINTF_OBJ * obj);

#endif /* IN_SPF_SYSTEM */

/*
 * generated src/parrot_config.c
 */
const char* Parrot_get_runtime_prefix(Interp *, STRING **prefix);

/*
 * generated src/revision.c
 */
int Parrot_config_revision(void);

#endif /* PARROT_MISC_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */

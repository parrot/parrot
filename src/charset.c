/*
Copyright (C) 2004-2007, The Perl Foundation.
$Id$

=head1 NAME

src/charset.c - global charset functions

=head1 DESCRIPTION

These are Parrot's generic charset handling functions

*/

#define PARROT_NO_EXTERN_CHARSET_PTRS
#include "parrot/parrot.h"

#include "encodings/fixed_8.h"
#include "encodings/utf8.h"
#include "encodings/utf16.h"
#include "encodings/ucs2.h"

#include "charset/ascii.h"
#include "charset/binary.h"
#include "charset/iso-8859-1.h"
#include "charset/unicode.h"

CHARSET *Parrot_iso_8859_1_charset_ptr;
CHARSET *Parrot_binary_charset_ptr;
CHARSET *Parrot_default_charset_ptr;
CHARSET *Parrot_unicode_charset_ptr;
CHARSET *Parrot_ascii_charset_ptr;

/*
 * all registered charsets are collected in one global structure
 */

typedef struct To_converter {
    CHARSET *to;
    charset_converter_t func;
} To_converter;

typedef struct One_charset {
    CHARSET *charset;
    STRING  *name;
    int n_converters;
    To_converter *to_converters;
} One_charset;

typedef struct All_charsets {
    int n_charsets;
    One_charset *set;
} All_charsets;

static All_charsets *all_charsets;

/* HEADERIZER HFILE: include/parrot/charset.h */

/* HEADERIZER BEGIN: static */

static INTVAL register_charset( PARROT_INTERP,
    NOTNULL(const char *charsetname),
    NOTNULL(CHARSET *charset) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void register_static_converters( PARROT_INTERP )
        __attribute__nonnull__(1);

/* HEADERIZER END: static */

PARROT_API
PARROT_CAN_RETURN_NULL
PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
CHARSET *
Parrot_new_charset(SHIM_INTERP)
{
    return mem_allocate_typed(CHARSET);
}

PARROT_API
void
Parrot_charsets_encodings_deinit(SHIM_INTERP)
{
    const int n = all_charsets->n_charsets;
    int i;

    for (i = 0; i < n; ++i) {
        if (all_charsets->set[i].n_converters)
            mem_sys_free(all_charsets->set[i].to_converters);
        mem_sys_free(all_charsets->set[i].charset);
    }
    mem_sys_free(all_charsets->set);
    mem_sys_free(all_charsets);
    all_charsets = NULL;
    parrot_deinit_encodings();
}

PARROT_API
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
CHARSET *
Parrot_find_charset(SHIM_INTERP, NOTNULL(const char *charsetname))
{
    int i;
    const int n = all_charsets->n_charsets;

    for (i = 0; i < n; ++i) {
        if (strcmp(all_charsets->set[i].charset->name, charsetname) == 0) {
            return all_charsets->set[i].charset;
        }
    }
    return NULL;
}

PARROT_API
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
CHARSET *
Parrot_load_charset(PARROT_INTERP, NOTNULL(const char *charsetname))
{
    UNUSED(charsetname);

    real_exception(interp, NULL, UNIMPLEMENTED, "Can't load charsets yet");
}

/*

FUNCDC: Parrot_charset_number

Return the number of the charset or -1 if not found.

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_charset_number(PARROT_INTERP, NOTNULL(STRING *charsetname))
{
    const int n = all_charsets->n_charsets;
    int i;

    for (i = 0; i < n; ++i) {
        if (!string_equal(interp, all_charsets->set[i].name, charsetname))
            return i;
    }
    return -1;
}

/*

FUNCDOC: Parrot_charset_number_of_str

Return the number of the charset of the given string or -1 if not found.

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_charset_number_of_str(SHIM_INTERP, NOTNULL(STRING *src))
{
    int i;
    const int n = all_charsets->n_charsets;

    for (i = 0; i < n; ++i) {
        if (src->charset == all_charsets->set[i].charset)
            return i;
    }
    return -1;
}

PARROT_API
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING*
Parrot_charset_name(SHIM_INTERP, INTVAL number_of_charset)
{
    if (number_of_charset >= all_charsets->n_charsets)
        return NULL;
    return all_charsets->set[number_of_charset].name;
}

PARROT_API
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
CHARSET*
Parrot_get_charset(SHIM_INTERP, INTVAL number_of_charset)
{
    if (number_of_charset >= all_charsets->n_charsets)
        return NULL;
    return all_charsets->set[number_of_charset].charset;
}

PARROT_API
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
const char *
Parrot_charset_c_name(SHIM_INTERP, INTVAL number_of_charset)
{
    if (number_of_charset >= all_charsets->n_charsets)
        return NULL;
    return all_charsets->set[number_of_charset].charset->name;
}

static INTVAL
register_charset(PARROT_INTERP, NOTNULL(const char *charsetname),
        NOTNULL(CHARSET *charset))
{
    const int n = all_charsets->n_charsets;
    int i;

    for (i = 0; i < n; ++i) {
        if (strcmp(all_charsets->set[i].charset->name, charsetname) == 0)
            return 0;
    }
    /*
     * TODO
     * this needs either a LOCK or we just forbid dynamic
     * loading of charsets from inside threads
     */
    if (!n)
        all_charsets->set = mem_allocate_typed(One_charset);
    else
        all_charsets->set = (One_charset *)mem_sys_realloc(all_charsets->set,
                (n + 1) * sizeof (One_charset));
    all_charsets->n_charsets++;
    all_charsets->set[n].charset = charset;
    all_charsets->set[n].name = const_string(interp, charsetname);
    all_charsets->set[n].n_converters = 0;

    return 1;
}

static void
register_static_converters(PARROT_INTERP)
{
    Parrot_register_charset_converter(interp,
            Parrot_iso_8859_1_charset_ptr, Parrot_ascii_charset_ptr,
            charset_cvt_iso_8859_1_to_ascii);
    Parrot_register_charset_converter(interp,
            Parrot_iso_8859_1_charset_ptr, Parrot_binary_charset_ptr,
            charset_cvt_ascii_to_binary);

    Parrot_register_charset_converter(interp,
            Parrot_ascii_charset_ptr, Parrot_binary_charset_ptr,
            charset_cvt_ascii_to_binary);
    Parrot_register_charset_converter(interp,
            Parrot_ascii_charset_ptr, Parrot_iso_8859_1_charset_ptr,
            charset_cvt_ascii_to_iso_8859_1);
}

PARROT_API
INTVAL
Parrot_register_charset(PARROT_INTERP, NOTNULL(const char *charsetname),
        NOTNULL(CHARSET *charset))
{
    if (!all_charsets) {
        all_charsets = mem_allocate_typed(All_charsets);
        all_charsets->n_charsets = 0;
        all_charsets->set = NULL;
    }
    if (strcmp("binary", charsetname) == 0) {
        Parrot_binary_charset_ptr = charset;
        return register_charset(interp, charsetname, charset);
    }
    if (strcmp("iso-8859-1", charsetname) == 0) {
        Parrot_iso_8859_1_charset_ptr = charset;
        return register_charset(interp, charsetname, charset);
    }
    if (strcmp("unicode", charsetname) == 0) {
        Parrot_unicode_charset_ptr = charset;
        return register_charset(interp, charsetname, charset);
    }
    if (strcmp("ascii", charsetname) == 0) {
        if (!Parrot_default_charset_ptr) {
            Parrot_default_charset_ptr = charset;
        }
        Parrot_ascii_charset_ptr = charset;
        return register_charset(interp, charsetname, charset);
    }
    return 0;
}

PARROT_API
void
Parrot_charsets_encodings_init(PARROT_INTERP)
{
    /* the order is crucial here:
     * 1) encodings, default = fixed_8
     * 2) charsets   default = ascii
     */
    Parrot_encoding_fixed_8_init(interp);
    Parrot_encoding_utf8_init(interp);
    Parrot_encoding_ucs2_init(interp);
    Parrot_encoding_utf16_init(interp);

    Parrot_charset_ascii_init(interp);
    Parrot_charset_iso_8859_1_init(interp);
    Parrot_charset_binary_init(interp);
    Parrot_charset_unicode_init(interp);

    /*
     * now encoding strings don't have a charset yet - set default
     */
    parrot_init_encodings_2();
    /*
     * now install charset converters
     */
    register_static_converters(interp);
}

PARROT_API
INTVAL
Parrot_make_default_charset(SHIM_INTERP, SHIM(const char *charsetname),
        NOTNULL(CHARSET *charset))
{
    Parrot_default_charset_ptr = charset;
    return 1;
}

PARROT_API
PARROT_WARN_UNUSED_RESULT
CHARSET *
Parrot_default_charset(SHIM_INTERP)
{
    return Parrot_default_charset_ptr;
}


PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
charset_converter_t
Parrot_find_charset_converter(SHIM_INTERP, NOTNULL(CHARSET *lhs), NOTNULL(CHARSET *rhs))
{
    int i;
    const int n = all_charsets->n_charsets;

    for (i = 0; i < n; ++i) {
        if (lhs == all_charsets->set[i].charset) {
            One_charset * const left = all_charsets->set + i;
            const int nc = left->n_converters;
            int j;

            for (j = 0; j < nc; ++j) {
                if (left->to_converters[j].to == rhs)
                    return left->to_converters[j].func;
            }
        }
    }
    return NULL;
}

PARROT_API
void
Parrot_register_charset_converter(SHIM_INTERP,
        NOTNULL(CHARSET *lhs), NOTNULL(CHARSET *rhs), NOTNULL(charset_converter_t func))
{
    const int n = all_charsets->n_charsets;
    int i;

    for (i = 0; i < n; ++i) {
        if (lhs == all_charsets->set[i].charset) {
            One_charset * const left = all_charsets->set + i;
            const int nc = left->n_converters++;

            if (nc) {
                left->to_converters = (To_converter *)mem_sys_realloc(
                        left->to_converters, sizeof (To_converter) * (nc + 1));
            }
            else
                left->to_converters = (To_converter *)mem_sys_allocate(sizeof (To_converter));
            left->to_converters[nc].to = rhs;
            left->to_converters[nc].func = func;
        }
    }
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

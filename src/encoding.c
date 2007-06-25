/*
Copyright (C) 2004-2007, The Perl Foundation.
$Id$

=head1 NAME

src/encoding.c - global encoding functions

=head1 DESCRIPTION

These are parrot's generic encoding handling functions

*/

#define PARROT_NO_EXTERN_ENCODING_PTRS
#include "parrot/parrot.h"

/* HEADERIZER TARGET: include/parrot/encoding.h */

ENCODING *Parrot_default_encoding_ptr;
ENCODING *Parrot_fixed_8_encoding_ptr;
ENCODING *Parrot_utf8_encoding_ptr;
ENCODING *Parrot_ucs2_encoding_ptr;
ENCODING *Parrot_utf16_encoding_ptr;

typedef struct One_encoding {
    ENCODING *encoding;
    STRING  *name;
} One_encoding;

typedef struct All_encodings {
    int n_encodings;
    One_encoding *enc;
} All_encodings;

static All_encodings *all_encodings;

void
parrot_init_encodings_2(Interp *interp)
{
    const int n = all_encodings->n_encodings;
    int i;

    for (i = 0; i < n; ++i) {
        all_encodings->enc[i].name->charset = Parrot_default_charset_ptr;
    }
}

void
parrot_deinit_encodings(Interp *interp)
{
    const int n = all_encodings->n_encodings;
    int i;

    for (i = 0; i < n; ++i) {
        mem_sys_free(all_encodings->enc[i].encoding);
    }
    mem_sys_free(all_encodings->enc);
    mem_sys_free(all_encodings);
    all_encodings = NULL;
}

PARROT_API
ENCODING *
Parrot_new_encoding(Interp *interp)
    /* MALLOC, WARN_UNUSED */
{
    return mem_allocate_typed(ENCODING);
}

PARROT_API
ENCODING *
Parrot_find_encoding(Interp *interp, const char *encodingname /*NN*/)
    /* WARN_UNUSED */
{
    const int n = all_encodings->n_encodings;
    int i;

    for (i = 0; i < n; ++i) {
        if (strcmp(all_encodings->enc[i].encoding->name, encodingname) == 0) {
            return all_encodings->enc[i].encoding;
        }
    }
    return NULL;
}

/* Yep, this needs to be a char * parameter -- it's tough to load in
   encodings and such for strings if we can't be sure we've got enough
   info set up to actually build strings... */

PARROT_API
ENCODING *
Parrot_load_encoding(Interp *interp, const char *encodingname)
    /* WARN_UNUSED, NORETURN */
{
    internal_exception(UNIMPLEMENTED, "Can't load encodings yet");
    return NULL;
}

/*

FUNCDOC: INTVAL Parrot_encoding_number

Return the number of the encoding or -1 if not found.

*/

PARROT_API
INTVAL
Parrot_encoding_number(Interp *interp, STRING *encodingname /*NN*/)
    /* WARN_UNUSED */
{
    const int n = all_encodings->n_encodings;
    int i;

    for (i = 0; i < n; ++i) {
        if (!string_equal(interp, all_encodings->enc[i].name,
                          encodingname))
            return i;
    }
    return -1;
}

/*

FUNCDOC: Parrot_encoding_number_of_str

Return the number of the encoding of the given string or -1 if not found.

*/

PARROT_API
INTVAL
Parrot_encoding_number_of_str(Interp *interp, STRING *src /*NN*/)
    /* WARN_UNUSED */
{
    const int n = all_encodings->n_encodings;
    int i;

    for (i = 0; i < n; ++i) {
        if (src->encoding == all_encodings->enc[i].encoding)
            return i;
    }
    return -1;
}

PARROT_API
STRING*
Parrot_encoding_name(Interp *interp, INTVAL number_of_encoding)
    /* WARN_UNUSED */
{
    if (number_of_encoding >= all_encodings->n_encodings)
        return NULL;
    return all_encodings->enc[number_of_encoding].name;
}

PARROT_API
ENCODING*
Parrot_get_encoding(Interp *interp, INTVAL number_of_encoding)
    /* WARN_UNUSED */
{
    if (number_of_encoding >= all_encodings->n_encodings)
        return NULL;
    return all_encodings->enc[number_of_encoding].encoding;
}

PARROT_API
const char *
Parrot_encoding_c_name(Interp *interp, INTVAL number_of_encoding)
    /* WARN_UNUSED */
{
    if (number_of_encoding >= all_encodings->n_encodings)
        return NULL;
    return all_encodings->enc[number_of_encoding].encoding->name;
}

static INTVAL
register_encoding(Interp *interp /*NN*/, const char *encodingname /*NN*/,
        ENCODING *encoding /*NN*/)
{
    const int n = all_encodings->n_encodings;
    int i;

    for (i = 0; i < n; ++i) {
        if (strcmp(all_encodings->enc[i].encoding->name, encodingname) == 0)
            return 0;
    }
    /*
     * TODO
     * this needs either a LOCK or we just forbid dynamic
     * loading of encodings from inside threads
     */
    if (!n)
        all_encodings->enc = mem_allocate_typed(One_encoding);
    else
        all_encodings->enc = (One_encoding*)mem_sys_realloc(all_encodings->enc,
                (n + 1) * sizeof (One_encoding));
    all_encodings->n_encodings++;
    all_encodings->enc[n].encoding = encoding;
    all_encodings->enc[n].name = const_string(interp, encodingname);

    return 1;
}

PARROT_API
INTVAL
Parrot_register_encoding(Interp *interp /*NN*/, const char *encodingname /*NN*/,
        ENCODING *encoding /*NN*/)
{
    if (!all_encodings) {
        all_encodings = mem_allocate_typed(All_encodings);
        all_encodings->n_encodings = 0;
        all_encodings->enc = NULL;
    }
    if (strcmp("fixed_8", encodingname) == 0) {
        Parrot_fixed_8_encoding_ptr = encoding;
        if (!Parrot_default_encoding_ptr) {
            Parrot_default_encoding_ptr = encoding;

        }
        return register_encoding(interp, encodingname, encoding);
    }
    if (strcmp("utf8", encodingname) == 0) {
        Parrot_utf8_encoding_ptr = encoding;
        return register_encoding(interp, encodingname, encoding);
    }
    if (strcmp("utf16", encodingname) == 0) {
        Parrot_utf16_encoding_ptr = encoding;
        return register_encoding(interp, encodingname, encoding);
    }
    if (strcmp("ucs2", encodingname) == 0) {
        Parrot_ucs2_encoding_ptr = encoding;
        return register_encoding(interp, encodingname, encoding);
    }
    return 0;
}

PARROT_API
INTVAL
Parrot_make_default_encoding(Interp *interp, const char *encodingname,
        ENCODING *encoding /*NN*/)
{
    Parrot_default_encoding_ptr = encoding;
    return 1;
}

PARROT_API
ENCODING *
Parrot_default_encoding(Interp *interp)
{
    return Parrot_default_encoding_ptr;
}

PARROT_API
encoding_converter_t
Parrot_find_encoding_converter(Interp *interp, ENCODING *lhs,
        ENCODING *rhs)
{
    return NULL;
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

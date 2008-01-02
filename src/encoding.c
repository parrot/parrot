/*
Copyright (C) 2004-2007, The Perl Foundation.
$Id$

=head1 NAME

src/encoding.c - global encoding functions

=head1 DESCRIPTION

These are parrot's generic encoding handling functions

=over 4

=cut

*/

#define PARROT_NO_EXTERN_ENCODING_PTRS
#include "parrot/parrot.h"

/* HEADERIZER HFILE: include/parrot/encoding.h */

/* HEADERIZER BEGIN: static */

static INTVAL register_encoding(PARROT_INTERP,
    ARGIN(const char *encodingname),
    ARGIN(ENCODING *encoding))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

/* HEADERIZER END: static */

ENCODING *Parrot_default_encoding_ptr;
ENCODING *Parrot_fixed_8_encoding_ptr;
ENCODING *Parrot_utf8_encoding_ptr;
ENCODING *Parrot_ucs2_encoding_ptr;
ENCODING *Parrot_utf16_encoding_ptr;

typedef struct One_encoding {
    NOTNULL(ENCODING *encoding);
    STRING  *name;
} One_encoding;

typedef struct All_encodings {
    int n_encodings;
    One_encoding *enc;
} All_encodings;

static All_encodings *all_encodings;

/*

=item C<void parrot_init_encodings_2>

RT#48260: Not yet documented!!!

=cut

*/

void
parrot_init_encodings_2(void)
{
    const int n = all_encodings->n_encodings;
    int i;

    for (i = 0; i < n; ++i) {
        all_encodings->enc[i].name->charset = Parrot_default_charset_ptr;
    }
}

/*

=item C<void parrot_deinit_encodings>

RT#48260: Not yet documented!!!

=cut

*/

void
parrot_deinit_encodings(void)
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

/*

=item C<ENCODING * Parrot_new_encoding>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
ENCODING *
Parrot_new_encoding(SHIM_INTERP)
{
    return mem_allocate_typed(ENCODING);
}

/*

=item C<const ENCODING * Parrot_find_encoding>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const ENCODING *
Parrot_find_encoding(SHIM_INTERP, ARGIN(const char *encodingname))
{
    const int n = all_encodings->n_encodings;
    int i;

    for (i = 0; i < n; ++i)
        if (strcmp(all_encodings->enc[i].encoding->name, encodingname) == 0)
            return all_encodings->enc[i].encoding;
    return NULL;
}

/*

=item C<const ENCODING * Parrot_load_encoding>

RT#48260: Not yet documented!!!

=cut

*/

/* Yep, this needs to be a char * parameter -- it's tough to load in
   encodings and such for strings if we can't be sure we've got enough
   info set up to actually build strings... */

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
const ENCODING *
Parrot_load_encoding(PARROT_INTERP, ARGIN(const char *encodingname))
{
    UNUSED(encodingname);
    real_exception(interp, NULL, UNIMPLEMENTED, "Can't load encodings yet");
}

/*

=item C<INTVAL Parrot_encoding_number>

Return the number of the encoding or -1 if not found.

=cut

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_encoding_number(PARROT_INTERP, ARGIN(const STRING *encodingname))
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

=item C<INTVAL Parrot_encoding_number_of_str>

Return the number of the encoding of the given string or -1 if not found.

=cut

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_encoding_number_of_str(SHIM_INTERP, ARGIN(const STRING *src))
{
    const int n = all_encodings->n_encodings;
    int i;

    for (i = 0; i < n; ++i) {
        if (src->encoding == all_encodings->enc[i].encoding)
            return i;
    }
    return -1;
}

/*

=item C<STRING* Parrot_encoding_name>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING*
Parrot_encoding_name(SHIM_INTERP, INTVAL number_of_encoding)
{
    if (number_of_encoding >= all_encodings->n_encodings)
        return NULL;
    return all_encodings->enc[number_of_encoding].name;
}

/*

=item C<const ENCODING* Parrot_get_encoding>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const ENCODING*
Parrot_get_encoding(PARROT_INTERP, INTVAL number_of_encoding)
{
    if (number_of_encoding >= all_encodings->n_encodings)
        return NULL;
    return all_encodings->enc[number_of_encoding].encoding;
}

/*

=item C<const char * Parrot_encoding_c_name>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const char *
Parrot_encoding_c_name(PARROT_INTERP, INTVAL number_of_encoding)
{
    if (number_of_encoding >= all_encodings->n_encodings)
        return NULL;
    return all_encodings->enc[number_of_encoding].encoding->name;
}

/*

=item C<static INTVAL register_encoding>

RT#48260: Not yet documented!!!

=cut

*/

static INTVAL
register_encoding(PARROT_INTERP, ARGIN(const char *encodingname),
        ARGIN(ENCODING *encoding))
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

/*

=item C<INTVAL Parrot_register_encoding>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API
INTVAL
Parrot_register_encoding(PARROT_INTERP, ARGIN(const char *encodingname),
        ARGIN(ENCODING *encoding))
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

/*

=item C<INTVAL Parrot_make_default_encoding>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API
INTVAL
Parrot_make_default_encoding(SHIM_INTERP, SHIM(const char *encodingname),
        ARGIN(ENCODING *encoding))
{
    Parrot_default_encoding_ptr = encoding;
    return 1;
}

/*

=item C<const ENCODING * Parrot_default_encoding>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PARROT_API
const ENCODING *
Parrot_default_encoding(SHIM_INTERP)
{
    return Parrot_default_encoding_ptr;
}

/*

=item C<encoding_converter_t Parrot_find_encoding_converter>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_API
encoding_converter_t
Parrot_find_encoding_converter(PARROT_INTERP, ARGIN(ENCODING *lhs), ARGIN(ENCODING *rhs))
{
    UNUSED(interp);
    UNUSED(lhs);
    UNUSED(rhs);

    /* XXX Apparently unwritten */

    return NULL;
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

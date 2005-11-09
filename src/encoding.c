/*
Copyright: 2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/encoding.c - global encoding functions

head1 DESCRIPTION

These are parrot's generic encoding handling functions

*/

#define PARROT_NO_EXTERN_ENCODING_PTRS
#include "parrot/parrot.h"

ENCODING *Parrot_default_encoding_ptr;
ENCODING *Parrot_fixed_8_encoding_ptr;
ENCODING *Parrot_utf8_encoding_ptr;
ENCODING *Parrot_utf16_encoding_ptr;

typedef struct {
    ENCODING *encoding;
    STRING  *name;
} One_encoding;

typedef struct {
    int n_encodings;
    One_encoding *enc;
} All_encodings;

static All_encodings *all_encodings;

void
parrot_deinit_encodings(Interp *interpreter)
{
    int i, n;

    n = all_encodings->n_encodings;
    for (i = 0; i < n; ++i) {
        mem_sys_free(all_encodings->enc[i].encoding);
    }
    mem_sys_free(all_encodings->enc);
    mem_sys_free(all_encodings);
    all_encodings = NULL;
}

ENCODING *
Parrot_new_encoding(Interp *interpreter)
{
    return mem_sys_allocate(sizeof(ENCODING));
}

ENCODING *
Parrot_find_encoding(Interp *interpreter, const char *encodingname)
{
    int i, n;

    n = all_encodings->n_encodings;
    for (i = 0; i < n; ++i) {
        if (!strcmp(all_encodings->enc[i].encoding->name, encodingname)) {
            return all_encodings->enc[i].encoding;
        }
    }
    return NULL;
}

/* Yep, this needs to be a char * parameter -- it's tough to load in
   encodings and such for strings if we can't be sure we've got enough
   info set up to actually build strings... */

ENCODING *
Parrot_load_encoding(Interp *interpreter, const char *encodingname)
{
    internal_exception(UNIMPLEMENTED, "Can't load encodings yet");
    return NULL;
}

/*

=item C<INTVAL Parrot_encoding_number(Interp *, STRING *encodingname)>

Return the number of the encoding or -1 if not found.

=item C<INTVAL Parrot_encoding_number_of_str(Interp *, const STRING *src)>

Return the number of the encoding of the given string or -1 if not found.

*/

INTVAL
Parrot_encoding_number(Interp *interpreter, STRING *encodingname)
{
    int i, n;

    n = all_encodings->n_encodings;
    for (i = 0; i < n; ++i) {
        if (!string_equal(interpreter, all_encodings->enc[i].name, encodingname))
            return i;
    }
    return -1;
}

INTVAL
Parrot_encoding_number_of_str(Interp *interpreter, STRING *src)
{
    int i, n;

    n = all_encodings->n_encodings;
    for (i = 0; i < n; ++i) {
        if (src->encoding == all_encodings->enc[i].encoding)
            return i;
    }
    return -1;
}

STRING*
Parrot_encoding_name(Interp *interpreter, INTVAL number_of_encoding)
{
    if (number_of_encoding >= all_encodings->n_encodings)
        return NULL;
    return all_encodings->enc[number_of_encoding].name;
}

ENCODING*
Parrot_get_encoding(Interp *interpreter, INTVAL number_of_encoding)
{
    if (number_of_encoding >= all_encodings->n_encodings)
        return NULL;
    return all_encodings->enc[number_of_encoding].encoding;
}

const char *
Parrot_encoding_c_name(Interp *interpreter, INTVAL number_of_encoding)
{
    if (number_of_encoding >= all_encodings->n_encodings)
        return NULL;
    return all_encodings->enc[number_of_encoding].encoding->name;
}

static INTVAL
register_encoding(Interp *interpreter, const char *encodingname,
        ENCODING *encoding)
{
    int i, n;

    n = all_encodings->n_encodings;
    for (i = 0; i < n; ++i) {
        if (!strcmp(all_encodings->enc[i].encoding->name, encodingname))
            return 0;
    }
    /*
     * TODO
     * this needs either a LOCK or we just forbid dynamic
     * loading of encodings from inside threads
     */
    if (!n)
        all_encodings->enc = mem_sys_allocate(sizeof(One_encoding));
    else
        all_encodings->enc = mem_sys_realloc(all_encodings->enc, (n + 1) *
                sizeof(One_encoding));
    all_encodings->n_encodings++;
    all_encodings->enc[n].encoding = encoding;
    all_encodings->enc[n].name = const_string(interpreter, encodingname);

    return 1;
}

INTVAL
Parrot_register_encoding(Interp *interpreter, const char *encodingname,
        ENCODING *encoding)
{
    if (!all_encodings) {
        all_encodings = mem_sys_allocate(sizeof(All_encodings));
        all_encodings->n_encodings = 0;
        all_encodings->enc = NULL;
    }
    if (!strcmp("fixed_8", encodingname)) {
        Parrot_fixed_8_encoding_ptr = encoding;
        if (!Parrot_default_encoding_ptr) {
            Parrot_default_encoding_ptr = encoding;

        }
        return register_encoding(interpreter, encodingname, encoding);
    }
    if (!strcmp("utf8", encodingname)) {
        Parrot_utf8_encoding_ptr = encoding;
        return register_encoding(interpreter, encodingname, encoding);
    }
    if (!strcmp("utf16", encodingname)) {
        Parrot_utf16_encoding_ptr = encoding;
        return register_encoding(interpreter, encodingname, encoding);
    }
    return 0;
}

INTVAL
Parrot_make_default_encoding(Interp *interpreter, const char *encodingname,
        ENCODING *encoding)
{
    Parrot_default_encoding_ptr = encoding;
    return 1;
}

ENCODING *
Parrot_default_encoding(Interp *interpreter)
{
    return Parrot_default_encoding_ptr;
}

encoding_converter_t
Parrot_find_encoding_converter(Interp *interpreter, ENCODING *lhs,
        ENCODING *rhs)
{
    return NULL;
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

/*
Copyright: 2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/charset.c - global charset functions

head1 DESCRIPTION

These are parrot's generic charset handling functions

*/

#define PARROT_NO_EXTERN_CHARSET_PTRS
#include "parrot/parrot.h"

CHARSET *Parrot_iso_8859_1_charset_ptr;
CHARSET *Parrot_binary_charset_ptr;
CHARSET *Parrot_default_charset_ptr;
CHARSET *Parrot_unicode_charset_ptr;
CHARSET *Parrot_ascii_charset_ptr;

/*
 * all registered charsets are collected in one global structure
 */

typedef struct {
    CHARSET *charset;
    STRING  *name;
} One_charset;

typedef struct {
    int n_charsets;
    One_charset *set;
} All_charsets;

static All_charsets *all_charsets;


CHARSET *
Parrot_new_charset(Interp *interpreter)
{
    return mem_sys_allocate(sizeof(CHARSET));
}

void
Parrot_deinit_charsets(Interp *interpreter)
{
    int i, n;

    n = all_charsets->n_charsets;
    for (i = 0; i < n; ++i) {
        mem_sys_free(all_charsets->set[i].charset);
    }
    mem_sys_free(all_charsets->set);
    mem_sys_free(all_charsets);
    all_charsets = NULL;
}

CHARSET *
Parrot_find_charset(Interp *interpreter, const char *charsetname)
{
    if (!strcmp("iso-8859-1", charsetname)) {
        return Parrot_iso_8859_1_charset_ptr;
    }
    if (!strcmp("unicode", charsetname)) {
        return Parrot_unicode_charset_ptr;
    }
    if (!strcmp("binary", charsetname)) {
        return Parrot_binary_charset_ptr;
    }
    return NULL;
}

CHARSET *
Parrot_load_charset(Interp *interpreter, const char *charsetname)
{
    internal_exception(UNIMPLEMENTED, "Can't load charsets yet");
    return NULL;
}

/*

=item C<INTVAL Parrot_charset_number(Interp *, STRING *charsetname)>

Return the number of the charset or -1 if not found.

=item C<INTVAL Parrot_charset_number_of_str(Interp *, const STRING *src)>

Return the number of the charset of the given string or -1 if not found.

*/

INTVAL
Parrot_charset_number(Interp *interpreter, STRING *charsetname)
{
    int i, n;

    n = all_charsets->n_charsets;
    for (i = 0; i < n; ++i) {
        if (!string_equal(interpreter, all_charsets->set[i].name, charsetname))
            return i;
    }
    return -1;
}

INTVAL
Parrot_charset_number_of_str(Interp *interpreter, STRING *src)
{
    int i, n;

    n = all_charsets->n_charsets;
    for (i = 0; i < n; ++i) {
        if (src->charset == all_charsets->set[i].charset)
            return i;
    }
    return -1;
}

STRING*
Parrot_charset_name(Interp *interpreter, INTVAL number_of_charset)
{
    if (number_of_charset >= all_charsets->n_charsets)
        return NULL;
    return all_charsets->set[number_of_charset].name;
}

static INTVAL
register_charset(Interp *interpreter, const char *charsetname,
        CHARSET *charset)
{
    int i, n;

    n = all_charsets->n_charsets;
    for (i = 0; i < n; ++i) {
        if (!strcmp(all_charsets->set[i].charset->name, charsetname))
            return 0;
    }
    if (!n)
        all_charsets->set = mem_sys_allocate(sizeof(One_charset));
    else
        all_charsets->set = mem_sys_realloc(all_charsets->set, (n + 1) *
                sizeof(One_charset));
    all_charsets->n_charsets++;
    all_charsets->set[n].charset = charset;
    all_charsets->set[n].name = const_string(interpreter, charsetname);

    return 1;
}

INTVAL
Parrot_register_charset(Interp *interpreter, const char *charsetname,
        CHARSET *charset)
{
    if (!all_charsets) {
        all_charsets = mem_sys_allocate(sizeof(All_charsets));
        all_charsets->n_charsets = 0;
        all_charsets->set = NULL;
    }
    if (!strcmp("binary", charsetname)) {
        Parrot_binary_charset_ptr = charset;
        return register_charset(interpreter, charsetname, charset);
    }
    if (!strcmp("iso-8859-1", charsetname)) {
        Parrot_iso_8859_1_charset_ptr = charset;
        if (!Parrot_default_charset_ptr) {
            Parrot_default_charset_ptr = charset;
        }
        return register_charset(interpreter, charsetname, charset);
    }
    if (!strcmp("unicode", charsetname)) {
        Parrot_unicode_charset_ptr = charset;
        return register_charset(interpreter, charsetname, charset);
    }
    if (!strcmp("ascii", charsetname)) {
        Parrot_ascii_charset_ptr = charset;
        return register_charset(interpreter, charsetname, charset);
    }
    return 0;
}

INTVAL
Parrot_make_default_charset(Interp *interpreter, const char *charsetname,
        CHARSET *charset)
{
    Parrot_default_charset_ptr = charset;
    return 1;
}

CHARSET *
Parrot_default_charset(Interp *interpreter)
{
    return Parrot_default_charset_ptr;
}

charset_converter_t
Parrot_find_charset_converter(Interp *interpreter, CHARSET *lhs, CHARSET *rhs)
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

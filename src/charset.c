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

CHARSET *
Parrot_new_charset(Interp *interpreter)
{

    return mem_sys_allocate(sizeof(CHARSET));
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

INTVAL
Parrot_register_charset(Interp *interpreter, const char *charsetname,
        CHARSET *charset)
{
    if (!strcmp("binary", charsetname)) {
        Parrot_binary_charset_ptr = charset;
        return 1;
    }
    if (!strcmp("iso-8859-1", charsetname)) {
        Parrot_iso_8859_1_charset_ptr = charset;
        if (!Parrot_default_charset_ptr) {
            Parrot_default_charset_ptr = charset;
        }
        return 1;
    }
    if (!strcmp("unicode", charsetname)) {
        Parrot_unicode_charset_ptr = charset;
        return 1;
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

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

/* Yep, this needs to be a char * parameter -- it's tough to load in
   encodings and such for strings if we can't be sure we've got enough
   info set up to actually build strings... */

ENCODING *
Parrot_new_encoding(Interp *interpreter)
{
    return mem_sys_allocate(sizeof(ENCODING));
}

ENCODING *
Parrot_find_encoding(Interp *interpreter, const char *encodingname)
{
    if (!strcmp("fixed_8", encodingname)) {
        return Parrot_fixed_8_encoding_ptr;
    }
    if (!strcmp("utf8", encodingname)) {
        return Parrot_fixed_8_encoding_ptr;
    }
    return NULL;
}

ENCODING *
Parrot_load_encoding(Interp *interpreter, const char *encodingname)
{
    internal_exception(UNIMPLEMENTED, "Can't load encodings yet");
    return NULL;
}

INTVAL
Parrot_register_encoding(Interp *interpreter, const char *encodingname,
        ENCODING *encoding)
{
    if (!strcmp("fixed_8", encodingname)) {
        Parrot_fixed_8_encoding_ptr = encoding;
        if (!Parrot_default_encoding_ptr) {
            Parrot_default_encoding_ptr = encoding;

        }
        return 1;
    }
    if (!strcmp("utf8", encodingname)) {
        Parrot_utf8_encoding_ptr = encoding;
        return 1;
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

/*
Copyright: 2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

charset/binary.c

=head1 DESCRIPTION

This file implements the charset functions for binary data

=cut

*/

#include "parrot/parrot.h"
#include "binary.h"
#include "ascii.h"

#ifdef EXCEPTION
#  undef EXCEPTION
#endif

#define EXCEPTION(err, str) \
    real_exception(interpreter, NULL, err, str)

static void
set_graphemes(Interp *interpreter, STRING *source_string,
        UINTVAL offset, UINTVAL replace_count, STRING *insert_string)
{
    ENCODING_SET_BYTES(interpreter, source_string, offset,
            replace_count, insert_string);
}

static STRING*
to_charset(Interp *interpreter, STRING *src, STRING *dest)
{
    charset_converter_t conversion_func;
    if ((conversion_func = Parrot_find_charset_converter(interpreter,
                    src->charset, Parrot_binary_charset_ptr))) {
         return conversion_func(interpreter, src, dest);
    }
    internal_exception(UNIMPLEMENTED, "to_charset for binary not implemented");
    return NULL;
}

/* A err. can't compose binary */
static STRING*
compose(Interp *interpreter, STRING *source_string)
{
    EXCEPTION(INVALID_CHARTYPE, "Can't compose binary data");
    return NULL;
}

/* A err. can't decompose binary */
static STRING*
decompose(Interp *interpreter, STRING *source_string)
{
    EXCEPTION(INVALID_CHARTYPE, "Can't decompose binary data");
    return NULL;
}

static void
upcase(Interp *interpreter, STRING *source_string)
{
    EXCEPTION(INVALID_CHARTYPE, "Can't upcase binary data");
}

static void
downcase(Interp *interpreter, STRING *source_string)
{
    EXCEPTION(INVALID_CHARTYPE, "Can't downcase binary data");
}

static void
titlecase(Interp *interpreter, STRING *source_string)
{
    EXCEPTION(INVALID_CHARTYPE, "Can't titlecase binary data");
}

static void
upcase_first(Interp *interpreter, STRING *source_string)
{
    EXCEPTION(INVALID_CHARTYPE, "Can't upcase binary data");
}

static void
downcase_first(Interp *interpreter, STRING *source_string)
{
    EXCEPTION(INVALID_CHARTYPE, "Can't downcase binary data");
}

static void
titlecase_first(Interp *interpreter, STRING *source_string)
{
    EXCEPTION(INVALID_CHARTYPE, "Can't titlecase binary data");
}

static INTVAL
compare(Interp *interpreter, STRING *lhs, STRING *rhs)
{
  return 0;
}

static INTVAL
cs_index(Interp *interpreter, STRING *source_string,
        STRING *search_string, UINTVAL offset)
{
    return -1;
}

static INTVAL
cs_rindex(Interp *interpreter, STRING *source_string,
        STRING *search_string, UINTVAL offset)
{
    return -1;
}

/* Binary's always valid */
static UINTVAL
validate(Interp *interpreter, STRING *source_string)
{
    return 1;
}

static INTVAL
is_cclass(Interp *interpreter, PARROT_CCLASS_FLAGS flags, STRING *source_string, UINTVAL offset)
{
    return 0;
}

static INTVAL
find_cclass(Interp *interpreter, PARROT_CCLASS_FLAGS flags, STRING *source_string, UINTVAL offset, UINTVAL count)
{
    return offset + count;
}

static INTVAL
find_not_cclass(Interp *interpreter, PARROT_CCLASS_FLAGS flags, STRING *source_string, UINTVAL offset, UINTVAL count)
{
    return offset + count;
}

static STRING *
string_from_codepoint(Interp *interpreter, UINTVAL codepoint)
{
    STRING *return_string = NULL;
    char real_codepoint = (char)codepoint;
    return_string = string_make(interpreter, &real_codepoint, 1, "binary", 0);
    return return_string;
}


CHARSET *
Parrot_charset_binary_init(Interp *interpreter)
{
    CHARSET *return_set = Parrot_new_charset(interpreter);
    static const CHARSET base_set = {
        "binary",
        ascii_get_graphemes,
        ascii_get_graphemes_inplace,
        set_graphemes,
        to_charset,
        compose,
        decompose,
        upcase,
        downcase,
        titlecase,
        upcase_first,
        downcase_first,
        titlecase_first,
        compare,
        cs_index,
        cs_rindex,
        validate,
        is_cclass,
        find_cclass,
        find_not_cclass,
        string_from_codepoint,
        ascii_compute_hash,
        NULL
    };

    memcpy(return_set, &base_set, sizeof(CHARSET));
    return_set->preferred_encoding = Parrot_fixed_8_encoding_ptr;
    Parrot_register_charset(interpreter, "binary", return_set);
    return return_set;

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

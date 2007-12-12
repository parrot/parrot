/*
Copyright (C) 2004-2007, The Perl Foundation.
$Id$

=head1 NAME

src/encodings/fixed_8.c

=head1 DESCRIPTION

This file implements the encoding functions for fixed-width 8-bit codepoints

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "fixed_8.h"

/* HEADERIZER HFILE: src/encodings/fixed_8.h */

/* HEADERIZER BEGIN: static */

static void become_encoding(PARROT_INTERP, SHIM(STRING *source_string))
        __attribute__nonnull__(1);

static UINTVAL bytes(SHIM_INTERP, NOTNULL(STRING *source_string))
        __attribute__nonnull__(2);

static UINTVAL codepoints(PARROT_INTERP, NOTNULL(STRING *source_string))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static UINTVAL fixed8_get_next(PARROT_INTERP, NOTNULL(String_iter *iter))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void fixed8_set_next(PARROT_INTERP,
    NOTNULL(String_iter *iter),
    UINTVAL c)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void fixed8_set_position(SHIM_INTERP,
    NOTNULL(String_iter *iter),
    UINTVAL pos)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static UINTVAL get_byte(PARROT_INTERP,
    ARGIN(const STRING *source_string),
    UINTVAL offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * get_bytes(PARROT_INTERP,
    NOTNULL(STRING *source_string),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * get_bytes_inplace(PARROT_INTERP,
    NOTNULL(STRING *source_string),
    UINTVAL offset,
    UINTVAL count,
    NOTNULL(STRING *return_string))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5);

PARROT_WARN_UNUSED_RESULT
static UINTVAL get_codepoint(PARROT_INTERP,
    ARGIN(const STRING *source_string),
    UINTVAL offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * get_codepoints(PARROT_INTERP,
    NOTNULL(STRING *source_string),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * get_codepoints_inplace(PARROT_INTERP,
    NOTNULL(STRING *source_string),
    UINTVAL offset,
    UINTVAL count,
    NOTNULL(STRING *dest_string))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5);

static void iter_init(SHIM_INTERP,
    ARGIN(const STRING *src),
    NOTNULL(String_iter *iter))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void set_byte(PARROT_INTERP,
    ARGIN(const STRING *source_string),
    UINTVAL offset,
    UINTVAL byte)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void set_bytes(PARROT_INTERP,
    NOTNULL(STRING *source_string),
    UINTVAL offset,
    UINTVAL count,
    NOTNULL(STRING *new_bytes))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5);

static void set_codepoint(PARROT_INTERP,
    NOTNULL(STRING *source_string),
    UINTVAL offset,
    UINTVAL codepoint)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void set_codepoints(PARROT_INTERP,
    NOTNULL(STRING *source_string),
    UINTVAL offset,
    UINTVAL count,
    NOTNULL(STRING *new_codepoints))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5);

PARROT_DOES_NOT_RETURN
PARROT_CANNOT_RETURN_NULL
static STRING * to_encoding(PARROT_INTERP,
    SHIM(STRING *src),
    SHIM(STRING *dest))
        __attribute__nonnull__(1);

/* HEADERIZER END: static */

#define UNIMPL real_exception(interp, NULL, UNIMPLEMENTED, "unimpl fixed_8")

/*

=item C<PARROT_DOES_NOT_RETURN
PARROT_CANNOT_RETURN_NULL
static STRING *
to_encoding(PARROT_INTERP, SHIM(STRING *src), SHIM(STRING *dest))>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_DOES_NOT_RETURN
PARROT_CANNOT_RETURN_NULL
static STRING *
to_encoding(PARROT_INTERP, SHIM(STRING *src), SHIM(STRING *dest))
{
    UNIMPL;
}


/*

=item C<PARROT_WARN_UNUSED_RESULT
static UINTVAL
get_codepoint(PARROT_INTERP, ARGIN(const STRING *source_string),
        UINTVAL offset)>

codepoints are bytes, so delegate

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UINTVAL
get_codepoint(PARROT_INTERP, ARGIN(const STRING *source_string),
        UINTVAL offset)
{
    return get_byte(interp, source_string, offset);
}

/*

=item C<static void
set_codepoint(PARROT_INTERP, NOTNULL(STRING *source_string),
        UINTVAL offset, UINTVAL codepoint)>

This is the same as set byte

=cut

*/

static void
set_codepoint(PARROT_INTERP, NOTNULL(STRING *source_string),
        UINTVAL offset, UINTVAL codepoint)
{
    set_byte(interp, source_string, offset, codepoint);
}

/*

=item C<PARROT_WARN_UNUSED_RESULT
static UINTVAL
get_byte(PARROT_INTERP, ARGIN(const STRING *source_string), UINTVAL offset)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UINTVAL
get_byte(PARROT_INTERP, ARGIN(const STRING *source_string), UINTVAL offset)
{
    unsigned char *contents = (unsigned char *)source_string->strstart;
    if (offset >= source_string->bufused) {
/*        real_exception(interp, NULL, 0,
                "get_byte past the end of the buffer (%i of %i)",
                offset, source_string->bufused);*/
        return 0;
    }
    return contents[offset];
}

/*

=item C<static void
set_byte(PARROT_INTERP, ARGIN(const STRING *source_string),
        UINTVAL offset, UINTVAL byte)>

RT#48260: Not yet documented!!!

=cut

*/

static void
set_byte(PARROT_INTERP, ARGIN(const STRING *source_string),
        UINTVAL offset, UINTVAL byte)
{
    unsigned char *contents;
    if (offset >= source_string->bufused) {
        real_exception(interp, NULL, 0, "set_byte past the end of the buffer");
    }
    contents = (unsigned char *)source_string->strstart;
    contents[offset] = (unsigned char)byte;
}

/*

=item C<PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_codepoints(PARROT_INTERP, NOTNULL(STRING *source_string),
        UINTVAL offset, UINTVAL count)>

Delegate to get_bytes

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_codepoints(PARROT_INTERP, NOTNULL(STRING *source_string),
        UINTVAL offset, UINTVAL count)
{
    STRING * const return_string = get_bytes(interp, source_string,
            offset, count);
    return_string->charset = source_string->charset;
    return return_string;
}

/*

=item C<PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_bytes(PARROT_INTERP, NOTNULL(STRING *source_string),
        UINTVAL offset, UINTVAL count)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_bytes(PARROT_INTERP, NOTNULL(STRING *source_string),
        UINTVAL offset, UINTVAL count)
{
    STRING * const return_string = Parrot_make_COW_reference(interp,
            source_string);
    return_string->encoding = source_string->encoding;
    return_string->charset = source_string->charset;

    return_string->strstart = (char *)return_string->strstart + offset ;
    return_string->bufused = count;

    return_string->strlen = count;
    return_string->hashval = 0;

    return return_string;
}


/*

=item C<PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_codepoints_inplace(PARROT_INTERP, NOTNULL(STRING *source_string),
        UINTVAL offset, UINTVAL count, NOTNULL(STRING *dest_string))>

Delegate to get_bytes

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_codepoints_inplace(PARROT_INTERP, NOTNULL(STRING *source_string),
        UINTVAL offset, UINTVAL count, NOTNULL(STRING *dest_string))
{

    return get_bytes_inplace(interp, source_string, offset,
            count, dest_string);
}

/*

=item C<PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_bytes_inplace(PARROT_INTERP, NOTNULL(STRING *source_string),
        UINTVAL offset, UINTVAL count, NOTNULL(STRING *return_string))>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_bytes_inplace(PARROT_INTERP, NOTNULL(STRING *source_string),
        UINTVAL offset, UINTVAL count, NOTNULL(STRING *return_string))
{
    Parrot_reuse_COW_reference(interp, source_string, return_string);

    return_string->strstart = (char *)return_string->strstart + offset ;
    return_string->bufused = count;

    return_string->strlen = count;
    return_string->hashval = 0;

    return return_string;
}

/*

=item C<static void
set_codepoints(PARROT_INTERP, NOTNULL(STRING *source_string),
        UINTVAL offset, UINTVAL count, NOTNULL(STRING *new_codepoints))>

Delegate to set_bytes

=cut

*/

static void
set_codepoints(PARROT_INTERP, NOTNULL(STRING *source_string),
        UINTVAL offset, UINTVAL count, NOTNULL(STRING *new_codepoints))
{
    set_bytes(interp, source_string, offset, count, new_codepoints);
}

/*

=item C<static void
set_bytes(PARROT_INTERP, NOTNULL(STRING *source_string),
        UINTVAL offset, UINTVAL count, NOTNULL(STRING *new_bytes))>

RT#48260: Not yet documented!!!

=cut

*/

static void
set_bytes(PARROT_INTERP, NOTNULL(STRING *source_string),
        UINTVAL offset, UINTVAL count, NOTNULL(STRING *new_bytes))
{
    string_replace(interp, source_string, offset, count, new_bytes, NULL);
}

/*

=item C<static void
become_encoding(PARROT_INTERP, SHIM(STRING *source_string))>

Unconditionally makes the string be in this encoding, if that's valid

=cut

*/

static void
become_encoding(PARROT_INTERP, SHIM(STRING *source_string))
{
    UNIMPL;
}


/*

=item C<static UINTVAL
codepoints(PARROT_INTERP, NOTNULL(STRING *source_string))>

RT#48260: Not yet documented!!!

=cut

*/

static UINTVAL
codepoints(PARROT_INTERP, NOTNULL(STRING *source_string))
{
    return bytes(interp, source_string);
}

/*

=item C<static UINTVAL
bytes(SHIM_INTERP, NOTNULL(STRING *source_string))>

RT#48260: Not yet documented!!!

=cut

*/

static UINTVAL
bytes(SHIM_INTERP, NOTNULL(STRING *source_string))
{
    return source_string->bufused;
}

/*
 * iterator functions
 */

/*

=item C<static UINTVAL
fixed8_get_next(PARROT_INTERP, NOTNULL(String_iter *iter))>

RT#48260: Not yet documented!!!

=cut

*/

static UINTVAL
fixed8_get_next(PARROT_INTERP, NOTNULL(String_iter *iter))
{
    const UINTVAL c = get_byte(interp, iter->str, iter->charpos++);
    iter->bytepos++;
    return c;
}

/*

=item C<static void
fixed8_set_next(PARROT_INTERP, NOTNULL(String_iter *iter), UINTVAL c)>

RT#48260: Not yet documented!!!

=cut

*/

static void
fixed8_set_next(PARROT_INTERP, NOTNULL(String_iter *iter), UINTVAL c)
{
    set_byte(interp, iter->str, iter->charpos++, c);
    iter->bytepos++;
}

/*

=item C<static void
fixed8_set_position(SHIM_INTERP, NOTNULL(String_iter *iter), UINTVAL pos)>

RT#48260: Not yet documented!!!

=cut

*/

static void
fixed8_set_position(SHIM_INTERP, NOTNULL(String_iter *iter), UINTVAL pos)
{
    iter->bytepos = iter->charpos = pos;
    PARROT_ASSERT(pos <= PObj_buflen(iter->str));
}


/*

=item C<static void
iter_init(SHIM_INTERP, ARGIN(const STRING *src), NOTNULL(String_iter *iter))>

RT#48260: Not yet documented!!!

=cut

*/

static void
iter_init(SHIM_INTERP, ARGIN(const STRING *src), NOTNULL(String_iter *iter))
{
    iter->str = src;
    iter->bytepos = iter->charpos = 0;
    iter->get_and_advance = fixed8_get_next;
    iter->set_and_advance = fixed8_set_next;
    iter->set_position =    fixed8_set_position;
}

/*

=item C<PARROT_CANNOT_RETURN_NULL
ENCODING *
Parrot_encoding_fixed_8_init(PARROT_INTERP)>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_CANNOT_RETURN_NULL
ENCODING *
Parrot_encoding_fixed_8_init(PARROT_INTERP)
{
    ENCODING * const return_encoding = Parrot_new_encoding(interp);

    ENCODING base_encoding = {
        "fixed_8",
        1, /* Max bytes per codepoint */
        to_encoding,
        get_codepoint,
        set_codepoint,
        get_byte,
        set_byte,
        get_codepoints,
        get_codepoints_inplace,
        get_bytes,
        get_bytes_inplace,
        set_codepoints,
        set_bytes,
        become_encoding,
        codepoints,
        bytes,
        iter_init

    };
    STRUCT_COPY(return_encoding, &base_encoding);
    Parrot_register_encoding(interp, "fixed_8", return_encoding);
    return return_encoding;
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


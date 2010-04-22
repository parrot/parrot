/*
Copyright (C) 2004-2010, Parrot Foundation.
$Id$

=head1 NAME

src/string/encoding/fixed_8.c

=head1 DESCRIPTION

This file implements the encoding functions for fixed-width 8-bit codepoints

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "fixed_8.h"

/* HEADERIZER HFILE: src/string/encoding/fixed_8.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static UINTVAL bytes(SHIM_INTERP, ARGIN(const STRING *source_string))
        __attribute__nonnull__(2);

static UINTVAL codepoints(PARROT_INTERP, ARGIN(const STRING *source_string))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static UINTVAL find_cclass(SHIM_INTERP,
    ARGIN(STRING *s),
    ARGIN(const INTVAL *typetable),
    INTVAL flags,
    UINTVAL pos,
    UINTVAL end)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static UINTVAL fixed8_get_next(PARROT_INTERP, ARGMOD(String_iter *iter))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*iter);

static void fixed8_set_next(PARROT_INTERP,
    ARGMOD(String_iter *iter),
    UINTVAL c)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*iter);

static void fixed8_set_position(SHIM_INTERP,
    ARGMOD(String_iter *iter),
    UINTVAL pos)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*iter);

static size_t fixed_8_hash(SHIM_INTERP,
    ARGIN(const STRING *s),
    size_t hashval)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static UINTVAL get_byte(SHIM_INTERP,
    ARGIN(const STRING *source_string),
    UINTVAL offset)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * get_bytes(PARROT_INTERP,
    ARGIN(STRING *source_string),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static UINTVAL get_codepoint(PARROT_INTERP,
    ARGIN(const STRING *source_string),
    UINTVAL offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING * get_codepoints(PARROT_INTERP,
    ARGIN(STRING *source_string),
    UINTVAL offset,
    UINTVAL count)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void iter_init(SHIM_INTERP,
    ARGIN(const STRING *src),
    ARGOUT(String_iter *iter))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*iter);

static void set_byte(PARROT_INTERP,
    ARGIN(const STRING *source_string),
    UINTVAL offset,
    UINTVAL byte)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_DOES_NOT_RETURN
PARROT_CANNOT_RETURN_NULL
static STRING * to_encoding(PARROT_INTERP, SHIM(const STRING *src))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_bytes __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(source_string))
#define ASSERT_ARGS_codepoints __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(source_string))
#define ASSERT_ARGS_find_cclass __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s) \
    , PARROT_ASSERT_ARG(typetable))
#define ASSERT_ARGS_fixed8_get_next __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(iter))
#define ASSERT_ARGS_fixed8_set_next __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(iter))
#define ASSERT_ARGS_fixed8_set_position __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(iter))
#define ASSERT_ARGS_fixed_8_hash __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_get_byte __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(source_string))
#define ASSERT_ARGS_get_bytes __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(source_string))
#define ASSERT_ARGS_get_codepoint __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(source_string))
#define ASSERT_ARGS_get_codepoints __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(source_string))
#define ASSERT_ARGS_iter_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(src) \
    , PARROT_ASSERT_ARG(iter))
#define ASSERT_ARGS_set_byte __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(source_string))
#define ASSERT_ARGS_to_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#define UNIMPL Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED, \
    "unimpl fixed_8")

/*

=item C<static STRING * to_encoding(PARROT_INTERP, const STRING *src)>

Converts the string C<src> to this particular encoding.  If C<dest> is
provided, it will contain the result.  Otherwise this function operates in
place.


=cut

*/

PARROT_DOES_NOT_RETURN
PARROT_CANNOT_RETURN_NULL
static STRING *
to_encoding(PARROT_INTERP, SHIM(const STRING *src))
{
    ASSERT_ARGS(to_encoding)
    UNIMPL;
}


/*

=item C<static UINTVAL get_codepoint(PARROT_INTERP, const STRING *source_string,
UINTVAL offset)>

codepoints are bytes, so delegate

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UINTVAL
get_codepoint(PARROT_INTERP, ARGIN(const STRING *source_string),
        UINTVAL offset)
{
    ASSERT_ARGS(get_codepoint)
    return get_byte(interp, source_string, offset);
}


/*

=item C<static UINTVAL find_cclass(PARROT_INTERP, STRING *s, const INTVAL
*typetable, INTVAL flags, UINTVAL pos, UINTVAL end)>

codepoints are bytes, so delegate

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UINTVAL
find_cclass(SHIM_INTERP, ARGIN(STRING *s), ARGIN(const INTVAL *typetable),
INTVAL flags, UINTVAL pos, UINTVAL end)
{
    ASSERT_ARGS(find_cclass)
    const unsigned char *contents = (const unsigned char *)s->strstart;
    for (; pos < end; ++pos) {
        if ((typetable[contents[pos]] & flags) != 0) {
            return pos;
        }
    }
    return end;
}

/*

=item C<static UINTVAL get_byte(PARROT_INTERP, const STRING *source_string,
UINTVAL offset)>

Returns the byte in string C<src> at position C<offset>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static UINTVAL
get_byte(SHIM_INTERP, ARGIN(const STRING *source_string), UINTVAL offset)
{
    ASSERT_ARGS(get_byte)
    const unsigned char *contents = (const unsigned char *)source_string->strstart;

    if (offset >= source_string->bufused) {
/*        Parrot_ex_throw_from_c_args(interp, NULL, 0,
                "get_byte past the end of the buffer (%i of %i)",
                offset, source_string->bufused); */
        return 0;
    }

    return contents[offset];
}

/*

=item C<static void set_byte(PARROT_INTERP, const STRING *source_string, UINTVAL
offset, UINTVAL byte)>

Sets, in string C<src> at position C<offset>, the byte C<byte>.

=cut

*/

static void
set_byte(PARROT_INTERP, ARGIN(const STRING *source_string),
        UINTVAL offset, UINTVAL byte)
{
    ASSERT_ARGS(set_byte)
    unsigned char *contents;

    if (offset >= source_string->bufused)
        Parrot_ex_throw_from_c_args(interp, NULL, 0,
            "set_byte past the end of the buffer");

    contents = (unsigned char *)source_string->strstart;
    contents[offset] = (unsigned char)byte;
}

/*

=item C<static STRING * get_codepoints(PARROT_INTERP, STRING *source_string,
UINTVAL offset, UINTVAL count)>

Returns the codepoints in string C<src> at position C<offset> and length
C<count>.  (Delegates to C<get_bytes>.)

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_codepoints(PARROT_INTERP, ARGIN(STRING *source_string),
        UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(get_codepoints)
    STRING * const return_string = get_bytes(interp, source_string,
            offset, count);
    return_string->charset = source_string->charset;
    return return_string;
}

/*

=item C<static STRING * get_bytes(PARROT_INTERP, STRING *source_string, UINTVAL
offset, UINTVAL count)>

Returns the bytes in string C<src> at position C<offset> and length C<count>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_bytes(PARROT_INTERP, ARGIN(STRING *source_string), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(get_bytes)
    STRING * const return_string = Parrot_str_copy(interp, source_string);

    return_string->encoding = source_string->encoding;
    return_string->charset = source_string->charset;

    return_string->strstart = (char *)return_string->strstart + offset ;
    return_string->bufused = count;

    return_string->strlen = count;
    return_string->hashval = 0;

    return return_string;
}


/*

=item C<static UINTVAL codepoints(PARROT_INTERP, const STRING *source_string)>

Returns the number of codepoints in string C<src>.

=cut

*/

static UINTVAL
codepoints(PARROT_INTERP, ARGIN(const STRING *source_string))
{
    ASSERT_ARGS(codepoints)
    return bytes(interp, source_string);
}

/*

=item C<static UINTVAL bytes(PARROT_INTERP, const STRING *source_string)>

Returns the number of bytes in string C<src>.

=cut

*/

static UINTVAL
bytes(SHIM_INTERP, ARGIN(const STRING *source_string))
{
    ASSERT_ARGS(bytes)
    return source_string->bufused;
}

/*
 * iterator functions
 */

/*

=item C<static UINTVAL fixed8_get_next(PARROT_INTERP, String_iter *iter)>

Moves the string iterator C<i> to the next codepoint.

=cut

*/

static UINTVAL
fixed8_get_next(PARROT_INTERP, ARGMOD(String_iter *iter))
{
    ASSERT_ARGS(fixed8_get_next)
    const UINTVAL c = get_byte(interp, iter->str, iter->charpos++);
    iter->bytepos++;
    return c;
}

/*

=item C<static void fixed8_set_next(PARROT_INTERP, String_iter *iter, UINTVAL
c)>

With the string iterator C<i>, appends the codepoint C<c> and advances to the
next position in the string.

=cut

*/

static void
fixed8_set_next(PARROT_INTERP, ARGMOD(String_iter *iter), UINTVAL c)
{
    ASSERT_ARGS(fixed8_set_next)
    set_byte(interp, iter->str, iter->charpos++, c);
    iter->bytepos++;
}

/*

=item C<static void fixed8_set_position(PARROT_INTERP, String_iter *iter,
UINTVAL pos)>

Moves the string iterator C<i> to the position C<n> in the string.

=cut

*/

static void
fixed8_set_position(SHIM_INTERP, ARGMOD(String_iter *iter), UINTVAL pos)
{
    ASSERT_ARGS(fixed8_set_position)
    iter->bytepos = iter->charpos = pos;
    PARROT_ASSERT(pos <= Buffer_buflen(iter->str));
}


/*

=item C<static void iter_init(PARROT_INTERP, const STRING *src, String_iter
*iter)>

Initializes for string C<src> the string iterator C<iter>.

=cut

*/

static void
iter_init(SHIM_INTERP, ARGIN(const STRING *src), ARGOUT(String_iter *iter))
{
    ASSERT_ARGS(iter_init)
    iter->str             = src;
    iter->bytepos         = iter->charpos        = 0;
    iter->get_and_advance = fixed8_get_next;
    iter->set_and_advance = fixed8_set_next;
    iter->set_position    = fixed8_set_position;
}


/*

=item C<static size_t fixed_8_hash(PARROT_INTERP, const STRING *s, size_t
hashval)>

Returns the hashed value of the string, given a seed in hashval.

=cut

*/

static size_t
fixed_8_hash(SHIM_INTERP, ARGIN(const STRING *s), size_t hashval)
{
    ASSERT_ARGS(fixed_8_hash)
    const unsigned char *pos = (const unsigned char *)s->strstart;
    UINTVAL        len = s->strlen;

    while (len--) {
        hashval += hashval << 5;
        hashval += *(pos++);
    }

    return hashval;
}


/*

=item C<void Parrot_encoding_fixed_8_init(PARROT_INTERP)>

Initializes the fixed-8 encoding.

=cut

*/

void
Parrot_encoding_fixed_8_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_encoding_fixed_8_init)
    ENCODING * const return_encoding = Parrot_new_encoding(interp);

    ENCODING base_encoding = {
        "fixed_8",
        1, /* Max bytes per codepoint */
        to_encoding,
        get_codepoint,
        get_byte,
        set_byte,
        get_codepoints,
        get_bytes,
        codepoints,
        bytes,
        iter_init,
        find_cclass,
        fixed_8_hash
    };

    STRUCT_COPY_FROM_STRUCT(return_encoding, base_encoding);
    Parrot_register_encoding(interp, "fixed_8", return_encoding);

    return;
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

encodings/utf16.c - UTF-16 encoding

=head1 DESCRIPTION

UTF-16 (L<ftp://ftp.rfc-editor.org/in-notes/rfc2781.txt>).

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/unicode.h"

#if 0
typedef unsigned short utf16_t;
#endif

/*

=item C<static UINTVAL
utf16_characters(const void *ptr, UINTVAL bytes)>

Returns the number of characters in the C<bytes> bytes from C<*ptr>.

=cut

*/

static UINTVAL
utf16_characters(const void *ptr, UINTVAL bytes)
{
    const utf16_t *u16ptr = ptr;
    const utf16_t *u16end = u16ptr + bytes / sizeof(utf16_t);
    UINTVAL characters = 0;

    while (u16ptr < u16end) {
        u16ptr += UTF16SKIP(u16ptr);
        characters++;
    }

    if (u16ptr > u16end) {
        internal_exception(MALFORMED_UTF16,
                           "Unaligned end in UTF-16 string\n");
    }

    return characters;
}

/*

=item C<static UINTVAL
utf16_decode(const void *ptr)>

Returns the integer for the UTF-16 character found at C<*ptr>.

=cut

*/

static UINTVAL
utf16_decode(const void *ptr)
{
    const utf16_t *u16ptr = ptr;
    UINTVAL c = *u16ptr++;

    if (UNICODE_IS_HIGH_SURROGATE(c)) {
        utf16_t low = *u16ptr++;

        if (!UNICODE_IS_LOW_SURROGATE(low)) {
            internal_exception(MALFORMED_UTF16,
                               "Malformed UTF-16 surrogate\n");
        }

        c = UNICODE_DECODE_SURROGATE(c, low);
    }
    else if (UNICODE_IS_LOW_SURROGATE(c)) {
        internal_exception(MALFORMED_UTF16, "Malformed UTF-16 surrogate\n");
    }

    return c;
}

/*

=item C<static void *
utf16_encode(void *ptr, UINTVAL c)>

Returns the UTF-16 encoding of integer C<c>.

=cut

*/

static void *
utf16_encode(void *ptr, UINTVAL c)
{
    utf16_t *u16ptr = (utf16_t *)ptr;

    if (c > 0x10FFFF || UNICODE_IS_SURROGATE(c)) {
        internal_exception(INVALID_CHARACTER,
                           "Invalid character for UTF-16 encoding\n");
    }

    if (c < 0x10000u) {
        *u16ptr++ = (utf16_t)c;
    }
    else {
        *u16ptr++ = (utf16_t)UNICODE_HIGH_SURROGATE(c);
        *u16ptr++ = (utf16_t)UNICODE_LOW_SURROGATE(c);
    }

    return u16ptr;
}

/*

=item C<static const void *
utf16_skip_forward(const void *ptr, UINTVAL n)>

Moves C<ptr> C<n> characters forward.

=cut

*/

static const void *
utf16_skip_forward(const void *ptr, UINTVAL n)
{
    const utf16_t *u16ptr = (const utf16_t *)ptr;

    while (n-- > 0) {
        if (UNICODE_IS_HIGH_SURROGATE(*u16ptr)) {
            u16ptr++;

            if (!UNICODE_IS_LOW_SURROGATE(*u16ptr)) {
                internal_exception(MALFORMED_UTF16,
                                   "Malformed UTF-16 surrogate\n");
            }
        }
        else if (UNICODE_IS_LOW_SURROGATE(*u16ptr)) {
            internal_exception(MALFORMED_UTF16,
                               "Malformed UTF-16 surrogate\n");
        }

        u16ptr++;
    }

    return u16ptr;
}

/*

=item C<static const void *
utf16_skip_backward(const void *ptr, UINTVAL n)>

Moves C<ptr> C<n> characters back.

=cut

*/

static const void *
utf16_skip_backward(const void *ptr, UINTVAL n)
{
    const utf16_t *u16ptr = (const utf16_t *)ptr;

    while (n-- > 0) {
        u16ptr--;

        if (UNICODE_IS_LOW_SURROGATE(*u16ptr)) {
            u16ptr--;

            if (!UNICODE_IS_HIGH_SURROGATE(*u16ptr)) {
                internal_exception(MALFORMED_UTF16,
                                   "Malformed UTF-16 surrogate\n");
            }
        }
        else if (UNICODE_IS_HIGH_SURROGATE(*u16ptr)) {
            internal_exception(MALFORMED_UTF16,
                               "Malformed UTF-16 surrogate\n");
        }
    }

    return u16ptr;
}

/*

=back

=head2 Iterator Functions

String iteration is currently only used in C<hash_string_equal()>.

=over 4

=item C<static UINTVAL
utf16_decode_and_advance(struct string_iterator_t *i)>

The UTF-16 implementation of the string iterator's C<decode_and_advance>
function.

=cut

*/

static UINTVAL
utf16_decode_and_advance(struct string_iterator_t *i)
{
    const utf16_t *u16ptr = (utf16_t *)((char *)i->str->strstart + i->bytepos);
    UINTVAL c = *u16ptr++;

    if (UNICODE_IS_HIGH_SURROGATE(c)) {
        utf16_t low = *u16ptr++;

        if (!UNICODE_IS_LOW_SURROGATE(low)) {
            internal_exception(MALFORMED_UTF16,
                               "Malformed UTF-16 surrogate\n");
        }

        c = UNICODE_DECODE_SURROGATE(c, low);
        i->bytepos += 4;
    }
    else if (UNICODE_IS_LOW_SURROGATE(c)) {
        internal_exception(MALFORMED_UTF16, "Malformed UTF-16 surrogate\n");
    }
    else {
        i->bytepos += 2;
    }

    i->charpos++;
    return c;
}

/*

=item C<static void
utf16_set_position(struct string_iterator_t *i, Parrot_Int pos)>

The UTF-16 implementation of the string iterator's C<set_position>
function.

=cut

*/

/* XXX Should use quickest direction */
static void
utf16_set_position(struct string_iterator_t *i, Parrot_Int pos)
{
    const utf16_t *u16ptr = (utf16_t *)i->str->strstart;

    i->charpos = pos;
    while (pos-- > 0) {
        if (UNICODE_IS_HIGH_SURROGATE(*u16ptr)) {
            u16ptr++;

            if (!UNICODE_IS_LOW_SURROGATE(*u16ptr)) {
                internal_exception(MALFORMED_UTF16,
                                   "Malformed UTF-16 surrogate\n");
            }
        }
        else if (UNICODE_IS_LOW_SURROGATE(*u16ptr)) {
            internal_exception(MALFORMED_UTF16,
                               "Malformed UTF-16 surrogate\n");
        }
        u16ptr++;
    }
    i->bytepos = (const char *)u16ptr - (const char *)i->str->strstart;
}

const ENCODING utf16_encoding = {
    enum_encoding_utf16,
    "utf16",
    UTF16_MAXLEN,
    utf16_characters,
    utf16_decode,
    utf16_encode,
    utf16_skip_forward,
    utf16_skip_backward,
    utf16_decode_and_advance,
    utf16_set_position
};

/*

=back

=head1 SEE ALSO

F<encodings/dbcs.c>,
F<encodings/singlebyte.c>,
F<encodings/utf8.c>,
F<encodings/utf32.c>,
F<src/string.c>,
F<include/parrot/string.h>,
F<docs/string.pod>.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

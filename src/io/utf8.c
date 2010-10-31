/*
Copyright (C) 2001-2010, Parrot Foundation.
$Id$

=head1 NAME

src/io/utf8.c - UTF8 I/O utility functions

=head1 DESCRIPTION

Convert output to utf8. Convert input to Parrot's internal string
representation.

=head2 Utility functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "io_private.h"
#include "../string/unicode.h"

/* HEADERIZER HFILE: include/parrot/io.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<size_t Parrot_io_read_utf8(PARROT_INTERP, PMC *filehandle, STRING
**buf)>

Read a string from a filehandle in UTF-8 format and convert it to a Parrot
string.

=cut

*/

size_t
Parrot_io_read_utf8(PARROT_INTERP, ARGMOD(PMC *filehandle),
        ARGMOD(STRING **buf))
{
    ASSERT_ARGS(Parrot_io_read_utf8)
    size_t  bytepos = 0;
    size_t  charpos = 0;
    size_t  len     = Parrot_io_read_buffer(interp, filehandle, buf);
    STRING *s       = *buf;

    s->encoding = Parrot_utf8_encoding_ptr;

    while (bytepos < s->bufused) {
        utf8_t  *u8ptr    = (utf8_t *)(s->strstart + bytepos);
        UINTVAL  c        = *u8ptr;
        size_t   utf8_len = 1;

        if (UTF8_IS_START(c)) {
            size_t new_bufused, count;

            utf8_len    = UTF8SKIP(u8ptr);
            new_bufused = bytepos + utf8_len;

            if (new_bufused > s->bufused) {
                /* read additional bytes to complete UTF-8 char */
                size_t  read;
                size_t  len2 = new_bufused - s->bufused;
                STRING *s2   = Parrot_str_new_init(interp, NULL, len2,
                                    Parrot_binary_encoding_ptr, 0);

                s2->bufused = len2;
                read        = Parrot_io_read_buffer(interp, filehandle, &s2);

                if (read < len2)
                    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_UTF8,
                        "Unaligned end in UTF-8 string\n");

                Parrot_gc_reallocate_string_storage(interp, s, new_bufused);
                mem_sys_memcopy(s->strstart + s->bufused, s2->strstart, len2);

                s->bufused  = new_bufused;
                u8ptr       = (utf8_t *)(s->strstart + bytepos);
                len        += len2;
            }

            /* Check for overlong forms */
            if (UTF8_IS_OVERLONG(c, u8ptr[1]))
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_UTF8,
                    "Overlong form in UTF-8 string\n");

            c &= UTF8_START_MASK(utf8_len);

            for (count = 1; count < utf8_len; ++count) {
                ++u8ptr;

                if (!UTF8_IS_CONTINUATION(*u8ptr))
                    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_UTF8,
                        "Malformed UTF-8 string\n");

                c = UTF8_ACCUMULATE(c, *u8ptr);
            }

            if (UNICODE_IS_INVALID(c))
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_CHARACTER,
                    "Invalid character in UTF-8 string\n");
        }
        else if (!UNICODE_IS_INVARIANT(c)) {
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_UTF8,
                "Malformed UTF-8 string\n");
        }

        bytepos += utf8_len;
        charpos += 1;
    }

    s->strlen = charpos;

    return len;
}

/*

=item C<size_t Parrot_io_write_utf8(PARROT_INTERP, PMC *filehandle, const STRING
*s)>

Write a Parrot string to a filehandle in UTF-8 format.

=cut

*/

size_t
Parrot_io_write_utf8(PARROT_INTERP, ARGMOD(PMC *filehandle), ARGIN(const STRING *s))
{
    ASSERT_ARGS(Parrot_io_write_utf8)
    STRING *dest;

    if (s->encoding == Parrot_utf8_encoding_ptr)
        return Parrot_io_write_buffer(interp, filehandle, s);

    dest = Parrot_utf8_encoding_ptr->to_encoding(interp, s);
    return Parrot_io_write_buffer(interp, filehandle, dest);
}

/*

=back

=head1 SEE ALSO

F<src/io/io_passdown.c>,
F<src/io/io.c>,
F<src/io/io_layers.c>,
F<src/io/io_private.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

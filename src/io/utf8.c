/*
Copyright (C) 2001-2010, Parrot Foundation.

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
    STRING *s, *s2;
    String_iter iter;

    size_t len  = Parrot_io_read_buffer(interp, filehandle, buf);
    s           = *buf;
    s->encoding = Parrot_utf8_encoding_ptr;

    /* count chars, verify utf8 */
    STRING_ITER_INIT(interp, &iter);

    while (iter.bytepos < s->bufused) {
        if (iter.bytepos + 4 > s->bufused) {
            const utf8_t *u8ptr = (utf8_t *)((char *)s->strstart +
                    iter.bytepos);
            const UINTVAL c = *u8ptr;

            if (UTF8_IS_START(c)) {
                UINTVAL new_bufused = iter.bytepos + UTF8SKIP(u8ptr);
                UINTVAL len2;
                INTVAL  read;

                if (new_bufused <= s->bufused)
                    goto ok;

                /* read additional bytes to complete UTF-8 char */
                len2        = new_bufused - s->bufused;
                s2          = Parrot_str_new_init(interp, NULL, len2,
                                    Parrot_binary_encoding_ptr, 0);
                s2->bufused = len2;
                read        = Parrot_io_read_buffer(interp, filehandle, &s2);
                UNUSED(read);

                Parrot_gc_reallocate_string_storage(interp, s, new_bufused);
                mem_sys_memcopy(s->strstart + s->bufused, s2->strstart, len2);

                s->bufused  = new_bufused;
                len        += len2;

                /* check last char */
            }
        }
ok:
        STRING_iter_get_and_advance(interp, s, &iter);
    }
    s->strlen = iter.charpos;
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
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

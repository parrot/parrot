/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/rx.c - Supporting file for the regular expression engine

=head1 DESCRIPTION

rx.c and rx.h set up functions to be used by the regular expression
engine. They also define internal helper functions that add a layer of
abstraction to the C<rx_is_X> family of functions.  Please also see
C<rx.ops>, C<rx.dev>, C<rxstacks.c>, and C<rxstacks.h>.

C<rxinfo> is the main structure involved in regular expressions; it's
stuffed into a C<Handle> PMC and passed to all regular expression
opcodes.

=head2 Functions

=over 4

=cut

*/

#include "parrot/rx.h"

const INTVAL RX_MARK = -1;
const char *RX_WORDCHARS =
    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_";
const char *RX_NUMCHARS = "0123456789";
const char *RX_SPACECHARS = "\r\n\t ";
const char *RX_NEWLINES = "\r\n";       /* XXX Unicode defines a few more. */

/*************************************************************
 * Parrot Regular Expression Engine, version 3.0 alpha (Rx3) *
 *          Copyright (C) 2001-2002 The Parrot Team          *
 *               Initial version by Brent Dax                *
 *************************************************************/

/*

=item C<INTVAL
rx_is_word_character(Interp *interpreter, INTVAL ch)>

Checks to see if supplied char is a word character.  It uses the
constant C<RX_WORDCHARS> to create a bitmap.  Please see
F<docs/dev/rx.dev> for a detailed explanation of bitmap.

=cut

*/

INTVAL
rx_is_word_character(Interp *interpreter, INTVAL ch)
{
    static Bitmap bmp = NULL;

    if (!bmp) {
        bmp = bitmap_make_cstr(interpreter, RX_WORDCHARS);
    }

    return bitmap_match(interpreter, bmp, ch);
}

/*

=item C<INTVAL
rx_is_number_character(Interp *interpreter, INTVAL ch)>

Checks to see if supplied character is a number character.  This
function breaks abstraction to gain speed.  It's just a speed hack for
now, it will change when it needs to be changed (for different language
support/character encoding).

=cut

*/

INTVAL
rx_is_number_character(Interp *interpreter, INTVAL ch)
{
    /* faster to do less-than/greater-than */

    if (ch >= '0' && ch <= '9') {
        return 1;
    }
    else {
        return 0;
    }
}

/*

=item C<INTVAL
rx_is_whitespace_character(Interp *interpreter, INTVAL ch)>

Checks to see if supplied character is a whitespace character.

=cut

*/

INTVAL
rx_is_whitespace_character(Interp *interpreter, INTVAL ch)
{
    static Bitmap bmp = NULL;

    if (!bmp) {
        bmp = bitmap_make_cstr(interpreter, RX_SPACECHARS);
    }

    return bitmap_match(interpreter, bmp, ch);
}

/*

=item C<INTVAL
rx_is_newline(Interp *interpreter, INTVAL ch)>

Checks to see if supplied character is a newline.

=cut

*/

INTVAL
rx_is_newline(Interp *interpreter, INTVAL ch)
{
    static Bitmap bmp = NULL;

    if (!bmp) {
        bmp = bitmap_make_cstr(interpreter, RX_NEWLINES);
    }

    return bitmap_match(interpreter, bmp, ch);
}

/*

=item C<Bitmap
bitmap_make(Interp *interpreter, STRING *str)>

Creates a bitmap from supplied string.  Please see F<docs/dev/rx.dev>
for more information on bitmaps.

=cut

*/

Bitmap
bitmap_make(Interp *interpreter, STRING *str)
{
    UINTVAL i, ch;
    Bitmap bmp = mem_sys_allocate(sizeof(struct bitmap_t));
    bmp->bmp = mem_sys_allocate(32);
    bmp->bigchars = NULL;

    for (i = 0; i < 32; i++) {
        bmp->bmp[i] = 0;
    }

    for (i = 0; i < string_length(interpreter, str); i++) {
        ch = string_ord(interpreter, str, (INTVAL)i);

        if (ch > 255) {
            bmp->bigchars =
                string_concat(interpreter, bmp->bigchars,
                              string_make(interpreter, (void *)&ch, 1,
                                          "iso-8859-1", 0), 0);
        }
        else {
            bmp->bmp[ch >> 3] |= (1 << (ch & 7));
        }
    }

    return bmp;
}

/*

=item C<Bitmap
bitmap_make_cstr(Interp *interpreter, const char *str)>

Same as C<bitmap_make()>, except passed a C<const char*> arg.

=cut

*/

Bitmap
bitmap_make_cstr(Interp *interpreter, const char *str)
{
    UINTVAL i, ch;
    Bitmap bmp = mem_sys_allocate(sizeof(struct bitmap_t));
    bmp->bmp = mem_sys_allocate(32);
    bmp->bigchars = NULL;

    for (i = 0; i < 32; i++) {
        bmp->bmp[i] = 0;
    }

    for (i = 0; i < strlen(str); i++) {
        ch = str[i];

        bmp->bmp[ch >> 3] |= (1 << (ch & 7));
    }

    return bmp;
}

/*

=item C<void
bitmap_add(Interp *interpreter, Bitmap bmp, INTVAL ch)>

Appends supplied character to supplied bitmap.

=cut

*/

void
bitmap_add(Interp *interpreter, Bitmap bmp, INTVAL ch)
{
    if (ch > 255) {
        bmp->bigchars =
            string_concat(interpreter, bmp->bigchars,
                          string_make(interpreter, (void *)&ch, 1, "iso-8859-1", 0),
                          0);
    }
    else {
        bmp->bmp[ch >> 3] |= (1 << (ch & 7));
    }
}

/*

=item C<INTVAL
bitmap_match(Bitmap bmp, INTVAL ch)>

Checks if supplied character is in supplied bitmap.

=cut

*/

INTVAL
bitmap_match(Interp *interpreter, Bitmap bmp, INTVAL ch)
{
    if (ch > 255) {
        UINTVAL i;

        for (i = 0; i < string_length(interpreter, bmp->bigchars); i++) {
            if (string_ord(interpreter, bmp->bigchars, (INTVAL)i) == ch) {
                return 1;
            }
        }

        return 0;
    }

    return (INTVAL)( bmp->bmp[ch >> 3] & (1 << (ch & 7)) ? 1 : 0 );
}

/*

=item C<void
bitmap_destroy(Bitmap bmp)>

Frees up memory the bitmap allocated.

=cut

*/

void
bitmap_destroy(Interp *interpreter, Bitmap bmp)
{
    /* XXX */
    if (bmp->bigchars && PObj_bufstart(bmp->bigchars)) {
        mem_sys_free(PObj_bufstart(bmp->bigchars));
	PObj_bufstart(bmp->bigchars) = NULL;
    }
    mem_sys_free(bmp->bmp);
    bmp->bmp = NULL;
    mem_sys_free(bmp);
    bmp = NULL;
}

/*

=back

=head1 SEE ALSO


F<include/parrot/rx.h>, F<src/rxstacks.c>, F<include/parrot/rxstacks.h>,
F<docs/dev/rx.dev>.

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

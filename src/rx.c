/* rx.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Supporting file for the regular expression engine
 *  Data Structure and Algorithms:
 *     rxinfo is the main structure involved in regular expressions; it's
 *     stuffed into a Handle PMC and passed to all regular expression opcodes.
 *  History:
 *  Notes:
 *  References:
 */

/*

=head1 NAME

rx.c / rx.h

=head1 SUMMARY

rx.c and rx.h set up functions to be used by the regular expression engine.
They also define internal helper functions that add a layer of
abstraction to
the rx_is_X family of functions.  Please also see C<rx.ops>, C<rx.dev>,
C<rxstacks.c>, and C<rxstacks.h>.

=head1 FUNCTIONS

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

=item B<rx_is_word_character>(struct Parrot_Interp *interpreter, INTVAL ch)

Checks to see if supplied char is a word character.  It uses the constant
RX_WORDCHARS to create a bitmap.  Please see rx.dev for a detailed
explanation of bitmap

=cut

*/
INTVAL
rx_is_word_character(struct Parrot_Interp *interpreter, INTVAL ch)
{
    static Bitmap bmp = NULL;

    if (!bmp) {
        bmp = bitmap_make_cstr(interpreter, RX_WORDCHARS);
    }

    return bitmap_match(bmp, ch);
}

/*

=item B<rx_is_number_character>(struct Parrot_Interp *interpreter, INTVAL ch)

Checks to see if supplied character is a number character.  This function
breaks abstraction to gain speed.  It's just a speed hack for now, it
will change when it needs to be changed (for different language
support/character encoding)

=cut

*/
INTVAL
rx_is_number_character(struct Parrot_Interp *interpreter, INTVAL ch)
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

=item B<rx_is_whitespace_character>(struct Parrot_Interp *interpreter, INTVAL ch)

Checks to see if supplied character is a whitespace character.

=cut

*/
INTVAL
rx_is_whitespace_character(struct Parrot_Interp *interpreter, INTVAL ch)
{
    static Bitmap bmp = NULL;

    if (!bmp) {
        bmp = bitmap_make_cstr(interpreter, RX_SPACECHARS);
    }

    return bitmap_match(bmp, ch);
}

/*

=item B<rx_is_newline>(struct Parrot_Interp *interpreter, INTVAL ch)

Checks to see if supplied character is a newline.

=cut

*/
INTVAL
rx_is_newline(struct Parrot_Interp *interpreter, INTVAL ch)
{
    static Bitmap bmp = NULL;

    if (!bmp) {
        bmp = bitmap_make_cstr(interpreter, RX_NEWLINES);
    }

    return bitmap_match(bmp, ch);
}

/*

=item B<bitmap_make>(struct Parrot_Interp *interpreter, STRING *str)

Creates a bitmap from supplied string.  Please see rx.dev for more
information on bitmaps.

=cut

*/
Bitmap
bitmap_make(struct Parrot_Interp *interpreter, STRING *str)
{
    UINTVAL i, ch;
    Bitmap bmp = mem_sys_allocate(sizeof(struct bitmap_t));
    bmp->bmp = mem_sys_allocate(32);
    bmp->bigchars = NULL;

    for (i = 0; i < 32; i++) {
        bmp->bmp[i] = 0;
    }

    for (i = 0; i < string_length(str); i++) {
        ch = string_ord(str, (INTVAL)i);

        if (ch > 255) {
            bmp->bigchars =
                string_concat(interpreter, bmp->bigchars,
                              string_make(interpreter, (void *)&ch, 1, 0, 0,
                                          0), 0);
        }
        else {
            bmp->bmp[ch >> 3] |= (1 << (ch & 7));
        }
    }

    return bmp;
}

/*

=item B<bitmap_make_cstr>(struct Parrot_Interp *interpreter, const char *str)

Same as bitmap_make, except passed a const char* arg.

=cut

*/
Bitmap
bitmap_make_cstr(struct Parrot_Interp *interpreter, const char *str)
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

=item B<bitmap_add>(struct Parrot_Interp *interpreter, Bitmap bmp, INTVAL ch)

Appends supplied character to supplied bitmap.

=cut

*/
void
bitmap_add(struct Parrot_Interp *interpreter, Bitmap bmp, INTVAL ch)
{
    if (ch > 255) {
        bmp->bigchars =
            string_concat(interpreter, bmp->bigchars,
                          string_make(interpreter, (void *)&ch, 1, 0, 0, 0),
                          0);
    }
    else {
        bmp->bmp[ch >> 3] |= (1 << (ch & 7));
    }
}

/*

=item B<bitmap_match>(Bitmap bmp, INTVAL ch)

Checks if supplied character is in supplied bitmap.

=cut

*/
INTVAL
bitmap_match(Bitmap bmp, INTVAL ch)
{
    if (ch > 255) {
        UINTVAL i;

        for (i = 0; i < string_length(bmp->bigchars); i++) {
            if (string_ord(bmp->bigchars, (INTVAL)i) == ch) {
                return 1;
            }
        }

        return 0;
    }

    return (INTVAL)( bmp->bmp[ch >> 3] & (1 << (ch & 7)) ? 1 : 0 );
}

/*

=item B<bitmap_destroy>(Bitmap bmp)

Frees up memory the bitmap allocated.

=cut

*/
void
bitmap_destroy(Bitmap bmp)
{
    /* XXX */
    if (bmp->bigchars && bmp->bigchars->bufstart)
        mem_sys_free(bmp->bigchars->bufstart);
    mem_sys_free(bmp->bmp);
    mem_sys_free(bmp);
}

/*

=back

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

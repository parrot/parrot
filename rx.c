/* rx.c
 *  Copyright: (When this is determined...it will go here)
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

rxinfo *
rx_allocate_info(struct Parrot_Interp *interpreter, STRING *string)
{
    rxinfo *rx = mem_sys_allocate(sizeof(rxinfo));

    rx->minlength = rx->index = rx->startindex = 0;
    rx->flags = enum_rxflags_none;
    rx->whichway = enum_rxdirection_forwards;

    rx->string = string;

    rx->groupstart = pmc_new(interpreter, enum_class_PerlArray);
    rx->groupend = pmc_new(interpreter, enum_class_PerlArray);

    rx->stack = intstack_new(interpreter);

    string_transcode(interpreter, rx->string, encoding_lookup("utf32"),
                     rx->string->type, &rx->string);

    return rx;
}

INLINE BOOLVAL
rx_is_word_character(struct Parrot_Interp *interpreter, INTVAL ch)
{
    static Bitmap bmp = NULL;

    if (!bmp) {
        bmp = bitmap_make_cstr(interpreter, RX_WORDCHARS);
    }

    return bitmap_match(bmp, ch);
}

INLINE BOOLVAL
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

INLINE BOOLVAL
rx_is_whitespace_character(struct Parrot_Interp *interpreter, INTVAL ch)
{
    static Bitmap bmp = NULL;

    if (!bmp) {
        bmp = bitmap_make_cstr(interpreter, RX_SPACECHARS);
    }

    return bitmap_match(bmp, ch);
}

INLINE BOOLVAL
rx_is_newline(struct Parrot_Interp *interpreter, INTVAL ch)
{
    static Bitmap bmp = NULL;

    if (!bmp) {
        bmp = bitmap_make_cstr(interpreter, RX_NEWLINES);
    }

    return bitmap_match(bmp, ch);
}

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

BOOLVAL
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

    return (BOOLVAL)( bmp->bmp[ch >> 3] & (1 << (ch & 7)) ? 1 : 0 );
}

void
bitmap_destroy(Bitmap bmp)
{
    string_destroy(bmp->bigchars);
    mem_sys_free(bmp->bmp);
    mem_sys_free(bmp);
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

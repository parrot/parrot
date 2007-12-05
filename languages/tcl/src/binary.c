/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */


#include "parrot/parrot.h"

#include "binary.h"
#include <stdio.h>

static int class_TclFloat  = 0;
static int class_TclInt    = 0;
static int class_TclList   = 0;
static int class_TclString = 0;

/*

=head1 NAME

languages/tcl/src/binary.c

=head1 DESCRIPTION

RT#48162

=head2 Functions

=over 4

=item C<static int
extract_int(char *str, int *pos, int length)>

Extract an integer from the string at the position given. Return the integer
and update the position. Returns 1 if no digit is found or if the int is
zero.

=cut

*/
static int
extract_int(char *str, int *pos, int length)
{
    int n = 0;

    while (*pos < length && isdigit((unsigned char)str[*pos]))
        n = 10*n + (str[(*pos)++] - '0');

    if (!n)
        n = 1;

    return n;
}

/*

=item C<static PMC *
binary_scan_number_field(PARROT_INTERP, char field, char *binstr, int *_pos, int length)>

Scan and remove a number from a binary string. Return a PMC representing
that value.

=cut

 */
static PMC *
binary_scan_number_field(PARROT_INTERP, char field, char *binstr, int *_pos, int length)
{
    char *c;
    double *d;
    float *f;
    int *n;

    int len;
    PMC *value = NULL;
    int pos = *_pos;
    switch (field)
    {
        /* a char */
        case 'c':
            if (pos >= length)
                break;
            c     = (char *)(binstr + pos);
            value = pmc_new(interp, class_TclInt);
            VTABLE_set_integer_native(interp, value, (INTVAL)*c);
            pos += 1;
            break;
        /* a double */
        case 'd':
            len = sizeof (double)/sizeof (char);
            if (pos + len > length)
                break;
            d     = (double *)(binstr + pos);
            value = pmc_new(interp, class_TclFloat);
            VTABLE_set_number_native(interp, value, *d);
            pos += len;
            break;
        /* a float */
        case 'f':
            len = sizeof (float)/sizeof (char);
            if (pos + len > length)
                break;
            f     = (float *)(binstr + pos);
            value = pmc_new(interp, class_TclFloat);
            VTABLE_set_number_native(interp, value, *f);
            pos += len;
            break;
        /* a native int */
        case 'n':
            len = sizeof (int)/sizeof (char);
            if (pos + len > length)
                break;
            n     = (int *)(binstr + pos);
            value = pmc_new(interp, class_TclInt);
            VTABLE_set_integer_native(interp, value, *n);
            pos += len;
            break;
    }
    (*_pos) = pos;
    return value;
}

/*

=item C<static PMC *
binary_scan_number_slurpy(PARROT_INTERP, char field, char *binstr, int *_pos, int length)>

Scan the binary string for all remaining occurences of a number of the type
of the field. Returns a TclList PMC of the number PMCs.

=cut

 */
static PMC *
binary_scan_number_slurpy(PARROT_INTERP, char field, char *binstr, int *_pos, int length)
{
    PMC *elem;
    PMC *values = pmc_new(interp, class_TclList);

    while ((elem = binary_scan_number_field(interp, field, binstr, _pos, length)))
        VTABLE_push_pmc(interp, values, elem);

    return values;
}

/*

=item C<static PMC *
binary_scan_number(PARROT_INTERP, char field,
                   char *format, int *formatpos, int formatlen,
                   char *binstr, int *binstrpos, int binstrlen)>

Scan the binary string for a number field. There may be a width following
the field specifier.

=cut

 */
static PMC *
binary_scan_number(PARROT_INTERP, char field,
                   char *format, int *formatpos, int formatlen,
                   char *binstr, int *binstrpos, int binstrlen)
{
    PMC *value;

    if ((*formatpos) < formatlen && format[*formatpos] == '*')
    {
        (*formatpos)++;
        value = binary_scan_number_slurpy(interp, field, binstr, binstrpos, binstrlen);
    }
    else
        value = binary_scan_number_field(interp, field, binstr, binstrpos, binstrlen);

    return value;
}

/*

=item C<static STRING *
binary_scan_string_field(PARROT_INTERP, char field,
                         char *binstr, int *_binstrpos, int binstrlen,
                         STRING *value, int length)>

Scan the binary string for a string field. Returns the value of the extracted
string (concatenated to its previous value).

=cut

 */
static STRING *
binary_scan_string_field(PARROT_INTERP, char field,
                         char *binstr, int *_binstrpos, int binstrlen,
                         STRING *value, int length)
{
    int binstrpos = *_binstrpos;

    char *c;
    switch (field)
    {
        case 'a':
            if (binstrpos + length > binstrlen)
                return NULL;
            c     = binstr + binstrpos;
            value = string_concat(interp, value, string_from_cstring(interp, c, length), 0);
            binstrpos += length;
            break;
        case 'A':
            if (binstrpos + length > binstrlen)
                return NULL;
            c     = binstr + binstrpos;
            value = string_concat(interp, value, string_from_cstring(interp, c, length), 0);
            binstrpos += length;
            break;
        default:
            return NULL;
    }

    *_binstrpos = binstrpos;
    return value;
}

/*

=item C<static STRING *
binary_scan_string_slurpy(PARROT_INTERP, char field,
                          char *binstr, int *_binstrpos, int binstrlen, STRING *value)>

Scan the binary string for all remaining matches of the field. Returns the
new value of the STRING value passed in.

=cut

 */
static STRING *
binary_scan_string_slurpy(PARROT_INTERP, char field,
                          char *binstr, int *_binstrpos, int binstrlen, STRING *value)
{
    int length = string_length(interp, value);
    value      = binary_scan_string_field(interp, field,
                                          binstr, _binstrpos, binstrlen,
                                          value, length);

    return value;
}

/*

=item C<static PMC *
binary_scan_string(PARROT_INTERP, char field,
                   char *format, int *formatpos, int formatlen,
                   char *binstr, int *binstrpos, int binstrlen)>

Scan the binary string for a string field. Returns a TclString PMC with the
value(s) extracted.

=cut

 */
static PMC *
binary_scan_string(PARROT_INTERP, char field,
                   char *format, int *formatpos, int formatlen,
                   char *binstr, int *binstrpos, int binstrlen)
{
    STRING *value = string_make_empty(interp, enum_stringrep_one, 128);
    PMC *pmcval   = pmc_new(interp, class_TclString);

    if ((*formatpos) < formatlen && format[*formatpos] == '*')
    {
        (*formatpos)++;
        value = binary_scan_string_slurpy(interp, field, binstr, binstrpos, binstrlen, value);
    }
    else
    {
        int n = extract_int(format, formatpos, formatlen);
        value = binary_scan_string_field(interp, field,
                                         binstr, binstrpos, binstrlen,
                                         value, n);
    }

    VTABLE_set_string_native(interp, pmcval, value);
    return pmcval;
}

/*

=item C<PMC *ParTcl_binary_scan(PARROT_INTERP, STRING *BINSTR, STRING *FORMAT)>

Scan a binary string according to a format string and return a TclList of
the extracted values.

Assumes, in order to prevent entering another PIR runloop, that the format
has been checked to contain valid fields.

String and number field code has been separated in an effort to reduce code.

=cut

 */
PMC *ParTcl_binary_scan(PARROT_INTERP, STRING *BINSTR, STRING *FORMAT)
{
    char *binstr  = string_to_cstring(interp, BINSTR);
    int binstrlen = (int)string_length(interp, BINSTR);
    int binstrpos = 0;
    char *format  = string_to_cstring(interp, FORMAT);
    int formatlen = string_length(interp, FORMAT);
    int formatpos = 0;
    PMC *values;

    /* make sure we've found the type numbers for the PMCs we want to create */
    if (!class_TclFloat)
    {
        class_TclFloat  = pmc_type(interp, string_from_literal(interp, "TclFloat"));
        class_TclInt    = pmc_type(interp, string_from_literal(interp, "TclInt"));
        class_TclList   = pmc_type(interp, string_from_literal(interp, "TclList"));
        class_TclString = pmc_type(interp, string_from_literal(interp, "TclString"));
    }

    values = pmc_new(interp, class_TclList);
    while (formatpos < formatlen)
    {
        char field = format[formatpos++];
        PMC *value;

        /* figure out if this is a number or a string field */
        switch (field)
        {
            case 'c':
            case 'd':
            case 'f':
            case 'n':
                value = binary_scan_number(interp, field,
                                           format, &formatpos, formatlen,
                                           binstr, &binstrpos, binstrlen);
                break;
            case 'a':
            case 'A':
                value = binary_scan_string(interp, field,
                                           format, &formatpos, formatlen,
                                           binstr, &binstrpos, binstrlen);
                break;
            default:
                value = NULL;
                break;
        }

        VTABLE_push_pmc(interp, values, value);
    }

    /* don't forget to free the strings we allocated */
    string_cstring_free(binstr);
    string_cstring_free(format);

    return values;
}

/*

=item C<static STRING *
binary_format_number_field(PARROT_INTERP, char field, STRING *binstr, PMC *value)>

RT#48164: Not yet documented!!!

=cut

*/

static STRING *
binary_format_number_field(PARROT_INTERP, char field, STRING *binstr, PMC *value)
{
    char c;
    double d;
    float f;
    int n;

    INTVAL len;

    switch (field)
    {
        /* a char */
        case 'c':
            c      = (char)VTABLE_get_integer(interp, value);
            binstr = string_concat(interp, binstr, string_from_cstring(interp, &c, 1), 0);
            break;
        /* a double */
        case 'd':
            d      = (double)VTABLE_get_number(interp, value);
            len    = sizeof (double)/sizeof (char);
            binstr = string_concat(interp, binstr, string_from_num(interp, (float)d), 0);
            break;
        /* a float */
        case 'f':
            f      = (float)VTABLE_get_number(interp, value);
            len    = sizeof (float)/sizeof (char);
            binstr = string_concat(interp, binstr, string_from_num(interp, f), 0);
            break;
        /* a native integer */
        case 'n':
            n      = (int)VTABLE_get_integer(interp, value);
            len    = sizeof (int)/sizeof (char);
            binstr = string_concat(interp, binstr, string_from_int(interp, n), 0);
            break;
    }

    return binstr;
}

/*

=item C<static STRING *
binary_format_number(PARROT_INTERP, char field, STRING *binstr, PMC *value,
                     char *format, int *formatpos, int formatlen)>

RT#48164: Not yet documented!!!

=cut

*/

static STRING *
binary_format_number(PARROT_INTERP, char field, STRING *binstr, PMC *value,
                     char *format, int *formatpos, int formatlen)
{
    binstr = binary_format_number_field(interp, field, binstr, value);

    return binstr;
}

/*

=item C<static STRING *
binary_format_string_field(PARROT_INTERP, char field, STRING *binstr,
                           STRING *strval, int length)>

RT#48164: Not yet documented!!!

=cut

*/

static STRING *
binary_format_string_field(PARROT_INTERP, char field, STRING *binstr,
                           STRING *strval, int length)
{
    int strlen = string_length(interp, strval);

    switch (field)
    {
        case 'a':
            if (strlen > length)
                string_chopn_inplace(interp, strval, strlen - length);
            binstr = string_concat(interp, binstr, strval, 0);
            /* pad with nulls if necessary */
            while (length-- > strlen)
                binstr = string_concat(interp, binstr, string_from_cstring(interp, "", 1), 0);
            break;
        case 'A':
            if (strlen > length)
                string_chopn_inplace(interp, strval, strlen - length);
            binstr = string_concat(interp, binstr, strval, 0);
            /* pad with spaces if necessary */
            while (length-- > strlen)
                binstr = string_concat(interp, binstr, string_from_cstring(interp, " ", 1), 0);
            break;
    }

    return binstr;
}

/*

=item C<static STRING *
binary_format_string(PARROT_INTERP, char field, STRING *binstr, PMC *value,
                     char *format, int *formatpos, int formatlen)>

RT#48164: Not yet documented!!!

=cut

*/

static STRING *
binary_format_string(PARROT_INTERP, char field, STRING *binstr, PMC *value,
                     char *format, int *formatpos, int formatlen)
{
    STRING *strval = VTABLE_get_string(interp, value);

    if ((*formatpos) < formatlen && format[*formatpos] == '*')
    {
        int len = string_length(interp, strval);
        binstr  = binary_format_string_field(interp, field, binstr, strval, len);
        (*formatpos)++;
    }
    else
    {
        int len = extract_int(format, formatpos, formatlen);
        binstr  = binary_format_string_field(interp, field, binstr, strval, len);
    }

    return binstr;
}

/*

=item C<STRING *ParTcl_binary_format(PARROT_INTERP, STRING *FORMAT, PMC *values)>

RT#48164: Not yet documented!!!

=cut

*/

STRING *ParTcl_binary_format(PARROT_INTERP, STRING *FORMAT, PMC *values)
{
    char *format   = string_to_cstring(interp, FORMAT);
    int formatlen  = string_length(interp, FORMAT);
    int formatpos  = 0;
    int valueidx   = 0;
    STRING *binstr = string_make_empty(interp, enum_stringrep_one, 128);

    while (formatpos < formatlen)
    {
        char field = format[formatpos++];
        PMC *value = VTABLE_get_pmc_keyed_int(interp, values, valueidx++);

        /* figure out if this is a number or a string field */
        switch (field)
        {
            case 'c':
            case 'd':
            case 'f':
            case 'n':
                binstr = binary_format_number(interp, field, binstr, value,
                                              format, &formatpos, formatlen);
                break;
            case 'a':
            case 'A':
                binstr = binary_format_string(interp, field, binstr, value,
                                              format, &formatpos, formatlen);
                break;
        }
    }

    string_cstring_free(format);

    return binstr;
}

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

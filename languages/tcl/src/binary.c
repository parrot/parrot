
#include "parrot/parrot.h"

#include "binary.h"
#include <stdio.h>

static int class_TclFloat = 0;
static int class_TclInt   = 0;
static int class_TclList  = 0;

static PMC *
binary_scan_field(Interp *interp, char field, char *binstr, int *_pos, int length)
{
    char *c;
    double *d;
    int len;
    PMC *value = PMCNULL;
    int pos = *_pos;
    switch (field)
    {
        case 'c':
            if (pos >= length)
                break;
            c     = (char *)(binstr + pos);
            value = pmc_new(interp, class_TclInt);
            VTABLE_set_integer_native(interp, value, (INTVAL)*c);
            pos += 1;
            break;
        case 'd':
            len = sizeof(double)/sizeof(char);
            if (pos + len > length)
                break;
            d     = (double *)(binstr + pos);
            value = pmc_new(interp, class_TclFloat);
            VTABLE_set_number_native(interp, value, *d);
            pos += len;
            break;
    }
    (*_pos) = pos;
    return value;
}

static PMC *
binary_scan_slurpy(Interp *interp, char field, char *binstr, int *_pos, int length)
{
    PMC *elem;
    PMC *values = pmc_new(interp, class_TclList);

    while ((elem = binary_scan_field(interp, field, binstr, _pos, length)) != PMCNULL)
        VTABLE_push_pmc(interp, values, elem);

    return values;
}

PMC *ParTcl_binary_scan(Interp *interp, STRING *BINSTR, STRING *FORMAT)
{
    char *binstr     = string_to_cstring(interp, BINSTR);
    int binstrlen    = (int)string_length(interp, BINSTR);
    int binstrpos    = 0;
    char *format     = string_to_cstring(interp, FORMAT);
    INTVAL formatlen = string_length(interp, FORMAT);
    INTVAL formatpos = 0;
    INTVAL value     = 0;
    PMC *values;

    if (!class_TclFloat)
    {
        class_TclFloat = pmc_type(interp, string_from_const_cstring(interp, "TclFloat", 0));
        class_TclInt   = pmc_type(interp, string_from_const_cstring(interp, "TclInt", 0));
        class_TclList  = pmc_type(interp, string_from_const_cstring(interp, "TclList", 0));
    }

    values = pmc_new(interp, class_TclList);
    while (formatpos < formatlen)
    {
        char field = format[formatpos++];
        PMC *value;

        if (formatpos < formatlen && format[formatpos] == '*')
        {
            formatpos++;
            value = binary_scan_slurpy(interp, field, binstr, &binstrpos, binstrlen);
        }
        else
            value = binary_scan_field(interp, field, binstr, &binstrpos, binstrlen);

        VTABLE_push_pmc(interp, values, value);
    }

    return values;
}

static STRING *
binary_format_field(Interp *interp, char field, STRING *binstr, PMC *value)
{
    char c;
    double d;
    INTVAL len;

    switch (field)
    {
        /* a char */
        case 'c':
            c      = (char)VTABLE_get_integer(interp, value);
            binstr = string_concat(interp, binstr, string_from_cstring(interp, &c, 1), 1);
            break;
        /* a double */
        case 'd':
            d      = (double)VTABLE_get_number(interp, value);
            len    = sizeof(double)/sizeof(char);
            binstr = string_concat(interp, binstr, string_from_cstring(interp, &d, len), len);
            break;
    }

    return binstr;
}

STRING *ParTcl_binary_format(Interp *interp, STRING *FORMAT, PMC *values)
{
    char *format      = string_to_cstring(interp, FORMAT);
    INTVAL formatlen  = string_length(interp, FORMAT);
    INTVAL pos        = 0;
    INTVAL valueidx   = 0;
    STRING *binstr    = string_make_empty(interp, enum_stringrep_one, 128);
    
    while (pos < formatlen)
    {
        PMC *value = VTABLE_get_pmc_keyed_int(interp, values, valueidx++);
        binstr = binary_format_field(interp, format[pos++], binstr, value);
    }

    return binstr;
}

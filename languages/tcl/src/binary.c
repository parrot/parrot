
#include "parrot/parrot.h"

#include "binary.h"
#include <stdio.h>

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
            value = pmc_new(interp, enum_class_Integer);
            VTABLE_set_integer_native(interp, value, (INTVAL)*c);
            pos += 1;
            break;
        case 'd':
            len = sizeof(double)/sizeof(char);
            if (pos + len > length)
                break;
            d     = (double *)(binstr + pos);
            value = pmc_new(interp, enum_class_Float);
            VTABLE_set_number_native(interp, value, *d);
            pos += len;
            break;
    }
    (*_pos) = pos;
    return value;
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
    PMC *values      = pmc_new(interp, enum_class_ResizablePMCArray);
    
    while (formatpos < formatlen)
    {
        PMC *value = binary_scan_field(interp, format[formatpos++],
                                       binstr, &binstrpos, binstrlen);
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
        case 'c':
            c      = (char)VTABLE_get_integer(interp, value);
            binstr = string_concat(interp, binstr, string_from_cstring(interp, &c, 1), 1);
            break;
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

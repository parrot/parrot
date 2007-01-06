
#include "parrot/parrot.h"

#include "binary.h"

PMC *ParTcl_binary_scan(Interp *interp, STRING *BINSTR, STRING *FORMAT)
{
    char *binstr     = string_to_cstring(interp, BINSTR);
    INTVAL binstrlen = string_length(interp, BINSTR);
    INTVAL binstrpos = 0;
    char *format     = string_to_cstring(interp, FORMAT);
    INTVAL formatlen = string_length(interp, FORMAT);
    INTVAL formatpos = 0;
    INTVAL value     = 0;
    PMC *values      = pmc_new(interp, enum_class_ResizablePMCArray);
    
    while (formatpos < formatlen)
    {
        char *c;
        double *d;
        INTVAL len;
        PMC *pmcval;
        switch (format[formatpos++])
        {
            case 'c':
                if (binstrpos + 1 > binstrlen)
                {
                    formatpos = formatlen;
                    break;
                }
                c = binstr + binstrpos;
                pmcval = pmc_new(interp, enum_class_Integer);
                VTABLE_set_integer_native(interp, pmcval, (int)(char)*c);
                VTABLE_push_pmc(interp, values, pmcval);
                binstrpos += 1;
                break;
            case 'd':
                len = sizeof(double)/sizeof(char);
                if (binstrpos + len > binstrlen)
                {
                    formatpos = formatlen;
                    break;
                }
                    d = (double *)(binstr + binstrpos);
                pmcval = pmc_new(interp, enum_class_Float);
                VTABLE_set_number_native(interp, pmcval, *d);
                VTABLE_push_pmc(interp, values, pmcval);
                binstrpos += len;
                break;
            default:
                break;
        }
    }

    return values;
}

STRING *ParTcl_binary_format(Interp *interp, STRING *FORMAT, PMC *values)
{
    char *format      = string_to_cstring(interp, FORMAT);
    INTVAL formatlen  = string_length(interp, FORMAT);
    INTVAL pos        = 0;
    INTVAL value      = 0;
    STRING *binstr    = string_from_cstring(interp, "", 0);
    
    while (pos < formatlen)
    {
        char c;
        double d;
        INTVAL len;
        switch (format[pos++])
        {
            case 'c':
                c      = (char)VTABLE_get_integer_keyed_int(interp, values, value++);
                binstr = string_concat(interp, binstr, string_from_cstring(interp, &c, 1), 1);
                break;
            case 'd':
                d      = VTABLE_get_integer_keyed_int(interp, values, value++);
                len    = sizeof(double)/sizeof(char);
                binstr = string_concat(interp, binstr, string_from_cstring(interp, &d, len), len);
                break;
            default:
                break;
        }
    }

    return binstr;
}

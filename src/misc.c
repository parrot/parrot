/* misc.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Miscellaneous functions, mainly the Parrot_sprintf family
 *  Data Structure and Algorithms:
 *     Uses a generalized formatting algorithm (spf_render.c) with
 *     a specialized vtable (spf_vtable.c) to handle argument extraction.
 *  History:
 *     This was once a simple, vararg-based implementation that existed
 *     completely within this file.  When the file grew to be nearly 1,000
 *     lines long, I split it into three. --BD
 *  Notes:
 *  References: misc.h, spf_vtable.c, spf_render.c
 */

#define IN_SPF_SYSTEM

#include "parrot/parrot.h"

/* All the other sprintf variants are implemented in terms of
 * Parrot_vsprintf_s.
 *
 * NAMING CONVENTION:
 *  Parrot_v?n?sprintf - a (nearly) drop-in replacement for v?n?sprintf.
 *  Parrot_v?sprintf_c - takes a C-string format, returns a Parrot string.
 *  Parrot_v?sprintf_s - takes a Parrot string format, returns a Parrot string.
 *
 *  So the _ means "returns Parrot string" and the other letter indicates the
 *      type for the format.  :^)
 */

STRING *
Parrot_vsprintf_s(struct Parrot_Interp *interpreter, STRING *pat, va_list args)
{
    SPRINTF_OBJ obj = va_core;
    obj.data = PARROT_VA_TO_VAPTR(args);

    return Parrot_sprintf_format(interpreter, pat, &obj);
}

STRING *
Parrot_vsprintf_c(struct Parrot_Interp *interpreter, const char *pat,
                  va_list args)
{
    STRING *realpat, *ret;

    realpat = string_make(interpreter, pat, strlen(pat),
                                  NULL, PObj_external_FLAG, NULL);
    ret = Parrot_vsprintf_s(interpreter, realpat, args);

    return ret;
}

void
Parrot_vsprintf(struct Parrot_Interp *interpreter, char *targ, const char *pat,
                va_list args)
{
    STRING *ret = Parrot_vsprintf_c(interpreter, pat, args);
    string_transcode(interpreter, ret, NULL, NULL, &ret);

    memcpy(targ, ret->strstart, ret->bufused);
    targ[ret->bufused] = '\0';
}

void
Parrot_vsnprintf(struct Parrot_Interp *interpreter, char *targ,
                 size_t len, const char *pat, va_list args)
{
    STRING *ret;
    if (len == 0)
        return;
    len--;
    if (len) {
        ret = Parrot_vsprintf_c(interpreter, pat, args);
        string_transcode(interpreter, ret, NULL, NULL, &ret);

        if (len > ret->bufused) {
            len = ret->bufused;
        }

        if (len)
            memcpy(targ, ret->strstart, len);
    }
    targ[len] = 0;
}

STRING *
Parrot_sprintf_s(struct Parrot_Interp *interpreter, STRING *pat, ...)
{
    STRING *ret;
    va_list args;

    va_start(args, pat);

    ret = Parrot_vsprintf_s(interpreter, pat, args);

    va_end(args);

    return ret;
}

STRING *
Parrot_sprintf_c(struct Parrot_Interp *interpreter, const char *pat, ...)
{
    STRING *ret;
    va_list args;

    va_start(args, pat);

    ret = Parrot_vsprintf_c(interpreter, pat, args);

    va_end(args);

    return ret;
}

void
Parrot_sprintf(struct Parrot_Interp *interpreter, char *targ, const char *pat,
               ...)
{
    va_list args;

    va_start(args, pat);

    Parrot_vsprintf(interpreter, targ, pat, args);

    va_end(args);
}

void
Parrot_snprintf(struct Parrot_Interp *interpreter, char *targ, size_t len,
                const char *pat, ...)
{
    va_list args;

    va_start(args, pat);

    Parrot_vsnprintf(interpreter, targ, len, pat, args);

    va_end(args);
}

STRING *
Parrot_psprintf(struct Parrot_Interp *interpreter, STRING *pat, PMC *ary)
{
    SPRINTF_OBJ obj = pmc_core;
    obj.data = ary;

    return Parrot_sprintf_format(interpreter, pat, &obj);
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

/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/misc.c - Miscellaneous functions

=head1 DESCRIPTION

Miscellaneous functions, mainly the C<Parrot_sprintf> family.

Uses a generalized formatting algorithm (F<src/spf_render.c>) with
a specialized vtable (F<src/spf_vtable.c>) to handle argument extraction.

=head2 Functions

The naming convention used is:

=over 4

=item C<Parrot_v?n?sprintf> 

A (nearly) drop-in replacement for v?n?sprintf.

=item  C<Parrot_v?sprintf_c>

Takes a C-string format, returns a Parrot string.

=item  C<Parrot_v?sprintf_s>

Takes a Parrot string format, returns a Parrot string.

So the C<_> means "returns Parrot string" and the other letter indicates
the type for the format.

=back

=over 4

=cut

*/

#define IN_SPF_SYSTEM

#include "parrot/parrot.h"

/*

=item C<STRING *
Parrot_vsprintf_s(Interp *interpreter, STRING *pat, va_list args)>

Almost all the other sprintf variants in this file are implemented in
terms of this function (see C<Parrot_psprintf()> for the exception). It
in turn calls C<Parrot_sprintf_format()> (see F<src/spf_render.c>).

=cut

*/

STRING *
Parrot_vsprintf_s(Interp *interpreter, STRING *pat, va_list args)
{
    SPRINTF_OBJ obj = va_core;
    obj.data = PARROT_VA_TO_VAPTR(args);

    return Parrot_sprintf_format(interpreter, pat, &obj);
}

/*

=item C<STRING *
Parrot_vsprintf_c(Interp *interpreter, const char *pat,
                  va_list args)>

C string version of C<Parrot_vsprintf_s()>.

=cut

*/

STRING *
Parrot_vsprintf_c(Interp *interpreter, const char *pat,
                  va_list args)
{
    STRING *realpat, *ret;

    realpat = string_make(interpreter, pat, strlen(pat),
                                  "iso-8859-1", PObj_external_FLAG);

	Parrot_block_GC(interpreter); /* don't allow realpat to get collected; need a better way to ensure that.... */
    ret = Parrot_vsprintf_s(interpreter, realpat, args);
	Parrot_unblock_GC(interpreter);

    return ret;
}

/*

=item C<void
Parrot_vsnprintf(Interp *interpreter, char *targ,
                 size_t len, const char *pat, va_list args)>

Similar to C<Parrot_vsprintf()> but with an option to specify the length
(C<len>) of the returned C string.

=cut

*/

void
Parrot_vsnprintf(Interp *interpreter, char *targ,
                 size_t len, const char *pat, va_list args)
{
    STRING *ret;
    if (len == 0)
        return;
    len--;
    if (len) {
        ret = Parrot_vsprintf_c(interpreter, pat, args);
        /* string_transcode(interpreter, ret, NULL, NULL, &ret); */

        if (len > ret->bufused) {
            len = ret->bufused;
        }

        if (len)
            memcpy(targ, ret->strstart, len);
    }
    targ[len] = 0;
}

/*

=item C<STRING *
Parrot_sprintf_s(Interp *interpreter, STRING *pat, ...)>

Calls C<Parrot_vsprintf_s()> with the C<va_list> obtained from C<...>.

=cut

*/

STRING *
Parrot_sprintf_s(Interp *interpreter, STRING *pat, ...)
{
    STRING *ret;
    va_list args;

    va_start(args, pat);

    ret = Parrot_vsprintf_s(interpreter, pat, args);

    va_end(args);

    return ret;
}

/*

=item C<STRING *
Parrot_sprintf_c(Interp *interpreter, const char *pat, ...)>

C string version of C<Parrot_sprintf_s()>.

=cut

*/

STRING *
Parrot_sprintf_c(Interp *interpreter, const char *pat, ...)
{
    STRING *ret;
    va_list args;

    va_start(args, pat);

    ret = Parrot_vsprintf_c(interpreter, pat, args);

    va_end(args);

    return ret;
}

/*

=item C<void
Parrot_snprintf(Interp *interpreter, char *targ, size_t len,
                const char *pat, ...)>

Similar to C<Parrot_sprintf()> but with an option to specify the length
(C<len>) of the returned C string.

=cut

*/

void
Parrot_snprintf(Interp *interpreter, char *targ, size_t len,
                const char *pat, ...)
{
    va_list args;

    va_start(args, pat);

    Parrot_vsnprintf(interpreter, targ, len, pat, args);

    va_end(args);
}

/*

=item C<STRING *
Parrot_psprintf(Interp *interpreter, STRING *pat, PMC *ary)>

Calls C<Parrot_sprintf_format()> with the insertion arguments in an
C<Array> PMC.

=cut

*/

STRING *
Parrot_psprintf(Interp *interpreter, STRING *pat, PMC *ary)
{
    SPRINTF_OBJ obj = pmc_core;
    obj.data = ary;

    return Parrot_sprintf_format(interpreter, pat, &obj);
}

/*

=back

=head1 SEE ALSO

F<src/misc.h>, F<src/spf_vtable.c>, F<src/spf_render.c>.

=head1 HISTORY

This was once a simple, vararg-based implementation that existed
completely within this file.  When the file grew to be nearly 1,000
lines long, I split it into three. --BD

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

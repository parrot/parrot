/*
Copyright (C) 2001-2010, Parrot Foundation.

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

=cut

*/

#define IN_SPF_SYSTEM

#include "parrot/parrot.h"

/* HEADERIZER HFILE: include/parrot/misc.h */

/*

=item C<STRING * Parrot_vsprintf_s(PARROT_INTERP, STRING *pat, va_list args)>

Almost all the other sprintf variants in this file are implemented in
terms of this function (see C<Parrot_psprintf()> for the exception). It
in turn calls C<Parrot_sprintf_format()> (see F<src/spf_render.c>).

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_vsprintf_s(PARROT_INTERP, ARGIN(STRING *pat), va_list args)
{
    ASSERT_ARGS(Parrot_vsprintf_s)
    SPRINTF_OBJ obj = va_core;
    obj.data = PARROT_VA_TO_VAPTR(args);

    return Parrot_sprintf_format(interp, pat, &obj);
}

/*

=item C<STRING * Parrot_vsprintf_c(PARROT_INTERP, const char *pat, va_list
args)>

C string version of C<Parrot_vsprintf_s()>.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
Parrot_vsprintf_c(PARROT_INTERP, ARGIN(const char *pat), va_list args)
{
    ASSERT_ARGS(Parrot_vsprintf_c)
    STRING * const realpat = Parrot_str_new_init(interp, pat, strlen(pat),
            Parrot_default_encoding_ptr, PObj_external_FLAG);

    STRING * const ret = Parrot_vsprintf_s(interp, realpat, args);

    return ret;
}

/*

=item C<void Parrot_vsnprintf(PARROT_INTERP, char *targ, size_t len, const char
*pat, va_list args)>

Similar to C<Parrot_vsprintf()> but with an option to specify the length
(C<len>) of the returned C string.

If len is zero, then C<targ> is unchanged.

=cut

*/

PARROT_EXPORT
void
Parrot_vsnprintf(PARROT_INTERP, ARGMOD(char *targ),
                 size_t len, ARGIN(const char *pat), va_list args)
{
    ASSERT_ARGS(Parrot_vsnprintf)

    if (len == 0)
        return;
    --len;
    if (len) {
        const STRING * const ret = Parrot_vsprintf_c(interp, pat, args);
        /* string_transcode(interp, ret, NULL, NULL, &ret); */

        char     * const str_ret = Parrot_str_to_cstring(interp, ret);
        const    size_t  str_len = strlen(str_ret);
        if (len > str_len) {
            len = str_len;
        }

        if (len)
            memcpy(targ, str_ret, len);
        Parrot_str_free_cstring(str_ret);
    }
    targ[len] = 0;
}

/*

=item C<STRING * Parrot_sprintf_s(PARROT_INTERP, STRING *pat, ...)>

Calls C<Parrot_vsprintf_s()> with the C<va_list> obtained from C<...>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_sprintf_s(PARROT_INTERP, ARGIN(STRING *pat), ...)
{
    ASSERT_ARGS(Parrot_sprintf_s)
    STRING *ret;
    va_list args;

    va_start(args, pat);

    ret = Parrot_vsprintf_s(interp, pat, args);

    va_end(args);

    return ret;
}

/*

=item C<STRING * Parrot_sprintf_c(PARROT_INTERP, const char *pat, ...)>

C string version of C<Parrot_sprintf_s()>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_sprintf_c(PARROT_INTERP, ARGIN(const char *pat), ...)
{
    ASSERT_ARGS(Parrot_sprintf_c)
    STRING *ret;
    va_list args;

    va_start(args, pat);

    ret = Parrot_vsprintf_c(interp, pat, args);

    va_end(args);

    return ret;
}

/*

=item C<void Parrot_snprintf(PARROT_INTERP, char *targ, size_t len, const char
*pat, ...)>

Similar to C<Parrot_sprintf()> but with an option to specify the length
(C<len>) of the returned C string.

=cut

*/

PARROT_EXPORT
void
Parrot_snprintf(PARROT_INTERP, ARGOUT(char *targ), size_t len,
                ARGIN(const char *pat), ...)
{
    ASSERT_ARGS(Parrot_snprintf)
    va_list args;

    va_start(args, pat);

    Parrot_vsnprintf(interp, targ, len, pat, args);

    va_end(args);
}

/*

=item C<STRING * Parrot_psprintf(PARROT_INTERP, STRING *pat, PMC *ary)>

Calls C<Parrot_sprintf_format()> with the insertion arguments in an
C<Array> PMC.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_psprintf(PARROT_INTERP, ARGIN(STRING *pat), ARGOUT(PMC *ary))
{
    ASSERT_ARGS(Parrot_psprintf)
    SPRINTF_OBJ obj = pmc_core;
    obj.data = ary;

    return Parrot_sprintf_format(interp, pat, &obj);
}

/*

=item C<int Parrot_secret_snprintf(char *buffer, size_t len, const char *format,
...)>

A simulation of C<snprintf> for systems that do not support it.

=cut

*/


PARROT_EXPORT
PARROT_IGNORABLE_RESULT
int
Parrot_secret_snprintf(ARGOUT(char *buffer), SHIM(size_t len), ARGIN(const char *format), ...)
{
    ASSERT_ARGS(Parrot_secret_snprintf)
    int retval;
    va_list ap;
    va_start(ap, format);
    retval = vsprintf(buffer, format, ap);
    va_end(ap);

    return retval;
}


/*

=back

=head1 SEE ALSO

F<src/misc.h>, F<src/spf_vtable.c>, F<src/spf_render.c>.

=head1 HISTORY

This was once a simple, vararg-based implementation that existed
completely within this file.  When the file grew to be nearly 1000
lines long, I split it into three. --BD

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

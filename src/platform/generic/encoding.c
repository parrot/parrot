/*
 * Copyright (C) 2012-2014, Parrot Foundation.
 */

/*

=head1 NAME

config/gen/platform/generic/encoding.c

=head1 DESCRIPTION

Platform C string encoding management

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

#if defined(PARROT_HAS_HEADER_LOCALE) && defined(PARROT_HAS_HEADER_LANGINFO)
#  include <locale.h>
#  include <langinfo.h>
#endif

/* HEADERIZER HFILE: none */

/*

=item C<void Parrot_init_platform_encoding(PARROT_INTERP)>

Set the platform encoding pointer, used for encoding/decoding strings passed to
the OS, to an appropriate value.

=cut

*/

void
Parrot_init_platform_encoding(SHIM_INTERP)
{
#if defined(PARROT_HAS_HEADER_LOCALE) && defined(PARROT_HAS_HEADER_LANGINFO)
    const char *orig  = setlocale(LC_CTYPE, NULL); /* store original locale */
    setlocale(LC_CTYPE, "");                       /* set locale to environment specification */
    {
        const char *codeset = nl_langinfo(CODESET);
        if (STREQ(codeset, "UTF-8")
         || STREQ(codeset, "utf-8"))          /* darwin 10.4 ppc */
            Parrot_platform_encoding_ptr = Parrot_utf8_encoding_ptr;
        else if (STREQ(codeset, "ISO-8859-1") /* linux */
              || STREQ(codeset, "ISO8859-1")) /* bsd */
            Parrot_platform_encoding_ptr = Parrot_latin1_encoding_ptr;
        else if (STREQ(codeset, "ANSI_X3.4-1968") /* linux */
              || STREQ(codeset, "US-ASCII")   /* freebsd */
              || STREQ(codeset, "646"))       /* bsd */
            Parrot_platform_encoding_ptr = Parrot_ascii_encoding_ptr;
        else if (!*codeset) /* do not warn on empty  */
            Parrot_platform_encoding_ptr = Parrot_ascii_encoding_ptr;
        else {
            /* Can't use Parrot_warn here, the interpreter is not ready */
            fprintf(stderr,
                "Unknown codeset `%s', defaulting to ASCII\n", codeset);
            Parrot_platform_encoding_ptr = Parrot_ascii_encoding_ptr;
        }
    }
    setlocale(LC_CTYPE, orig); /* restore original locale */
#else
    Parrot_platform_encoding_ptr = Parrot_ascii_encoding_ptr;
#endif
}


/*

=item C<size_t Parrot_str_platform_strlen(PARROT_INTERP, const char *s)>

Get the length of a platform-encoded C string.

=cut

*/

size_t
Parrot_str_platform_strlen(SHIM_INTERP, const char *s)
{
    return strlen(s);
}

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

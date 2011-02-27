/*
 * Copyright (C) 2011, Parrot Foundation.
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

#include <locale.h>
#include <langinfo.h>

/* HEADERIZER HFILE: none */

/*

=item C<void Parrot_init_platform_encoding(PARROT_INTERP)>

Set the platform encoding pointer, used for encoding/decoding strings passed to
the OS, to an appropriate value.

=cut

*/

void
Parrot_init_platform_encoding(PARROT_INTERP)
{
    const char *orig  = setlocale(LC_CTYPE, NULL); /* store original locale */
    setlocale(LC_CTYPE, "");                       /* set locale to environment specification */
    {
        const char *codeset = nl_langinfo(CODESET);
        if (STREQ(codeset, "UTF-8"))
            Parrot_platform_encoding_ptr = Parrot_utf8_encoding_ptr;
        else if (STREQ(codeset, "ISO-8859-1"))
            Parrot_platform_encoding_ptr = Parrot_latin1_encoding_ptr;
        else if (STREQ(codeset, "ANSI_X3.4-1968"))
            Parrot_platform_encoding_ptr = Parrot_ascii_encoding_ptr;
        else {
            Parrot_warn(interp, PARROT_WARNINGS_PLATFORM_FLAG,
                "Unknown codeset `%s', defaulting to ASCII", codeset);
            Parrot_platform_encoding_ptr = Parrot_ascii_encoding_ptr;
        }
    }
    setlocale(LC_CTYPE, orig); /* restore original locale */
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

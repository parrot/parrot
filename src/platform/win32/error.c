/*
 * Copyright (C) 2011, Parrot Foundation.
 */

/*

=head1 NAME

src/platform/win32/error.c

=head1 DESCRIPTION

Functions for handling system errors.

=head2 Functions

=over 4

=cut

*/

#include <windows.h>

#include "parrot/parrot.h"

/* HEADERIZER HFILE: none */

/*

=item C<STRING * Parrot_platform_strerror(PARROT_INTERP, INTVAL error)>

Returns a error message for a system error code.

=cut

*/

STRING *
Parrot_platform_strerror(PARROT_INTERP, INTVAL error)
{
    DWORD   flags   = FORMAT_MESSAGE_ALLOCATE_BUFFER
                    | FORMAT_MESSAGE_FROM_SYSTEM
                    | FORMAT_MESSAGE_IGNORE_INSERTS
                    | FORMAT_MESSAGE_MAX_WIDTH_MASK;
    DWORD   lang_id = MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT);
    DWORD   len;
    char   *msg;
    STRING *result;

    /* TODO: Support Unicode error messages */

    /* FormatMessage really expects a (char **) cast to a (char *) */
    len = FormatMessage(flags, NULL, error, lang_id, (LPTSTR)&msg, 0, NULL);

    if (len == 0) {
        result = Parrot_sprintf_c(interp, "Error code %ld", error);
    }
    else {
        result = Parrot_str_new(interp, msg, len);

        LocalFree(msg);
    }

    return result;
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


/*
 * $Id$
 * Copyright (C) 2006-2007, The Perl Foundation.
 */

/*

=head1 NAME

bcg_logger.c

=head1 DESCRIPTION

RT#48264

=head2 Methods

=over 4

=cut

*/

#include <stdarg.h>
#include "bcg_logger.h"

/*

=item C<void
bcg_throw_exception(BCG_info * bcg_info,
        const int code, const char *format, ...)>

RT#48260: Not yet documented!!!

=cut

*/

void
bcg_throw_exception(BCG_info * bcg_info,
        const int code, const char *format, ...)
{
    char    *message = mem_allocate_n_zeroed_typed(MAX_MESSAGE_SIZE, char);
    va_list  ap_list;


    va_start(ap_list, format);
    vsnprintf(message, MAX_MESSAGE_SIZE, format, ap_list);
    va_end(ap_list);

    bcg_info->error_msg  = message;
    bcg_info->error_code = code;

    BCG_THROW(bcg_info, code);
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

/*
 * $Id$
 * Copyright (C) 2004-2007, The Perl Foundation.
 */

/*

=head1 NAME

config/gen/platform/generic/signal.c

=head1 DESCRIPTION

Signal handling stuff

=head2 Functions

=over 4

=cut

*/

#ifdef PARROT_HAS_HEADER_SIGNAL
#  include <signal.h>

/*

=item C<Parrot_sighandler_t
Parrot_set_sighandler(int signum, Parrot_sighandler_t handler)>

for now use signal based functions

=cut

*/

Parrot_sighandler_t
Parrot_set_sighandler(int signum, Parrot_sighandler_t handler)
{
    return signal(signum, handler);
}
#endif /* PARROT_HAS_HEADER_SIGNAL */

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

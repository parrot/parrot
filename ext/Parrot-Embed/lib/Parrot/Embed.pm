package Parrot::Embed;

# $Id$

use strict;
use warnings;

our $VERSION = '20081006';

use base 'DynaLoader';

Parrot::Embed->bootstrap($VERSION);

1;

__END__

=head1 NAME

Parrot::Embed - use Parrot from Perl 5

=head1 VERSION

Version 20081006

=head1 SYNOPSIS

  use Parrot::Embed qw(Parrot_revision);

=head1 DESCRIPTION

This module embeds libparrot in Perl 5 programs.  You can load Parrot bytecode,
compile your own code, and call Parrot subroutines and send and receive values
to them.

It provides the core implementation used by the L<Parrot::Interpreter> module.
Do consider using L<Parrot::Interpreter> first however.  See also
L<Parrot::PMC>.

This module provides no user-inspectable code.

=head1 AUTHOR

chromatic, C<< <chromatic at wgz.org> >>

=head1 BUGS

Please report any bugs or feature requests to the Parrot Porters mailing list.
Someday there may be a CPAN version of this code.  Who knows?

=head1 COPYRIGHT & LICENSE

Copyright (C) 2006-2008 The Perl Foundation / chromatic.

This program is free software; you can redistribute it and/or modify it
under the same terms as Parrot itself.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

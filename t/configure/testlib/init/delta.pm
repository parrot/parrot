# Copyright (C) 2001-2003, The Perl Foundation.
# $Id$

=head1 NAME

t/configure/testlib/init/delta.pm - Module used in configuration tests

=cut

package init::delta;
use strict;
use warnings;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step;

$description = 'Determining if your computer does delta';
@args = ();

sub runstep {
    my ( $self, $conf, @params ) = @_;
    print "\n@params\n";
    return $self;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

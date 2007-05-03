# Copyright (C) 2001-2003, The Perl Foundation.
# $Id$

=head1 NAME

t/configure/testlib/init/beta.pm - Module used in configuration tests

=cut

package init::beta;
use strict;
use warnings;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step;

$description = 'Determining if your computer does beta';
@args = qw( verbose );

sub runstep {
    my ( $self, $conf ) = @_;
    my $verbose = $conf->options->get('verbose');
    print "\nbeta is verbose\n" if $verbose;
    print "\nYou've got beta\n";
    return $self;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

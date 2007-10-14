# Copyright (C) 2001-2003, The Perl Foundation.
# $Id$

=head1 NAME

t/configure/testlib/inter/theta.pm - Module used in configuration tests

=cut

package inter::theta;

use strict;
use warnings;
use vars qw($description @args);

use File::Basename qw/basename/;

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':inter';

$description = 'Determining if your computer does theta';
@args        = qw(ask theta);

sub runstep {
    my ( $self, $conf ) = @_;

    my $ask = $conf->options->get('ask');

    my $question = 'Will Perl 6 be out before Christmas?';
    my $response;
    if ($ask) {
        $response = prompt( $question, q{Y/n} );
    }
    return $self;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

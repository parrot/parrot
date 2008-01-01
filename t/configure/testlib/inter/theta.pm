# Copyright (C) 2001-2003, The Perl Foundation.
# $Id$

=head1 NAME

t/configure/testlib/inter/theta.pm - Module used in configuration tests

=cut

package inter::theta;

use strict;
use warnings;

use File::Basename qw/basename/;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':inter';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determining if your computer does theta};
    $data{args}        = [ qw( ask theta ) ];
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $ask = $conf->options->get('ask');

    my $question = 'Will Perl 6 be out before Christmas?';
    my $response;
    if ($ask) {
        $response = prompt( $question, q{Y/n} );
    }
    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

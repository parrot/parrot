# Copyright (C) 2001-2003, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/ops.pm - Ops Files

=head1 DESCRIPTION

Asks the user to select which ops files to include.

=cut

package auto::ops;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Which opcode files should be compiled in};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my @ops = (
        sort {
            if ( $a =~ /core\.ops/ ) { return -1 }
            if ( $b =~ /core\.ops/ ) { return 1 }
            return ( $a cmp $b )
            }
            grep { !/vtable\.ops/ } glob "src/ops/*.ops"
    );

    my $ops = join ' ', grep { !/obscure\.ops/ } @ops;

    $ops = $conf->options->get('ops') if defined $conf->options->get('ops');

    $conf->data->set( ops => $ops );

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

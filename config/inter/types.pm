# Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

config/inter/types.pm - Sizes for Parrot Types

=head1 DESCRIPTION

Asks the user which size integer, floating-point number and opcode types should
be.

=cut

package inter::types;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':inter';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{What types should Parrot use};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $intval   = $conf->options->get('intval')   || 'long';
    my $floatval = $conf->options->get('floatval') || 'double';
    my $opcode   = $intval;

    if ( $conf->options->get('ask') ) {
        $intval   = prompt( "\n\nHow big would you like your integers to be?", $intval );
        $floatval = prompt( "And your floats?",                                $floatval );
        print "\n";
    }

    $conf->data->set(
        iv       => $intval,
        nv       => $floatval,
        opcode_t => $opcode
    );

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

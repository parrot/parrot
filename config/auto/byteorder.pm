# Copyright (C) 2001-2003, Parrot Foundation.

=head1 NAME

config/auto/byteorder.pm - Native Byteorder

=head1 DESCRIPTION

Computes the native byteorder for Parrot's wordsize.

=cut

package auto::byteorder;

use strict;
use warnings;

use Parrot::Configure::Step qw(:auto);
use base qw(Parrot::Configure::Step);


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Compute native byteorder for wordsize};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $byteorder = _probe_for_byteorder($conf);

    $self->_evaluate_byteorder($conf, $byteorder);

    return 1;
}

sub _probe_for_byteorder {
    my $conf = shift;
    $conf->cc_gen('config/auto/byteorder/test_c.in');
    $conf->cc_build();
    my $byteorder = $conf->cc_run()
        or die "Can't run the byteorder testing program: $!";
    $conf->cc_clean();
    chomp $byteorder;
    return $byteorder;
}

sub _evaluate_byteorder {
    my ($self, $conf, $byteorder) = @_;
    if ( $byteorder =~ /^1234/ ) {
        $conf->data->set(
            byteorder => $byteorder,
            bigendian => 0
        );
        $self->set_result('little-endian');
    }
    elsif ( $byteorder =~ /^(?:8765|4321)/ ) {
        $conf->data->set(
            byteorder => $byteorder,
            bigendian => 1
        );
        $self->set_result('big-endian');
    }
    else {
        die "Unsupported byte-order [$byteorder]!";
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

# Copyright (C) 2001-2012, Parrot Foundation.

=head1 NAME

config/auto/byteorder.pm - Native Byteorder

=head1 DESCRIPTION

Computes the native byteorder for Parrot's wordsize
and probes for system byteswap macro support.

=cut

package auto::byteorder;

use strict;
use warnings;

use Parrot::Configure::Step qw(:auto);
use base qw(Parrot::Configure::Step);


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Native byteorder and bswap};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $byteorder = _probe_for_byteorder($conf);
    $self->_evaluate_byteorder($conf, $byteorder);

    $self->_probe_byteswap($conf, "byteswap.h") ||         # GNU (esp. linux)
      $self->_probe_byteswap($conf, "endian.h") ||         # Linux
      $self->_probe_byteswap($conf, "sys/endian.h") ||     # Freebsd
      $self->_probe_byteswap($conf, "sys/byteorder.h") ||  # BSWAP_32 on Solaris 10
      $self->_probe_byteswap($conf, "libkern/OSByteOrder.h") || # OSX
      $self->_probe_byteswap($conf, "machine/endian.h");   # Old OSX

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
        $self->set_result('le');
    }
    elsif ( $byteorder =~ /^(?:8765|4321)/ ) {
        $conf->data->set(
            byteorder => $byteorder,
            bigendian => 1
        );
        $self->set_result('be');
    }
    else {
        die "Unsupported byte-order [$byteorder]!";
    }
    return 1;
}

sub _probe_byteswap {
    my ($self, $conf, $include) = @_;
    my $i = $include;
    $i =~ s|/|_|g;
    $i =~ s|\.h$||g;

    $conf->cc_gen('config/auto/byteorder/bswap_c.in');
    eval { $conf->cc_build("-DPARROT_HAS_HEADER_".uc($i)) };
    my $ret = $@ ? 0 : $conf->cc_run();
    $conf->cc_clean();
    if ($ret and $ret ne '0x12345678') {
	my $i = $include;
	$i =~ s|/|_|g;
	$i =~ s|\.h$||g;
        $conf->data->set( "i_".lc($i) => 'define');
	$self->set_result($self->result()." ".$i);
    }
    else {
        $conf->data->set( "i_".lc($i) => undef) unless $ret;
    }

    return $ret;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

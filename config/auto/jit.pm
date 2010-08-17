# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/jit - JIT Capability

=head1 DESCRIPTION

Determines whether there is JIT capability available.  Use the
C<--jitcapable> and C<--execcapable> options to override the default
value calculated specifically for your CPU architecture and operating
system.

Code formerly found in this step class used to determine characteristics
of the CPU has been moved into the preceding step class, auto::arch.

=cut

package auto::jit;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determine JIT capability};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $osname  = $conf->data->get('osname');
    my $cpuarch = $conf->data->get('cpuarch');

    $conf->data->set(
        jitarchname    => 'nojit',
        jitcpuarch     => $cpuarch,
        jitcpu         => $cpuarch,
        jitosname      => $osname,
        jitcapable     => 0,
        execcapable    => 0,
        cc_hasjit      => '',
        TEMP_jit_o     => '',
        TEMP_exec_h    => '',
        TEMP_exec_o    => '',
        TEMP_exec_dep  => '',
        asmfun_o       => '',
    );
    $self->set_result('no');
    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

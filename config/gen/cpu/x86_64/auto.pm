
=head1 NAME

config/gen/cpu/x86_64/auto.pl

=head1 DESCRIPTION

Adds -fPIC to x86_64 (AMD64) ccflags, if necessary.

=cut

package gen::cpu::x86_64::auto;

use strict;

sub runstep
{
    my ($self, $conf) = @_;

    my $ccflags = $conf->data->get('ccflags');
    $conf->data->add(' ', ccflags => "-fPIC") unless $ccflags =~ /-fPIC/;
}

1;

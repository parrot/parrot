
=head1 NAME

config/gen/cpu/x86_64/auto.pl

=head1 DESCRIPTION

Adds -fPIC to x86_64 (AMD64) ccflags, if necessary.

=cut

use strict;

sub run_cpu
{
    my ($conf, $verbose) = @_;

    my $ccflags = $conf->data->get('ccflags');
    $ccflags .= " -fPIC" unless $ccflags =~ /-fPIC/;
    $conf->data->set(ccflags => $ccflags);
}

1;

=head1 NAME

config/gen/cpu/x86_64/auto.pl

=head1 DESCRIPTION

Adds -fPIC to x86_64 (AMD64) ccflags, if necessary.

=cut

use strict;

sub run_cpu {
    my $ccflags=Configure::Data->get('ccflags');
    $ccflags .= " -fPIC" unless $ccflags =~ /-fPIC/;
    Configure::Data->set(ccflags => $ccflags);
}

1;

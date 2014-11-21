# Copyright (C) 2004-2014, Parrot Foundation.

=head1 NAME

config/auto/cpu/amd64/auto.pm

=head1 DESCRIPTION

Test

=cut

package auto::cpu::amd64::auto;

use strict;
use warnings;

sub runstep {
    my ( $self, $conf ) = @_;

    # x86_64 on gcc has cmpxchg
    my $gcc = $conf->data->get('gccversion');
    if ( defined $gcc ) {
        # HAS_foo defines PARROT_HAS_`uc foo`
        $conf->data->set(
            "HAS_I386_GCC_CMPXCHG"   => '1',
            "HAS_X86_64_GCC_CMPXCHG" => '1',
        );
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

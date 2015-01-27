# Copyright (C) 2004-2015, Parrot Foundation.

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

    # AMD64 on gcc has cmpxchg
    my $gcc = $conf->data->get('gccversion');
    if ( defined $gcc ) {
        $conf->debug("gccversion: $gcc\n");
        # HAS_foo defines PARROT_HAS_`uc foo`
        $conf->data->set(
            "HAS_I386_gcc_cmpxchg"  => '1',
            "HAS_AMD64_gcc_cmpxchg" => '1',
        );
        $conf->debug(" (gcc_cmpxchg)\n");
    }
    else {
        $conf->debug("gccversion: (none)\n");
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

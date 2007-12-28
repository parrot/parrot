# Copyright (C) 2004-2006, The Perl Foundation.
# $Id$

=head1 NAME

config/gen/cpu/x86_64/auto.pm

=head1 DESCRIPTION

Adds -fPIC to x86_64 (AMD64) ccflags, if necessary.  Also handles
cmpxchg.

=cut

package gen::cpu::x86_64::auto;

use strict;
use warnings;

sub runstep {
    my ( $self, $conf ) = @_;

    my $ccflags = $conf->data->get('ccflags');
    $conf->data->add( ' ', ccflags => "-fPIC" ) unless $ccflags =~ /-fPIC/;

    # when running on gcc, we just define the config item
    if ( defined( $conf->data->get('gccversion') ) ) {

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

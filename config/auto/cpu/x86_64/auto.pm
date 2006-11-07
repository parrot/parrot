# Copyright: 2001-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/cpu/x86_64/auto.pm

=head1 DESCRIPTION

Test

=cut

package auto::cpu::x86_64::auto;

use strict;
use warnings;

sub runstep
{
    my ($self, $conf) = @_;
    # x86_64 is recently new and has cmpxchg

    my $verbose = $conf->options->get('verbose');
    my $gcc = $conf->data->get('gccversion');

    # whenn running on gcc, we just define the config item
    if (defined $gcc) {
	# HAS_foo defines PARROT_HAS_`uc foo`
	$conf->data->set(
	    "HAS_I386_GCC_CMPXCHG" => '1',
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

# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Configure::RunSteps - Configuration Steps

=head1 DESCRIPTION

This module lists, in order, the configuration steps that will be run by
F<Configure.pl>. It should be edited when adding a new step. For more
information on Parrot's configuration system, and how to add new steps,
see F<docs/configuration.pod>.

=head2 Functions

=over 4

=cut

package Parrot::Configure::RunSteps;

use strict;
use vars qw(@steps);

# EDIT HERE TO ADD NEW TESTS
@steps=qw(
    init/manifest.pl
    init/data.pl
    init/miniparrot.pl
    init/hints.pl
    init/headers.pl
    inter/progs.pl
    auto/gcc.pl
    init/optimize.pl
    inter/charset.pl
    inter/encoding.pl
    inter/types.pl
    inter/ops.pl
    inter/exp.pl
    inter/pmc.pl
    auto/alignptrs.pl
    auto/headers.pl
    auto/sizes.pl
    auto/byteorder.pl
    auto/pack.pl
    auto/format.pl
    auto/isreg.pl
    auto/jit.pl
    gen/cpu.pl
    auto/funcptr.pl
    auto/cgoto.pl
    auto/inline.pl
    auto/gc.pl
    auto/memalign.pl
    auto/signal.pl
    auto/env.pl
    auto/aio.pl
    auto/gmp.pl
    auto/snprintf.pl
    gen/icu.pl
    gen/config_h.pl
    gen/core_pmcs.pl
    gen/parrot_include.pl
    gen/makefiles.pl
    gen/platform.pl
    gen/config_pm.pl
);

=item C<runsteps()>

Loops over the configuration steps, running each one in turn.

=cut

sub runsteps {
    shift;
    my %args=@_;

    local $SIG{__WARN__} = sub {
        warn $_[0] unless $_[0] =~ /^Subroutine runstep redefined at config/
    };

    my $verbose = $args{verbose};
    my $n = 0;

    for(@steps) {

        die "No config/$_" unless -e "config/$_";
        require "config/$_";
        print "\n$Configure::Step::description";
        print '.' x (70-length $Configure::Step::description);
	++$n;
	if ($args{'verbose-step'}) {
	    if ($args{'verbose-step'} =~ /^\d+$/ &&
		    $n == $args{'verbose-step'}) {
		$args{verbose} = 2;
	    }
	    elsif ($Configure::Step::description =~ /$args{'verbose-step'}/) {
		$args{verbose} = 2;
	    }
	}
	# cc_build uses this verbose setting
	Configure::Data->set('verbose' => $args{verbose}) if $n > 2;

        print "\n" if $args{verbose} && $args{verbose} == 2;

        $Configure::Step::result='done';


        {
            local $_;
            Configure::Step::runstep(@args{@Configure::Step::args});
        }

        print "..." if $args{verbose} && $args{verbose} == 2;
        print "$Configure::Step::result." unless m{^inter/} && $args{ask};

	$args{verbose} = $verbose;
    }
}

=back

=head1 SEE ALSO

=over 4

=item C<Parrot::Configure::Step>

=item F<docs/configuration.pod>

=back

=cut

1;

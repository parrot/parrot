# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/gmp.pl - Test for GNU MP (GMP) Math library

=head1 DESCRIPTION

Determines whether the platform supports GMP.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto';

$description="Determining if your platform supports GMP...";

@args=qw(verbose);

sub runstep {
    my $test;
    my ($verbose) = @_;
    my $libs = Configure::Data->get('libs');
    Configure::Data->add(' ', 'libs', '-lgmp');

    cc_gen('config/auto/gmp/gmp.in');
    eval { cc_build(); };
    if (! $@) {
	$test = cc_run();
	if ($test eq "499999500000\n") {
	    print " (yes) " if $verbose;

	    Configure::Data->set(
		gmp => 'define',
		HAS_GMP => 1,
	    );
	}

    }
    else {
	Configure::Data->set('libs', $libs);
	print " (no) " if $verbose;
    }
}


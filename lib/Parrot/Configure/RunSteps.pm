package Parrot::Configure::RunSteps;

use strict;
use vars qw(@steps);

# EDIT HERE TO ADD NEW TESTS
@steps=qw(
	init/manifest.pl
	init/data.pl
	init/miniparrot.pl
	init/hints.pl
	inter/progs.pl
	inter/types.pl
	inter/ops.pl
	inter/exp.pl
	inter/pmc.pl
	auto/headers.pl
	auto/sizes.pl
	auto/byteorder.pl
	auto/pack.pl
	auto/format.pl
	auto/gcc.pl
	auto/jit.pl
	auto/funcptr.pl
	auto/cgoto.pl
	auto/alignptrs.pl
	gen/config_h.pl
	gen/config_pm.pl
	gen/makefiles.pl
	gen/platform.pl
);

sub runsteps {
	shift;
	my %args=@_;

	local $SIG{__WARN__} = sub {
		warn $_[0] unless $_[0] =~ /^Subroutine runstep redefined at config/
	};

	for(@steps) {
                #print "$_\n";
		die "No config/$_" unless -e "config/$_";
		require "config/$_";
		print "\n$Configure::Step::description";

		{
			local $_;
			Configure::Step::runstep(@args{@Configure::Step::args});
		}

		print "done." unless m{^inter/} && $args{ask};
	}	
}

1;

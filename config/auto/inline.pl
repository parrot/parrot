package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto';

$description="Determining if your compiler supports inline...";

@args=qw(inline);

sub runstep {
    my $test;
    my ($inline) = @_;

    if (defined $inline) {
	$test = $inline;
    }
    else {
	cc_gen('config/auto/inline/test_1.in');
	eval { cc_build(); };
	if (! $@) {
	    $test = cc_run();
	    chomp $test if $test;
	}
	cc_clean();
	if (!$test) {
	    cc_gen('config/auto/inline/test_2.in');
	    eval { cc_build(); };
	    if (! $@) {
		$test = cc_run();
		chomp $test if $test;
	    }
	    cc_clean();
	}
	if ($test) {
	    print " ($test) ";
	}
	else {
	    print " no ";
	    $test = '';
	}
    }

    Configure::Data->set(
	inline => $test
    );
}

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto';

$description="Determining if your C library has a working S_ISREG...";

sub runstep {
    my $test = 0;

    cc_gen('config/auto/isreg/test_c.in');
    eval { cc_build(); };
    unless ($@ || cc_run() !~ /ok/) {
	$test = 1;
    }
    cc_clean();

    Configure::Data->set(
	isreg  => $test
    );
    print $test ? " (Yep) " : " (no) "
}

1;

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto';

$description="Determining if your C library supports memalign...";

sub runstep {
    my $test = 0;

    cc_gen('config/auto/memalign/test_c.in');
    eval { cc_build(); };
    unless ($@ || cc_run() !~ /ok/) {
	$test = 1;
    }
    cc_clean();

    Configure::Data->set(
	memalign          => $test
    );
    print $test ? " (Yep) " : " (no) "
}

1;

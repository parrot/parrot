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

    my $test2 = 0;

    cc_gen('config/auto/memalign/test_c2.in');
    eval { cc_build(); };
    unless ($@ || cc_run() !~ /ok/) {
	$test2 = 1;
    }
    cc_clean();

    my $f;
    Configure::Data->set(
	memalign          => ($f = $test2 ? 'posix_memalign' :
			     $test ?  'memalign' :
			     undef)
    );
    print $test ? " (Yep:$f) " : " (no) "
}

1;

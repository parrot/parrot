package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto';

$description="Determining if your C library has setenv / unsetenv...";

sub runstep {
    my ($setenv, $unsetenv) = (0, 0);

    if ($^O eq 'Win32') {
	$setenv = 1;
	$unsetenv = 1;
    }
    else {
	cc_gen('config/auto/env/test_setenv.in');
	eval { cc_build(); };
	unless ($@ || cc_run() !~ /ok/) {
	    $setenv = 1;
	}
	cc_clean();
	cc_gen('config/auto/env/test_unsetenv.in');
	eval { cc_build(); };
	unless ($@ || cc_run() !~ /ok/) {
	    $unsetenv = 1;
	}
	cc_clean();
    }

    Configure::Data->set(
	setenv => $setenv,
	unsetenv => $unsetenv
    );

    if ($setenv && $unsetenv) {
	print " (both) ";
    }
    elsif ($setenv) {
	print " (setenv) ";
    }
    elsif ($unsetenv) {
	print " (unsetenv) ";
    }
    else {
	print " (no) ";
    }
}

1;

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;

$description="Checking for --miniparrot...";

@args=qw(miniparrot);

sub runstep {
    return unless defined $_[0];

    print "Yes..";
    Configure::Data->set(
        ccflags => '-DMINIPARROT'
    );
}

1;

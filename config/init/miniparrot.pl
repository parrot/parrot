package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;

$description="Checking for --miniparrot...";

@args=qw(miniparrot);

sub runstep {
    return unless defined $_[0];

    print "Yes..";
    
    Configure::Data->set('miniparrot' => 1);
    Configure::Data->set('DEVEL' => Configure::Data->get('DEVEL') . '-miniparrot');
}

1;

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;

$description="Tweaking ccflags...";

@args=qw(miniparrot);

sub runstep {
    my ($miniparrot) = @_;
    
    return unless defined $miniparrot;

    my $ccflags = Configure::Data->get('ccflags') || '';
    Configure::Data->set(
        ccflags => $ccflags . ' -DMINIPARROT '
    );
}

1;

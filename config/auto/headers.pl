package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;
use Config;

$description="Probing for C headers...";

@args=qw(miniparrot);

sub runstep {
    my ($miniparrot) = @_;

    if ($miniparrot) {
        foreach (qw(assert complex ctyle errno locale math setjmp signal stdarg
                    stdio stdlib string time)) {
            Configure::Data->set("i_$_" => 1);
        }
	return;
    }

    for (keys %Config) {
	next unless /^i_/;
	Configure::Data->set($_, $Config{$_});
    }
}

1;

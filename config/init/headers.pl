package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;

$description="Determinig nongenerated header files...";

@args=();

sub runstep {
    my $inc = 'include/parrot';
    
    my @headers=(
        sort
        map  { m{\./$inc/(.*)} }
        glob "./$inc/*.h"
    );
    
    $_ = "\$(INC)/$_" for @headers;
    my $nongen_headers = join("\\\n	", @headers);
    
    Configure::Data->set(
        inc            => $inc,
        nongen_headers => $nongen_headers,
    );
}

1;
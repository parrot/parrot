package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;
use ExtUtils::Manifest qw(maniread);

$description="Determining nongenerated header files...";

@args=();

sub runstep {
    my $inc = 'include/parrot';

    my @headers=(
	sort
	map  { m{^$inc/(.*\.h)\z} }
	keys %{maniread()}
    );

    $_ = "\$(INC)/$_" for @headers;
    my $nongen_headers = join("\\\n	", @headers);

    Configure::Data->set(
	inc            => $inc,
	nongen_headers => $nongen_headers,
    );
}

1;

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step qw(copy_if_diff);

$description="Moving platform files into place...";

@args=qw(miniparrot);

sub runstep {
  my $platform=lc $^O;
  $platform =~ s/^ms//;

  $platform="ansi" if defined($_[0]);
  $platform="generic" unless -e "config/gen/platform/$platform.c";

  copy_if_diff("config/gen/platform/$platform.c", "src/platform.c");
  copy_if_diff("config/gen/platform/$platform.h", "include/parrot/platform.h");
  copy_if_diff("config/gen/platform/platform_interface.h",
		  "include/parrot/platform_interface.h");
}

1;

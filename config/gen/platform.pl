package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;
use File::Copy 'copy';

$description="Moving platform files into place...";

@args=();

sub runstep {
  my $platform=lc $^O;
  $platform =~ s/^ms//;

  $platform="generic" unless -e "config/gen/platform/$platform.c";
  
  copy("config/gen/platform/$platform.c", "platform.c");
  copy("config/gen/platform/$platform.h", "include/parrot/platform.h");
  
  my $now=time;
  utime $now, $now, "platform.c", "include/parrot/platform.h";
}

1;
package Configure::Step;

use strict;
use vars qw($description @args);

$description="Configuring ICU ...";

@args=qw(buildicu);

sub runstep {
  my ($buildicu) = @_;

  unless ($buildicu) {
    print " [Skipped] ";
    return;
  }

  print "\n";
  # This is the configure line suggested by icu/README.parrot
  system "cd icu/source ; ./configure --disable-layout --disable-tests --disable-samples";
  if ($? != 0) {
    print " [Failed] ";
    return;
  }

  Configure::Data->set(
    buildicu => 1,
    icu_make => <<'RULES',
###############################################################################
#
# Build ICU:
#
###############################################################################

icu : icu.dummy

icu.dummy :
	$(MAKE_C) icu/source

icu.clean :
	$(MAKE_C) icu/source clean

all : icu

clean : icu.clean

RULES
   );
}

1;

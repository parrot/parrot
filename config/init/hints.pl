# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/init/hints.pl - Platform Hints

=head1 DESCRIPTION

Loads the platform and local hints files, modifying the defaults set up
in F<config/init/data.pl>.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;

$description="Loading platform and local hints files...";

@args = qw( cc verbose define );

sub runstep {
  my $hints = "config/init/hints/" . lc($^O) . ".pl";
  my $hints_used = 0;
  print "[ " if $_[1];
  if(-e $hints) {
    print "$hints " if $_[1];
    do $hints;
    die $@ if $@;
    $hints_used++;
  }
  $hints = "config/init/hints/local.pl";
  if(-e $hints) {
    print "$hints " if $_[1];
    do $hints;
    die $@ if $@;
    $hints_used++;
  }
  if ($hints_used == 0) {
    print "(no hints) " if $_[1];
  }
  print "]" if $_[1];
}

1;

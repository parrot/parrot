#! perl -w
# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/gen/cpu.pl - CPU specific Files

=head1 DESCRIPTION

Runs C<&run_cpu()> in F<config/gen/cpu/${cpuarch}/auto.pl> if it exists.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step qw(copy_if_diff);
use Carp;

$description="Running CPU specific stuff...";

@args=qw(miniparrot verbose);

sub runstep {
  my ($miniparrot, $verbose) = @_;
  return if $miniparrot;

  my $cpu = Configure::Data->get('cpuarch');
  print "\t(cpu = '$cpu') " if $verbose;
  my $f;
  if (-d "config/gen/cpu/$cpu" && -e ($f = "config/gen/cpu/$cpu/auto.pl")) {
    require $f;
    &run_cpu($verbose);
  }
}


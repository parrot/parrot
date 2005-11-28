# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/gen/cpu.pm - CPU specific Files

=head1 DESCRIPTION

Runs C<&run_cpu()> in F<config/gen/cpu/${cpuarch}/auto.pm> if it exists.

=cut

package Configure::Step;

use strict;
use vars qw($description $result @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step qw(copy_if_diff);
use Carp;

$description="Running CPU specific stuff...";

@args=qw(miniparrot verbose);

sub runstep {
    my $self = shift;
  my ($miniparrot, $verbose) = @_;
  return if $miniparrot;

  my $cpu = Parrot::Configure::Data->get('cpuarch');
  print "\t(cpu = '$cpu') " if $verbose;
  my $f;
  if (-d "config/gen/cpu/$cpu" && -e ($f = "config/gen/cpu/$cpu/auto.pm")) {
    require $f;
    &run_cpu($verbose);
  }
}


# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/alignptrs.pl - Pointer Alignment

=head1 DESCRIPTION

Determines the minimum pointer alignment.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto';

$description="Determining your minimum pointer alignment...";

@args=qw(miniparrot verbose);

sub runstep {
  my ($miniparrot) = @_;

  if ($miniparrot) {
     # we can't guarantee anything about pointer alignment under ANSI C89.
     # so we will have to check every byte.
     Configure::Data->set(ptr_alignment => 1);
     return;
  }
  # HP-UX 10.20/32 hangs in this test.
  # We currently don't need this configure setting,
  # so we just do not test and set some value here
  print(" not tested (4) ") if $_[1];
  Configure::Data->set(ptr_alignment => 4);
  return;

  return if (defined(Configure::Data->get('ptr_alignment')));
  cc_gen('config/auto/alignptrs/test_c.in');
  cc_build();

  my $align = 999999;

  for my $try_align (64, 32, 16, 8, 4, 2, 1) {
      my $results=cc_run_capture($try_align);
      if ($results =~ /OK/ && $results !~ /align/i) {
        $align = $try_align;
      }
  }

  cc_clean();

  if ($align == 999999) {
    die "Can't determine alignment!\n";
  }

  Configure::Data->set(ptr_alignment => $align);
}

1;

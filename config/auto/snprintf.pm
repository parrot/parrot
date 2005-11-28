# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/snprintf.pm - Test for snprintf

=head1 DESCRIPTION

Tests if snprintf is present and if it's C99 compliant.

=cut

package Configure::Step;

use strict;
use vars qw($description $result @args);

use base qw(Parrot::Configure::Step::Base);


$description = "Testing snprintf ...";

@args = qw(verbose);

sub runstep {
    my $self = shift;
  my ($verbose) = @_;
  cc_gen('config/auto/snprintf/test.in');
  cc_build();
  my $res = cc_run() or die "Can't run the snprintf testing program: $!";
  cc_clean();

  if ($res =~ /snprintf/) {
    Parrot::Configure::Data->set(
      HAS_SNPRINTF => 1,
    );
  }
  if ($res =~ /^C99 snprintf/) {
    Parrot::Configure::Data->set(
      HAS_C99_SNPRINTF => 1,
    );
  }
  elsif ($res =~ /^old snprintf/) {
    Parrot::Configure::Data->set(
      HAS_OLD_SNPRINTF => 1,
    );
  }
  print " ($res) " if $verbose;
}

1;

# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/init/optimize.pl - Optimization

=head1 DESCRIPTION

Enables optimization by adding the appropriate flags for the local
platform to the C<CCFLAGS>.
Should this be part of config/inter/progs.pl ? XXX

=cut

package Configure::Step;

use strict;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step;

$description="Enabling optimization...";

@args=qw(verbose optimize);

sub runstep {
    my $self = shift;
  my ($verbose, $optimize) = @_;
  if (Parrot::Configure::Data->get('optimize')) {
    my($ccflags, $optimize) =
      Parrot::Configure::Data->get(qw(ccflags optimize));
    $ccflags .= " $optimize -DDISABLE_GC_DEBUG=1 -DNDEBUG";

    Parrot::Configure::Data->set(
                         ccflags => $ccflags,
                        );
  }
  else {
    print "(none requested) " if $verbose;
  }
}

1;

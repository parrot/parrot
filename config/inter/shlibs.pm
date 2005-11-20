# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id: cc_shared.pl $

=head1 NAME

config/inter/shlibs.pl - Flags for shared libraries.

=head1 DESCRIPTION

Asks the user which flags are needed for compiling position-independent
code for use in shared libraries.  Eventually, other
shared-library-related prompts may end up here.

This is a separate unit from config/inter/progs.pl because the answers
depend on which compiler is in use.  Thus it should come after the
gccversion test.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':inter';

$description = 'Determining flags for building shared libraries...';

@args = qw(ask verbose cc_shared);

sub runstep {
  my ($ask, $verbose, $cc_shared) = @_;
    $cc_shared = integrate(Parrot::Configure::Data->get('cc_shared'), $cc_shared);
    $cc_shared=prompt(
	"\nWhat flags instruct your compiler to compile code suitable for use in a shared library?",
	$cc_shared) if $ask;
    Parrot::Configure::Data->set(cc_shared =>  $cc_shared);
    $Configure::Step::result =
        ( $cc_shared =~ m/^ ?$/ ) ? 'done' : $cc_shared;
}
1;

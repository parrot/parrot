#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/gen/cflags.pl - CFLAGS File

=head1 DESCRIPTION

Generates the F<CFLAGS> file. This provides a way to add or remove
options on a per-C-file basis.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':gen';

$description="Generating CFLAGS...";

@args=();

sub runstep {
  genfile('config/gen/cflags/root.in',      'CFLAGS',
          commentType => '#');

  open(CFLAGS, ">> CFLAGS") or die "open >> CFLAGS: $!";

  if (Configure::Data->get('cpuarch') =~ /sun4|sparc64/) {
      print CFLAGS <<"EOF";
jit_cpu.c -{-Wcast-align}        # lots of noise!
nci.c     -{-Wstrict-prototypes} # lots of noise!
EOF
  }

  close CFLAGS
}

1;

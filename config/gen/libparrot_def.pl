#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/gen/file.pl - Parrot Library Interface Definition File

=head1 DESCRIPTION

Generates F<libparrot_def.def>.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':gen';

$description="Generating libparrot.def...";

@args=();

sub runstep {
  genfile('config/gen/libparrot_def/libparrot_def.in', 'libparrot.def');
}

1;

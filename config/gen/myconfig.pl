#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/gen/myconfig.pl - Recording Configuration

=head1 DESCRIPTION

Records the current configuration in the F<myconfig> file.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':gen';

$description="Recording this configuration in myconfig...";

@args=();

sub runstep {
  genfile('config/gen/myconfig/myconfig.in',      'myconfig');
}

1;

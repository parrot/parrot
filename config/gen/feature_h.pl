#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/gen/feature_h.pl - Feature Header

=head1 DESCRIPTION

Generates F<include/parrot/feature.h> containing some architecture
specific defines.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':gen';

$description="Generating feature.h...";

@args=();

sub runstep {
  genfile('config/gen/feature_h/feature_h.in', 'include/parrot/feature.h',
          commentType => '/*',
          ignorePattern => 'PARROT_CONFIG_DATE',
  	  feature_file => 1);

}

1;

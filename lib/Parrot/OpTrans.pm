#
# OpTrans.pm
#
# $Id$
#

use strict;
#use warnings;

package Parrot::OpTrans;

sub new    { return bless { }, shift; }
sub prefix { return 'Parrot_'; }
sub suffix { return ''; }

1;


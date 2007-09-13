package Regex::Ops;

# Copyright (C) 2002-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use vars qw(%MARKERS);

sub mark {
    my $name = shift || '';
    my $number = ++$MARKERS{$name};
    $number = '' if ( $number == 1 ) && ( $name ne '' );
    return bless( [ 'label', "\@$name$number" ], 'asm_op' );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

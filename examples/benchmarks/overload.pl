#! perl
package Foo;

# Copyright (C) 2004-2007, Parrot Foundation.
# $Id$

use strict;
use warnings;

use overload '*' => \&my_mul, 'fallback' => 1;

sub new {
    my ( $class, $val ) = @_;
    return bless \$val, $class;
}

sub my_mul {
    return ${ $_[0] } * ${ $_[1] };
}

1;

package main;
my $a = Foo->new(7);
my $b = Foo->new(6);
my $r;
for my $i ( 1 .. 50_000 ) { $r = $a * $b }
print "$r\n";

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

#! perl -w
use strict;

my $o = new Foo();
for my $i (1 .. 500000) {
	my $x = $o->[0];
	my $y = $o->[1];
}
print $o->[0], "\n";

package Foo;

sub new {
    my $self = ref $_[0] ? ref shift : shift;
    return bless [ 10, 20 ], $self;
}

1;

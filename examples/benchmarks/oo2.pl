#! perl -w
use strict;

for my $i (1 .. 500000) {
	my $o = new Foo();
}
my $o = new Foo();
print $o->[0], "\n";

package Foo;

sub new {
    my $self = ref $_[0] ? ref shift : shift;
    return bless [ 10, 20 ], $self;
}
1;

#! perl -w
use strict;

my $o = new Foo();
for my $i (1 .. 500000) {
	my $x = $o->i;
	my $y = $o->j;
}
print $o->i, "\n";

package Foo;

sub new {
    my $self = ref $_[0] ? ref shift : shift;
    return bless [ 10, 20 ], $self;
}

sub i {
    my $self = shift;
    if (@_) { $self->[0] = shift } else { $self->[0] }
}

sub j {
    my $self = shift;
    if (@_) { $self->[1] = shift } else { $self->[1] }
}

1;

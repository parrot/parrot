#! perl -w
package Foo;
use strict;

use overload '*' => \&my_mul, 'fallback' => 1;

sub new {
    my ($class, $val) = @_;
    bless \$val, $class;
}
sub my_mul {
    ${$_[0]} * ${$_[1]};
}

1;

package main;
my $a = Foo->new(7);
my $b = Foo->new(6);
my $r;
for my $i (1..500_000) { $r = $a * $b }
print "$r\n";

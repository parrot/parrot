#!perl
use strict;
use P6C::TestCompiler tests => 5;
use Test::More qw(skip);

##############################
output_is(<<'CODE', <<'OUT', 'Hyper 1');
sub parray(@y) {
    print1('(' ~ @y[0] ~ ', ' ~ @y[1] ~ ')');
}
sub main() {
    my @a = (1,2);
    my @x = (3,4);
    my @b = (5,6);
    my $i = 2;
    parray @a >>*<< @x >>+<< @b;
    parray $i >>*<< @x >>+<< @b;
    parray @a  * @x >>+<< @b;
    parray 2 * 3 >>+<< @b;
#    print1(@a >>*<< @x  + @b); # Array math not in 0.0.7
# IMCC clobbers too many registers with this:
#     @y = @a >><<<< @a;
#     print1('(' ~ @y[0] ~ ', ' ~ @y[1] ~ ')');
}
CODE
(8, 14)
(11, 14)
(9, 10)
(11, 12)
OUT

##############################
output_is(<<'CODE', <<'OUT', 'Hyper 2');
sub main() {
    my $a = 2.1;
    my @x = 1..1000;
    my @b = 1001..2000;
    my @c = $a >>*<< @x >>+<< @b;
    print1(@c[0]);
    print1(@c[9]);
    print1(@c[99]);
    print1(@c[999]);
}
CODE
1003.100000
1031
1310
4100
OUT

##############################
output_is(<<'CODE', <<'OUT', 'Hyper 3');
sub parray(@y) {
    print1('(' ~ @y[0] ~ ', ' ~ @y[1] ~ ', ' ~ @y[2] ~ ')');
}

sub main() {
    my @a = (0,0,1);
    my @b = (1,0,1);
    my @c = @a && @b;
    parray(@c);
    @c = @a || @b;
    parray(@c);
    @c = @a >>&&<< @b;
    parray(@c);
    @c = @a >>||<< @b;
    parray(@c);
    @c = @a >>^^<< @b;
    parray(@c);
}
CODE
(1, 0, 1)
(0, 0, 1)
(, , 1)
(1, 0, 1)
(1, 0, 0)
OUT

##############################
output_is(<<'CODE', <<'OUT', 'Hyper 4');
sub main () {
    my @a = (1..3);
    my @b = (4..9);
    my @c = @a >>+<< @b;
    print @c >>~<< ' ',"x\n";
    @c = @b >>+<< @a;
    print @c >>~<< ' ',"x\n";
    @b = @b >>+<< @a;
    print @b >>~<< ' ',"x\n";
    @b = (4..9);
    @b >>+=<< @a;
    print @b >>~<< ' ',"x\n";
    @b = (4..9);
    @a >>+=<< @b;
    print @a >>~<< ' ',"x\n";
}
CODE
5 7 9 7 8 9 x
5 7 9 7 8 9 x
5 7 9 7 8 9 x
5 7 9 7 8 9 x
5 7 9 7 8 9 x
OUT

##############################
output_like(<<'CODE', <<'OUT', 'Hyper Assign');
my @a = 2..4;
my @b = 5..6;
my @c;
@c = @a;
@c >>+=<< @b;
print @c >>~<< ' ',"x\n";
@c = @b;
@c >>+=<< @a;
print @c >>~<< ' ',"x\n";

@c = @a;
@c >>*=<< @b;
print @c >>~<< ' ',"x\n";

@c = @a;
@c >>**=<< @b;
print @c >>~<< ' ',"x\n";

@c = @a;
@c >>/=<< @b;
print @c >>~<< ' ',"x\n";

@c = @b;
@c >>%=<< @a;
print @c >>~<< ' ',"x\n";

@c = @b;
@c >>-=<< @a;
print @c >>~<< ' ',"x\n";
CODE
/7 9 4 x
7 9 4 x
10 18 0 x
32 729 1 x
0\.400000 0\.500000 Inf x
1 0 0 x
3 3 -4 x/i
OUT

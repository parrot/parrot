#!perl
use strict;
use P6C::TestCompiler tests => 10;

##############################
output_is(<<'CODE', <<'OUT', "Basic hello.");
sub main() {
    print1("Hello, " _ "world");
}
CODE
Hello, world
OUT

##############################
output_is(<<'CODE', <<'OUT', "Binary math ops");
sub main() {
    print1(2 + 3);
    print1(2 - 3);
    print1(2 * 3);
    print1(6 / 2);
    print1(2 % 3);
    print1(2 _ 3);
    print1(2 ** 3);
}
CODE
5
-1
6
3.000000
2
23
8
OUT

##############################
output_is(<<'CODE', <<'OUT', "Binary bit ops");
sub main() {
    print1(2 << 3);
    print1(32 >> 3);
    print1(32 | 3);
    print1(31 & 3);
    print1(10 ~ 12);		# 1010 ~ 1100 -> 0110 == 6
}
CODE
16
4
35
3
6
OUT

##############################
output_is(<<'CODE', <<'OUT', "Binary logical ops");
sub main() {
    print1(2 || 3);
    print1(0 || 2);
    print1(2 || 0);
    print1(0 || 0);
    print1(2 && 3);
    print1(2 && 0);
    print1(0 && 2);
    print1(0 && 0);
    print1(2 ~~ 3);
    print1(2 ~~ 0);
    print1(0 ~~ 2);
    print1(0 ~~ 0);
    my $x;
    print1($x // 0);
    print1(0  // $x);
    print1($x // $x);
    print1(2  // 3);
}

CODE
2
2
2
0
3
0


0
1
1
0
0
0

2
OUT

##############################
output_is(<<'CODE', <<'OUT', "equality");
sub main() {
    my ($x, $y) = (1, 2);
    my ($a, $b) = ('1', '2');
    unless $a eq $x == $a {
    } elsunless $a ne $b != $x {
    } elsunless $a + $x eq $b == $y {
    } else {
	print1("ok");
    }
}

CODE
ok
OUT

##############################
output_is(<<'CODE', <<'OUT', "gt/lt");
sub main() {
    my ($x, $y, $z, $w) = (1, '2', 21, '122');
    unless $x < $y < $z < $w {
    } elsunless $x lt $w lt $y lt $z {
    } elsunless $w > $z > $y > $x {
    } elsunless $z gt $y gt $w gt $x {
    } elsunless $z gt $w > $z {
    } else {
	print1("ok");
    }
}

CODE
ok
OUT

##############################
output_is(<<'CODE', <<'OUT', 'Ternary');
sub main() {
    my ($x, $y, $z) = (1,2,3);
    my ($a, $b);
    $a = ($x ?? $b :: $y) = $y + 3;
    print1(0 ?? "bad" :: "ok");
    print1(1 ?? "ok" :: "bad");
    print1($a);
    print1($b);
    print1($y);
    print1($x ?? $b - $a ?? "bad" :: "ok" :: "foo");
}
CODE
ok
ok
5
5
2
ok
OUT

##############################
output_is(<<'CODE', <<'OUT', 'Hyper 1');
sub parray(@y) {
    print1('(' _ @y[0] _ ', ' _ @y[1] _ ')');
}
sub main() {
    my @a = (1,2);
    my @x = (3,4);
    my @b = (5,6);
    my $i = 2;
    parray @a ^* @x ^+ @b;
    parray $i ^* @x ^+ @b;
    parray @a  * @x ^+ @b;
    parray 2 * 3 ^+ @b;
#    print1(@a ^* @x  + @b); # Array math not in 0.0.7
# IMCC clobbers too many registers with this:
#     @y = @a ^<< @a;
#     print1('(' _ @y[0] _ ', ' _ @y[1] _ ')');
}
CODE
(8.000000, 14.000000)
(11.000000, 14.000000)
(9.000000, 10.000000)
(11.000000, 12.000000)
OUT

##############################
output_is(<<'CODE', <<'OUT', 'Hyper 2');
sub main() {
    my $a = 2.1;
    my @x = 1..1000;
    my @b = 1001..2000;
    my @c = $a ^* @x ^+ @b;
    print1(@c[0]);
    print1(@c[9]);
    print1(@c[99]);
    print1(@c[999]);
}
CODE
1003.100000
1031.000000
1310.000000
4100.000000
OUT

##############################
output_is(<<'CODE', <<'OUT', 'Hyper 3');
sub parray(@y) {
    print1('(' _ @y[0] _ ', ' _ @y[1] _ ', ' _ @y[2] _ ')');
}

sub main() {
    my @a = (0,0,1);
    my @b = (1,0,1);
    my @c = @a && @b;
    parray(@c);
    @c = @a || @b;
    parray(@c);
    @c = @a ^&& @b;
    parray(@c);
    @c = @a ^|| @b;
    parray(@c);
    @c = @a ^~~ @b;
    parray(@c);
}
CODE
(1, 0, 1)
(0, 0, 1)
(, , 1)
(1, 0, 1)
(1, 0, 0)
OUT


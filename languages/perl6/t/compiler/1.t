#!perl
use strict;
use P6C::TestCompiler tests => 15;
use Test::More qw(skip);

##############################
output_is(<<'CODE', <<'OUT', "Basic hello.");
sub main() {
    print1("Hello, " _ "world");
}
CODE
Hello, world
OUT

##############################
output_is(<<'CODE', <<'OUT', "Unary '+', posification");
print( 0, "\n" );
print( -0, "\n" );
print( +0, "\n" );
print( 1, "\n" );
print( +2, "\n" );
print( -3, "\n" );
CODE
0
0
0
1
2
-3
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
    print1(2 ** 3 ** 1);
    print1(2 ** 1 ** 3);
    print1(2 ** -1 ** 3);
}
CODE
5
-1
6
3.000000
2
23
8.000000
8.000000
2.000000
0.500000
OUT

##############################
output_is(<<'CODE', <<'OUT', "Prae & post incr 1");
sub main() {
    my $x = 2;
    print1 "ok 1" if ($x++ == 2);
    print1 "ok 2" if ($x == 3);
    print1 "ok 3" if (--$x == 2);
    my $y = $x++;
    print1 "ok 4" if ($x == 3 && $y == 2);
    print1 ("ok "_ ($x++ + $y++));
    print1 "ok 6" if ($x == 4 && $y == 3);
}
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUT

##############################
output_is(<<'CODE', <<'OUT', "Prae & post incr 2");
sub main() {
    my $x = 2;
    my $y = $x;
    my @z = ($x, $y);
    # actually above statement makes next fail -lt
    print1 (++$x _ ' ' _ $y);
    $x--;
    print ++$x _ ' ' _ $y _ "\n";
    print $x++ _ ' ' _ $y _ "\n";
    print $x _ ' ' _ $y++ _ "\n";
    print $x _ ' ' _ ++$y _ "\n";
    print @z[0]++ _ ' ' _ ++@z[1] _ "\n";
    print $x _ ' ' _ $y _ "\n";
    print @z[0] _ ' ' _ @z[1] _ "\n";
}
CODE
3 2
3 2
3 2
4 2
4 4
2 3
4 4
3 3
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

##############################
output_is(<<'CODE', <<'OUT', 'Hyper 4');
sub main () {
    my @a = (1..3);
    my @b = (4..9);
    my @c = @a ^+ @b;
    print @c ^_ ' ',"\n";
    @c = @b ^+ @a;
    print @c ^_ ' ',"\n";
    @b = @b ^+ @a;
    print @b ^_ ' ',"\n";
    @b = (4..9);
    @b ^+= @a;
    print @b ^_ ' ',"\n";
    @b = (4..9);
    @a ^+= @b;
    print @a ^_ ' ',"\n";
}
CODE
5.000000 7.000000 9.000000 7.000000 8.000000 9.000000 
5.000000 7.000000 9.000000 7.000000 8.000000 9.000000 
5.000000 7.000000 9.000000 7.000000 8.000000 9.000000 
5.000000 7.000000 9.000000 7.000000 8.000000 9.000000 
5.000000 7.000000 9.000000 7.000000 8.000000 9.000000 
OUT

##############################
output_is(<<'CODE', <<'OUT', 'Hyper Assign');
my @a = 2..4;
my @b = 5..6;
my @c;
@c = @a;
@c ^+= @b;
print @c ^_ ' ',"\n";
@c = @b;
@c ^+= @a;
print @c ^_ ' ',"\n";

@c = @a;
@c ^*= @b;
print @c ^_ ' ',"\n";

@c = @a;
@c ^**= @b;
print @c ^_ ' ',"\n";

@c = @a;
@c ^/= @b;
print @c ^_ ' ',"\n";

@c = @b;
@c ^%= @a;
print @c ^_ ' ',"\n";

@c = @b;
@c ^-= @a;
print @c ^_ ' ',"\n";
CODE
7.000000 9.000000 4.000000 
7.000000 9.000000 4.000000 
10.000000 18.000000 0.000000 
32.000000 729.000000 1.000000 
0.400000 0.500000 Inf 
1.000000 0.000000 0.000000 
3.000000 3.000000 -4.000000 
OUT

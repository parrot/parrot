#!perl
use strict;
use P6C::TestCompiler tests => 12;
use Test::More qw(skip);

##############################
output_is(<<'CODE', <<'OUT', "Basic hello.");
sub main() {
    print1("Hello, " ~ "world");
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
    print1(2 ~ 3);
    print1(2 ** 3);
    print1(2 ** 3 ** 1);
    print1(2 ** 1 ** 3);
    print1(2 ** -1 ** 3);
}
CODE
5
-1
6
3
2
23
8
8
2
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
    print1 ("ok "~ ($x++ + $y++));
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
    print1 (++$x ~ ' ' ~ $y);
    $x--;
    print ++$x ~ ' ' ~ $y ~ "\n";
    print $x++ ~ ' ' ~ $y ~ "\n";
    print $x ~ ' ' ~ $y++ ~ "\n";
    print $x ~ ' ' ~ ++$y ~ "\n";
    print @z[0]++ ~ ' ' ~ ++@z[1] ~ "\n";
    print $x ~ ' ' ~ $y ~ "\n";
    print @z[0] ~ ' ' ~ @z[1] ~ "\n";
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
    print1(32 +| 3);
    print1(31 +& 3);
    print1(10 +^ 12);		# 1010 +^ 1100 -> 0110 == 6
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
    print1(2 ^^ 3);
    print1(2 ^^ 0);
    print1(0 ^^ 2);
    print1(0 ^^ 0);
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
2
2
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
output_is(<<'CODE', <<'OUT', "elsunless");
sub main() {
    if 2 > 1 {
	print1("ok")
    } else {
	print1("not ok")
    }
    unless 1 > 2 {
	print1("ok")
    } else {
	print1("not ok")
    }
    unless 2 > 1 {
	print1("not ok")
    } elsunless 3 > 2 {
	print1("not ok")
    } elsif "yep" {
	print1("ok")
    } else {
	print1("not ok")
    }
}

CODE
ok
ok
ok
OUT

##############################
output_is(<<'CODE', <<'OUT', 'Nested Scopes');
sub main() {
    my $a = 3;
    if 1 {
	my $a = 4;
	if 2 { my $a = 5; print1("a is " ~ $a) }
	print1("a is " ~ $a);
    }
    print1("a is " ~ $a);
    if 1 {
	my $a = 5;
	print1("a is " ~ $a);
    }
    print1("a is " ~ $a);
    if 1 {
	$a = 6;
    }
    print1("a is " ~ $a);
}
CODE
a is 5
a is 4
a is 3
a is 5
a is 3
a is 6
OUT

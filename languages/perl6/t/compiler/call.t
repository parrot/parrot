#!perl
use strict;
use P6C::TestCompiler tests => 21;
use Test::More;

##############################
output_is(<<'CODE', <<'OUT', "call - no args, proto def, proto call");
sub f () { print "hello\n" }
f();
CODE
hello
OUT

##############################
output_is(<<'CODE', <<'OUT', "call - no args, unproto def, proto call");
sub f { print "hello\n" }
f();
CODE
hello
OUT

##############################
output_is(<<'CODE', <<'OUT', "call - no args, proto def, unproto call");
f(); # Should be *f()
sub f () { print "hello\n" }
CODE
hello
OUT

##############################
output_is(<<'CODE', <<'OUT', "call - no args, unproto def, unproto call");
f();
sub f { print "hello\n" }
CODE
hello
OUT

##############################
output_is(<<'CODE', <<'OUT', "subroutine call");
sub _fact($tot, $max, $n) {
    if $n > $max {
	print1($max ~ "! = " ~ $tot);
    } else {
	_fact $tot * $n, $max, $n + 1;
    }
}

sub fact($n) {
    unless 0 <= $n < 20 {
	print1("Sorry, can't take " ~ $n ~ " factorial");
    } else {
	_fact 1, $n, 1
    }
}

sub main() {
    fact 12;
    fact -1;
    fact 0;
    fact 24;
}

CODE
12! = 479001600
Sorry, can't take -1 factorial
0! = 1
Sorry, can't take 24 factorial
OUT

##############################
output_is(<<'CODE', <<'OUT', "no args");
sub noargs() {
    print "ok " ~ $i++ ~ "\n";
}

sub main() {
    $i = 1;
    noargs;
    noargs();
}

CODE
ok 1
ok 2
OUT

##############################
output_is(<<'CODE', <<'OUT', "no args - unprototyped");
sub main() {
    $i = 1;
    noargs();
#    $func = &noargs;
#    $func();
}

sub noargs() {
    print "ok " ~ $i++ ~ "\n";
}

CODE
ok 1
OUT

##############################
# This is probably wrong -- I think $c should really get a reference
# to @array, not its length.
output_is(<<'CODE', <<'OUT', "simple untyped args");
sub f($a, @b, $c) {
    print "a=$a\n";
    print "b=@b\n";
    print "c=$c\n";
}

sub main() {
    my @array = (10,20,30,40);
    f(100, @array, @array);
}

CODE
a=100
b=10 20 30 40
c=4
OUT

##############################
output_is(<<'CODE', <<'OUT', "slurpy array");
sub f($a, *@b) {
    print "a=$a\n";
    print "b=@b\n";
}

sub main() {
    my @array = (10,20,30,40);
    f(100, @array, 2, 3);
}

CODE
a=100
b=10 20 30 40 2 3
OUT

##############################
SKIP: {
    skip("cannot flatten arguments yet", 2);
output_is(<<'CODE', <<'OUT', "flattened args");
sub f($a, $b) {
    print "a=$a\n";
    print "b=$b\n";
}

sub main() {
    my @array = (10,20);
    f(*@array);
}

CODE
a=10
b=20
OUT

##############################
output_is(<<'CODE', <<'OUT', "slurped, flattened args");
sub f($a, *@b) {
    print "a=$a\n";
    print "b=@b\n";
}

sub main() {
    my @array = (10,20,30,40);
    f(*@array, 100, 200);
}

CODE
a=10
b=20 30 40 100 200
OUT
} # SKIP

SKIP: {
    skip("default values not implemented", 3);
output_is(<<'CODE', <<'OUT', "only optionals");
sub f(?$a, ?$b) {
    print "f() called\n";
    if (defined($a)) {
        print "a=$a\n";
    }
    if (defined($b)) {
        print "b=$b\n";
    }
}

sub main() {
    f(10,20);
    f(100);
    f();
}

CODE
f() called
a=10
b=20
f() called
a=100
f() called
OUT

output_is(<<'CODE', <<'OUT', "positional + optional");
sub f($a, ?$b) {
    print "f() called\n";
    print "a=$a\n";
    if (defined($b)) {
        print "b=$b\n";
    }
}

sub main() {
    f(10,20);
    f(100);
}

CODE
f() called
a=10
b=20
f() called
a=100
OUT

output_is(<<'CODE', <<'OUT', "positional + optional + slurpy");
sub f($a, ?$b, *@c) {
    print "f() called\n";
    print "a=$a\n";
    if (defined($b)) {
        print "b=$b\n";
    }
    print "c=@c\n";
}

sub main() {
    f(10,20);
    f(100);
    f(10,20,30,40,50);
    my @array = 1..5;
    f(10,20,@array);
    f(10,20,100,@array,200);
}

CODE
f() called
a=10
b=20
c=
f() called
a=100
c=
f() called
a=10
b=20
c=30 40 50
f() called
a=10
b=20
c=1 2 3 4 5
f() called
a=10
b=20
c=100 1 2 3 4 5 200
OUT
} # SKIP

output_is(<<'CODE', <<'OUT', "named only");
sub f(+$a, +$b) {
    print "a=$a\n";
    print "b=$b\n";
}

sub main() {
    f(b => "bee", a => "aye");
}

CODE
a=aye
b=bee
OUT

output_is(<<'CODE', <<'OUT', "named + positional");
sub f($a, +$b) {
    print "a=$a\n";
    print "b=$b\n";
}

sub main() {
    f("aye", b => "bee");
}

CODE
a=aye
b=bee
OUT

output_is(<<'CODE', <<'OUT', "named + positional, called w/names");
sub f($a, +$b) {
    print "a=$a\n";
    print "b=$b\n";
}

sub main() {
    f(a => "aye", b => "bee");
}

CODE
a=aye
b=bee
OUT

##############################
output_is(<<'CODE', <<'OUT', "Argument context");
sub zero() {
    print1('zero');
}

sub one($x) {
    print1('one ' ~$x);
}

sub two($x, $y) {
    print1('two ' ~$x ~' ' ~$y);
}

sub three($x, $y, $z) {
    print1('three ' ~$x ~' ' ~$y ~' ' ~$z);
}

sub main() {
    one 1, one 2;
    two 1, 2, two 3, 4;
    three 1, 2, 3, one 4, two 5, 6;
    zero; zero();
    one 1; one(1);
    my $x = 1.1;
    one $x - 0.1; one($x - 0.1);
}

CODE
one 1
one 2
two 1 2
two 3 4
three 1 2 3
one 4
two 5 6
zero
zero
one 1
one 1
one 1
one 1
OUT

##############################
output_is(<<'CODE', <<'OUT', "Closures 1");
sub main() {
    my $f = { print @_[0,1], "\n"; }
    my @x = (1,2);
    $f(@x);
    $f(3,4);
    $f(5..10);
}
CODE
12
34
56
OUT

##############################
output_is(<<'CODE', <<'OUT', "Closures 2");
sub main() {
    my $f = { print $^b, $^a, "\n"; }
    my @x = (1,2);
    $f(@x);
    $f(3,4);
    $f(5..10);
}
CODE
21
43
65
OUT

##############################
output_is(<<'CODE', <<'OUT', "Closures 3");
sub main() {
    my $f = -> $a, $b { print $b, $a, "\n"; }
    my @x = (1,2);
    $f(@x);
    $f(3,4);
    $f(5..10);
}
CODE
21
43
65
OUT

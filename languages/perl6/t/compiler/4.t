#!perl
use strict;
use P6C::TestCompiler tests => 3;

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
output_is(<<'CODE', <<'OUT', 'Loops and Guards');
sub main() {
    my $i = 3;
    while $i > 0 {
	--$i;
	print1($i);
    }
    until $i > 3 {
	++$i;
	print1($i);
    }
    print1(--$i) until $i == 0;
    print1(++$i) while $i != 3;
    print1("ok") if $i eq '3';
    print1("ok") unless $i ne '3';
}


CODE
2
1
0
1
2
3
4
3
2
1
0
1
2
3
ok
ok
OUT

##############################
output_is(<<'CODE', <<'OUT', 'Nested Scopes');
sub main() {
    my $a = 3;
    if 1 {
	my $a = 4;
	if 2 { my $a = 5; print1("a is " _ $a) }
	print1("a is " _ $a);
    }
    print1("a is " _ $a);
    if 1 {
	my $a = 5;
	print1("a is " _ $a);
    }
    print1("a is " _ $a);
    if 1 {
	$a = 6;
    }
    print1("a is " _ $a);
}
CODE
a is 5
a is 4
a is 3
a is 5
a is 3
a is 6
OUT

#!perl
use strict;
use P6C::TestCompiler tests => 4;

##############################
output_is(<<'CODE', <<'OUT', "loop control: while");
sub main() {
    my $i = 0;
    my $j = 0;
 outer: while 1 {
    inner: while 1 {
	    $i++;
	    last outer if $i == 20;
	    next unless $i % 3;
	    last inner unless $i % 4;
	    print $i, "\n";
	}
	print "outer: ", $i, "\n";
    }
    print "done\n";
}
CODE
1
2
outer: 4
5
7
outer: 8
10
11
13
14
outer: 16
17
19
done
OUT

##############################
output_is(<<'CODE', <<'OUT', "loop control: for");
sub main() {
    my $x = 1;
    for 1..12 {
	next unless $_ % 3;
	print $_, "\n";
	if $_ % 4 == 0 && $x {
	    $x = 0;
	    redo;
	}
	last if $_ == 10;
    }
}
CODE
1
2
4
4
5
7
8
10
OUT

##############################
output_is(<<'CODE', <<'OUT', "loop control: foreach");
sub main() {
    my $x = 1;
    foreach (1..12) {
	next unless $_ % 3;
	print $_, "\n";
	if $_ % 4 == 0 && $x {
	    $x = 0;
	    redo;
	}
	last if $_ == 10;
    }
}
CODE
1
2
4
4
5
7
8
10
OUT

##############################
output_is(<<'CODE', <<'OUT', "loop control: loop");
sub main() {
    my $x = 1;
    loop (my $i = 1; $i < 13; $i++) {
	next unless $i % 3;
	print $i, "\n";
	if $i % 4 == 0 && $x {
	    $x = 0;
	    redo;
	}
	last if $i == 10;
    }
}
CODE
1
2
4
4
5
7
8
10
OUT

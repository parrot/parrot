#!perl

use strict;
#use P6C::TestCompiler skip_all => "store_global";
use P6C::TestCompiler tests => 6;

##############################
output_is(<<'CODE', <<'OUT', "Exceptions 1");
sub main() {
    try {
	print "dying\n";
	die;
	print "foo\n";
    }
    print "alive\n";
    my $x = try { 1 }
    my $y = try {
	die;
	CATCH { default { 2 } }
    }
    print $x ~' ' ~$y, "\n";
}
CODE
dying
alive
1 2
OUT

##############################
output_is(<<'CODE', <<'OUT', "Exceptions 2");
sub main() {
    try {
	print "dying\n";
	die;
	print "foo\n";
    }
    print "alive\n";
    die;
}
CODE
dying
alive
Unknown error.
Died (no handler).
OUT

##############################
output_is(<<'CODE', <<'OUT', "Exceptions 3");
sub main() {
    try {
	try {
	    print "dying\n";
	    die;
	    print "foo\n";
	}
	print "survived\n";
	die "again";
	print "what?\n";
    }
    print "Yup\n";
    die;
    print "huh?\n";
}
CODE
dying
survived
Yup
Unknown error.
Died (no handler).
OUT

##############################
output_is(<<'CODE', <<'OUT', "Exceptions 4");
sub unpleasant {
    die "ugh";
}

sub main() {
    try {
	try {
	    print "dying\n";
	    die;
	    print "foo\n";
	}
	print "survived\n";
	unpleasant;
	print "what?\n";
    }
    print "Yup\n";
    die;
    print "huh?\n";
}
CODE
dying
survived
Yup
Unknown error.
Died (no handler).
OUT

##############################
output_is(<<'CODE', <<'OUT', "Exceptions 5");
sub foo {
    die "eek";
}

sub main() {
    my $saverr;
    if 1 {
	print "about to die\n";
	foo;
	CATCH { default {
	    print "caught ", $!, "\n";
	    $saverr = $!;
	} }
    } else {
	print "oops\n";
    }
    print $saverr, ": still alive\n";
    if 0 {
	print "?\n";
    } else {
	foo;
    }
    CATCH { default {print $!, ", eh?\n" } }
    die;			# Not reached.
}
CODE
about to die
caught eek
eek: still alive
eek, eh?
OUT

##############################
output_is(<<'CODE', <<'OUT', "Exceptions 6");
sub main() {
    CATCH { default { print "foo\n" } }
    for 1..5 {
	die $_ unless $_ % 3;
	CATCH {
	    when 1 { print "a\n" }
	    print "a.1: ", $!, "\n";
 	    when 3 { print "b\n" }
 	    print "b.1\n";
	}
	print $_, "\n";
    }
    print "Survived 1\n";
    for 1..5 {
	die $_ unless $_ % 3;
	CATCH {
	    when 1 { print "a\n" }
	    print "a.1: ", $!, "\n";
 	    when 2 { print "b\n" }
 	    print "b.1\n";
	}
	print $_, "\n";
    }
}
CODE
1
2
a.1: 3
b
4
5
Survived 1
1
2
a.1: 3
b.1
foo
OUT

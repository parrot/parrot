#!perl

use strict;
use P6C::TestCompiler tests => 2;

##############################
output_is(<<'CODE', <<'OUT', "Exceptions");
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
output_is(<<'CODE', <<'OUT', "Exceptions 2");
sub foo {
    die "eek";
}

sub main() {
    my $saverr;
    if 1 {
	print "about to die\n";
	foo;
	CATCH {
	    print "caught ", $!, "\n";
	    $saverr = $!;
	}
    } else {
	print "oops\n";
    }
    print $saverr, ": still alive\n";
    if 0 {
	print "?\n";
    } else {
	foo;
    }
    CATCH { print $!, ", eh?\n" }
    die;			# Not reached.
}
CODE
about to die
caught eek
eek: still alive
eek, eh?
OUT

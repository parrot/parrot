#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/ref.t - Reference PMC

=head1 SYNOPSIS

	% perl t/pmc/ref.t

=head1 DESCRIPTION

Tests that method delegation works on a C<Ref> PMC.

=cut

use Parrot::Test tests => 6;
use Test::More qw(skip);

output_is(<<'CODE', <<'OUTPUT', "new ref");
	new P2, .PerlInt
	new P1, .Ref, P2
	print "ok 1\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "inc ref");
	new P2, .PerlInt
	new P1, .Ref, P2
	inc P1
	print P1
	print P2
	print "\n"
	end
CODE
11
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "deref");
	new P2, .PerlInt
	new P1, .Ref, P2
	print "ok 1\n"
	deref P3, P1
	typeof S0, P1
	print S0
	print "\n"
	typeof S0, P3
	print S0
	print "\n"
	end
CODE
ok 1
Ref
PerlInt
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "assign ref");
	new P2, .PerlInt
	new P3, .PerlNum
	set P3, 0.5
	new P1, .Ref, P2
	inc P1
	print P1
	print "\n"
	assign P1, P3
	inc P1
	print P1
	print "\n"
	print P3
	print "\n"
	end
CODE
1
1.500000
1.500000
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "typeof SharedRef");
	new P2, .PerlInt
	new P1, .SharedRef, P2
	print "ok 1\n"
	set P1, 4711
	print P1
	print "\n"
	typeof S0, P1
	print S0
	print "\n"
	set P1, "hello\n"
	typeof S0, P1
	print S0
	print "\n"
	print P1
	end
CODE
ok 1
4711
PerlInt
PerlString
hello
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "deref SharedRef");
	new P2, .PerlInt
	new P1, .SharedRef, P2
	print "ok 1\n"
	deref P3, P1
	print "never\n"
	end
CODE
/ok 1
Not a reference PMC/
OUTPUT

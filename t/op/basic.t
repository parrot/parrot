#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;


=head1 NAME

t/op/basic.t - Basic Ops

=head1 SYNOPSIS

	% prove t/op/basic.t

=head1 DESCRIPTION

Tests basic string and branching operations.

=cut


# It would be very embarrassing if these didnt work...
output_is(<<'CODE', '', "noop, end");
	noop
	end
CODE

output_is(<<'CODE', '1', "print 1");
	print	1
	end
CODE

output_is(<<'CODE', 'Parrot flies', "print string");
	print 'Parrot flies'
	end
CODE

output_is(<<'CODE', 'Parrot flies', "print double-quoted string");
       print "Parrot flies"
       end
CODE

output_is(<<'CODE', 'Parrot	flies', "print double-quoted string, tabs");
       print "Parrot\tflies"
       end
CODE

output_is(<<'CODE', q('Parrot' flies), "print double-quoted string, nested single");
       print "'Parrot' flies"
       end
CODE

output_is(<<'CODE', q("Parrot" flies), "print single-quoted string, nested double");
       print '"Parrot" flies'
       end
CODE

output_is(<<'CODE', q(Parrot flies), "print string with embedded hex escape");
       print "Parrot\x20flies"
       end
CODE

output_is(<<'CODE', q(Parrot flies), "escaped non-special");
       print "Parrot fl\ies"
       end
CODE

output_is(<<'CODE', <<OUTPUT, "print string with embedded newline");
       print "Parrot flies\n"
       end
CODE
Parrot flies
OUTPUT

output_is( <<'CODE', '42', "branch_ic" );
	set	I4, 42
	branch	HERE
	set	I4, 1234
HERE:
	print	I4
	end
CODE


output_is( <<'CODE', '42', "branch_ic (backward)" );
	set	I4, 42
	branch	one
two:	branch	three
	set	I4, 1234
	add	I4, I4, I4
one:
	branch	two
three:
	print	I4
	end
CODE


output_is(<<'CODE', <<'OUTPUT', "bsr_i");
	print	"start\n"

	bsr	LAB1

	print	"done\n"
	end

LAB1:	print	"lab 1\n"
	ret
CODE
start
lab 1
done
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set_addr");
       set_addr I1, FOO
       jump I1
       print "Jump failed\n"
       end

FOO:   print "Jump succeeded\n"
       end
CODE
Jump succeeded
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "multiple labels");
     if 0,FOO
     if 1,BAR
     print "not "
FOO:
BAR:
     print "ok 1\n"
     end
CODE
ok 1
OUTPUT

output_is(<<'CODE', 32, "Predeclared opcodes");
     set_i_ic I0,32
     print I0
     end
CODE

pir_output_is(<<'CODE', <<'OUTPUT', "pir syntax with marker - is");

.sub _main
     .const string OK = "ok\n"
     print OK
     end
.end

CODE
ok
OUTPUT

pir_output_isnt(<<'CODE', <<'OUTPUT', "pir syntax with marker - isnt");

.sub _main
     .const string OK = "ok\n"
     print OK
     end
.end

CODE
parrot
OUTPUT

pir_output_like(<<'CODE', <<'OUTPUT', "pir syntax with marker - like");

.sub _main
     .const string OK = "ok\n"
     print OK
     end
.end

CODE
/^\w\w\s+$/
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "pir syntax with function - is");
.sub _main
     .const string OK = "ok\n"
     print OK
     end
.end

CODE
ok
OUTPUT

pir_output_isnt(<<'CODE', <<'OUTPUT', "pir syntax with function - isnt");
.sub _main
     .const string OK = "ok\n"
     print OK
     end
.end

CODE
nada niete
OUTPUT

pir_output_like(<<'CODE', <<'OUTPUT', "pir syntax with function - like");
.sub _main
     .const string OK = "ok 1\n"
     print OK
     end
.end

CODE
/^\w{2}\s\d\s+$/
OUTPUT

my $CODE = '
.sub _main
    print "ok\n"
    end
.end

#.namespace'; # no \n at end of file

pir_output_like( $CODE, <<'OUTPUT', "end of line handling");
/unexpected/
OUTPUT


## remember to change the number of tests :-)
BEGIN { plan tests => 23; }


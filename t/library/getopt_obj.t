#!perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 15;


=head1 NAME

t/library/getopt_obj.t - testing the module Getopt/Obj.pir

=head1 SYNOPSIS

	% prove t/library/getopt_obj.t

=head1 DESCRIPTION

This test program tries to handle command line arguments with the
module F<runtime/parrot/library/Getopt/Obj.pir>.

=cut


# 1
pir_output_is(<<'CODE', <<'OUT', "basic long options");

.sub main :main 
	.local pmc argv
	argv = new .ResizablePMCArray
	push argv, '--foo=bar'
	push argv, '--bar=3.14'
	push argv, '--bax=3'
	push argv, '--baz'

	load_bytecode "Getopt/Obj.pir"
	.local pmc getopts
	getopts = new "Getopt::Obj"

	$P0 = getopts."add"()
	$P0."long"("foo")
	$P0."type"(.String)

	$P0 = getopts."add"()
	$P0."long"("bar")
	$P0."type"(.Float)

	$P0 = getopts."add"()
	$P0."long"("bax")
	$P0."type"(.Integer)

	$P0 = getopts."add"()
	$P0."long"("baz")

	$P1 = getopts."get_options"(argv)
	
	$S0 = $P1["foo"]
	print "foo is "
	print $S0
	print "\n"

	$S0 = $P1["bar"]
	print "bar is "
	print $S0
	print "\n"

	$S0 = $P1["bax"]
	print "bax is "
	print $S0
	print "\n"

	$S0 = $P1["baz"]
	print "baz is "
	print $S0
	print "\n"
.end

CODE
foo is bar
bar is 3.14
bax is 3
baz is 1
OUT

# 2
pir_output_is(<<'CODE', <<'OUT', "basic short options");
.sub main :main 
	.local pmc argv
	argv = new .ResizablePMCArray
	push argv, '-f'
	push argv, 'bar'
	push argv, '-Abc'
	push argv, '-c'

	load_bytecode "Getopt/Obj.pir"
	.local pmc getopts
	getopts = new "Getopt::Obj"

	$P0 = getopts."add"()
	$P0."short"("f")
	$P0."type"(.String)

	$P0 = getopts."add"()
	$P0."short"("A")
	$P0."type"(.String)

	$P0 = getopts."add"()
	$P0."short"("c")

	$P1 = getopts."get_options"(argv)
	
	$S0 = $P1["f"]
	print "f is "
	print $S0
	print "\n"

	$S0 = $P1["A"]
	print "A is "
	print $S0
	print "\n"

	$S0 = $P1["c"]
	print "c is "
	print $S0
	print "\n"
.end
CODE
f is bar
A is bc
c is 1
OUT

# 3
pir_output_is(<<'CODE', <<'OUT', "simple array");
.sub main :main 
	.local pmc argv
	argv = new .ResizablePMCArray
	push argv, '-Iinca'
	push argv, '-Iincb'

	load_bytecode "Getopt/Obj.pir"
	.local pmc getopts
	getopts = new "Getopt::Obj"

	$P0 = getopts."add"()
	$P0."short"("I")
	$P0."type"(.Array)

	$P1 = getopts."get_options"(argv)
	
	$S0 = $P1["I";0]
	print "0 is "
	print $S0
	print "\n"

	$S0 = $P1["I";1]
	print "1 is "
	print $S0
	print "\n"

.end
CODE
0 is inca
1 is incb
OUT

# 4
pir_output_is(<<'CODE', <<'OUT', "mixing long and short with array");
.sub main :main 
	.local pmc argv
	argv = new .ResizablePMCArray
	push argv, '-Iinca'
	push argv, '--include=incb'

	load_bytecode "Getopt/Obj.pir"
	.local pmc getopts
	getopts = new "Getopt::Obj"

	$P0 = getopts."add"()
	$P0."long"("include")
	$P0."short"("I")
	$P0."type"(.Array)

	$P1 = getopts."get_options"(argv)
	
	$S0 = $P1["include";0]
	print "0 is "
	print $S0
	print "\n"

	$S0 = $P1["include";1]
	print "1 is "
	print $S0
	print "\n"

.end
CODE
0 is inca
1 is incb
OUT

# 5
pir_output_is(<<'CODE', <<'OUT', "hash");
.sub main :main 
	.local pmc argv
	argv = new .ResizablePMCArray
	push argv, '-Dfoo=bar'
	push argv, '--define=bax=baz'
	push argv, '-Dfoobar'

	load_bytecode "Getopt/Obj.pir"
	.local pmc getopts
	getopts = new "Getopt::Obj"

	$P0 = getopts."add"()
	$P0."long"("define")
	$P0."short"("D")
	$P0."type"(.Hash)

	$P1 = getopts."get_options"(argv)
	
	$S0 = $P1["define";"foo"]
	print "foo is "
	print $S0
	print "\n"

	$S0 = $P1["define";"bax"]
	print "bax is "
	print $S0
	print "\n"

	$S0 = $P1["define";"foobar"]
	print "foobar is "
	print $S0
	print "\n"

.end
CODE
foo is bar
bax is baz
foobar is 1
OUT

# 6
pir_output_is(<<'CODE', <<'OUT', "bundling short options");
.sub main :main 
	.local pmc argv
	argv = new .ResizablePMCArray
	push argv, '-abc'

	load_bytecode "Getopt/Obj.pir"
	.local pmc getopts
	getopts = new "Getopt::Obj"

	$P0 = getopts."add"()
	$P0."short"("a")
	$P0 = getopts."add"()
	$P0."short"("b")
	$P0 = getopts."add"()
	$P0."short"("c")

	$P1 = getopts."get_options"(argv)
	
	$S0 = $P1["a"]
	print "a is "
	print $S0
	print "\n"

	$S0 = $P1["b"]
	print "b is "
	print $S0
	print "\n"

	$S0 = $P1["c"]
	print "c is "
	print $S0
	print "\n"

.end
CODE
a is 1
b is 1
c is 1
OUT

# 7
pir_output_is(<<'CODE', <<'OUT', "ignored options");
.sub main :main 
	.local pmc argv
	argv = new .ResizablePMCArray
	push argv, '--ignore'
	push argv, '--foo'

	load_bytecode "Getopt/Obj.pir"
	.local pmc getopts
	getopts = new "Getopt::Obj"
	getopts."notOptStop"(1)

	$P0 = getopts."add"()
	$P0."long"("foo")

	$P1 = getopts."get_options"(argv)
	
	$S0 = $P1["foo"]
	print "foo is "
	print $S0
	print "\n"

	$S0 = argv[0]
	print "argv[0] is "
	print $S0
	print "\n"

.end
CODE
foo is 1
argv[0] is --ignore
OUT

# 8
pir_output_is(<<'CODE', <<'OUT', "double dash stop");
.sub main :main 
	.local pmc argv
	argv = new .ResizablePMCArray
	push argv, '--foo'
	push argv, '--'
	push argv, '--bar'

	load_bytecode "Getopt/Obj.pir"
	.local pmc getopts
	getopts = new "Getopt::Obj"

	$P0 = getopts."add"()
	$P0."long"("foo")
	$P0 = getopts."add"()
	$P0."long"("bar")

	$P1 = getopts."get_options"(argv)
	
	$S0 = $P1["foo"]
	print "foo is "
	print $S0
	print "\n"

	# Hash sets an nonexistant value to ''
	$S0 = $P1["bar"]
	print "bar is "
	print $S0
	print "\n"

	$S0 = argv[0]
	print "argv[0] is "
	print $S0
	print "\n"

.end
CODE
foo is 1
bar is 
argv[0] is --bar
OUT

# 9
pir_output_is(<<'CODE', <<'OUT', "notOptStop");
.sub main :main 
	.local pmc argv
	argv = new .ResizablePMCArray
	push argv, '--foo'
	push argv, 'foo'
	push argv, '--bar'

	load_bytecode "Getopt/Obj.pir"
	.local pmc getopts
	getopts = new "Getopt::Obj"
	getopts."notOptStop"(1)

	$P0 = getopts."add"()
	$P0."long"("foo")
	$P0 = getopts."add"()
	$P0."long"("bar")

	$P1 = getopts."get_options"(argv)
	
	$S0 = $P1["foo"]
	print "foo is "
	print $S0
	print "\n"

	$S0 = $P1["bar"]
	print "bar is "
	print $S0
	print "\n"

	$S0 = argv[0]
	print "argv[0] is "
	print $S0
	print "\n"

	$S0 = argv[1]
	print "argv[1] is "
	print $S0
	print "\n"

.end
CODE
foo is 1
bar is 
argv[0] is foo
argv[1] is --bar
OUT

# 10
pir_output_is(<<'CODE', <<'OUT', "optarg");
.sub main :main 
	.local pmc argv
	argv = new .ResizablePMCArray
	push argv, '--foo'
	push argv, '-f'
	push argv, '-bbar'

	load_bytecode "Getopt/Obj.pir"
	.local pmc getopts
	getopts = new "Getopt::Obj"
	getopts."notOptStop"(1)

	$P0 = getopts."add"()
	$P0."long"("foo")
	$P0."optarg"(1)
	$P0."type"(.String)

	$P0 = getopts."add"()
	$P0."short"("f")
	$P0."optarg"(1)
	$P0."type"(.String)

	$P0 = getopts."add"()
	$P0."short"("b")
	$P0."optarg"(1)
	$P0."type"(.String)

	$P1 = getopts."get_options"(argv)
	
	$S0 = $P1["foo"]
	print "foo is "
	print $S0
	print "\n"

	$S0 = $P1["f"]
	print "f is "
	print $S0
	print "\n"

	$S0 = $P1["b"]
	print "b is "
	print $S0
	print "\n"

.end
CODE
foo is 
f is 
b is bar
OUT

# 11
pir_output_is(<<'CODE', <<'OUT', "pass through");
.sub main :main 
	.local pmc argv
	argv = new .ResizablePMCArray
	push argv, '--foo'
	push argv, 'foo'
	push argv, '--bar'
	push argv, 'bar'

	load_bytecode "Getopt/Obj.pir"
	.local pmc getopts
	getopts = new "Getopt::Obj"

	$P0 = getopts."add"()
	$P0."long"("foo")
	$P0 = getopts."add"()
	$P0."long"("bar")

	$P1 = getopts."get_options"(argv)
	
	$S0 = $P1["foo"]
	print "foo is "
	print $S0
	print "\n"

	$S0 = $P1["bar"]
	print "bar is "
	print $S0
	print "\n"

	$S0 = argv[0]
	print "argv[0] is "
	print $S0
	print "\n"

	$S0 = argv[1]
	print "argv[1] is "
	print $S0
	print "\n"

.end
CODE
foo is 1
bar is 1
argv[0] is foo
argv[1] is bar
OUT

# 12
pir_output_is(<<'CODE', <<'OUT', "lone dash");
.sub main :main 
	.local pmc argv
	argv = new .ResizablePMCArray
	push argv, '--foo'
	push argv, '-'
	push argv, '--bar'

	load_bytecode "Getopt/Obj.pir"
	.local pmc getopts
	getopts = new "Getopt::Obj"

	$P0 = getopts."add"()
	$P0."long"("foo")
	$P0 = getopts."add"()
	$P0."long"("bar")

	$P1 = getopts."get_options"(argv)
	
	$S0 = $P1["foo"]
	print "foo is "
	print $S0
	print "\n"

	$S0 = $P1["bar"]
	print "bar is "
	print $S0
	print "\n"

	$S0 = argv[0]
	print "argv[0] is "
	print $S0
	print "\n"

.end
CODE
foo is 1
bar is 1
argv[0] is -
OUT

# 13
pir_output_is(<<'CODE', <<'OUT', "push interface");
.sub main :main 
	.local pmc argv
	argv = new .ResizablePMCArray
	push argv, '--foo=file'
	push argv, '-bfile.txt'
	push argv, '-x'
	push argv, 'file.t'
	push argv, '-z'
	push argv, 'text'
	push argv, '-I'
	push argv, 'texta'
	push argv, '-I'
	push argv, 'textb'
	push argv, '-Dfoo=bar'
	push argv, '--define=bax=baz'
	push argv, '-Dfoobar'

	load_bytecode "Getopt/Obj.pir"
	.local pmc getopts
	getopts = new "Getopt::Obj"

	push getopts, 'foo=s'
	push getopts, 'bar|b=s'
	push getopts, 'bax|x=s'
	push getopts, 'baz|z:s'
	push getopts, 'I=@'
	push getopts, 'define|D:%'

	$P1 = getopts."get_options"(argv)
	

	$S0 = $P1["foo"]
	print "foo is "
	print $S0
	print "\n"

	$S0 = $P1["bar"]
	print "bar is "
	print $S0
	print "\n"

	$S0 = $P1["bax"]
	print "bax is "
	print $S0
	print "\n"

	$S0 = $P1["baz"]
	print "baz is "
	print $S0
	print "\n"

	$S0 = $P1["I";0]
	print "I[0] is "
	print $S0
	print "\n"

	$S0 = $P1["I";1]
	print "I[1] is "
	print $S0
	print "\n"

	$S0 = $P1["define";"foo"]
	print "define[foo] is "
	print $S0
	print "\n"

	$S0 = $P1["define";"bax"]
	print "define[bax] is "
	print $S0
	print "\n"

	$S0 = $P1["define";"foobar"]
	print "define[foobar] is "
	print $S0
	print "\n"

	$S0 = argv[0]
	print "argv[0] is "
	print $S0
	print "\n"

.end
CODE
foo is file
bar is file.txt
bax is file.t
baz is 
I[0] is texta
I[1] is textb
define[foo] is bar
define[bax] is baz
define[foobar] is 1
argv[0] is text
OUT

# 14
pir_output_like(<<'CODE', <<'OUT', "missing spec");
.sub main :main 
	.local pmc argv
	argv = new .ResizablePMCArray
	push argv, '--foo=file'
	load_bytecode "Getopt/Obj.pir"
	.local pmc getopts
	getopts = new "Getopt::Obj"
	$P1 = getopts."get_options"(argv)
	$S0 = $P1["foo"]
	print "foo is "
	print $S0
	print "\n"
	$S0 = argv[0]
	print "argv[0] is "
	print $S0
	print "\n"
.end
CODE
/Option 'foo' not in specs/
OUT

# 15
pir_output_like(<<'CODE', <<'OUT', "missing argument");
.sub main :main 
	.local pmc argv
	argv = new .ResizablePMCArray
	push argv, '--foo=file'
	push argv, '--bar'
	load_bytecode "Getopt/Obj.pir"
	.local pmc getopts
	getopts = new "Getopt::Obj"
	push getopts, 'foo=s'
	push getopts, 'bar=s'
	$P1 = getopts."get_options"(argv)
	$S0 = $P1["foo"]
	print "foo is "
	print $S0
	print "\n"
	$S0 = argv[0]
	print "argv[0] is "
	print $S0
	print "\n"
.end
CODE
/Missing a required argument for option 'bar'/
OUT


=head1 AUTHOR

Joshua Isom - C<loneowl@ritalin.shout.net>

=head1 SEE ALSO

F<runtime/parrot/library/Getopt/Obj.pir>

=cut



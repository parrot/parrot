#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/builtin.t - Builtin Methods

=head1 SYNOPSIS

	% perl -Ilib t/pmc/builtin.t

=head1 DESCRIPTION

Tests builtin opcode-like methods.

=cut

use Parrot::Test tests => 3;

pir_output_is(<<'CODE', <<'OUT', "six ways to call a method");
.sub main @MAIN
    .local pmc x, y, cl, m
    x = new Float
    x = 1.0
    # opcode syntax
    print "opcode        "
    y = cos x
    print y
    print "\n"
    # function call syntax
    print "function      "
    y = "cos"(x)
    print y
    print "\n"
    # method call
    print "method        "
    y = x."cos"()
    print y
    print "\n"
    # same as class method
    cl = getclass "Float"
    print "class method  "
    y = cl."cos"(x)
    print y
    print "\n"
    # bound class nethod
    print "bound class m "
    m = getattribute cl, "cos"	# m = Float.cos
    y = m(x)
    print y
    print "\n"
    # bound object nethod
    m = getattribute x, "cos"	# m = x.cos
    print "bound obj met "
    y = m()
    print y
    print "\n"
.end
CODE
opcode        0.540302
function      0.540302
method        0.540302
class method  0.540302
bound class m 0.540302
bound obj met 0.540302
OUT

pir_output_is(<<'CODE', <<'OUT', "ParrotIO.puts");
.sub main @MAIN
    .local pmc o, m, cl
    o = getstdout
    $I0 = o."puts"("ok 1\n")
    puts $I0, o, "ok 2\n"
    $I0 = "puts"(o, "ok 3\n")
    m = getattribute o, "puts"
    $I0 = m("ok 4\n")
    cl = getclass "ParrotIO"
    $I0 = cl."puts"(o, "ok 5\n")
.end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUT

pir_output_is(<<'CODE', <<'OUT', "say");
.sub main @MAIN
    .local pmc io
    $I0 = say "ok 1"
    io = getstdout
    $I0 = say io, "ok 2"
    say "ok 3"
    say io, "ok 4"
.end
CODE
ok 1
ok 2
ok 3
ok 4
OUT



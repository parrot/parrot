#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/library/pge.t - Grammar Engine tests

=head1 SYNOPSIS

	% perl -Ilib t/library/pge.t

=cut

use strict;

use Parrot::Test tests => 3;

# 1
pir_output_is(<<'CODE', <<'OUT', "character class membership");

.sub _main
    load_bytecode "library/PGE/Class.pir"

    .local pmc vowels
    .local pmc new_sub

    find_global new_sub, "PGE::Class::Discrete", "new"
    vowels = new_sub("aeiou")

    $I1 = vowels["o"]
    if $I1 goto OK1
    print "not "
OK1:
    print "ok 1\n"

    $I2 = vowels["q"]
    unless $I2 goto OK2
    print "not "
OK2:
    print "ok 2\n"

    end
.end
CODE
ok 1
ok 2
OUT

# 2
pir_output_is(<<'CODE', <<'OUT', "character class membership: method form");

.sub _main
    load_bytecode "library/PGE/Class.pir"

    .local pmc vowels
    .local pmc new_sub
    find_global new_sub, "PGE::Class::Discrete", "new"
    vowels = new_sub("aeiou")

    $I1 = vowels.matches("o")
    if $I1 goto OK1
    print "not "
OK1:
    print "ok 1\n"

    $I2 = vowels.matches("q")
    unless $I2 goto OK2
    print "not "
OK2:
    print "ok 2\n"

    end
.end
CODE
ok 1
ok 2
OUT

# 3
pir_output_is(<<'CODE', <<'OUT', "RegCounter");

.sub _main
    load_bytecode "library/PGE/RegCounter.pir"
    
    .local pmc rc
    $P0 = find_global "PGE::RegCounter", "new"
    rc = $P0()

    rc.declare("foo", "$I")
    rc.declare("bar", "$P")
    rc.declare("baz", "$I")

    $S0 = rc["foo"]
    print $S0
    print "\n"

    $S0 = rc["bar"]
    print $S0
    print "\n"

    $S0 = rc["baz"]
    print $S0
    print "\n"

    $S0 = rc["bar"]
    print $S0
    print "\n"

    .local pmc ch
    ch = rc.next()

    ch.declare("bar", "$P")
    ch.declare("baz", "$P")
    ch.declare("quux", "_L")

    $S0 = ch["bar"]
    print $S0
    print "\n"

    $S0 = ch["baz"]
    print $S0
    print "\n"

    $S0 = ch["quux"]
    print $S0
    print "\n"

    $S0 = ch["bar"]
    print $S0
    print "\n"

    $S0 = rc["bar"]
    print $S0
    print "\n"

    $S0 = rc["baz"]
    print $S0
    print "\n"
.end
CODE
$I0
$P1
$I2
$P1
$P3
$P4
_L5
$P3
$P1
$I2
OUT

# vim: ft=imc :

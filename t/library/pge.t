#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/library/pge.t - Grammar Engine tests

=head1 SYNOPSIS

	% perl -Ilib t/library/pge.t

=cut

use strict;

use Parrot::Test tests => 2;

# 1
output_is(<<'CODE', <<'OUT', "character class membership");
##PIR##
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
output_is(<<'CODE', <<'OUT', "character class membership: method form");
##PIR##
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

# vim: ft=imc :

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
    $I0 = find_type "PGE::Class::Discrete"
    new vowels, $I0

    set vowels, "aeiou"

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
output_is(<<'CODE', <<'OUT', "character class membership: method forms");
##PIR##
.sub _main
    load_bytecode "library/PGE/Class.pir"

    .local pmc vowels
    $I0 = find_type "PGE::Class::Discrete"
    new vowels, $I0

    vowels.set_chars("aeiou")

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

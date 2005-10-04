#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id: pge.t 9188 2005-09-13 02:53:47Z azuroth $

=head1 NAME

t/library/pge-hs.t - Grammar Engine Haskell Output tests

=head1 SYNOPSIS

	% perl -Ilib t/library/pge-hs.t

=cut

use strict;

use Parrot::Test tests => 1;

# 1
pir_output_is(<<'CODE', <<'OUT', "PGE::Hs match");

.sub _main
    .local pmc match, add_rule
    .local string result

    load_bytecode "PGE.pbc"
    load_bytecode "PGE/Hs.pir"

    match = find_global "PGE::Hs", "match"
    add_rule = find_global "PGE::Hs", "add_rule"
    add_rule("foo", "s")
    result = match("test", "t(.<foo>)t")

    eq result, "PGE_Match 0 4 [PGE_Match 1 3 [] [(\"foo\", PGE_Match 2 3 [] [])]] []\n", OK
    print "not "

OK:
    print "ok 1\n"
    end
.end
CODE
ok 1
OUT

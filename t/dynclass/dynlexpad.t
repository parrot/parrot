#! perl
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 5;
use Parrot::Config;


=head1 NAME

t/dynclass/dynlexpad.t - test the DynLexPad PMC

=head1 SYNOPSIS

	% prove t/dynclass/dynlexpad.t

=head1 DESCRIPTION

Tests the C<DynLexPad> PMC.

=cut


pir_output_is(<< 'CODE', << 'OUTPUT', "loadlib");
.sub main :main
    .local pmc lib
    lib = loadlib "dynlexpad"
    unless lib goto not_loaded
    print "ok\n"
    end
not_loaded:
    print "not loaded\n"
.end
CODE
ok
OUTPUT

my $loadlib = <<'EOC';
#
# the immediate sub gets run, before the .HLL_map below
# is parsed, therefore the .DynLexPad constant is aready
# available
#
.sub _load_lib :immediate
    .local pmc lib
    lib = loadlib "dynlexpad"
.end

.HLL "Some", ""
.HLL_map .LexPad, .DynLexPad

EOC

pir_output_is($loadlib . << 'CODE', << 'OUTPUT', "store_lex");
# see loadlib
.sub 'test' :main
    foo()
.end
.sub foo :lex
    $P1 = new .Integer
    $P1 = 13013
    store_lex 'a', $P1
    print "ok 1\n"
    $P2 = find_lex 'a'
    print "ok 2\n"
    print $P2
    print "\n"
    end
.end
CODE
ok 1
ok 2
13013
OUTPUT

pir_output_is($loadlib . << 'CODE', << 'OUTPUT', "check :outer");
.sub 'test' :main
    foo()
.end
.sub foo :lex
    $P1 = new .Integer
    $P1 = 13013
    store_lex 'a', $P1
    $P2 = find_lex 'a'
    print $P2
    print "\n"
    .const .Sub bar_sub = "bar"
    $P0 = newclosure bar_sub
    $P0()
.end
.sub bar :outer(foo)
    .const .Sub baz_sub = "baz"
    $P0 = newclosure baz_sub
    $P0()
.end
.sub baz :lex :outer(bar)
    $P1 = find_lex 'a'
    print $P1
    print "\n"
.end
CODE
13013
13013
OUTPUT

pir_output_is($loadlib . << 'CODE', << 'OUTPUT', "tcl-ish upvar");
.sub 'test' :main
    foo()
.end
.sub foo :lex
    $P1 = new .Integer
    $P1 = 13013
    store_lex 'a', $P1
    $P2 = find_lex 'a'
    print $P2
    print "\n"
    .const .Sub bar_sub = "bar"
    $P0 = newclosure bar_sub
    $P0()
    # check the upvar
    $P2 = find_lex 'b'
    print $P2
    print "\n"
.end
.sub bar :outer(foo)
    .const .Sub baz_sub = "baz"
    $P0 = newclosure baz_sub
    $P0()
.end
.sub baz :lex :outer(bar)
    $P1 = find_lex 'a'
    print $P1
    print "\n"
    # upvar 2 'b', 55
    .local pmc sub, pad
    .include 'interpinfo.pasm'
    sub = interpinfo .INTERPINFO_CURRENT_SUB
    sub = sub."get_outer"()
    unless sub goto err
    sub = sub."get_outer"()
    unless sub goto err
    pad = sub."get_lexpad"()
    $P2 = new .Integer
    $P2 = 55
    pad['b'] = $P2
    .return()
err:
    print "outer not found\n"
.end
CODE
13013
13013
55
OUTPUT

pir_output_is($loadlib . << 'CODE', << 'OUTPUT', "check that dynlexpad honors hll");
.sub 'test' :main
    foo()
    bar()
.end
.sub foo :lex
.include 'interpinfo.pasm'
    interpinfo $P1, .INTERPINFO_CURRENT_SUB
    $P2 = $P1."get_lexpad"()
    $S0 = typeof $P2
    print $S0
    print "\n"
.end
.HLL "parrot",""
.sub bar :lex
    interpinfo $P1, .INTERPINFO_CURRENT_SUB
    $P2 = $P1."get_lexpad"()
    $S0 = typeof $P2
    print $S0
    print "\n"
.end
CODE
DynLexPad
LexPad
OUTPUT

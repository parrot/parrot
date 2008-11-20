#! perl
# Copyright (C) 2005-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 7;
use Parrot::Config;

=head1 NAME

t/dynpmc/dynlexpad.t - test the DynLexPad PMC

=head1 SYNOPSIS

        % prove t/dynpmc/dynlexpad.t

=head1 DESCRIPTION

Tests the C<DynLexPad> PMC.

=cut

pir_output_is( << 'CODE', << 'OUTPUT', "loadlib" );
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
# the .loadlib directive gets run before the .HLL_map below is parsed,
# therefore the .DynLexPad constant is already available
#
.loadlib "dynlexpad"

.HLL "Some"
.HLL_map "LexPad" = "DynLexPad"

EOC

pir_output_is( $loadlib . << 'CODE', << 'OUTPUT', "store_lex" );
# see loadlib
.sub 'test' :main
    foo()
.end
.sub foo :lex
    $P1 = new 'Integer'
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

pir_output_is( $loadlib . << 'CODE', << 'OUTPUT', "check :outer" );
.sub 'test' :main
    foo()
.end
.sub foo :lex
    $P1 = new 'Integer'
    $P1 = 13013
    store_lex 'a', $P1
    $P2 = find_lex 'a'
    print $P2
    print "\n"
    .const 'Sub' bar_sub = "bar"
    $P0 = newclosure bar_sub
    $P0()
.end
.sub bar :outer(foo)
    .const 'Sub' baz_sub = "baz"
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

pir_output_is( $loadlib . << 'CODE', << 'OUTPUT', "tcl-ish upvar" );
.sub 'test' :main
    foo()
.end
.sub foo :lex
    $P1 = new 'Integer'
    $P1 = 13013
    store_lex 'a', $P1
    $P2 = find_lex 'a'
    print $P2
    print "\n"
    .const 'Sub' bar_sub = "bar"
    $P0 = newclosure bar_sub
    $P0()
    # check the upvar
    $P2 = find_lex 'b'
    print $P2
    print "\n"
.end
.sub bar :outer(foo)
    .const 'Sub' baz_sub = "baz"
    $P0 = newclosure baz_sub
    $P0()
.end
.sub baz :lex :outer(bar)
    $P1 = find_lex 'a'
    print $P1
    print "\n"
    # upvar 2 'b', 55
    .local pmc pad, interp
    interp = getinterp
    pad = interp["lexpad"; 2]
    $P2 = new 'Integer'
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

pir_output_is( $loadlib . << 'CODE', << 'OUTPUT', "check that dynlexpad honors hll" );
.sub 'test' :main
    foo()
    bar()
.end
.sub foo :lex
    .local pmc pad, interp
    interp = getinterp
    pad = interp["lexpad"]
    $S0 = typeof pad
    print $S0
    print "\n"
.end
.HLL "parrot"
.sub bar :lex
    .local pmc pad, interp
    interp = getinterp
    pad = interp["lexpad"]
    $S0 = typeof pad
    print $S0
    print "\n"
.end
CODE
DynLexPad
LexPad
OUTPUT

pir_output_is( $loadlib . << 'CODE', << 'OUTPUT', "dynlexpad - lexpad interop" );
.sub 'test' :main
    foo()
.end

.sub foo
    .lex 'a', $P0               # static lexical
    $P0 = new 'String'
    $P0 = "ok 1"
    $P1 = find_lex 'a'
    say $P1

    $P2 = new 'String'
    $P2 = "ok 2"
    store_lex 'a', $P2
    say $P0                   # sic!

    $P3 = new 'String'
    $P3 = "ok 3"
    store_lex 'b', $P3          # and a dynamic one
    $P4 = find_lex 'b'
    say $P4
.end
CODE
ok 1
ok 2
ok 3
OUTPUT

TODO: {
    local $TODO = "iterator not implemented for DynLexPads";

pir_output_is( $loadlib . << 'CODE', << 'OUTPUT', "dynlexpad - iterator" );
.sub 'test' :main
    .local pmc dlp, str1, str2, str3, it, key, interp

    .lex 'a', str1
    .lex 'b', str2
    .lex 'c', str3

    str1 = new 'String'
    str1 = 'happy pants'

    str2 = new 'String'
    str2 = 'content pants'

    str3 = new 'String'
    str3 = 'sad pants'

    interp = getinterp
    dlp    = interp['lexpad']

    say "Getting iterator"
    it = new 'Iterator', dlp
    say "Have iterator"
iter_loop:
    unless it goto iter_done
    key = shift it
    $S0 = key
    print key
    print ":"
    key = dlp[key]
    $S0 = key
    say key
    goto iter_loop
iter_done:
.end
CODE
a:happy pants
b:content pants
c:sad pants
OUTPUT
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

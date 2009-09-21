#! perl
# Copyright (C) 2005-2007, Parrot Foundation.
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
.loadlib "dynlexpad"

.HLL "Some"
.sub load :anon :init
  .local pmc interp, lexpad, dynlexpad
  interp = getinterp
  lexpad = get_class 'LexPad'
  dynlexpad = get_class 'DynLexPad'
  interp.'hll_map'(lexpad, dynlexpad)
.end

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
    local $TODO = "iterator not implemented for DynLexPads; TT #1028";

pir_output_is( $loadlib . << 'CODE', << 'OUTPUT', "dynlexpad - iterator" );

.loadlib 'dynlexpad'
.sub 'onload' :immediate
    .local pmc interp
    interp = getinterp

    .local pmc core
    core = get_class 'LexPad'
    .local pmc hll
    hll = get_class 'DynLexPad'
    interp.'hll_map'(core,hll)
.end

.sub 'test' :main

    .local pmc str1,str2,str3
    .lex 'a', str1
    .lex 'b', str2
    .lex 'c', str3

    str1 = box 'pants'
    str2 = box 'pants'
    str3 = box 'pants'

    .local pmc interp
    interp = getinterp

    .local pmc dlp
    dlp    = interp['lexpad']

    .local pmc iterator
    iterator = iter dlp
iter_loop:
    unless iterator goto iter_done
    .local pmc key
    key = shift iterator
    .local string value
    value = dlp[key]
    say value
    goto iter_loop
iter_done:
.end
CODE
pants
pants
pants
OUTPUT
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

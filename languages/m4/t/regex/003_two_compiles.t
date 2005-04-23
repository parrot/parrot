# $Id$

use strict;

use Parrot::Test tests => 1;

# See whethe to regexes can be compiled
pir_output_is( << 'END_PIR', << 'OUTPUT', "compile two regexes" );

.sub test @MAIN
    load_bytecode "library/pcre.imc"

    .local pmc init_func
    init_func    = find_global 'PCRE', 'init'
    .local pmc compile_func
    compile_func = find_global 'PCRE', 'compile'
    .local pmc match_func
    match_func= find_global 'PCRE', 'match'
    .local pmc dollar_func
    dollar_func = find_global 'PCRE', 'dollar'
    .local pmc pcre_lib
    pcre_lib = init_func()

    .local string error
    .local int errptr
    .local pmc regex_1, regex_2
    .local string pat

    pat = "asdf"
    ( regex_1, error, errptr )= compile_func( pat, 0 )
    $I0 = defined regex_1
    unless $I0 goto match_err

    pat = "123"
    ( regex_2, error, errptr )= compile_func( pat, 0 )
    $I0 = defined regex_2
    unless $I0 goto match_err

    .local int ok, i
    .local pmc result
    .local string s, match
    s = "0123asdf89"

    # Try the first regex
    ( ok, result )= match_func( regex_1, s, 0, 0 )
    if ok < 0 goto nomatch
    print ok
    print " match(es):\n"
    i = 0
lp_1: match = dollar_func( s, ok, result, i )
    print match
    print "\n"
    inc i
    if i < ok goto lp_1

    # Try the second regex
    ( ok, result )= match_func( regex_2, s, 0, 0 )
    if ok < 0 goto nomatch
    print ok
    print " match(es):\n"
    i = 0
lp_2: match = dollar_func( s, ok, result, i )
    print match
    print "\n"
    inc i
    if i < ok goto lp_2

    end
nomatch:
    print "no match\n"
    end
match_err:
    print "error in regex: "
    print "at: '"
    length $I0, pat
    $I0 = $I0 - errptr
    substr $S0, pat, errptr, $I0
    print $S0
    print "'\n"
.end
END_PIR
1 match(es):
asdf
1 match(es):
123
OUTPUT

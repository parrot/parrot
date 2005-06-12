# $Id$

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 1;

# Test loading of pcre library, Perl compatible regular expressions
pir_output_is( << 'END_PIR', << 'OUTPUT', "call parrot and do something" );

.sub test @MAIN
    load_bytecode "pcre.imc"

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
    .local pmc regex
    .local string pat
    pat = "asdf"
    ( regex, error, errptr )= compile_func( pat, 0 )
    $I0 = defined regex
    unless $I0 goto match_err

    .local int ok
    .local pmc result
    .local string s
    s = "0123asdf89"
    ( ok, result )= match_func( regex, s, 0, 0 )
    if ok < 0 goto nomatch
    print ok
    print " match(es):\n"
    .local int i
    i = 0
    .local string match
    .local string s
lp: match = dollar_func( s, ok, result, i )
    print match
    print "\n"
    inc i
    if i < ok goto lp
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
OUTPUT

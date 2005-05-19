# $Id$

use strict;
use FindBin;
use lib "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 5;
use Parrot::Test::PGE;

# Assemble PIR for simple pattern matching with PCRE
sub get_pir_pcre
{
  my ( $string, $token ) = @_;

  my %regex = ( name     => q{[_a-zA-Z][_a-zA-Z0-9]*},
                quoted   => q{^`[^`]*'} );
  return q{

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
    pat = "} . $regex{$token} . q{"
    ( regex, error, errptr )= compile_func( pat, 0 )
    $I0 = defined regex
    unless $I0 goto match_err

    .local int ok
    .local pmc result
    .local string s
    s = "} . $string . q{"
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
  }
}

# Assemble PIR for simple pattern matching with PGE
# This is not used yet
sub get_pir_pge
{
  my ( $string, $token ) = @_;

  my %regex = ( word          => q{^(a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z|A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z)(a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z|A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|0|1|2|3|4|5|6|7|8|9)*},
                quoted_string => q{^`[^`]*'},
                simple        => q{^[^`#_a-zA-Z]},
                comment       => q{^#[^\n]*\n},
              );
  return << "END_PIR";

.sub pge
    .param string target
    .param string pattern 

    print "pattern: "
    print pattern
    print "\\n"
    print "target: "
    print target
    print "\\n"

    .local pmc p6rule
    p6rule = find_global "PGE", "p6rule"  # get the compiler

    .local pmc rulesub                     
    rulesub = p6rule(pattern)        # compile it to rulesub

    .local pmc match
    match = rulesub(target)                   # execute rule on target string

match_loop:
    unless match goto match_fail           # if match fails stop
    print "match succeeded\\n"

    match."dump"()                       # display captures

    match."next"()                        # find the next match
    goto match_loop

match_fail:
    print "match failed\\n"   
    .return()
.end

.sub main \@MAIN
    load_bytecode "PGE.pbc"
    pge( "$string", "$regex{$token}" ) 
.end

END_PIR
}


{
  my $code = get_pir_pcre( 'foo', 'name' );
  pir_output_is( $code, << 'OUTPUT', "'foo' is a name" );
1 match(es):
foo
OUTPUT
}
{
  my $code = get_pir_pcre( '_tmp', 'name' );
  pir_output_is( $code, << 'OUTPUT', "'_tmp' is a name" );
1 match(es):
_tmp
OUTPUT
}
{
  my $code = get_pir_pcre( 'name2', 'name' );
  pir_output_is( $code, << 'OUTPUT', "'name2' is a name" );
1 match(es):
name2
OUTPUT
}
{
  my $code = get_pir_pcre( "`quoted'", 'quoted' );
  pir_output_is( $code, << 'OUTPUT', "'`quoted'' is a quoted string" );
1 match(es):
`quoted'
OUTPUT
}
{
  my $code = get_pir_pcre( "`'", 'quoted' );
  pir_output_is( $code, << 'OUTPUT', "'`'' is a quoted string" );
1 match(es):
`'
OUTPUT
}

# Do not use PGE yet
if ( 0 )
{
my %regex = ( word          => q{^(a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z|A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z)(a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z|A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|0|1|2|3|4|5|6|7|8|9)*},
              quoted_string => q{^`[^`]*'},
              simple        => q{^[^`#_a-zA-Z]},
              comment       => q{^#[^\n]*\n},
            );
# Test whether words are recognised
{
  foreach my $target ( q{foo}, q{_tmp}, q{name} )
  {
    p6rule_is( $target, $regex{word}, "'$target' is a word" );
  }
}

# TODO: Test whether non-words are not recognised

# Test whether quoted strings are recognised
{
  foreach my $target ( q{`quoted'}, q{`'} )
  {
    my $code = get_pir_pge( $target, 'quoted_string' );
    pir_output_is( $code, << "OUTPUT", "'$target' is a quoted string" );

1 match(es):
$target
OUTPUT
  }
}
}

# TODO: Test whether non-quoted are not recognised

# TODO: Test whether comments are recognised

# TODO: Test whether non-comments are not recognised

# TODO: Test whether simple tokens are recognised

# TODO: Test whether non-simple tokens are not recognised

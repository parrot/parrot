# $Id$

use strict;

use Parrot::Test tests => 5;
use Parrot::Test::PGE;

# Assemble PIR for simple pattern matching
sub get_pir_pcre
{
  my ( $string, $token ) = @_;

  my %regex = ( name     => q{[_a-zA-Z][_a-zA-Z0-9]*},
                quoted   => q{^`[^`]*'},
              );
  return q{
.include "library/pcre.imc"
.sub _main
  print	"\n"
  .local pmc lib
  .PCRE_INIT(lib)
  .local string error
  .local int errptr
  .local pmc code
  .local string pat
  pat = "} . $regex{$token} . q{"
  .PCRE_COMPILE(pat, 0, code, error, errptr)
  $I0 = defined code
  unless $I0 goto match_err

  .local int ok
  .local pmc result
  .local string s
  s = "} . $string . q{"
  .PCRE_MATCH(code, s, 0, 0, ok, result)
  if ok < 0 goto nomatch
  print ok
  print " match(es):\n"
  .local int i
  i = 0
  .local string match
  .local string s
lp: .PCRE_DOLLAR(s, ok, result, i, match)
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
  exit 1
.end
  }
}

# Assemble PIR for simple pattern matching
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

    .local pmc pge_compile
    find_global pge_compile,  "PGE", "_pge_compile"  # get the compiler

    .local pmc rulesub                     
    rulesub = pge_compile(pattern)        # compile it to rulesub

    .local pmc match
    match = rulesub(target)                   # execute rule on target string

match_loop:
    unless match goto match_fail           # if match fails stop
    print "match succeeded\\n"

    match."_print"()                       # display captures

    match."_next"()                        # find the next match
    goto match_loop

match_fail:
    print "match failed\\n"   
    .return()
.end
.include "library/pcre.imc"
.sub _main \@MAIN
  load_bytecode "pge.pir"
  pge( "$string", "$regex{$token}" ) 
  print	"\\n"
  .local pmc lib
  .PCRE_INIT(lib)
  .local string error
  .local int errptr
  .local pmc code
  .local string pat
  pat = "$regex{$token}"
  .PCRE_COMPILE(pat, 0, code, error, errptr)
  \$I0 = defined code
  unless \$I0 goto match_err

  .local int ok
  .local pmc result
  .local string s
  s = "$string"
  .PCRE_MATCH(code, s, 0, 0, ok, result)
  if ok < 0 goto nomatch
  print ok
  print " match(es):\\n"
  .local int i
  i = 0
  .local string match
  .local string s
lp: .PCRE_DOLLAR(s, ok, result, i, match)
  print match
  print "\\n"
  inc i
  if i < ok goto lp
  end
nomatch:
  print "no match\\n"
  end
match_err:
  print "error in regex: "
  print "at: '"
  length \$I0, pat
  \$I0 = \$I0 - errptr
  substr \$S0, pat, errptr, \$I0
  print \$S0
  print "'\\n"
  exit 1
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

# TODO: Test wether non-quoted are not recognised

# TODO: Test wether comments are recognised

# TODO: Test wether non-comments are not recognised

# TODO: Test wether simple tokens are recognised

# TODO: Test wether non-simple tokens are not recognised

# $Id$

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 29;
use Parrot::Test::PGE;

# Assemble PIR for pattern matching with PCRE
sub get_pir_pcre
{
  my ( $string, $token ) = @_;

  my %regex = ( word     => q{^[_a-zA-Z][_a-zA-Z0-9]*},
                string   => q{^`[^`]*'},    #'
                simple   => q{^[^`#_a-zA-Z]}, 
                comment  => q{^#[^\n]*\n}, 
              );

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


# Tests for PCRE
{
  my $code = get_pir_pcre( 'foo', 'word' );
  pir_output_is( $code, << 'OUTPUT', "'foo' is a word" );
1 match(es):
foo
OUTPUT
}
{
  my $code = get_pir_pcre( '_tmp', 'word' );
  pir_output_is( $code, << 'OUTPUT', "'_tmp' is a word" );
1 match(es):
_tmp
OUTPUT
}
{
  my $code = get_pir_pcre( 'name2', 'word' );
  pir_output_is( $code, << 'OUTPUT', "'name2' is a word" );
1 match(es):
name2
OUTPUT
}
{
  my $code = get_pir_pcre( "`quoted'", 'string' );
  pir_output_is( $code, << 'OUTPUT', "'`string'' is a quoted string" );
1 match(es):
`quoted'
OUTPUT
}
{
  my $code = get_pir_pcre( "`'", 'string' );
  pir_output_is( $code, << 'OUTPUT', "'`'' is a quoted string" );
1 match(es):
`'
OUTPUT
}
{
  my $code = get_pir_pcre( "+", 'simple' );
  pir_output_is( $code, << 'OUTPUT', "+ is a simple token" );
1 match(es):
+
OUTPUT
}
{
  my $code = get_pir_pcre( '# asdf\n', 'comment' );
  pir_output_is( $code, << 'OUTPUT', '# asdf\n is a comment' );
1 match(es):
# asdf

OUTPUT
}

# Tests for PGE
{
  my %regex = ( word     => q{^<[_a..zA..Z]><[_a..zA..Z0..9]>*},
                string   => q{^`<-[`]>*'},
                simple   => q{^<-[`#_a..zA..Z]>}, 
                comment  => q{^\#\N*\n}, 
              );
  foreach my $target ( qw{ foo Korrekturfluid _Gebietsverkaufsleiter a1 b2_c3_ } )
  {
    p6rule_is( $target, $regex{word}, "q{$target} is a word" );
  }
  foreach my $target ( qw{ 1a +a1 }, "  with_leading_space" )
  {
    p6rule_isnt( $target, $regex{word}, "q{$target} is not a word" );
  }

  foreach my $target ( qw{ `Korrekturfluid' `' } )
  {
    p6rule_is( $target, $regex{string}, "q{$target} is a quoted string" );
  }
  foreach my $target ( qw{ 1a +a1 `asdf asdf' } )
  {
    p6rule_isnt( $target, $regex{string}, "q{$target} is not a quoted string" );
  }

  foreach my $target ( "+# asdf", "'", '123', '0' )
  {
    p6rule_is( $target, $regex{simple}, "q{$target} is passed through" );
  }
  foreach my $target ( "# asdf\n", '_x' )
  {
    p6rule_isnt( $target, $regex{simple}, "q{$target} is not passed through" );
  }

  foreach my $target ( "# asdf\n" )
  {
    p6rule_is( $target, $regex{comment}, "q{$target} is a comment" );
  }
  foreach my $target ( " # asdf\n" )
  {
    p6rule_isnt( $target, $regex{comment}, "q{$target} is not a comment" );
  }
}

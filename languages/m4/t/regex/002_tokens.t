# $Id$

use strict;

use Parrot::Test tests => 5;

# Assemble PIR for simple pattern matching
sub get_pir
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


{
  my $code = get_pir( 'foo', 'name' );
  pir_output_is( $code, << 'OUTPUT', "'foo' is a name" );

1 match(es):
foo
OUTPUT
}
{
  my $code = get_pir( '_tmp', 'name' );
  pir_output_is( $code, << 'OUTPUT', "'_tmp' is a name" );

1 match(es):
_tmp
OUTPUT
}
{
  my $code = get_pir( 'name2', 'name' );
  pir_output_is( $code, << 'OUTPUT', "'name2' is a name" );

1 match(es):
name2
OUTPUT
}
{
  my $code = get_pir( "`quoted'", 'quoted' );
  pir_output_is( $code, << 'OUTPUT', "'`quoted'' is a quoted string" );

1 match(es):
`quoted'
OUTPUT
}
{
  my $code = get_pir( "`'", 'quoted' );
  pir_output_is( $code, << 'OUTPUT', "'`'' is a quoted string" );

1 match(es):
`'
OUTPUT
}

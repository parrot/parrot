#!perl

use strict;
use lib '../../lib';             # Finding Parrot/Config.pm
use lib '../../imcc';            # Finding imcc/TestCompiler.pm
use TestCompiler tests => 5;

my $parrot_home = '../..';
$ENV{PARROT} = "$parrot_home/parrot";

# Assemble PIR for simple pattern matching
sub get_pir
{
  my ( $string, $token ) = @_;

  my %regex = ( name     => q{[_a-zA-Z][_a-zA-Z0-9]*},
                quoted   => q{^`[^`]*'},
              );
  return q{
.include "library/pcre.imc"
.pcc_sub _main prototyped
  print	"\n"
  .sym pmc lib
  .PCRE_INIT(lib)
  .sym string error
  .sym int errptr
  .sym pmc code
  .sym string pat
  pat = "} . $regex{$token} . q{"
  .PCRE_COMPILE(pat, 0, code, error, errptr)
  $I0 = defined code
  unless $I0 goto match_err

  .sym int ok
  .sym pmc result
  .sym string s
  s = "} . $string . q{"
  .PCRE_MATCH(code, s, 0, 0, ok, result)
  if ok < 0 goto nomatch
  print ok
  print " match(es):\n"
  .sym int i
  i = 0
  .sym string match
  .sym string s
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
  output_is( $code, << 'OUTPUT', "'foo' is a name" );

1 match(es):
foo
OUTPUT
}
{
  my $code = get_pir( '_tmp', 'name' );
  output_is( $code, << 'OUTPUT', "'_tmp' is a name" );

1 match(es):
_tmp
OUTPUT
}
{
  my $code = get_pir( 'name2', 'name' );
  output_is( $code, << 'OUTPUT', "'name2' is a name" );

1 match(es):
name2
OUTPUT
}
{
  my $code = get_pir( "`quoted'", 'quoted' );
  output_is( $code, << 'OUTPUT', "'`quoted'' is a quoted string" );

1 match(es):
`quoted'
OUTPUT
}
{
  my $code = get_pir( "`'", 'quoted' );
  output_is( $code, << 'OUTPUT', "'`'' is a quoted string" );

1 match(es):
`'
OUTPUT
}

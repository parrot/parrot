#!perl

# $Id$

use strict;
use lib '../../lib';             # Finding Parrot/Config.pm
use lib '../../imcc';            # Finding imcc/TestCompiler.pm

use TestCompiler tests => 2;

my $parrot_home = '../..';
$ENV{PARROT} = "$parrot_home/parrot";

# Test some regular expressions needed for parsing m4-input files.
{
  output_is( << 'END_PIR', << 'OUTPUT', "call parrot and do something" );
.pcc_sub _main prototyped
  print	42
  print	"\n"
  end
.end
END_PIR
42
OUTPUT
}

# Test loading of pcre library, Perl compatible regular expressions
{
  my $code = << 'END_PIR';
.include "library/pcre.imc"
.pcc_sub _main prototyped
  print	"\n"
  .local pmc lib
  .PCRE_INIT(lib)
  .local string error
  .local int errptr
  .local pmc code
  .local string pat
  pat = "asdf"
  .PCRE_COMPILE(pat, 0, code, error, errptr)
  $I0 = defined code
  unless $I0 goto match_err

  .local int ok
  .local pmc result
  .local string s
  s = "0123asdf89"
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
END_PIR

  output_is( $code, << 'OUTPUT', "a simple match with libpcre" );

1 match(es):
asdf
OUTPUT
}

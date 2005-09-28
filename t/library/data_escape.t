#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/library/data_escape.t - Data::Escape tests

=head1 SYNOPSIS

	% perl t/harness t/library/data_escape.t

=cut

use strict;
use Parrot::Test;


my $lib= 'Data/Escape.pbc';
my $ns= 'Data::Escape';
my @subs= qw/ String /;

my $PRE=<<PRE;
.sub main \@MAIN
    load_bytecode "$lib"
PRE

my $POST=<<POST;
NOK:
    print "not "
OK:
    print "ok\\n"
END:
.end
POST


pir_output_is($PRE . <<CODE . $POST, <<'OUT', "load_bytecode");
	goto OK
CODE
ok
OUT


## find_global tests
for my $sub ( @subs )
{
pir_output_is($PRE . <<CODE . $POST, <<'OUT', "find_global '$sub'");
    .local pmc sub
    sub = find_global "$ns", "$sub"
    goto OK
CODE
ok
OUT
} ## end find_global tests


pir_output_is($PRE . <<CODE . $POST, <<'OUT', "escape_string: empty string");
	.local pmc escape_string
	.local string str

	escape_string = find_global "$ns", 'String'

	str = ""
	str = escape_string( str, "'" )

	print str
	print "\\n"
	goto END
CODE

OUT


pir_output_is($PRE . <<CODE . $POST, <<'OUT', "escape_string: no escapes");
	.local pmc escape_string
	.local string str

	escape_string = find_global "$ns", 'String'

	str = "abc 123"
	str = escape_string( str, "'" )

	print str
	print "\\n"
	goto END
CODE
abc 123
OUT


pir_output_is($PRE . <<CODE . $POST, <<'OUT', "escape_string: tab, carriage return, linefeed");
	.local pmc escape_string
	.local string str

	escape_string = find_global "$ns", 'String'

	str = "a\\tb\\nc\\r"
	str = escape_string( str, "'" )

	print str
	print "\\n"
	goto END
CODE
a\tb\nc\r
OUT


SKIP: {
	skip 'tests not written' => 5;
pir_output_is($PRE . <<CODE . $POST, <<'OUT', "escape_string: other characters less than 31", todo => 'test not written' );
CODE
ok
OUT


pir_output_is($PRE . <<CODE . $POST, <<'OUT', "escape_string: single quote", todo => 'test not written' );
CODE
ok
OUT


pir_output_is($PRE . <<CODE . $POST, <<'OUT', "escape_string: double quote", todo => 'test not written' );
CODE
ok
OUT


pir_output_is($PRE . <<CODE . $POST, <<'OUT', "escape_string: ascii", todo => 'test not written' );
CODE
ok
OUT


pir_output_is($PRE . <<CODE . $POST, <<'OUT', "escape_string: non-ascii", todo => 'test not written' );
CODE
ok
OUT
}


SKIP: {
	skip 'currently causes bus error' => 1;
pir_output_is($PRE . <<'CODE' . $POST, <<'OUT', "escape_string: freeze a simple pmc" );
  .local pmc escaper # I hardly know'er
  escaper = find_global "Data::Escape", "String"

  .local pmc original_pmc
  original_pmc = new String
  original_pmc = "ok"

  .local string frozen_pmc
  frozen_pmc = freeze original_pmc

  .local string escaped_frozen_pmc
  escaped_frozen_pmc = escaper(frozen_pmc)

  .local string pir_code
  pir_code = ".sub test @ANON\n$P1 = thaw \"%s\"\nprint $P1\n.end\n"

  .local pmc printf_args
  printf_args = new Array
  printf_args = 1
  printf_args[0] = escaped_frozen_pmc

  pir_code = sprintf pir_code, printf_args

  .local pmc pir_compiler
  pir_compiler = compreg "PIR"

  .local pmc compiled_sub
  compiled_sub = pir_compiler($S3)
  compiled_sub()
CODE
ok
OUT
}

## don't forget to change the number of tests!
BEGIN { plan tests => 11; }

# vim: ft=imc :

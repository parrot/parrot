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


my $lib= 'Data/Escape.imc';
my $ns= 'Data::Escape';
my @subs= qw/ String /;

my $PRE=<<PRE;
.sub main \@MAIN
    load_bytecode "$lib"

	.local pmc escape_string

	escape_string = find_global "$ns", 'String'
PRE

my $POST=<<'POST';
NOK:
    print "not "
OK:
    print "ok"
END:
	print "\n"
.end
POST


## 1
pir_output_is(<<CODE, <<'OUT', "load_bytecode");
.sub main \@MAIN
    load_bytecode "$lib"
	goto OK
NOK:
    print "not "
OK:
    print "ok"
END:
	print "\\n"
.end
CODE
ok
OUT


## find_global tests
for my $sub ( @subs )
{
pir_output_is(<<CODE, <<'OUT', "find_global '$sub'");
.sub main \@MAIN
    load_bytecode "$lib"
    .local pmc sub
    sub = find_global "$ns", "$sub"
    goto OK
NOK:
    print "not "
OK:
    print "ok"
END:
	print "\\n"
.end
CODE
ok
OUT
} ## end find_global tests


pir_output_is($PRE . <<'CODE' . $POST, <<'OUT', "escape_string: empty string");
	.local string str
	str = ""
	str = escape_string( str, '"' )

	print str
	goto OK
CODE
ok
OUT


pir_output_is($PRE . <<'CODE' . $POST, <<'OUT', "escape_string: no escapes");
	.local string str

	str = "abc 123"
	str = escape_string( str, '"' )

	print str
	goto END
CODE
abc 123
OUT


pir_output_is($PRE . <<'CODE' . $POST, <<'OUT', "escape_string: tab, carriage return, linefeed");
	.local string str

	str = "a\tb\nc"
	str = escape_string( str, '"' )

	print str
	goto END
CODE
a\tb\nc
OUT


SKIP: {
	skip 'tests not written' => 1;
pir_output_is($PRE . <<CODE . $POST, <<'OUT', "escape_string: other characters less than 32", todo => 'test not written' );
CODE
ok
OUT
}

pir_output_is($PRE . <<'CODE' . $POST, <<'OUT', "escape_string: single quote" );
	.local string str

	str = "a'b'c'"
	str = escape_string( str, "'" )

	print str
	goto END
CODE
a\'b\'c\'
OUT


pir_output_is($PRE . <<'CODE' . $POST, <<'OUT', "escape_string: double quote" );
	.local string str

	str = 'a"b"c"'
	str = escape_string( str, '"' )

	print str
	goto END
CODE
a\"b\"c\"
OUT


pir_output_is($PRE . <<'CODE' . $POST, <<'OUT', "escape_string: single  double: escape single" );
	.local string str

	str = "ab\"'\"'c"
	str = escape_string( str, "'" )

	print str
	goto END
CODE
ab"\'"\'c
OUT


pir_output_is($PRE . <<'CODE' . $POST, <<'OUT', "escape_string: single & double: escape double" );
	.local string str

	str = "ab\"'\"'c"
	str = escape_string( str, '"' )

	print str
	goto END
CODE
ab\"'\"'c
OUT


pir_output_is($PRE . <<'CODE' . $POST, <<'OUT', "escape_string: backslash" );
	.local string str

	str = '\ abc \t'
	str = escape_string( str )

	print str
	goto END
CODE
\\ abc \\t
OUT


SKIP: {
	skip 'test not written' => 1;
pir_output_is($PRE . <<'CODE' . $POST, <<'OUT', "escape_string: non-ascii", todo => 'test not written' );
CODE
ok
OUT
}


SKIP: {
	skip 'currently causes bus error' => 1;
pir_output_is($PRE . <<'CODE' . $POST, <<'OUT', "escape_string: freeze a simple pmc" );
  .local pmc original_pmc
  original_pmc = new String
  original_pmc = "ok"

  .local string frozen_pmc
  frozen_pmc = freeze original_pmc

  .local string escaped_frozen_pmc
  escaped_frozen_pmc = escape_string( frozen_pmc, '"' )

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
BEGIN { plan tests => 13; }

# vim: ft=imc :

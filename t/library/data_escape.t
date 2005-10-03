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


pir_output_is($PRE . <<CODE . $POST, <<'OUT', "escape_string: other characters less than 32" );
	.local string str, x

    .local int index
	index = 0
	str = ''

LOOP:
	if index >= 32 goto DONE

	x = chr index
	concat str, x

	inc index
	branch LOOP

DONE:
	str = escape_string( str, "'" )

	print str
	goto END
CODE
\000\001\002\003\004\005\006\007\010\t\n\013\014\015\016\017\020\021\022\023\024\025\026\027\030\031\032\033\034\035\036\037
OUT


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
	str = escape_string( str, '"' )

	print str
	goto END
CODE
\\ abc \\t
OUT


pir_output_is($PRE . <<'CODE' . $POST, <<'OUT', "escape_string: unprintable followed by numbers" );
	.local string str

	str = chr 2
	concat str, '123'
	str = escape_string( str, '"' )

	print str
	goto END
CODE
\002123
OUT


SKIP: {
	skip 'test not written' => 1;
pir_output_is($PRE . <<'CODE' . $POST, <<'OUT', "escape_string: non-ascii", todo => 'test not written' );
CODE
ok
OUT
}


pir_output_is($PRE . <<'CODE', <<'OUT', "escape_string: freeze a simple pmc" );
  .local pmc original_pmc
  original_pmc = new String
  original_pmc = "ok\n"

  .local string frozen_pmc
  frozen_pmc = freeze original_pmc

  .local string escaped_frozen_pmc
  escaped_frozen_pmc = escape_string( frozen_pmc, '"' )

  .local string pir_code
  pir_code = ".sub test @ANON\n$P1 = thaw binary:\""

  pir_code .= escaped_frozen_pmc
  pir_code .= "\"\nprint $P1\n.end\n"

  .local pmc pir_compiler
  pir_compiler = compreg "PIR"

  .local pmc compiled_sub
  compiled_sub = pir_compiler(pir_code)
  compiled_sub()
.end
CODE
ok
OUT

my @codes = qw/ 0666 0777 0888 0999 6666 7777 8888 9999/;

my $unicode_test = $PRE . << 'CODE' . $POST;
	.local string str
	str = unicode:"\u%s"
	str = escape_string( str, '"' )
	print str
	goto END
CODE

foreach my $codepoint (@codes) {
	pir_output_is(
		(sprintf $unicode_test, $codepoint),
		(sprintf "\\x{%i}\n", $codepoint),
		"escape_string: unicode: $codepoint"
	);
}

## don't forget to change the number of tests!
BEGIN { plan tests => 22; }

# vim: ft=imc :

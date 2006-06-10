#!perl -w

use Test::More;
use DotNetTesting;
use strict;

use Test::More tests => 4;

## Testing class for this file.
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public class Test
    {
        public string ret_string()
        {
            return "Hello world!\n";
        }

        public string ret_string_with_quotes()
        {
            return "I said, \"Hello world!\"\n";
        }

        public string ret_string_with_quotes_s()
        {
            return "I said, 'Hello world!'\n";
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'ret_string');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$S0 = obj.ret_string()
	print $S0
.end
PIR
Hello world!
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'ret_string_with_quotes');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$S0 = obj.ret_string_with_quotes()
	print $S0
.end
PIR
I said, "Hello world!"
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'ret_string_with_quotes_s');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$S0 = obj.ret_string_with_quotes_s()
	print $S0
.end
PIR
I said, 'Hello world!'
OUTPUT

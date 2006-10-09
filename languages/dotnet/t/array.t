#!perl 

use strict;
use warnings;
use lib qw( lib ../lib ../../lib dotnet dotnet/t );

use DotNetTesting;

use Test::More tests => 5;

## Testing class for this file.
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public class test_elem
    {
        public int value;
    }


    public class Test
    {
        public test_elem[] create_array()
        {
            test_elem[] x = new test_elem[5];
            return x;
        }

        public int array_length(test_elem[] x)
        {
            return x.Length;
        }

        public int create_and_length()
        {
            test_elem[] x = new test_elem[5];
            return x.Length;
        }

        public int loadstore_test()
        {
            test_elem[] x = new test_elem[5];

            for (int i = 0; i < x.Length; i++) {
                x[i] = new test_elem();
                x[i].value = i + 1;
            }
        
            int total = 0;
            for (int i = 0; i < x.Length; i++)
                total += x[i].value;
            return total;
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'create_array');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$P0 = obj.create_array()
	print $P0
	print "\n"
.end
PIR
5
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'array_length');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$P0 = obj.create_array()
	$I1 = obj.array_length($P0)
	print $I1
	print "\n"
.end
PIR
5
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'create_and_length');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.create_and_length()
	print $I0
	print "\n"
.end
PIR
5
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'loadstore_test');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.loadstore_test()
	print $I0
	print "\n"
.end
PIR
15
OUTPUT

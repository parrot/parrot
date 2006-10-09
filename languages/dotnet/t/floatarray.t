#!perl 

use strict;
use warnings;
use lib qw( lib ../lib ../../lib dotnet dotnet/t );

use DotNetTesting;

use Test::More tests => 3;

## Testing class for this file.t';
#
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public class Test
    {
        public float test_float()
        {
            float[] x = new float[5];

            for (int i = 0; i < x.Length; i++)
                x[i] = (float)i + (float)1.5;
            float total = 0;
            for (int i = 0; i < x.Length; i++)
                total += x[i];
            return total;
        }

        public double test_double()
        {
            double[] x = new double[5];

            for (int i = 0; i < x.Length; i++)
                x[i] = (double)i + 1.5;
            double total = 0;
            for (int i = 0; i < x.Length; i++)
                total += x[i];
            return total;
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'float');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$N0 = obj.test_float()
	print $N0
	print "\n"
.end
PIR
17.500000
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'double');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$N0 = obj.test_double()
	print $N0
	print "\n"
.end
PIR
17.500000
OUTPUT

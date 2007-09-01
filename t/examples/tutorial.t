#!perl
# Copyright (C) 2007 The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 18;
use Parrot::Config;

=head1 NAME

t/examples/tutorial.t - Test examples in F<examples/tutorial>

=head1 SYNOPSIS

    % prove t/examples/tutorial.t

=head1 DESCRIPTION

Test the examples in F<examples/tutorial>.

=head1 SEE ALSO

F<t/examples/pir.t>

=head1 AUTHORS

Bernhard Schmalhofer - <Bernhard.Schmalhofer@gmx.de>

Colin Kuskie - <ckuskie@sterling.net>

=cut

# Set up expected output for examples
my %expected = (
    '01_temp_var.pir' => << 'END_EXPECTED',
42
3.141590
Hello
Ford
END_EXPECTED

    '02_local_var.pir' => << 'END_EXPECTED',
42
3.141590
Hello
Ford
END_EXPECTED

    '03_temp_var_basic_pmcs.pir' => << 'END_EXPECTED',
42
6.35
Foo Bar Baz
END_EXPECTED

    '04_pod_comments.pir' => << 'END_EXPECTED',
Ignored Pod comments.
END_EXPECTED

    '10_math_ops.pir' => << 'END_EXPECTED',
7
5.200000
END_EXPECTED

    '11_math_ops_self_mod.pir' => << 'END_EXPECTED',
6
11.220000
END_EXPECTED

    '13_logical_ops.pir' => << 'END_EXPECTED',
0 2
1 2
END_EXPECTED

    '20_string_ops.pir' => << 'END_EXPECTED',
Hello, Zaphod!
END_EXPECTED

    ##Note extra whitespace after 3rd hello
    '21_string_ops_repeat.pir' => << 'END_EXPECTED',
Hello Hello Hello 
END_EXPECTED

    '22_string_ops_length.pir' => << 'END_EXPECTED',
5
END_EXPECTED

    '23_string_ops_substr.pir' => << 'END_EXPECTED',
bc
bc
abcde
bc
aXYZde
END_EXPECTED

    '24_string_ops_clone.pir' => << 'END_EXPECTED',
Ford
Zaphod
Zaphod
END_EXPECTED

    '30_arrays_basic.pir' => << 'END_EXPECTED',
Baz Foo Bar
Bar'
Bar
Baz
END_EXPECTED

    '31_array_ops_split.pir' => << 'END_EXPECTED',
the
brown
END_EXPECTED

    '32_array_ops_sprintf.pir' => << 'END_EXPECTED',
int 0x2a num +10.50

END_EXPECTED

    '33_hashes.pir' => << 'END_EXPECTED',
5
Integer
String
END_EXPECTED

    '34_multikey.pir' => << 'END_EXPECTED',
42
END_EXPECTED

#    '' => << 'END_EXPECTED',
#END_EXPECTED

);

my %skips = (
);

while ( my ( $example, $expected ) = each %expected ) {
    my $skip = $skips{$example};
    if ($skip) {
        my ( $cond, $reason ) = @{$skip};
        if ( eval "$cond" ) {
            Test::More->builder->skip("$example $reason");
            next;
        }
    }
    example_output_is( "examples/tutorial/$example", $expected );
}

TODO:
{
    local $TODO = 'some examples not passing yet';
    fail('12_math_ops_pasm.pir');
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

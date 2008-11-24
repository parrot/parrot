#!perl
# Copyright (C) 2007-2008 The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 34;
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
3.14159
Hello
Ford
END_EXPECTED

    '02_local_var.pir' => << 'END_EXPECTED',
42
3.14159
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
5.2
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
13
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

    '40_file_ops.pir' => << 'END_EXPECTED',
The quick brown fox jumps over the lazy dog.

END_EXPECTED

    '50_goto.pir' => << 'END_EXPECTED',
before branch
after branch
END_EXPECTED

##
## Output for when the test is not marked as "todo" anymore.
##
    #    '51_if_unless.pir' => << 'END_EXPECTED',
    #before if
    #after if
    #
    #before unless
    #is printed
    #after unless
    #-0.0 was false
    #END_EXPECTED

    '52_if_compare.pir' => << 'END_EXPECTED',
before if
after if
END_EXPECTED

    '53_loop.pir' => << 'END_EXPECTED',
120
END_EXPECTED

    '55_iterator.pir' => << 'END_EXPECTED',
foo
bar
baz
boz
END_EXPECTED

    '56_defined.pir' => << 'END_EXPECTED',
$P1 is defined
$P3 is undefined
END_EXPECTED

    '57_exists.pir' => << 'END_EXPECTED',
my_array[0] is defined
my_array[0] exists
my_array[1] is not defined
my_array[1] exists
my_array[2] is not defined
my_array[2] does not exist
END_EXPECTED

    '60_subroutines.pir' => << 'END_EXPECTED',
Hello, Zaphod
END_EXPECTED

    '61_namespaces.pir' => << 'END_EXPECTED',
Hello
END_EXPECTED

    '62_namespaces.pir' => << 'END_EXPECTED',
Hello, Zaphod
END_EXPECTED

    '70_class_object.pir' => << 'END_EXPECTED',
Hello
5
END_EXPECTED

    '81_continuation.pir' => << 'END_EXPECTED',
got argument: 4
continuation called
END_EXPECTED

    '82_coroutine.pir' => << 'END_EXPECTED',
2
3
END_EXPECTED

    '83_external_libraries.pir' => << 'END_EXPECTED',
22
END_EXPECTED

    '90_writing_tests.pir' => << 'END_EXPECTED',
1..4
ok 1 - first test
ok 2 - second test
ok 3 #skip skipped test
ok 4 # TODO 42
END_EXPECTED

);

my %skips = ();

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
    fail('11_math_ops_self_mod.pir');
    fail('12_math_ops_pasm.pir');
}

my @TODO_35 = ();
if ($^O =~ /Win32/) {
    @TODO_35 = ( todo => 'Failing on Win32' );
}
example_output_is( "examples/tutorial/51_if_unless.pir", << 'END_EXPECTED', @TODO_35 );
before if
after if

before unless
is printed
after unless
-0.0 was false
END_EXPECTED

# cleanup
{

    # The example '40_file_ops.pir' leave a temporary file.
    unlink '40_file_ops_data.txt';
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

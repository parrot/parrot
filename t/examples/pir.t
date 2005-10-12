#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/examples/pir.t - Test examples in F<examples/pir>

=head1 SYNOPSIS

    % perl -Ilib t/examples/pir.t

    % perl t/harness t/examples/pir.t

=head1 DESCRIPTION

Test the examples in F<examples/pir>.

=head1 TODO

Check on remaining examples.
Perhaps use Parrot::Test::run_command().

=head1 SEE ALSO

F<t/examples/pasm.t>

=head1 AUTHOR

Bernhard Schmalhofer - <Bernhard.Schmalhofer@gmx.de>

=cut

use strict;
use Parrot::Test tests => 4;
use Test::More;
use Parrot::Config;

my $PARROT = ".$PConfig{slash}$PConfig{test_prog}";

# Set up expected output for examples
my %expected = (
    'mandel.pir'        =>  << 'END_EXPECTED',
................::::::::::::::::::::::::::::::::::::::::::::...............
...........::::::::::::::::::::::::::::::::::::::::::::::::::::::..........
........::::::::::::::::::::::::::::::::::,,,,,,,:::::::::::::::::::.......
.....:::::::::::::::::::::::::::::,,,,,,,,,,,,,,,,,,,,,,:::::::::::::::....
...::::::::::::::::::::::::::,,,,,,,,,,,,;;;!:H!!;;;,,,,,,,,:::::::::::::..
:::::::::::::::::::::::::,,,,,,,,,,,,,;;;;!!/>&*|& !;;;,,,,,,,:::::::::::::
::::::::::::::::::::::,,,,,,,,,,,,,;;;;;!!//)|.*#|>/!;;;;;,,,,,,:::::::::::
::::::::::::::::::,,,,,,,,,,,,;;;;;;!!!!//>|:    !:|//!!;;;;;,,,,,:::::::::
:::::::::::::::,,,,,,,,,,;;;;;;;!!/>>I>>)||I#     H&))>////*!;;,,,,::::::::
::::::::::,,,,,,,,,,;;;;;;;;;!!!!/>H:  #|              IH&*I#/;;,,,,:::::::
::::::,,,,,,,,,;;;;;!!!!!!!!!!//>|.H:                     #I>!!;;,,,,::::::
:::,,,,,,,,,;;;;!/||>///>>///>>)|H                         %|&/;;,,,,,:::::
:,,,,,,,,;;;;;!!//)& :;I*,H#&||&/                           *)/!;;,,,,,::::
,,,,,,;;;;;!!!//>)IH:,        ##                            #&!!;;,,,,,::::
,;;;;!!!!!///>)H%.**           *                            )/!;;;,,,,,::::
                                                          &)/!!;;;,,,,,::::
,;;;;!!!!!///>)H%.**           *                            )/!;;;,,,,,::::
,,,,,,;;;;;!!!//>)IH:,        ##                            #&!!;;,,,,,::::
:,,,,,,,,;;;;;!!//)& :;I*,H#&||&/                           *)/!;;,,,,,::::
:::,,,,,,,,,;;;;!/||>///>>///>>)|H                         %|&/;;,,,,,:::::
::::::,,,,,,,,,;;;;;!!!!!!!!!!//>|.H:                     #I>!!;;,,,,::::::
::::::::::,,,,,,,,,,;;;;;;;;;!!!!/>H:  #|              IH&*I#/;;,,,,:::::::
:::::::::::::::,,,,,,,,,,;;;;;;;!!/>>I>>)||I#     H&))>////*!;;,,,,::::::::
::::::::::::::::::,,,,,,,,,,,,;;;;;;!!!!//>|:    !:|//!!;;;;;,,,,,:::::::::
::::::::::::::::::::::,,,,,,,,,,,,,;;;;;!!//)|.*#|>/!;;;;;,,,,,,:::::::::::
:::::::::::::::::::::::::,,,,,,,,,,,,,;;;;!!/>&*|& !;;;,,,,,,,:::::::::::::
...::::::::::::::::::::::::::,,,,,,,,,,,,;;;!:H!!;;;,,,,,,,,:::::::::::::..
.....:::::::::::::::::::::::::::::,,,,,,,,,,,,,,,,,,,,,,:::::::::::::::....
........::::::::::::::::::::::::::::::::::,,,,,,,:::::::::::::::::::.......
...........::::::::::::::::::::::::::::::::::::::::::::::::::::::..........
END_EXPECTED

    'sudoku.pir'        =>  << 'END_EXPECTED',
+---------+---------+---------+
| 1  .  . | .  .  . | .  .  . |
| .  .  2 | 7  4  . | .  .  . |
| .  .  . | 5  .  . | .  .  4 |
+---------+---------+---------+
| .  3  . | .  .  . | .  .  . |
| 7  5  . | .  .  . | .  .  . |
| .  .  . | .  .  9 | 6  .  . |
+---------+---------+---------+
| .  4  . | .  .  6 | .  .  . |
| .  .  . | .  .  . | .  7  1 |
| .  .  . | .  .  1 | .  3  . |
+---------+---------+---------+
init ok
+---------+---------+---------+
| 1  8  4 | 9  6  3 | 7  2  5 |
| 5  6  2 | 7  4  8 | 3  1  9 |
| 3  9  7 | 5  1  2 | 8  6  4 |
+---------+---------+---------+
| 2  3  9 | 6  5  7 | 1  4  8 |
| 7  5  6 | 1  8  4 | 2  9  3 |
| 4  1  8 | 2  3  9 | 6  5  7 |
+---------+---------+---------+
| 9  4  1 | 3  7  6 | 5  8  2 |
| 6  2  3 | 8  9  5 | 4  7  1 |
| 8  7  5 | 4  2  1 | 9  3  6 |
+---------+---------+---------+
solved
END_EXPECTED
                          );

# Do the testing
my %test_func = ( pasm => \&pasm_output_is,
                  pir  => \&pir_output_is,
                  imc  => \&pir_output_is );

while ( my ( $example, $expected ) = each %expected ) {
    my $code_fn   = "examples/pir/$example";
    my $code = Parrot::Test::slurp_file($code_fn);

    my ( $extension ) = $example =~ m{ [.]                  # introducing extension
                                       ( pasm | pir | imc ) # match and capture the extension
                                       \z                   # at end of string
                                     }ixms or Usage();
    if ( defined $extension ) { 
      $test_func{$extension}->($code, $expected, $code_fn);
    }
    else {
      ok( defined $extension, "no extension recognized for $code_fn" );
    }
}

# For testing md5sum.pir we need to pass a filename
{
  my $md5sum_fn = "examples$PConfig{slash}pir$PConfig{slash}md5sum.pir";
  my $sum = `$PARROT $md5sum_fn $md5sum_fn`;
  is( $sum, "0141db367bd8265f37926c16ccf5113a\t$md5sum_fn\n", $md5sum_fn );
}

# Testing pcre.imc with a simple pattern
{
  my $pcre_fn = "examples$PConfig{slash}pir$PConfig{slash}pcre.pir";
  my $test_out = `$PARROT $pcre_fn asdf as`;
  is( $test_out, << 'END_EXPECTED', $pcre_fn );
asdf =~ /as/
1 match(es):
as
END_EXPECTED
}

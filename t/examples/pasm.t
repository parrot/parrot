#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/examples/pasm.t - Test examples in F<examples/pasm>

=head1 SYNOPSIS

	% perl -Ilib t/examples/pasm.t

        % perl t/harness t/examples/pasm.t

=head1 DESCRIPTION

Test the examples in F<examples/assambly>.
For now only a fex examples are included here.

=head1 TODO

Check on remaining examples.

=head1 SEE ALSO

F<t/examples/japh.t>

=cut

use strict;
use Parrot::Test tests => 2;
use Test::More;

# Set up expected output for examples
my %expected = (

    'fact.pasm'        =>  << 'END_EXPECTED',
fact of 0 is: 1
fact of 1 is: 1
fact of 2 is: 2
fact of 3 is: 6
fact of 4 is: 24
fact of 5 is: 120
fact of 6 is: 720
END_EXPECTED

    'hello.pasm'        =>  << 'END_EXPECTED',
Hello World
END_EXPECTED
                          );

# Do the testing
my %test_func = ( pasm => \&pasm_output_is,
                  pir  => \&pir_output_is,
                  imc  => \&pir_output_is );

while ( my ( $example, $expected ) = each %expected )
{
    my $code_fn   = "examples/pasm/$example";
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

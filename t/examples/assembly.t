#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/examples/assembly.t - Test examples in F<examples/assembly>

=head1 SYNOPSIS

	% perl -Ilib t/examples/assembly.t

        % perl t/harness t/examples/assembly.t

=head1 DESCRIPTION

Test the examples in F<examples/assambly>.
For now only a fex examples are included here.

=head1 TODO

Check on remaining examples.

=head1 SEE ALSO

F<t/examples/japh.t>

=cut

use strict;
use Parrot::Test tests => 1;
use Test::More;

# Set up expected output for examples
my %expected = (
    'getopt_demo.imc'        =>  << 'END_EXPECTED',
Hi, I am 'getopt_demo.imc'.

You haven't passed the option '--bool'. This is fine with me.
You haven't passed the option '--string'. This is fine with me.
You haven't passed the option '--integer'. This is fine with me.
All args have been parsed.
END_EXPECTED
                          );

# Do the testing
my %test_func = ( pasm => \&pasm_output_is,
                  pir  => \&pir_output_is,
                  imc  => \&pir_output_is );

while ( my ( $example, $expected ) = each %expected )
{
    my $code_fn   = "examples/assembly/$example";
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

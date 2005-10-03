#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/examples/subs.t - Test examples in F<examples/subs>

=head1 SYNOPSIS

	% perl -Ilib t/examples/subs.t

        % perl t/harness t/examples/subs.t

=head1 DESCRIPTION

Test the examples in F<examples/subs>.

=head1 SEE ALSO

F<t/examples/japh.t>
F<t/examples/assembly.t>

=cut

use strict;
use Parrot::Test tests => 4;
use Test::More;

# Set up expected output for examples
my %expected = (
    'pasm_sub1.pasm'        =>  << 'END_EXPECTED',
Hello from subroutine
Hello from main
END_EXPECTED

    'sub1.imc'        =>  << 'END_EXPECTED',
7 8 nine
return: 10
END_EXPECTED

    'sub2.imc'        =>  << 'END_EXPECTED',
return: 10 11 12
END_EXPECTED

    'sub3.imc'        =>  << 'END_EXPECTED',
7 8 nine
END_EXPECTED
                          );

# Do the testing
my %test_func = ( pasm => \&pasm_output_is,
                  pir  => \&pir_output_is,
                  imc  => \&pir_output_is );

while ( my ( $example, $expected ) = each %expected )
{
    my $code_fn   = "examples/subs/$example";
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

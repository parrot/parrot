#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/examples/pir.t - Test examples in F<examples/past>

=head1 SYNOPSIS

    % perl -Ilib t/examples/past.t

    % perl t/harness t/examples/past.t

=head1 DESCRIPTION

Test the examples in F<examples/past>.

=head1 TODO

Perhaps use Parrot::Test::run_command().

=head1 SEE ALSO

F<t/examples/pasm.t>

=head1 AUTHOR

Bernhard Schmalhofer - <Bernhard.Schmalhofer@gmx.de>

=cut

use strict;
use Parrot::Test tests => 1;
use Test::More;
use Parrot::Config;

my $PARROT = ".$PConfig{slash}$PConfig{test_prog}";

# Set up expected output for examples
my %expected = (
    'hello.past'        =>  << 'END_EXPECTED',
Hello PAST
END_EXPECTED
                          );

# Do the testing
my %test_func = ( pasm => \&pasm_output_is,
                  past => \&past_output_is,
                  pir  => \&pir_output_is,
                  imc  => \&pir_output_is );

while ( my ( $example, $expected ) = each %expected ) {
    my $code_fn   = "examples/past/$example";
    my $code = Parrot::Test::slurp_file($code_fn);

    my ( $extension ) = $example =~ m{ [.]                         # introducing extension
                                       ( pasm | pir | imc | past ) # match and capture the extension
                                       \z                          # at end of string
                                     }ixms or Usage();
    if ( defined $extension ) { 
      $test_func{$extension}->($code, $expected, $code_fn);
    }
    else {
      ok( defined $extension, "no extension recognized for $code_fn" );
    }
}

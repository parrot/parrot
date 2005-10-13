#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/examples/library.t - Test examples in F<examples/library>

=head1 SYNOPSIS

	% perl -Ilib t/examples/library.t

        % perl t/harness t/examples/library.t

=head1 DESCRIPTION

Test the examples in F<examples/library>.


=head1 SEE ALSO

F<t/examples/japh.t>

=cut

use strict;
use Parrot::Test tests => 3;
use Test::More;
use Parrot::Config;

my $PARROT = ".$PConfig{slash}$PConfig{test_prog}";

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
    my $code_fn = "examples/library/$example";
    my $code    = Parrot::Test::slurp_file($code_fn);

    my ( $extension ) = $example =~ m{ [.]                  # introducing extension
                                       ( pasm | pir | imc ) # match and capture the extension
                                       \z                   # at end of string
                                     }ixms or Usage();
    if ( defined $extension ) { 
      $test_func{$extension}->($code, $expected, $code_fn);
    }
    else {
      fail( "no extension recognized for $code_fn" );
    }
}


# For testing md5sum.pir we need to pass a filename
{
    my $md5sum_fn = "examples$PConfig{slash}library$PConfig{slash}md5sum.pir";
    my $sample_fn = "t$PConfig{slash}library$PConfig{slash}perlhist.txt";
    my $sum = `$PARROT $md5sum_fn $sample_fn`;
    is( $sum, "fb171bd1a17bf6cd08d73105ad738a35\t$sample_fn\n", $md5sum_fn );
}


# Testing pcre.imc with a simple pattern, if we have PCRE
my $cmd = ($^O =~ /MSWin32/) ? "pcregrep --version" : "pcre-config --version";
my $has_pcre = Parrot::Test::run_command($cmd, STDERR => '/dev/null') == 0;
SKIP:
{
    skip( "no pcre-config", 1 ) unless $has_pcre;
    my $pcre_fn = "examples$PConfig{slash}library$PConfig{slash}pcre.pir";
    my $test_out = `$PARROT $pcre_fn asdf as`;
    is( $test_out, << 'END_EXPECTED', $pcre_fn );
asdf =~ /as/
1 match(es):
as
END_EXPECTED
};

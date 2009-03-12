# $Id$

=head1 NAME

lisp/t/lexicals.t - test lexical variables

=head1 DESCRIPTION

PDD20 compatibility.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib", "$FindBin::Bin/../../../lib";

# core Perl modules
use Test::More;

# Parrot modules
use Parrot::Test;

my @test_cases_without_exit_code = (
    [ q{ ( setq a 42 ) ( print a ) },
      q{42},
      q{not a lexical},
    ],
    # infinity lurking here
    #[ q{ ( let (( x 2 )) ( print x ) )
      #},
      #qr{has no value},
      #q{no lexicals yet}
    #],
);

my @test_cases_with_exit_code = (
);

Test::More::plan( tests =>   scalar @test_cases_without_exit_code
                           + scalar @test_cases_with_exit_code );

foreach ( @test_cases_without_exit_code )
{
    my ( $code, $out, $desc, @other ) = @{ $_ };

    $desc ||= substr( $code, 0, 32 ); 
    language_output_is( 'Lisp', $code, $out . "\n", $desc, @other );
}

foreach ( @test_cases_with_exit_code )
{
    my ( $code, $regex, $desc, @other ) = @{ $_ };

    $desc ||= substr( $code, 0, 32 ); 
    language_error_output_like( 'Lisp', $code, $regex, $desc, @other );
}

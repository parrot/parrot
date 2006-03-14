# $Id$

=head1 NAME

Test/M4.pm - Testing routines specific to 'm4'.

=head1 DESCRIPTION

Call 'Parrot m4' and 'GNU m4'.

=cut

package Parrot::Test::M4;

use strict;
use warnings;
use 5.008;

use Data::Dumper;
use File::Basename;

use Parrot::Test;
use Parrot::Test::M4::Gnu;
use Parrot::Test::M4::PIR;

our $VERSION = 0.01;

=head1 METHODS

=head2 new

A kind of factory, that finds the proper subclass of Parrot::Test::M4.
XXX: Do not configure with environment variables.

=cut

sub new {
    return $ENV{PARROT_M4_TEST_PROG} ?
        ( bless {}, 'Parrot::Test::M4::Gnu' )              
        :
        ( bless {}, 'Parrot::Test::M4::PIR' );              
}

my %language_test_map = (
    output_is         => 'is_eq',
    output_like       => 'like',
    output_isnt       => 'isnt_eq',
                        );

foreach my $func ( keys %language_test_map ) {
    no strict 'refs';            ## no critic

    *{"Parrot::Test::M4::$func"} = sub ($$;$) {
        my $self = shift;
        my ( $code, $output, $desc ) = @_;
  
        my $count = $self->{builder}->current_test + 1;

        # flatten filenames (don't use directories)
        my $lang_fn        = Parrot::Test::per_test( '.m4', $count );
        my $m4_out_fn = $self->get_out_fn( $count );
        my @test_prog = $self->get_test_prog( $count );

        # This does nor create byte code, but m4 code
        my $parrotdir       = dirname( $self->{parrot} );
        Parrot::Test::generate_code( $code, $parrotdir, $count, $lang_fn );

        # STDERR is written into same output file
        my $exit_code = Parrot::Test::run_command( 
                            \@test_prog, 
                            CD     => $self->{relpath}, 
                            STDOUT => $m4_out_fn,
                            STDERR => $m4_out_fn 
                        );
  
        my $builder_func = $language_test_map{$func};
        # That's the reason for:   no strict 'refs';
        my $pass = $self->{builder}->$builder_func(
                       Parrot::Test::slurp_file($m4_out_fn),
                       $output,
                       $desc
                                                  );
        if ( ! $pass ) {
            my $diag = q{};
            my $test_prog = join ' && ', @test_prog;
            if ( $exit_code ) {
                $diag .= "'$test_prog' failed with exit code $exit_code."
            }
            if ( $diag ) {
                $self->{builder}->diag( $diag )
            }
        }

        # The generated files are left in the t/* directories.
        # Let 'make clean' and 'svn:ignore' take care of them.

        return $pass;
    }
}

1;

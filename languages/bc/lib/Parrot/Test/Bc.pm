# $Id$

package Parrot::Test::Bc;

use strict;

use Data::Dumper;
use File::Basename;

use Parrot::Test;
use Parrot::Test::Bc::Antlr2;
use Parrot::Test::Bc::Antlr3;
use Parrot::Test::Bc::Posix;

=head1 NAME

Test/Bc.pm - Testing routines specific to 'bc'.

=head1 DESCRIPTION

Call 'Parrot bc' and 'POSIX bc'.

=head1 METHODS

=head2 new

A kind of factory, that finds the proper subclass of Parrot::Test::Bc.
XXX: Do not configure with environment variables.

=cut

sub new {
    return $ENV{PARROT_BC_TEST_PROG} ?
        ( bless {}, 'Parrot::Test::Bc::Posix' )              
        :
        ( bless {}, 'Parrot::Test::Bc::Antlr2' );              
}

my %language_test_map = (
    output_is         => 'is_eq',
    output_like       => 'like',
    output_isnt       => 'isnt_eq'
                        );

foreach my $func ( keys %language_test_map ) {
    no strict 'refs';

    *{"Parrot::Test::Bc::$func"} = sub {
        my $self = shift;
        my ( $code, $output, $desc, %options ) = @_;
  
        my $count = $self->{builder}->current_test + 1;

        # flatten filenames (don't use directories)
        # The 'with_past' option indicates which on should be tested
        my $bc_out_fn = $self->get_out_fn( $count );
        my @test_prog = $self->get_test_prog( $count, $options{with_past} );

 
        # This does not create byte code, but bc code
        my $parrotdir = dirname( $self->{parrot} );
        my $lang_fn   = Parrot::Test::per_test( '.bc', $count );
        Parrot::Test::generate_code( $code, $parrotdir, $count, $lang_fn );

        # STDERR is written into same output file
        # die Dumper( \@test_prog );
        my $exit_code = Parrot::Test::run_command( 
                            \@test_prog, 
                            CD     => $self->{relpath}, 
                            STDOUT => $bc_out_fn,
                            STDERR => $bc_out_fn 
                        );
  
        my $builder_func = $language_test_map{$func};
        # That's the reason for:   no strict 'refs';
        my $pass = $self->{builder}->$builder_func(
                       Parrot::Test::slurp_file($bc_out_fn),
                       $output,
                       $desc
                                                  );
        unless ( $pass ) {
            my $diag = '';
            my $test_prog = join ' && ', @test_prog;
            $diag .= "'$test_prog' failed with exit code $exit_code." if $exit_code;
            $self->{builder}->diag( $diag ) if $diag;
        }

        # The generated files are left in the t/* directories.
        # Let 'make clean' and '.cvsignore' take care of them.

        return $pass;
    }
}

1;

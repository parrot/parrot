# $Id$

package Parrot::Test::Bc;

use strict;

use Data::Dumper;
use File::Basename;

require Parrot::Test;

=head1 NAME

Test/Bc.pm - Testing routines specific to 'bc'.

=head1 DESCRIPTION

Call 'Parrot bc' and 'POSIX bc'.

=head1 METHODS

=head2 new

Yet another constructor.

=cut

sub new {
    return bless {};
}

my %language_test_map = (
    output_is         => 'is_eq',
    output_like       => 'like',
    output_isnt       => 'isnt_eq'
                        );

foreach my $func ( keys %language_test_map ) {
    no strict 'refs';

    *{"Parrot::Test::Bc::$func"} = sub ($$;$) {
        my $self = shift;
        my ( $code, $output, $desc ) = @_;
  
        my $count = $self->{builder}->current_test + 1;

        # flatten filenames (don't use directories)
        my $lang_f         = Parrot::Test::per_test( '.bc', $count );
        my $pir_f          = Parrot::Test::per_test( '.pir', $count );
        my $bc_out_f       = Parrot::Test::per_test( $ENV{PARROT_BC_TEST_PROG} ? '.posix_out' : '.parrot_out', $count );
        my $test_prog_args = $ENV{TEST_PROG_ARGS} || '';
        my @test_prog      = $ENV{PARROT_BC_TEST_PROG} ?
                 ( "$ENV{PARROT_BC_TEST_PROG}  ${test_prog_args} languages/${lang_f}" ):
                 ( "python languages/bc/bc.py languages/${lang_f}", 
                   "$self->{parrot} languages/${pir_f}" );

        # This does nor create byte code, but bc code
        my $parrotdir       = dirname( $self->{parrot} );
        Parrot::Test::generate_code( $code, $parrotdir, $count, $lang_f );

        # STDERR is written into same output file
        my $exit_code = Parrot::Test::run_command( 
            \@test_prog, 
            CD => $self->{relpath}, 
            STDOUT => $bc_out_f, STDERR => $bc_out_f 
        );
  
        my $builder_func = $language_test_map{$func};
        # That's the reason for:   no strict 'refs';
        my $pass = $self->{builder}->$builder_func(
                       Parrot::Test::slurp_file($bc_out_f),
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

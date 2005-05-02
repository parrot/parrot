# $Id$

use strict;

package Parrot::Test::m4;

require Parrot::Test;
use File::Basename;


=head1 NAME

Test/m4.pm - Testing routines specific to 'm4'.

=head1 DESCRIPTION

Call 'Parrot m4' and 'GNU m4'.

=head1 METHODS

=head2 new

Yet another constructor.

=cut

sub new {
    return bless {};
}


=head2 output_is

This gets called when language_output_is() is called in a test file.

=cut

sub output_is {
    my $self = shift;
    my ( $code, $output, $desc ) = @_;
  
    my $count = $self->{builder}->current_test + 1;

    # flatten filenames (don't use directories)
    my $lang_f          = Parrot::Test::per_test( '.m4', $count );
    my $parrot_m4_out_f = Parrot::Test::per_test( '.parrot_out', $count );
    my $gnu_m4_out_f    = Parrot::Test::per_test( '.gnu_out', $count );

    my $test_prog_args = $ENV{TEST_PROG_ARGS} || '';
    my $parrot_m4      = "$self->{parrot} languages/m4/m4.pbc ${test_prog_args} languages/${lang_f}";
    my $gnu_m4         = "m4 ${test_prog_args} languages/${lang_f}";

    # This does nor create byte code, but m4 code
    my $parrotdir       = dirname( $self->{parrot} );
    Parrot::Test::generate_code( $code, $parrotdir, $count, $lang_f );

    # STDERR is written into same output file
    my $parrot_exit_code = Parrot::Test::run_command( 
        $parrot_m4, 
        CD => $self->{relpath}, 
        STDOUT => $parrot_m4_out_f, STDERR => $parrot_m4_out_f 
    );
    my $gnu_exit_code    = Parrot::Test::run_command( 
        $gnu_m4,
        CD => $self->{relpath},
        STDOUT => $gnu_m4_out_f,    STDERR => $gnu_m4_out_f 
    );
  
    my $pass = $self->{builder}->is_eq( Parrot::Test::slurp_file($parrot_m4_out_f) . Parrot::Test::slurp_file($gnu_m4_out_f),
                                        $output . $output,
                                        $desc );
    unless ( $pass )
    {
      my $diag = '';
      $diag .= "'$parrot_m4' failed with exit code $parrot_exit_code." if $parrot_exit_code;
      $diag .= "'$gnu_m4' failed with exit code $gnu_exit_code.";
      $self->{builder}->diag( $diag ) if $diag;
    }

    # The generated files are left in the t/* directories.
    # Let 'make clean' and '.cvsignore' take care of them.

    return $pass;
}

1;

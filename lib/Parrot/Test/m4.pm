# $Id$

use strict;

use Data::Dumper;
use File::Basename;

package Parrot::Test::m4;

=head1 NAME

Test/m4.pm - Testing routines specific to 'm4'.

=head1 DESCRIPTION

Call 'Parrot m4' and 'GNU m4'.

=head1 METHODS

=head2 new

Yet another constructor.

=cut

sub new 
{
  return bless {};
}


=head2 output_is

This gets called when language_output_is() is called in a test file.

=cut

sub output_is 
{
  my $self = shift;
  my ( $code, $output, $desc ) = @_;
  
  my $count = $self->{builder}->current_test + 1;

  # flatten filenames (don't use directories)
  my $lang_f          = Parrot::Test::per_test( '.m4', $count );
  my $parrot_m4_out_f = Parrot::Test::per_test( '.parrot_out', $count );
  my $gnu_m4_out_f    = Parrot::Test::per_test( '.gnu_out', $count );

  my $test_prog_args = $ENV{TEST_PROG_ARGS} || '';
  my $parrot_m4      = "(cd $self->{relpath} && $self->{parrot} languages/m4/m4.pbc ${test_prog_args} languages/${lang_f})";
  my $gnu_m4         = "(cd $self->{relpath} && m4 ${test_prog_args} languages/${lang_f})";

  # This does nor create byte code, but m4 code
  my $parrotdir       = File::Basename::dirname( $self->{parrot} );
  Parrot::Test::generate_pbc_for( $code, $parrotdir, $count, $lang_f );

  # TODO: Don't ignore STDERR
  my $exit_code = Parrot::Test::_run_command( $parrot_m4, STDOUT => $parrot_m4_out_f );
  $exit_code    = Parrot::Test::_run_command( $gnu_m4,    STDOUT => $gnu_m4_out_f );
  
  my $pass = $self->{builder}->is_eq( Parrot::Test::slurp_file($parrot_m4_out_f) . Parrot::Test::slurp_file($gnu_m4_out_f), , $output . $output, $desc );
  $self->{builder}->diag( "'$parrot_m4' failed with exit code $exit_code" ) if $exit_code and not $pass;
  # die Data::Dumper::Dumper( $lang_f, `pwd`, $parrot_m4, $parrotdir,  $parrot_m4_out_f );

  # The generated files are left in the t/* directories.
  # Let 'make clean' and '.cvsignore' take care of them.

  return $pass;
}

1;

# $Id$

use strict;

use File::Basename;

package Parrot::Test::m4;

use Data::Dumper;

=head1

Provide language specific testing routines here...

This is currently alarmingly similar to the generated subs in Parrot::Test.
Perhaps someone can do a better job of delegation here.

=cut

sub new 
{
  return bless {};
}

sub output_is() 
{
  my ( $self, $code, $output, $desc ) = @_;
  
  my $count = $self->{builder}->current_test + 1;

  # flatten filenames (don't use directories)
  # but, always put the test in a tempdir, so we're not cluttering
  my $lang_f          = Parrot::Test::per_test( '.m4', $count );
  $lang_f             = ( File::Spec->splitpath( $lang_f ) )[2];
  $lang_f             = File::Spec->catfile( File::Spec->tmpdir(), $lang_f );

  my $parrot_m4_out_f = Parrot::Test::per_test( '.parrot_out', $count );
  $parrot_m4_out_f    = ( File::Spec->splitpath( $parrot_m4_out_f ) )[2];
  $parrot_m4_out_f    = File::Spec->catfile( File::Spec->tmpdir(), $parrot_m4_out_f );

  my $gnu_m4_out_f    = Parrot::Test::per_test( '.gnu_out', $count );
  $gnu_m4_out_f       = ( File::Spec->splitpath( $gnu_m4_out_f ) )[2];
  $gnu_m4_out_f       = File::Spec->catfile( File::Spec->tmpdir(), $gnu_m4_out_f );

  my $parrotdir       = File::Basename::dirname( $self->{parrot} );
  Parrot::Test::generate_pbc_for( $code, $parrotdir, $count, $lang_f );

  my $test_prog_args = $ENV{TEST_PROG_ARGS} || '';
  my $parrot_m4      = "(cd $self->{relpath} &&  $self->{parrot} languages/m4/m4.pbc ${test_prog_args} ${lang_f})";
  my $gnu_m4         = "(cd $self->{relpath} && m4 ${test_prog_args} ${lang_f})";

  # For some reason, if you redirect both STDERR and STDOUT here, 
  # you get a 38M file of garbage. We'll temporarily assume everything
  # works and ignore stderr.
  my $exit_code = Parrot::Test::_run_command( $parrot_m4, STDOUT => $parrot_m4_out_f );
  $exit_code = Parrot::Test::_run_command( $gnu_m4, STDOUT => $gnu_m4_out_f );
  
  my $pass = $self->{builder}->is_eq( Parrot::Test::slurp_file($parrot_m4_out_f) . Parrot::Test::slurp_file($parrot_m4_out_f), , $output . $output, $desc );
  $self->{builder}->diag( "'$parrot_m4' failed with exit code $exit_code" ) if $exit_code and not $pass;

  unless ( $ENV{POSTMORTEM} ) 
  {
    unlink( $lang_f );
    unlink( $parrot_m4_out_f );
    unlink( $gnu_m4_out_f );
  }

  return $pass;
}

1;

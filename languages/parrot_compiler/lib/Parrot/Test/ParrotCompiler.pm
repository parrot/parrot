# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;

use Data::Dumper;
use File::Basename;

package Parrot::Test::ParrotCompiler;

=head1 NAME

Parrot/Test/ParrotCompiler.pm - Testing routines specific to 'ParrotCompiler'.

=head1 DESCRIPTION

Calls 'parrot_compiler.pbc'.

=head1 METHODS

=head2 new

Yet another constructor.

=cut

sub new 
{
  return bless {};
}


=head2 gen_output

Called in output_is(),
which gets called when language_output_is() is called in a test file.

=cut

sub gen_output 
{
  my $self = shift;
  my ( $code, $test_no ) = @_;
  
  # flatten filenames (don't use directories)
  my $code_f   = Parrot::Test::per_test( '.code', $test_no );
  my $out_f    = Parrot::Test::per_test( '.out', $test_no );

  my $test_prog_args = $ENV{TEST_PROG_ARGS} || '';
  my $cmd      = "(cd $self->{relpath} && $self->{parrot} languages/parrot_compiler/parrot_compiler.pbc $test_prog_args < languages/$code_f)";

  my $parrotdir       = File::Basename::dirname( $self->{parrot} );
  Parrot::Test::generate_code( $code, $parrotdir, $test_no, $code_f );

  # STDERR is written into same output file
  my $diag = '';
  my $parrot_exit_code = Parrot::Test::_run_command( $cmd, STDOUT => $out_f, STDERR => $out_f );
  $diag .= "'$cmd' failed with exit code $parrot_exit_code." if $parrot_exit_code;
  $self->{builder}->diag( $diag ) if $diag;
  
  return Parrot::Test::slurp_file($out_f);
}


=head2 output_is

This gets called when language_output_is() is called in a test file.

=cut

sub output_is 
{
  my $self = shift;
  my ( $code, $expected, $desc ) = @_;
  
  my $test_no = $self->{builder}->current_test + 1;

  my $output = $self->gen_output( $code, $test_no ); 
  
  my $pass = $self->{builder}->is_eq( $output, $expected, $desc );

  return $pass;
}

1;

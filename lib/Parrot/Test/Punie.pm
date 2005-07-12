package Parrot::Test::Punie;

use File::Basename;

=head1 NAME

Parrot::Test::Punie -- testing routines for languages/punie

This is largely a copy of Parrot::Test::Tcl, which looks like it's
largely a copy of Parrot::Test::Python. Abstraction needed.

=cut

sub new {
  return bless {};
}

sub output_is() {

  my ($self, $code, $output, $desc) = @_;
  
  $count = $self->{builder}->current_test + 1;

  $desc = $language unless $desc;
  
  my $lang_f = Parrot::Test::per_test('.p1',$count);
  my $out_f = Parrot::Test::per_test('.out',$count);
  my $parrotdir = dirname $self->{parrot};

  $TEST_PROG_ARGS = $ENV{TEST_PROG_ARGS} || '';
  my $args = $TEST_PROG_ARGS;

  $lang_f = File::Spec->rel2abs($lang_f);
  $out_f = File::Spec->rel2abs($out_f);
  Parrot::Test::generate_code( $code, $parrotdir, $count, $lang_f );

  my $cmd;
  my $exit_code = 0;
  my $pass = 0;

  $cmd = "$self->{parrot} $args languages/punie/punie.pbc $lang_f";

  # For some reason, if you redirect both STDERR and STDOUT here, 
  # you get a 38M file of garbage. We'll temporarily assume everything
  # works and ignore stderr.
  $exit_code = Parrot::Test::run_command($cmd, CD => $self->{relpath},
					 STDOUT => $out_f);
  
  unless ($pass) {
    my $file = Parrot::Test::slurp_file($out_f);
    $pass =$self->{builder}->is_eq( Parrot::Test::slurp_file($out_f), $output, $desc );
    $self->{builder}->diag("'$cmd' failed with exit code $exit_code")
      if $exit_code and not $pass;
  }

  unless($ENV{POSTMORTEM}) {
    unlink $lang_f;
    unlink $out_f;
  }

  return $pass;
}

1;

package Parrot::Test::Python;

use File::Basename;

=head1

Provide language specific testing routines here...

This is currently alarmingly similar to the generated subs in Parrot::Test.
Perhaps someone can do a better job of delegation here.

=cut

sub new {
  return bless {};
}

sub output_is() {

    my ($self, $code, $output, $desc) = @_;

    $count = $self->{builder}->current_test + 1;

    $desc = $language unless $desc;

    my $lang_f = Parrot::Test::per_test('.py',$count);
    my $pir_f = Parrot::Test::per_test('.pir',$count);
    # need .py file in current dir for import
    $lang_f = (File::Spec->splitpath($lang_f))[2];
    my $py_out_f = "$lang_f.out";
    my $pir_out_f = "$pir_f.out";
    my $parrotdir = dirname $self->{parrot};

    $TEST_PROG_ARGS = $ENV{TEST_PROG_ARGS} || '';
    my $args = $TEST_PROG_ARGS;

    Parrot::Test::generate_pbc_for( $code, $parrotdir, $count, $lang_f );

    my ($pycmd, $cmd, $pass, $dir);
    my $exit_code = 0;

    $pycmd = "python  $lang_f";
    $cmd = "perl pie-thon.pl $lang_f";

    # For some reason, if you redirect both STDERR and STDOUT here,
    # you get a 38M file of garbage. We'll temporarily assume everything
    # works and ignore stderr.
    $exit_code = Parrot::Test::_run_command($pycmd, STDOUT => $py_out_f);
    my $py_file = Parrot::Test::slurp_file($py_out_f);
    my $pir_file;

    $exit_code |= Parrot::Test::_run_command($cmd,
	    STDOUT => $pir_f, STDERR => $pir_f);
    if ($exit_code) {
	$pir_file = Parrot::Test::slurp_file($pir_f);
    }
    else {
	$cmd = $self->{relpath}. $self->{parrot} . " --python ${args} $pir_f";
	# print STDERR "$cmd\n";
	$exit_code = Parrot::Test::_run_command($cmd, STDOUT => $pir_out_f);
	$pir_file = Parrot::Test::slurp_file($pir_out_f);
    }
    $pass = $self->{builder}->is_eq( $pir_file, $py_file, $desc );
    $self->{builder}->diag("'$cmd' failed with exit code $exit_code")
    if $exit_code and not $pass;

    unless($ENV{POSTMORTEM}) {
	unlink $lang_f;
	unlink $py_out_f;
	unlink $pir_out_f;
	unlink $pir_f;
    }

    return $pass;
}

1;

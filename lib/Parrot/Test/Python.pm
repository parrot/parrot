package Parrot::Test::Python;

use File::Basename;

=head1 Parrot::Test::Python

Provide language specific testing routines here...

This is currently alarmingly similar to the generated subs in Parrot::Test.
Perhaps someone can do a better job of delegation here.

Note: this current verion is based on Pirate.  Previous versions were
based on ast2past and versions before that on pie-thon.

=cut

sub new {
  return bless {};
}

sub output_is() {

    my ($self, $code, $output, $desc) = @_;

    $count = $self->{builder}->current_test + 1;

    $desc = $language unless $desc;

    my $lang_f = Parrot::Test::per_test('.py',$count);
    my $py_out_f = "$lang_f.out";
    my $pirate_out_f = Parrot::Test::per_test('.pirate.out',$count);
    my $parrotdir = dirname $self->{parrot};

    $TEST_PROG_ARGS = $ENV{TEST_PROG_ARGS} || '-j -Oc';
    my $args = $TEST_PROG_ARGS;

    Parrot::Test::generate_code( $code, $parrotdir, $count, $lang_f );

    my ($pycmd, $cmd, $pass, $dir);
    my $exit_code = 0;

    $pycmd = "python  $lang_f";
    $cmd = "pirate $lang_f";

    # For some reason, if you redirect both STDERR and STDOUT here,
    # you get a 38M file of garbage. We'll temporarily assume everything
    # works and ignore stderr.
    $exit_code = Parrot::Test::run_command($pycmd, STDOUT => $py_out_f);
    my $py_file = Parrot::Test::slurp_file($py_out_f);
    my $pirate_file;

    $exit_code |= Parrot::Test::run_command($cmd,
	    STDOUT => $pirate_out_f);
	$pirate_file = Parrot::Test::slurp_file($pirate_out_f);
    $pass = $self->{builder}->is_eq( $pirate_file, $py_file, $desc );
    $self->{builder}->diag("'$cmd' failed with exit code $exit_code")
    if $exit_code and not $pass;

    unless($ENV{POSTMORTEM}) {
	unlink $lang_f;
	unlink $py_out_f;
	unlink $pirate_out_f;
    }

    return $pass;
}

1;

package Parrot::Test::Tcl;

use File::Basename;

require Parrot::Test;

=head1 Parrot::Test::Tcl

Provide language specific testing routines here...

This is currently alarmingly similar to the generated subs in Parrot::Test.
Perhaps someone can do a better job of delegation here.

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

  *{"Parrot::Test::Tcl::$func"} = sub ($$;$) {

    my ($self, $code, $output, $desc) = @_;
  
    $count = $self->{builder}->current_test + 1;

    $desc = $language unless $desc;

    # Figure out how many levels we have to go back to get to parrot.
    # And, conversely, how many levels we have to go down to get to
    # the tcl binary.

    # There are basically 3 choices: run in one of:
    #  languages
    #  languages/tcl
    #  languages/tcl/t

    my $path_to_parrot = $INC{"Parrot/Config.pm"};
    $path_to_parrot =~ s:/lib/Parrot/Config.pm$::;
    my $dir_count = scalar(File::Spec->splitdir($path_to_parrot));
    my $path_to_tcl;
    if ($dir_count == 0) {
      $path_to_tcl = File::Spec->join('languages','tcl');
    } elsif ($dir_count == 1) {
      $path_to_tcl = 'tcl';
    } elsif ($dir_count == 2) {
      $path_to_tcl = '.';
    } elsif ($dir_count >2) {
      $path_to_tcl = File::Spec->join(File::Spec->updir() x ($dir_count - 2));
    }

    my $lang_f = Parrot::Test::per_test('.tcl',$count);
    my $out_f = Parrot::Test::per_test('.out',$count);

    $TEST_PROG_ARGS = $ENV{TEST_PROG_ARGS} || '';
    my $args = $TEST_PROG_ARGS;

    Parrot::Test::write_code_to_file( $code, $lang_f );

    my $cmd;
    my $exit_code = 0;
    my $pass = 0;

    my $executable = File::Spec->join($path_to_parrot,$self->{parrot}) . 
    " $args " . File::Spec->join($path_to_tcl, 'tcl.pbc');
    if (defined($ENV{PARROT_TCLSH})) {
      $executable = $ENV{PARROT_TCLSH};
    }
    $cmd = "$executable $lang_f";

    $exit_code = Parrot::Test::run_command($cmd, #CD => $self->{relpath},
					   STDOUT => $out_f, STDERR => $out_f);
  
    unless ($pass) {
      my $file = Parrot::Test::slurp_file($out_f);
      my $builder_func = $language_test_map{$func};
    
      {
        no strict 'refs';

        $pass = $self->{builder}->$builder_func( Parrot::Test::slurp_file($out_f), $output, $desc );
      }
      $self->{builder}->diag("'$cmd' failed with exit code $exit_code")
      if $exit_code and not $pass;
    }

    unless($ENV{POSTMORTEM}) {
      unlink $out_f;
    }

    return $pass;
  }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

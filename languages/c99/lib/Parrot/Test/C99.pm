# $Id: C99.pm 13519 2006-07-24 22:23:24Z tewk $

package Parrot::Test::C99;

use strict;
use warnings;

use File::Basename;

=head1 Parrot::Test::C99

Provide language specific testing routines here...

This is currently alarmingly similar to the generated subs in Parrot::Test.
Perhaps someone can do a better job of delegation here.

=cut

sub new {
    return bless {};
}


sub output_is() {
    my ($self, $code, $output, $desc) = @_;
    #print "@_\n";

    my $count = $self->{builder}->current_test + 1;
    $desc = 'C99 Test' unless $desc;

    my $lang_f = File::Spec->rel2abs(Parrot::Test::per_test('.c',$count));
    my $out_f  = File::Spec->rel2abs(Parrot::Test::per_test('.out',$count));
    my $c99_out_f = File::Spec->rel2abs(Parrot::Test::per_test('.c99.out',$count));
    my $c99_out_debug_f = File::Spec->rel2abs(Parrot::Test::per_test('.c99.debug.out',$count));
    my $parrotdir = dirname $self->{parrot};
    
    Parrot::Test::write_code_to_file( $code, $lang_f );

    my $args = $ENV{TEST_PROG_ARGS} || '';

    
    #my $gcc_cmd = "gcc $lang_f";
    #my $gcc_exit_code = Parrot::Test::run_command($gcc_cmd, CD => $self->{relpath}, STDOUT => $out_f, STDERR => $out_f );
    #my $gcc_output = Parrot::Test::slurp_file($out_f);

    my $c99_cmd = "$self->{parrot} $args languages/c99/c99.pbc $lang_f";
    my $c99_exit_code = Parrot::Test::run_command($c99_cmd, CD => $self->{relpath}, STDOUT => $c99_out_f, STDERR => $c99_out_f );
    my $c99_output = Parrot::Test::slurp_file($c99_out_f);

    my $pass = $self->{builder}->is_eq( $c99_output, "1");
    #my $pass = $self->{builder}->is_eq( $c99_output, $gcc_output, $desc );
    #$self->{builder}->diag("'$gcc_cmd' failed with exit code $gcc_exit_code") if $gcc_exit_code and not $pass;
    $self->{builder}->diag("'$c99_cmd' failed with exit code $c99_exit_code") if $c99_exit_code and not $pass;


    if (not $pass) {
      my $c99_debug_cmd = "$self->{parrot} $args languages/c99/c99.pbc -d $lang_f";
      my $c99_debug_exit_code = Parrot::Test::run_command($c99_debug_cmd, CD => $self->{relpath}, STDOUT => $c99_out_debug_f, STDERR => $c99_out_debug_f );
      my $c99_debug_output = Parrot::Test::slurp_file($c99_out_debug_f);
    }

    unless ($ENV{POSTMORTEM}) {
        #unlink $lang_f;
        unlink $out_f;
        unlink $c99_out_f;
    }
    return $pass;
}

1;

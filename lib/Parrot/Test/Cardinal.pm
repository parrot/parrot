# $Id: Cardinal.pm 12039 2006-03-26 19:46:16Z bernhard $

package Parrot::Test::Cardinal;

use strict;
use warnings;

use File::Basename;

=head1 Parrot::Test::Cardinal

Provide language specific testing routines here...

This is currently alarmingly similar to the generated subs in Parrot::Test.
Perhaps someone can do a better job of delegation here.

=cut

sub new {
    return bless {};
}


sub output_is() {
    my ($self, $code, $output, $desc) = @_;
    print "@_\n";

    my $count = $self->{builder}->current_test + 1;
    $desc = 'Cardinal Test' unless $desc;

    my $lang_f = File::Spec->rel2abs(Parrot::Test::per_test('.rb',$count));
    my $out_f  = File::Spec->rel2abs(Parrot::Test::per_test('.out',$count));
    my $cardinal_out_f = File::Spec->rel2abs(Parrot::Test::per_test('.cardinal.out',$count));
    my $parrotdir = dirname $self->{parrot};
    
    Parrot::Test::write_code_to_file( $code, $lang_f );

    my $args = $ENV{TEST_PROG_ARGS} || '';

    
    my $ruby_cmd = "ruby $lang_f";
    my $ruby_exit_code = Parrot::Test::run_command($ruby_cmd, CD => $self->{relpath}, STDOUT => $out_f, STDERR => $out_f );
    my $ruby_output = Parrot::Test::slurp_file($out_f);

    my $cardinal_cmd = "$self->{parrot} $args languages/cardinal/cardinal.pbc $lang_f";
    my $cardinal_exit_code = Parrot::Test::run_command($cardinal_cmd, CD => $self->{relpath}, STDOUT => $cardinal_out_f, STDERR => $out_f );
    my $cardinal_output = Parrot::Test::slurp_file($cardinal_out_f);

    my $pass = $self->{builder}->is_eq( $cardinal_output, $ruby_output, $desc );
    $self->{builder}->diag("'$ruby_cmd' failed with exit code $ruby_exit_code") if $ruby_exit_code and not $pass;
    $self->{builder}->diag("'$cardinal_cmd' failed with exit code $cardinal_exit_code") if $cardinal_exit_code and not $pass;


    unless ($ENV{POSTMORTEM}) {
        unlink $lang_f;
        unlink $out_f;
        unlink $cardinal_out_f;
    }
    return $pass;
}

1;

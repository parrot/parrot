# $Id$

package Parrot::Test::APL;

use strict;
use warnings;

use File::Basename;

=head1 NAME

Parrot::Test::APL -- testing routines for languages/apl

This is largely a copy of Parrot::Test::Tcl, which looks like it's
largely a copy of Parrot::Test::Python. Abstraction needed.

=cut

sub new {
    return bless {};
}

sub output_is() {
    my ($self, $code, $output, $desc) = @_;
  
    my $count = $self->{builder}->current_test + 1;

    my $lang_f    = Parrot::Test::per_test('.apl',$count);
    my $out_f     = Parrot::Test::per_test('.out',$count);
    my $parrotdir = dirname $self->{parrot};

    my $args = $ENV{TEST_PROG_ARGS} || '';

    $lang_f = File::Spec->rel2abs($lang_f);
    $out_f  = File::Spec->rel2abs($out_f);
    Parrot::Test::write_code_to_file( $code, $lang_f );

    my $cmd;
    my $exit_code = 0;
    my $pass = 0;

    $cmd = "$self->{parrot} $args languages/APL/APL.pbc $lang_f";

    $exit_code = Parrot::Test::run_command($cmd, CD => $self->{relpath},
                                           STDOUT => $out_f, STDERR => $out_f );
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

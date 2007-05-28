# $Id$

package Parrot::Test::Lisp;

use strict;
use warnings;

use File::Basename;

=head1 NAME

Parrot::Test::Lisp -- testing routines for languages/lisp

This is largely a copy of Parrot::Test::Punie.

=cut

sub new {
    return bless {};
}

sub output_is {
    my ( $self, $code, $output, $desc ) = @_;

    my $count = $self->{builder}->current_test + 1;

    my $lang_fn = File::Spec->rel2abs(Parrot::Test::per_test( '.l',  $count ));
    my $out_fn  = File::Spec->rel2abs(Parrot::Test::per_test( '.out', $count ));
    Parrot::Test::write_code_to_file( $code, $lang_fn );

    my $exit_code = 0;
    my $pass      = 0;
    my $args      = $ENV{TEST_PROG_ARGS} || '';
    my $cmd       = "../../$self->{parrot} $args lisp.pbc $lang_fn";

    $exit_code = Parrot::Test::run_command(
        $cmd,
        CD     => "$self->{relpath}/languages/lisp!",
        STDOUT => $out_fn,
        STDERR => $out_fn
    );
    if ( ! $pass ) {
        my $file = Parrot::Test::slurp_file($out_fn);
        $pass = $self->{builder}->is_eq( Parrot::Test::slurp_file($out_fn), $output, $desc );
        $self->{builder}->diag("'$cmd' failed with exit code $exit_code")
            if $exit_code and not $pass;
    }

    return $pass;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

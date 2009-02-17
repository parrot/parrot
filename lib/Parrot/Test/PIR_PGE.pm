# $Id$

# Copyright (C) 2007-2008, Parrot Foundation.

package Parrot::Test::PIR_PGE;

use strict;
use warnings;

use File::Basename;
use File::Spec ();

=head1 NAME

Parrot::Test::PIR_PGE -- testing routines for languages/PIR

This is largely a copy of Parrot::Test::Punie, which is also a copy
of something...

This module is named PIR_PGE, because PIR is a "reserved" name,
for internal use only.

=cut

sub new {
    return bless {};
}

my %language_test_map = (
    output_is   => 'is_eq',
    output_like => 'like',
    output_isnt => 'isnt_eq'
);

foreach my $func ( keys %language_test_map ) {
    no strict 'refs';    ## no critic

    *{"Parrot::Test::PIR_PGE::$func"} = sub {
        my $self = shift;
        my ( $code, $output, $desc ) = @_;

        my $count = $self->{builder}->current_test + 1;

        my $lang_f = File::Spec->rel2abs( Parrot::Test::per_test( '.pir', $count ) );
        Parrot::Test::write_code_to_file( $code, $lang_f );

        my $args = $ENV{TEST_PROG_ARGS} || '';
        my $cmd = "$self->{parrot} $args languages/PIR/pir.pbc $lang_f";

        my $out_f = File::Spec->rel2abs( Parrot::Test::per_test( '.out', $count ) );
        my $exit_code = Parrot::Test::run_command(
            $cmd,
            CD     => $self->{relpath},
            STDOUT => $out_f,
            STDERR => $out_f
        );
        my $file         = Parrot::Test::slurp_file($out_f);
        my $builder_func = $language_test_map{$func};

        my $pass;
        {
            no strict 'refs';

            $pass =
                $self->{builder}->$builder_func( Parrot::Test::slurp_file($out_f), $output, $desc );
            $self->{builder}->diag("'$cmd' failed with exit code $exit_code")
                if $exit_code and not $pass;
        }

        unless ( $ENV{POSTMORTEM} ) {
            unlink $lang_f;
            unlink $out_f;
        }

        return $pass;
    };
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

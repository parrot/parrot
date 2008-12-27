# Copyright (C) 2008, The Perl Foundation.
# $Id$

package Parrot::Test::Luad;

require Parrot::Test;

=head1 NAME

Test/Luad.pm - Testing routines specific to 'luad.pir'.

=head1 DESCRIPTION

Call F<languages/lua/luad.pir>.

=head1 METHODS

=head2 new

Yet another constructor.

=cut

use strict;
use warnings;

use File::Spec;

sub new {
    return bless {};
}

my %language_test_map = (
    output_is   => 'is_eq',
    output_like => 'like',
    output_isnt => 'isnt_eq',
);

foreach my $func ( keys %language_test_map ) {
    no strict 'refs';

    *{"Parrot::Test::Luad::$func"} = sub {
        my $self = shift;
        my ( $code, $output, $desc, %options ) = @_;

        my $count = $self->{builder}->current_test + 1;

        my $params = $options{params} || q{};

        # flatten filenames (don't use directories)
        my $lang_fn = File::Spec->rel2abs( Parrot::Test::per_test( '.lua', $count ) );
        my $luac_fn  = File::Spec->rel2abs( Parrot::Test::per_test( '.luac', $count ) );
        my $lua_out_fn = File::Spec->rel2abs( Parrot::Test::per_test( '.parrot_out', $count ) );
        my @test_prog = (
            "luac -o ${luac_fn} ${lang_fn}",
            "$self->{parrot} languages/lua/luad.pir ${luac_fn}",
        );

        # This does not create byte code, but lua code
        Parrot::Test::write_code_to_file( $code, $lang_fn );

        # STDERR is written into same output file
        my $exit_code = Parrot::Test::run_command(
            \@test_prog,
            CD     => $self->{relpath},
            STDOUT => $lua_out_fn,
            STDERR => $lua_out_fn,
        );

        my $builder_func = $language_test_map{$func};

        # That's the reason for:   no strict 'refs';
        my $pass =
            $self->{builder}
            ->$builder_func( Parrot::Test::slurp_file($lua_out_fn), $output, $desc );
        unless ($pass) {
            my $diag = q{};
            my $test_prog = join ' && ', @test_prog;
            $diag .= "'$test_prog' failed with exit code $exit_code."
                if $exit_code;
            $self->{builder}->diag($diag) if $diag;
        }

        # The generated files are left in the t/* directories.
        # Let 'make clean' and 'svn:ignore' take care of them.

        return $pass;
        }
}

=head1 SEE ALSO

F<languages/lua/t/Parrot/Test/Lua.pm>

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

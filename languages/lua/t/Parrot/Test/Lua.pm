# Copyright (C) 2005-2006, The Perl Foundation.
# $Id$

package Parrot::Test::Lua;

use strict;

use Data::Dumper;
use File::Basename;

require Parrot::Test;

=head1 NAME

Test/Lua.pm - Testing routines specific to 'lua'.

=head1 DESCRIPTION

Call 'Parrot lua' and 'original lua'.

=head1 METHODS

=head2 new

Yet another constructor.

=cut

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

    *{"Parrot::Test::Lua::$func"} = sub {
        my $self = shift;
        my ( $code, $output, $desc, %options ) = @_;

        my $count = $self->{builder}->current_test + 1;

        # flatten filenames (don't use directories)
        my $lua_test = $ENV{PARROT_LUA_TEST_PROG} || q{};
        my $lang_fn = Parrot::Test::per_test( '.lua', $count );
        my $pir_fn  = Parrot::Test::per_test( '.pir', $count );
        my $lua_out_fn = Parrot::Test::per_test(
            $lua_test eq 'lua' ? '.orig_out' : '.parrot_out', $count );
        my $test_prog_args = $ENV{TEST_PROG_ARGS} || q{};
        my @test_prog;
        if ( $lua_test eq 'lua' ) {
            @test_prog = (
                "$ENV{PARROT_LUA_TEST_PROG} ${test_prog_args} languages/${lang_fn}",
            );
        }
        elsif ( $lua_test eq 'monkey' ) {
            @test_prog = (
                "monkey -o languages/${pir_fn} languages/${lang_fn}",
                "$self->{parrot} languages/${pir_fn}",
            );
        }
        elsif ( $lua_test eq 'lua2pir' ) {
            @test_prog = (
                "luac languages/${lang_fn}",
                "l2p -o languages/${pir_fn} > nul",
                "$self->{parrot} languages/${pir_fn}",
            );
        }
        else {
            @test_prog = (
                "perl -Ilanguages/lua languages/lua/luac.pl languages/${lang_fn}",
                "$self->{parrot} --no-gc languages/${pir_fn}",
#                "$self->{parrot} languages/lua/test_lex.pir languages/${lang_fn}",
#                "$self->{parrot} languages/lua/luac.pir languages/${lang_fn}",
            );
        }

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
        my $pass = $self->{builder}
            ->$builder_func( Parrot::Test::slurp_file($lua_out_fn),
            $output, $desc );
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

=head1 HISTORY

Mostly taken from F<languages/bc/lib/Parrot/Test/Bc.pm>.

=head1 SEE ALSO

F<languages/tcl/lib/Parrot/Test/Tcl.pm>, F<languages/m4/lib/Parrot/Test/M4.pm>

=head1 AUTHOR

Francois Perrad

=cut

1;

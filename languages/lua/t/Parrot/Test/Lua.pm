# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

package Parrot::Test::Lua;

use strict;

use File::Basename;

require Parrot::Test;

=head1 NAME

Test/Lua.pm - Testing routines specific to 'lua'.

=head1 DESCRIPTION

Call 'Lua on Parrot' and 'original lua'.

=head1 METHODS

=head2 new

Yet another constructor.

=cut

use strict;
use warnings;

sub new {
    return bless {};
}

sub get_test_prog {
    return $ENV{PARROT_LUA_TEST_PROG} || 'lua.pbc';
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

        my $params = $options{params} || q{};

        # flatten filenames (don't use directories)
        my $lua_test = get_test_prog();
        my $lang_fn = Parrot::Test::per_test( '.lua', $count );
        my $pir_fn  = Parrot::Test::per_test( '.pir', $count );
        my $lua_out_fn =
            Parrot::Test::per_test( $lua_test eq 'lua' ? '.orig_out' : '.parrot_out', $count );
        my $test_prog_args = $ENV{TEST_PROG_ARGS} || q{};
        my @test_prog;
        my $src = (defined $code) ? 'languages/' . $lang_fn : q{};
        if ( $lua_test eq 'lua' ) {
            @test_prog = (
                "lua $test_prog_args $src $params",
            );
        }
        elsif ( $lua_test eq 'luac.pl' ) {
            @test_prog = (
                "perl -Ilanguages/lua languages/lua/luac.pl $src",
                "$self->{parrot} languages/${pir_fn} $params",
            );
        }
        elsif ( $lua_test eq 'luap.pir' ) {
            @test_prog = (
                "$self->{parrot} languages/lua/luap.pir -o languages/${pir_fn} --target=pir $src",
                "$self->{parrot} languages/${pir_fn} $params",
            );
        }
        elsif ( $lua_test eq 'luac2pir.pir' ) {
            @test_prog = (
                "luac -o ${src}c $src",
                "$self->{parrot} languages/lua/luac2pir.pir ${src}c",
                "$self->{parrot} ${src}c.pir $params",
            );
        }
        elsif ( $lua_test eq 'lua.pbc' ) {
            @test_prog = (
                "$self->{parrot} languages/lua/lua.pbc $test_prog_args $src $params",
            );
        }
        else {
            die "unknown option : $lua_test\n";
        }

        # This does not create byte code, but lua code
        Parrot::Test::write_code_to_file( $code, $lang_fn )
            if (defined $code);

        # STDERR is written into same output file
        my $exit_code = Parrot::Test::run_command(
            \@test_prog,
            CD     => $self->{relpath},
            STDOUT => $lua_out_fn,
            STDERR => $lua_out_fn,
        );

        my $builder_func = $language_test_map{$func};

        # set a todo-item for Test::Builder to find
        my $call_pkg = $self->{builder}->exported_to() || '';

        local *{ $call_pkg . '::TODO' } = ## no critic Variables::ProhibitConditionalDeclarations
                        \$options{todo} if defined $options{todo};

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

=head1 HISTORY

Mostly taken from F<languages/bc/lib/Parrot/Test/Bc.pm>.

=head1 SEE ALSO

F<languages/tcl/lib/Parrot/Test/Tcl.pm>, F<languages/m4/lib/Parrot/Test/M4.pm>

=head1 AUTHOR

Francois Perrad

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:


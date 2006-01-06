# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
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
    output_is         => 'is_eq',
    output_like       => 'like',
    output_isnt       => 'isnt_eq',
);

foreach my $func ( keys %language_test_map ) {
    no strict 'refs';

    *{"Parrot::Test::Lua::$func"} = sub {
        my $self = shift;
        my ( $code, $output, $desc, %options ) = @_;

        my $count = $self->{builder}->current_test + 1;

        # flatten filenames (don't use directories)
        my $lang_fn        = Parrot::Test::per_test( '.lua', $count );
        my $pir_fn         = Parrot::Test::per_test( '.pir', $count );
        my $lua_out_fn     = Parrot::Test::per_test( $ENV{PARROT_LUA_TEST_PROG} ? '.orig_out' : '.parrot_out', $count );
        my $test_prog_args = $ENV{TEST_PROG_ARGS} || '';
        my @test_prog      = $ENV{PARROT_LUA_TEST_PROG} ?
                 ( "$ENV{PARROT_LUA_TEST_PROG}  ${test_prog_args} languages/${lang_fn}" ):
                 ( "perl -Ilanguages/lua languages/lua/luac.pl languages/${lang_fn}",
                   "$self->{parrot} languages/${pir_fn}" );

        # This does not create byte code, but lua code
        my $parrotdir       = dirname( $self->{parrot} );
        Parrot::Test::generate_code( $code, $parrotdir, $count, $lang_fn );

        # STDERR is written into same output file
        my $exit_code = Parrot::Test::run_command(
            \@test_prog,
            CD => $self->{relpath},
            STDOUT => $lua_out_fn,
            STDERR => $lua_out_fn,
        );

        my $builder_func = $language_test_map{$func};
        # That's the reason for:   no strict 'refs';
        my $pass = $self->{builder}->$builder_func(
                       Parrot::Test::slurp_file($lua_out_fn),
                       $output,
                       $desc
        );
        unless ( $pass ) {
            my $diag = '';
            my $test_prog = join ' && ', @test_prog;
            $diag .= "'$test_prog' failed with exit code $exit_code." if $exit_code;
            $self->{builder}->diag( $diag ) if $diag;
        }

        # The generated files are left in the t/* directories.
        # Let 'make clean' and 'svn:ignore' take care of them.

        return $pass;
    }
}

=head1 HISTORY

Mostly taken from F<languages/bc/lib/Parrot/Test/Bc.pm>.

=head1 SEE ALSO

F<languages/tcl/t/Parrot/Test/Tcl.pm>, F<languages/m4/lib/Parrot/Test/m4.pm>

=head1 AUTHOR

Francois Perrad

=cut

1;

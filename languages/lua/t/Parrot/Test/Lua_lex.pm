# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

package Parrot::Test::Lua_lex;

use strict;

use Data::Dumper;
use File::Basename;

require Parrot::Test;

=head1 NAME

Test/Lua_lex.pm - Testing routines specific to 'lua' lexicography.

=head1 DESCRIPTION

Call F<languages/lua/test_lex.pir>.

=head1 METHODS

=head2 new

Yet another constructor.

=cut

use strict;
use warnings;

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

    *{"Parrot::Test::Lua_lex::$func"} = sub {
        my $self = shift;
        my ( $code, $output, $desc, %options ) = @_;

        my $count = $self->{builder}->current_test + 1;

        my $params = $options{params} || q{};

        # flatten filenames (don't use directories)
        my $lang_fn = Parrot::Test::per_test( '.lua', $count );
        my $lua_out_fn = Parrot::Test::per_test( '.parrot_out', $count );
        my @test_prog = (
            "$self->{parrot} languages/lua/test_lex.pir languages/${lang_fn}",
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


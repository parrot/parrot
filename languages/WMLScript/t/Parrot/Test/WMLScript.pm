# Copyright (C) 2006, The Perl Foundation.
# $Id: Lua.pm 12840 2006-05-30 15:08:05Z coke $

package Parrot::Test::WMLScript;

use strict;

use Data::Dumper;
use File::Basename;

require Parrot::Test;

=head1 NAME

Test/WMLScript.pm - Testing routines specific to 'WMLScript'.

=head1 DESCRIPTION

Call WMLScript compiler, translator and parrot.

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

    *{"Parrot::Test::WMLScript::$func"} = sub {
        my $self = shift;
        my ( $code, $output, $desc, %options ) = @_;

        my $count = $self->{builder}->current_test + 1;

        my $cflags = $options{cflags} || q{};
        my $function = $options{function} || 'main';
        my $params = $options{params} || q{}; 

        # flatten filenames (don't use directories)
        my $lang_fn = Parrot::Test::per_test( '.wmls', $count );
        my $bin_fn = Parrot::Test::per_test( '.wmlsc', $count );
        my $out_fn = Parrot::Test::per_test( '.out', $count );

        # This does not create byte code, but WMLScript code
        Parrot::Test::write_code_to_file( $code, $lang_fn );

        Parrot::Test::run_command(
            "wmlsc $cflags languages/${lang_fn}",
            CD     => $self->{relpath},
        );

        my @test_prog = (
#            "wmlsc $cflags languages/${lang_fn}",
            "$self->{parrot} languages/WMLScript/src/wmls2pir.pir languages/${bin_fn}",
            "$self->{parrot} languages/WMLScript/src/wmlsi.pir languages/${bin_fn} $function $params",
        );

        # STDERR is written into same output file
        my $exit_code = Parrot::Test::run_command(
            \@test_prog,
            CD     => $self->{relpath},
            STDOUT => $out_fn,
            STDERR => $out_fn,
        );

        my $builder_func = $language_test_map{$func};

        # That's the reason for:   no strict 'refs';
        my $pass = $self->{builder}
            ->$builder_func( Parrot::Test::slurp_file($out_fn),
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

F<languages/tcl/lib/Parrot/Test/Tcl.pm>, F<languages/m4/lib/Parrot/Test/M4.pm>, F<languages/lua/t/Parrot/Test/lua.pm>

=head1 AUTHOR

Francois Perrad

=cut

1;

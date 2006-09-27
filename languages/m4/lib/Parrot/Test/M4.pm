# $Id$

=head1 NAME

Test/M4.pm - Testing routines specific to 'm4'.

=head1 DESCRIPTION

Call 'Parrot m4' and 'GNU m4'.

=cut

package Parrot::Test::M4;

use strict;
use warnings;
use 5.006;

use Data::Dumper;
use File::Basename;

use Parrot::Test;
use Parrot::Test::M4::Gnu;
use Parrot::Test::M4::PIR;

our $VERSION = 0.01;

=head1 METHODS

=head2 new

A kind of factory, that finds the proper subclass of Parrot::Test::M4.
XXX: Do not configure with environment variables.

=cut

sub new {
    return $ENV{PARROT_M4_TEST_PROG}
        ? ( bless {}, 'Parrot::Test::M4::Gnu' )
        : ( bless {}, 'Parrot::Test::M4::PIR' );
}

my %language_test_map = (
    output_is   => 'is_eq',
    output_like => 'like',
    output_isnt => 'isnt_eq',
);

foreach my $func ( keys %language_test_map ) {
    no strict 'refs';    ## no critic

    *{"Parrot::Test::M4::$func"} = sub ($$;$) {
        my $self = shift;
        my ( $code, $output, $desc ) = @_;

        my $count = $self->{builder}->current_test + 1;

        # This is taken from Parrot::Test::Tcl.pm

        # Figure out how many levels we have to go back to get to parrot.
        # And, conversely, how many levels we have to go down to get to
        # the tcl binary.

        # There are basically 2 choices: run in one of:
        #  languages
        #  languages/m4

        my $language       = 'm4';
        my $path_to_parrot = Parrot::Test::path_to_parrot();
        my $dir_count      = scalar( File::Spec->splitdir($path_to_parrot) );
        my $path_to_language;
        if ( $dir_count == 0 ) {
            $path_to_language = File::Spec->join( 'languages', $language );
        }
        elsif ( $dir_count == 1 ) {
            $path_to_language = $language;
        }
        elsif ( $dir_count == 2 ) {
            $path_to_language = '.';
        }
        elsif ( $dir_count > 2 ) {
            $path_to_language = File::Spec->join( File::Spec->updir() x ( $dir_count - 2 ) );
        }

        # flatten filenames (don't use directories)
        my $lang_fn     = Parrot::Test::per_test( '.m4', $count );
        my $lang_out_fn = $self->get_out_fn($count);
        my @test_prog   = $self->get_test_prog( $path_to_parrot, $path_to_language, $count );

        # This does nor create byte code, but m4 code
        Parrot::Test::write_code_to_file( $code, $lang_fn );
        my $exit_code = Parrot::Test::run_command(
            \@test_prog,
            STDOUT => $lang_out_fn,
            STDERR => $lang_out_fn
        );

        my $builder_func = $language_test_map{$func};

        # That's the reason for:   no strict 'refs';
        my $pass =
            $self->{builder}
            ->$builder_func( Parrot::Test::slurp_file($lang_out_fn), $output, $desc );
        if ( !$pass ) {
            my $diag = q{};
            my $test_prog = join( ' && ', @test_prog );
            if ($exit_code) {
                $diag .= "'$test_prog' failed with exit code $exit_code.";
            }
            if ($diag) {
                $self->{builder}->diag($diag);
            }
        }

        # The generated files are left in the t/* directories.
        # Let 'make clean' and 'svn:ignore' take care of them.

        return $pass;
        }
}

1;

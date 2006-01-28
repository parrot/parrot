# $Id$

package Parrot::Test::HQ9plus;

use strict;
use warnings;

use Data::Dumper;
use File::Basename;

use Parrot::Test;

=head1 NAME

Parrot::Test::HQ9plus - Testing routines specific to 'HQ9plus'.

=head1 DESCRIPTION

Call HQ9plus.pbc

=head1 METHODS

=head2 new

=cut

sub new {
    return bless {};
}

my %language_test_map = (
    output_is         => 'is_eq',
    output_like       => 'like',
    output_isnt       => 'isnt_eq'
                        );

foreach my $func ( keys %language_test_map ) {
    no strict 'refs';

    *{"Parrot::Test::HQ9plus::$func"} = sub ($$;$) {
        my $self = shift;
        my ( $code, $output, $desc ) = @_;
  
        my $count = $self->{builder}->current_test + 1;

        # flatten filenames (don't use directories)
        my $lang_fn   = Parrot::Test::per_test( '.HQ9plus', $count );
        my $out_fn    = Parrot::Test::per_test( '.out', $count );
        my @test_prog = ( "$self->{parrot} languages/HQ9plus/HQ9plus.pbc languages/${lang_fn}" );

        # This does nor create byte code, but HQ9plus code
        my $parrotdir = dirname( $self->{parrot} );
        Parrot::Test::generate_code( $code, $parrotdir, $count, $lang_fn );

        # STDERR is written into same output file
        my $exit_code = Parrot::Test::run_command( 
                            \@test_prog, 
                            CD     => $self->{relpath}, 
                            STDOUT => $out_fn,
                            STDERR => $out_fn 
                        );
  
        my $builder_func = $language_test_map{$func};
        # That's the reason for:   no strict 'refs';
        my $pass = $self->{builder}->$builder_func(
                       Parrot::Test::slurp_file($out_fn),
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
        # Let 'make clean' and '.cvsignore' take care of them.

        return $pass;
    }
}

1;

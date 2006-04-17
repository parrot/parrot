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

        my $language = 'HQ9plus';
        # flatten filenames (don't use directories)
        my $lang_fn        = Parrot::Test::per_test( '.HQ9plus', $count );
        my $out_fn         = Parrot::Test::per_test( '.out', $count );
        my $path_to_parrot = Parrot::Test::path_to_parrot();
        my $dir_count      = scalar(File::Spec->splitdir($path_to_parrot));
        my $path_to_language;
        if ($dir_count == 0) {
          $path_to_language = File::Spec->join('languages', $language);
        } elsif ($dir_count == 1) {
          $path_to_language = $language;
        } elsif ($dir_count == 2) {
          $path_to_language = '.';
        } elsif ($dir_count >2) {
          $path_to_language = File::Spec->join(File::Spec->updir() x ($dir_count - 2));
        }
        my @test_prog = 
            ( join( ' ',
                    File::Spec->join($path_to_parrot,$self->{parrot}), 
                    File::Spec->join($path_to_language, 'HQ9plus.pbc'),
                    $lang_fn ) );

        Parrot::Test::write_code_to_file( $code, $lang_fn );

        # STDERR is written into same output file
        my $exit_code = Parrot::Test::run_command( 
                            \@test_prog, 
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
        # Let 'make clean' and 'svn:ignore' take care of them.

        return $pass;
    }
}

1;

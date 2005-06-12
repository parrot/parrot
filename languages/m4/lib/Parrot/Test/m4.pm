# $Id: m4.pm 7964 2005-05-03 21:14:35Z bernhard $

package Parrot::Test::m4;

use strict;

use Data::Dumper;
use File::Basename;

require Parrot::Test;

=head1 NAME

Test/m4.pm - Testing routines specific to 'm4'.

=head1 DESCRIPTION

Call 'Parrot m4' and 'GNU m4'.

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
    output_isnt       => 'isnt_eq'
                        );

foreach my $func ( keys %language_test_map ) {
    no strict 'refs';

    *{"Parrot::Test::m4::$func"} = sub ($$;$) {
        my $self = shift;
        my ( $code, $output, $desc ) = @_;
  
        my $count = $self->{builder}->current_test + 1;

        # flatten filenames (don't use directories)
        my $lang_f        = Parrot::Test::per_test( '.m4', $count );
        my $m4_out_f      = Parrot::Test::per_test( $ENV{PARROT_M4_TEST_PROG} ? '.gnu_out' : '.parrot_out', $count );
        my $test_prog_args = $ENV{TEST_PROG_ARGS} || '';
        my $test_prog      = $ENV{PARROT_M4_TEST_PROG} || 
                                 "$self->{parrot} languages/m4/m4.pbc";
        $test_prog .= " ${test_prog_args} languages/${lang_f}";
         # die Dumper( $test_prog, \%ENV );

        # This does nor create byte code, but m4 code
        my $parrotdir       = dirname( $self->{parrot} );
        Parrot::Test::generate_code( $code, $parrotdir, $count, $lang_f );

        # STDERR is written into same output file
        my $exit_code = Parrot::Test::run_command( 
            $test_prog, 
            CD => $self->{relpath}, 
            STDOUT => $m4_out_f, STDERR => $m4_out_f 
        );
  
        my $builder_func = $language_test_map{$func};
        # That's the reason for:   no strict 'refs';
        my $pass = $self->{builder}->$builder_func(
                       Parrot::Test::slurp_file($m4_out_f),
                       $output,
                       $desc
                                                  );
        unless ( $pass ) {
            my $diag = '';
            $diag .= "'$test_prog' failed with exit code $exit_code." if $exit_code;
            $self->{builder}->diag( $diag ) if $diag;
        }

        # The generated files are left in the t/* directories.
        # Let 'make clean' and '.cvsignore' take care of them.

        return $pass;
    }
}

1;

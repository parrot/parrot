# $Id$

package Parrot::Test::Bc;

use strict;
use warnings;

use Data::Dumper;
use File::Basename;

use Parrot::Test;
use Parrot::Test::Bc::Antlr2;
use Parrot::Test::Bc::Antlr3;
use Parrot::Test::Bc::Posix;

=head1 NAME

Test/Bc.pm - Testing routines specific to 'bc'.

=head1 DESCRIPTION

Call 'Parrot bc' and 'POSIX bc'.

=head1 METHODS

=head2 new

A kind of factory, that finds the proper subclass of Parrot::Test::Bc.
XXX: Do not configure with environment variables.
Use Antlr2 in smoke testing.

=cut

sub new {
    my $test_module = $ENV{'PARROT_BC_TEST_MODULE'} || 'Parrot::Test::Bc::Antlr2';
                
    return bless {}, $test_module;
}

my %language_test_map = (
    output_is         => 'is_eq',
    output_like       => 'like',
    output_isnt       => 'isnt_eq'
                        );

foreach my $func ( keys %language_test_map ) {
    no strict 'refs';

    *{"Parrot::Test::Bc::$func"} = sub {
        my $self = shift;
        my ( $code, $output, $desc, %options ) = @_;
  
        my $count = $self->{builder}->current_test() + 1;

        # These are the thing that depend on the actual Bc implementation
        my $out_fn    = $self->get_out_fn( $count, \%options );
        my @test_prog = $self->get_test_prog( $count, \%options );

        # This does not create byte code, but bc code
        {
            my $parrotdir = dirname( $self->{parrot} );
            my $lang_fn   = Parrot::Test::per_test( '.bc', $count );
            Parrot::Test::write_code_to_file( $code, $lang_fn );
        }

        # set a TODO for Test::Builder to find
        my $skip_why = $self->skip_why( \%options );
        if ( $skip_why ) {
            $self->{builder}->skip( $skip_why );
        } else {
            # STDERR is written into same output file
            my $exit_code = Parrot::Test::run_command( 
                                \@test_prog, 
                                CD     => $self->{relpath}, 
                                STDOUT => $out_fn,
                                STDERR => $out_fn 
                            );
  
           my $meth = $language_test_map{$func};
           # That's the reason for:   no strict 'refs';
           my $pass = $self->{builder}->$meth(
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
        }

        # The generated files are left in the t/* directories.
        # Let 'make clean' and 'svn:ignore' take care of them.

        return; 
    }
}

1;

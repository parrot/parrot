# $Id$

package Parrot::Test::Plumhead;

# pragmata
use strict;
use warnings;

use Data::Dumper;
use File::Basename;

use Parrot::Test;
use Parrot::Test::Plumhead::PHP;
use Parrot::Test::Plumhead::Phc2Past;

=head1 NAME

Test/Plumhead.pm - Testing routines specific to 'php'.

=head1 DESCRIPTION

Call 'plumhead.pl' and 'php'.

=head1 METHODS

=head2 new

A kind of factory, that finds the proper subclass of Parrot::Test::Plumhead.
XXX: Do not configure with environment variables.
Use plumhead.pl in smoke testing.

=cut

sub new {
    my $test_module = $ENV{PARROT_PLUMHEAD_TEST_MODULE} || 'Parrot::Test::Plumhead::Phc2Past';
                
    return bless {}, $test_module;
}

my %language_test_map = (
    output_is         => 'is_eq',
    output_like       => 'like',
    output_isnt       => 'isnt_eq'
                        );

foreach my $func ( keys %language_test_map ) {
    no strict 'refs';

    *{"Parrot::Test::Plumhead::$func"} = sub {
        my $self = shift;
        my ( $code, $output, $desc, %options ) = @_;
  
        my $count = $self->{builder}->current_test() + 1;

        # These are the thing that depend on the actual Plumhead implementation
        my $out_fn    = $self->get_out_fn( $count, \%options );
        my @test_prog = $self->get_test_prog( $count, \%options );

        # This does not create byte code, but PHP code
        {
            my $parrotdir = dirname( $self->{parrot} );
            my $lang_fn   = Parrot::Test::per_test( '.php', $count );
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

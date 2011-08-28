# Copyright (C) 2006-2009, Parrot Foundation.

=head1 NAME

Parrot::Test::Harness - a test harness for languages built on Parrot

=head1 SYNOPSIS

Tell the harness which language, and optionally compiler or other executable,
you want to use in a file called F<t/harness>:

  use Parrot::Test::Harness language => 'punie';

  # or

  use Parrot::Test::Harness language => 'perl6', compiler => 'perl6.pbc';

  # or

  use Parrot::Test::Harness
      language  => 'eclectus',
      verbosity => 1,
      exec      => [ 'petite', '--script' ],
      arguments => [ '--files' ],
      files     => [ 't/*.pl' ];

That's it. Seriously.

=head1 DESCRIPTION

This module provides a basic test harness for Parrot-hosted languages. Right
now it parameterizes the three parameters that at least four language
implementations need.

If you really want, you can pass a third option to the C<use> line.
C<arguments> should be an array reference containing additional arguments (as
you might find on the command line).

If you don't pass a C<compiler> or C<exec> argument pair, the harness will run the tests
with C<perl>.  If you I<do> pass one of these pairs, the harness can use another executable.
For C<exec> a reference to a an array of string is expected.
For C<compiler> the harness will run the tests with
C<parrot>, calling the C<compiler> file as the first argument.

This means that you can write your tests in your language itself and run them
through your compiler itself.  If you can load PIR libraries from your
language, you can even use the existing PIR testing tools.

If the C<verbosity> argument pair is provided, it will pass it through to the TAP::Harness
as is. This allows for extremely quiet or loud test output to be generated.

=head1 AUTHOR

Written by chromatic with most of the intelligence stolen from the Punie
harness and most of that probably stolen from Test::Harness

Please send patches and bug reports via Parrot's Trac queue or to the mailing
list.

=cut

package Parrot::Test::Harness;

use strict;
use warnings;

use Carp;
use File::Spec;
use Test::Harness;
use List::Util;

sub set_flags {
    my %options = @_;

    $ENV{HARNESS_VERBOSE} = 1;
    if ( $options{exec} ) {
        $ENV{HARNESS_PERL} ||= join q{ }, @{$options{exec}};
    }
    elsif ( $options{compiler} ) {
        $ENV{HARNESS_PERL} ||= join q{}, "../../parrot ./$options{compiler}";
    }

    return;
}

# return a list of test files
sub get_files {
    my %options = @_;

=pod

The option '--files' is used for supporting unified testing of language
implementations. It is used by F<languages/t/harness> for collecting a
list testfiles from many language implementations.

When that option is passed, a list of pathes to test files is printed.
Currently these test files need to be Perl 5 scripts.
The file pathes are relative to a language implementation dir.

When the first argument in the '--files' list is '--master', add the language
dir as a prefix to all files args.

When there is no '--files' option, then things are saner.
Nothing is printed. An array of file pathes is returned to the caller.

=cut

    if ( grep { m/^--files$/ } @{ $options{arguments} } ) {

        # --files indicates that 'languages/t/harness' wants a list of test files
        my @files;
        {
            # file patterns are either passed from a <language>/t/harness,
            # or the default is used
            my @file_patterns =
                ( $options{files} && ref $options{files} eq 'ARRAY' ) ?
                    @{ $options{files} }
                    :
                    ( 't/*.t', 't/*/*.t' );
            if ( List::Util::first { $_ eq '--master' } @{ $options{arguments} } ) {
                # if --master is passed, add the language dir as a prefix
                @files = map { glob( File::Spec->catfile( $options{language}, $_  ) )
                             }
                             @file_patterns;
            }
            else {
                @files = map { glob( $_ )
                             }
                             @file_patterns;
            }
        }
        print map { $_ . "\n" } @files;

        exit;
    }
    elsif ( @{ $options{arguments} } ) {

        # Someone specified tests for me to run.
        my @files;
        foreach my $arg ( @{ $options{arguments} } ) {
            -f $arg && push @files, glob $arg;
            -d $arg && push @files, glob( File::Spec->catfile( $arg, '*.t' ) );
        }

        return @files;
    }
    else {
        # file patterns are either passed from a <language>/t/harness,
        # or the default is used
        my @file_patterns =
            ( $options{files} && ref $options{files} eq 'ARRAY' ) ?
                @{ $options{files} }
                :
                ( 't/*.t', 't/*/*.t' );
        return map { glob( $_ )
                   }
                   @file_patterns;
    }
}

sub import {
    my ( $class, %options ) = @_;

    croak "Need a language\n" unless $options{language};

    $options{arguments} ||= \@ARGV;

    exit unless my @files = get_files(%options);

    if (eval { require TAP::Harness; 1 }) {
        my %harness_options =
              $options{exec}     ? ( exec => $options{exec} )
            : $options{compiler} ? ( exec => [ '../../parrot', './' . $options{compiler} ] )
            :                      ();
        $harness_options{verbosity} =                    $options{verbosity} || 0;
        $harness_options{jobs}      = $ENV{TEST_JOBS} || $options{jobs}      || 1;
        print $harness_options{exec} . "\n";
        TAP::Harness->new( \%harness_options )->runtests( @files );

        return;
    }

    set_flags(%options);

    local $Test::Harness::Switches = '';

    no warnings 'redefine';
    local *Test::Harness::Straps::_INC2PERL5LIB = ## no critic Variables::ProhibitConditionalDeclarations
        sub { @INC }
        if $options{compiler};

    runtests(@files);
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

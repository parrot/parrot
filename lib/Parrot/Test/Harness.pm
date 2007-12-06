# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

=head1 NAME

Parrot::Test::Harness - a test harness for languages built on Parrot

=head1 SYNOPSIS

Tell the harness which language, and optionally compiler or other executable,
you want to use in a file called F<t/harness>:

  use Parrot::Test::Harness language => 'punie';

  # or

  use Parrot::Test::Harness language => 'perl6', compiler => 'perl6.pbc';

  # or

  use Parrot::Test::Harness language => 'perl6', compiler => 'perl6.pbc';

  # or

  use Parrot::Test::Harness language => 'eclectus', exec => [ 'petite', '--script' ];

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

=head1 AUTHOR

Written by chromatic with most of the intelligence stolen from the Punie
harness and most of that probably stolen from Test::Harness

Please send patches and bug reports via Parrot's RT queue or to the mailing
list.

=cut

package Parrot::Test::Harness;

use strict;
use warnings;

use Carp;
use File::Spec;
use Test::Harness;

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

sub get_files {
    my %options = @_;

=pod

Conformant to a recent post on p6i, if called with a single argument of
C<--files>, return a list of files to process.  This list is one per line, and
is relative to the languages dir.

If called with no args, run the suite.

=cut

    if ( grep { /^--files$/ } @{ $options{arguments} } ) {

        # --files indicates the 'languages/t/harness' wants a list of test files
        my $dir = File::Spec->catfile( $options{language}, 't' );
        my @files = (
            glob( File::Spec->catfile( $dir, '*.t' ) ),
            glob( File::Spec->catfile( $dir, '*/*.t' ) )
        );
        print join( "\n", @files );
        print "\n" if @files;
        exit;
    }
    elsif ( @{ $options{arguments} } ) {

        # Someone specified tests for me to run.
        my @files = ();
        foreach my $arg ( @{ $options{arguments} } ) {
            -f $arg && push @files, glob $arg;
            -d $arg && push @files, glob( File::Spec->catfile( $arg, '*.t' ) );
        }
        return @files;
    }
    else {

        # I must be running out of languages/$language
        # You may want a deeper search than this.
        return (
            glob( File::Spec->catfile( 't', '*.t' ) ),
            glob( File::Spec->catfile( 't', '*/*.t' ) )
        );
    }
}

sub import {
    my ( $class, %options ) = @_;

    croak "Need a language\n" unless $options{language};

    $options{arguments} ||= \@ARGV;

    exit unless my @files = get_files(%options);

    if (eval { require TAP::Harness; 1 }) {
        my %options =
              $options{exec}     ? ( exec => $options{exec} )
            : $options{compiler} ? ( exec => [ '../../parrot', './' . $options{compiler} ] )
            :                      ();
        TAP::Harness->new( \%options )->runtests( @files );

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

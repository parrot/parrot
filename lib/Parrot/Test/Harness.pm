# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

Parrot::Test::Harness - a test harness for languages built on Parrot

=head1 SYNOPSIS

Tell the harness which language (and optionally, compiler) you want to use in a
file called F<t/harness>:

  use Parrot::Test::Harness language => 'punie';

  # or

  use Parrot::Test::Harness language => 'perl6', compiler => 'perl6.pbc';

That's it.  Seriously.

=head1 DESCRIPTION

This module provides a basic test harness for Parrot-hosted languages.  Right
now it parameterizes the two parameters that at least three language
implementations need.

If you really want, you can pass a third option to the C<use> line.
C<arguments> should be an array reference containing additional arguments (as
you might find on the command line).

If you don't pass a C<compiler> argument pair, the harness will run the tests
with C<perl>.  If you I<do> pass the pair, the harness will run the tests with
C<parrot>, calling the C<compiler> file as the first argument.

This means that you can write your tests in your language itself and run them
through your compiler itself.  If you can load PIR libraries from your
language, you can even use the existing PIR testing tools.

=head1 AUTHOR

written by chromatic with most of the intelligence stolen from the Punie
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

sub set_flags
{
    my %options           = @_;
    $ENV{HARNESS_VERBOSE} = 1;
    $ENV{HARNESS_PERL}  ||= '../../parrot ./' . $options{compiler}
        if $options{compiler};

    # Per Leo on 18APR2005, run the test suite with --gc-debug
    if ( $ENV{TEST_PROG_ARGS} && $ENV{TEST_PROG_ARGS} !~ /\b--gc-debug\b/ )
    {
        $ENV{TEST_PROG_ARGS} .= " --gc-debug";
    }
}

sub get_files
{
    my %options = @_;

=pod

Conformant to a recent post on p6i, if called with a single argument of
C<--files>, return a list of files to process.  This list is one per line, and
is relative to the languages dir.

If called with no args, run the suite.

=cut

    if ( grep { /^--files$/ } @{ $options{arguments} } )
    {
        # --files indicates the 'languages/t/harness' wants a list of test files
        my $dir   = File::Spec->catfile( $options{language}, 't' );
        my @files = ( glob( File::Spec->catfile( $dir, '*.t' ) ),
                      glob( File::Spec->catfile( $dir, '*/*.t' ) )
                    );
        print join( "\n", @files );
        print "\n" if @files;
        exit;
    }
    elsif (@{ $options{arguments} })
    {
        # Someone specified tests for me to run.
        return grep { -f $_ } @{ $options{arguments} };
    }
    else
    {
        # I must be running out of languages/$language
        # You may want a deeper search than this.
        return ( glob( File::Spec->catfile( 't', '*.t' ) ),
                 glob( File::Spec->catfile( 't', '*/*.t' ) )
               );
    }
}

sub import
{
    my ($class, %options) = @_;

    croak "Need a language\n" unless $options{language};

    $options{arguments} ||= \@ARGV;

    exit unless my @files = get_files( %options );

    set_flags( %options );

    local $Test::Harness::Switches = '';
    runtests(@files);
}

1;

# vim: expandtab sw=4

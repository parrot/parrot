#!perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use File::Basename qw( fileparse );
use File::Spec::Functions qw( catfile );
use Parrot::Config;
use Parrot::Revision;
use ExtUtils::Manifest qw( maniread );

=head1 NAME

t/distro/file_metadata.t - verify file metadata matches expectations

=head1 SYNOPSIS

 % prove t/distro/file_metadata.t

=head1 DESCRIPTION

Makes sure that file metadata meets our expectations. For example, checks
include 'all test files have "text/plain" mime-type',
and 'all "text/plain" files have keyword expansion enabled'.  Also checks
that all "text/plain" files have their svn:eol-style set to 'native'.

Note: These tests would benefit from judicial application of Iterators.

=cut

my $cmd = -d '.svn' ? 'svn' : 'svk';

# how many files to check at a time. May have to lower this when we run
# this on systems with finicky command lines.
my $chunk_size = 100;

# get files listed in MANIFEST
my @manifest_files =
    sort keys %{ maniread( catfile $PConfig{build_dir}, 'MANIFEST' ) };

## all test files must have "text/plain" mime-type. Assume anything in the
## repository with a .t is test file.

my $mime_types = get_attribute( 'svn:mime-type', @manifest_files );

TEST_MIME: {

    # find test files
    my $test_suffix = '.t';
    my @test_files  = grep { m/\Q$test_suffix\E$/ } @manifest_files;
    my $test        = 'svn:mime-type';
    my $expected    = 'text/plain';
    my @failed      = verify_attributes( $test, $expected, 0, $mime_types, \@test_files );

    if (@failed) {
        my $failure = join " ($expected)\n", @failed;
        $failure = "\n" . $failure . " ($expected)\n";
        is( $failure, "", $test );
    }
    else {
        pass($test);
    }
}    # TEST_MIME

## keyword expansion must be set for any manifest files with an explicit
## mime type of text/plain. Assume a default of text/plain if not specified

KEYWORD_EXP: {

    # we only want those files whose mime types that start with text/plain

    my @plain_files;
    foreach my $file ( keys %$mime_types ) {
        if ( !defined( $mime_types->{$file} )
            || $mime_types->{$file} =~ qr{^text/plain} )
        {

            push @plain_files, $file;
        }
    }

    my $test     = 'svn:keywords';
    my $expected = 'Author Date Id Revision';
    my $keywords = get_attribute( $test, @plain_files );

    my @failed = verify_attributes( $test, $expected, 1, $keywords );

    if (@failed) {
        my $failure = join " ($expected)\n", @failed;
        $failure = "\n" . $failure . " ($expected)\n";
        is( $failure, "", $test );
    }
    else {
        pass($test);
    }

}    # KEYWORD_EXP

## eol-style must be set to 'native' for any manifest files with an explicit
## mime type of text/plain. Assume a default of text/plain if not specified.
## This is, however, *not* true for many files.  Some text files need to
## have a single LF character as the EOL character on *all* platforms due to
## Parrot's current IO mechanism.  Therefore, we need to check that the
## files with LF are the ones we expect, and that the rest are native.

our $lf_files_regexp = qr{
    ^examples/shootout/.*\.input$ |
    ^examples/shootout/.*\.output$ |
    ^t/compilers/pge/p5regex/re_tests$ |
    ^t/library/perlhist.txt$ |
    ^t/op/sprintf_tests$
     }x;

NATIVE_EOL_STYLE: {

    # we need to skip the files which *should* have LF as the eol-style
    # we only want those files whose mime types that start with text/plain
    ## collect the files to test
    my @plain_files;
    foreach my $file ( keys %$mime_types ) {
        if ( !defined( $mime_types->{$file} )
            || $mime_types->{$file} =~ qr{^text/plain} )
        {
            push @plain_files, $file
                unless $file =~ $lf_files_regexp;
        }
    }

    my $test      = 'svn:eol-style';
    my $expected  = 'native';
    my $test_name = $test . "=" . $expected;
    my $keywords  = get_attribute( $test, @plain_files );

    my @failed = verify_attributes( $test, $expected, 1, $keywords );

    if (@failed) {
        my $failure = join " ($expected)\n", @failed;
        $failure = "\n" . $failure . " ($expected)\n";
        is( $failure, "", $test_name );
    }
    else {
        pass($test_name);
    }

}    # NATIVE_EOL_STYLE

LF_EOL_STYLE: {

    ## collect the files to test
    my @lf_files;
    foreach my $file ( keys %$mime_types ) {
        if ( !defined( $mime_types->{$file} )
            || $mime_types->{$file} =~ qr{^text/plain} )
        {
            push @lf_files, $file
                if $file =~ $lf_files_regexp;
        }
    }

    my $test      = 'svn:eol-style';
    my $expected  = 'LF';
    my $test_name = $test . "=" . $expected;
    my $keywords  = get_attribute( $test, @lf_files );

    my @failed = verify_attributes( $test, $expected, 1, $keywords );

    if (@failed) {
        my $failure = join " ($expected)\n", @failed;
        $failure = "\n" . $failure . " ($expected)\n";
        is( $failure, "", $test_name );
    }
    else {
        pass($test_name);
    }

}    # LF_EOL_STYLE

=for skip

# When unskipped, rewrite to conform to other tests.

SKIP: {
    skip 'custom svn keywords not yet supported' => 1;
## Copyright keyword
COPYRIGHT: {
    my $readme = catfile( $PConfig{build_dir}, 'README' );
    open my $IN, '<' => $readme
        or die qq|can't open $readme: $!|;

    my $official_copyright;
    while( <$IN> )
    {
        next unless m/^Parrot is (Copyright .*)/;
        $official_copyright = $1;
        last;
    }
    fail('official copyright not found') and last COPYRIGHT
        unless length $official_copyright;

    @cmd = qw(pg Copyright);

    $msg = 'Copyright property matches official copyright';
    diag $msg;

    is(
        sub{ my $r = qx($cmd @cmd $_); chomp $r; "$_: $r" }->(),
        "$_: $official_copyright",
        "$msg ($_)"
    ) for @manifest_files;
} # COPYRIGHT
} # SKIP

=cut

BEGIN {
    unless ( $Parrot::Revision::current or `svk ls .` ) {
        plan skip_all => 'not a working copy';
    }
    else { plan tests => 4 }
}

exit;

#
# Given a list, a count, and a sub, process that list count elements
# at a time. (do this to speed up execution for the svn/svk commands)
#

sub at_a_time {
    my $count = shift;
    my $sub   = shift;
    my @list  = @_;

    return unless $count;
    return unless $sub;
    return unless @list;

    my $pos = 0;

    while ( $pos < @list ) {
        my $start = $pos;
        my $end   = $pos + $count - 1;
        if ( $end >= @list ) { $end = @list - 1 }
        my @sublist = @list[ $start .. $end ];
        $sub->(@sublist);
        $pos += $count;
    }

    return;
}

# Given an attribute and a list of files, return a hashref
# containing filenames/values.
sub get_attribute {
    my $attribute = shift;
    my @list      = @_;

    diag "Collecting $attribute attributes...\n";

    my %results;
    map { $results{$_} = undef } @list;

    at_a_time(
        $chunk_size,
        sub {
            my @partial_list = @_;

            foreach my $result (qx($cmd pg $attribute @partial_list)) {

                # This RE may be a little wonky.
                if ( $result =~ m{(.*) - (.*)} ) {
                    my ( $file, $attribute ) = ( $1, $2 );

                    # file names are reported with backslashes on Windows,
                    # but we want forward slashes
                    $file =~ s!\\!/!g if $^O eq 'MSWin32';

                    $results{$file} = $attribute;
                }
            }

        },
        @list
    );
    return \%results;
}

sub verify_attributes {
    my $attribute = shift;    # name of the attribute
    my $expected  = shift;    # the expected value
    my $exact     = shift;    # should this be an exact match?
    my $results   = shift;    # the results hash ref: file -> value
    my $files     = shift;    # an arrayref of files we care about. (undef->all)

    my @files;
    if ( defined($files) ) {
        @files = @$files;
    }
    else {
        @files = keys %$results;
    }

    my @failures;
    foreach my $file ( sort @files ) {
        my $actual = $results->{$file};
        if ( !defined $actual ) {
            push @failures, $file;
            next;
        }
        if ($exact) {
            if ( $actual ne $expected ) {
                push @failures, $file;
            }
        }
        else {
            if ( $actual !~ /^$expected/ ) {
                push @failures, $file;
            }
        }
    }

    return @failures;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

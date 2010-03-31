#!perl
# Copyright (C) 2006-2007, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use File::Basename qw( fileparse );
use File::Spec::Functions qw( catfile splitpath splitdir );
use File::Spec::Unix;
use Parrot::Config;
use ExtUtils::Manifest qw( maniread );

=head1 NAME

t/distro/file_metadata.t - verify that file metadata matches expectations

=head1 SYNOPSIS

 % prove t/distro/file_metadata.t

=head1 DESCRIPTION

Makes sure that file metadata meets our expectations. For example, checks
include 'all test files have "text/plain" mime-type',
and 'all "text/plain" files have keyword expansion enabled'.  Also checks
that all "text/plain" files have their svn:eol-style set to 'native'.

Note: These tests would benefit from judicial application of Iterators.

=cut

BEGIN {
    unless ( -e 'DEVELOPING' ) {
        plan skip_all => "Don't bother running these in a tarball.";
        exit(0);
    }
}


my $cmd = 'svn';
my @git_svn_metadata;    # set in BEGIN block

# how many files to check at a time. May have to lower this when we run
# this on systems with finicky command lines.
my $chunk_size = 100;

# get files listed in MANIFEST
my @manifest_files =
    sort keys %{ maniread( catfile $PConfig{build_dir}, 'MANIFEST' ) };

my $mime_types = get_attribute( 'svn:mime-type', @manifest_files );

## only certain mime types are expected.


VALID_MIME: {

    my $test        = 'svn:mime-type';
    my @expected    = qw[
        text/css
        text/plain
        text/script
        text/xml
        application/octet-stream
        application/postscript
        image/gif
        image/png
    ];
    push @expected, 'text/plain; charset=UTF-8';

    my $expected    = join '|', @expected, "";
    my $expected_re = qr{^(${expected})$};

    my @failed      = verify_attributes( $test, $expected_re, 0, $mime_types, \@manifest_files, 1 );

    if (@failed) {
        my $failure = join q{}, "Invalid svn:mime-types found in the following files:\n",
            map { "$_\n" } @failed;
        is( $failure, '', $test );
    }
    else {
        pass($test);
    }
}    # VALID_MIME

## all test files must have "text/plain" mime-type. Assume anything in the
## repository with a .t is test file.

TEST_MIME: {

    # find test files
    my $test_suffix = '.t';
    my @test_files  = grep { m/\Q$test_suffix\E$/ } @manifest_files;
    my $test        = 'svn:mime-type';
    my $expected    = 'text/plain';
    my @failed      = verify_attributes( $test, $expected, 0, $mime_types, \@test_files );
    my $test_name   = "$test for .t files";

    if (@failed) {
        my $failure = join q{}, "Set $test with:\n",
            map { " $cmd ps $test '$expected' $_\n" } @failed;
        $failure = "git svn metadata $test incorrect for @failed" if -d '.git';
        is( $failure, '', $test_name );
    }
    else {
        pass($test_name);
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
        my $failure = join q{}, "Set $test with:\n",
            map { " $cmd ps $test \"$expected\" $_\n" } @failed;
        $failure = "git svn metadata $test incorrect for @failed" if -d '.git';
        is( $failure, '', $test );
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
    ^examples/shootout/.*\.pir_input$ |
    ^examples/shootout/.*\.pir_output$ |
    ^t/compilers/pge/p5regex/re_tests$ |
    ^t/library/perlhist\.txt$ |
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
        my $failure = join q{}, "Set $test with:\n",
            map { " $cmd ps $test $expected $_\n" } @failed;
        $failure = "git svn metadata $test incorrect for @failed" if -d '.git';
        is( $failure, '', $test_name );
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
        my $failure = join q{}, "Set $test with:\n",
            map { " $cmd ps $test $expected $_\n" } @failed;
        $failure = "git svn metadata $test incorrect for @failed" if -d '.git';
        is( $failure, '', $test_name );
    }
    else {
        pass($test_name);
    }

}    # LF_EOL_STYLE

BEGIN {
    if ( -d '.git' ) {
        my $git_svn_metadata = catfile(qw/.git svn git-svn unhandled.log/);
        if ( -e $git_svn_metadata ) {
            diag 'Checking git svn metadata';
            plan tests => 5;

            # Read the file once and store lines
            if ( !open my $git_svn_metadata_fh, '<', $git_svn_metadata ) {
                diag "trouble opening metadata file: $git_svn_metadata";
            }
            else {
                @git_svn_metadata = <$git_svn_metadata_fh>;
                close $git_svn_metadata_fh;
            }
        }
        else {
            plan skip_all => q{git svn file metadata not retained};
        }
    }
    elsif ( ! (-d '.svn' && `svn info .`) ) {
        plan skip_all => 'not a working copy';
    }
    else { plan tests => 5 }
}

#
# Given a list, a count, and a sub, process that list count elements
# at a time. (do this to speed up execution for the svn commands)
#

sub at_a_time {
    my $count = shift;
    my $sub   = shift;
    my @list  = @_;

    return unless $sub;
    return unless @list;

    while (@list) {
        $count = @list if $count > @list;
        my @sublist = splice @list, 0, $count;
        $sub->(@sublist);
    }

    return;
}

# Given an attribute and a list of files, return a hashref
# containing filenames/values.
sub get_attribute {
    my $attribute = shift;
    my @list      = @_;

    diag "Collecting $attribute attributes...\n";

    my %results = map { $_ => undef } @list;

    if ( -d '.git' ) {
        return git_svn_metadata( $attribute, \%results );
    }

    # choose a chunk size such that we don't end calling svn on
    # a single file (which causes the output format to change).
    my $csize = $chunk_size;
    $csize-- while ( ( $csize > 1 ) && ( @list % $csize == 1 ) );

    at_a_time(
        $csize,
        sub {
            my @partial_list = @_;

            foreach my $result (qx($cmd pg $attribute @partial_list)) {

                # This RE may be a little wonky.
                if ( $result =~ m{(.*) - (.*)} ) {
                    my ( $full_path, $attribute ) = ( $1, $2 );

                    # split the path
                    my ( $volume, $directories, $file ) = splitpath $full_path;
                    my @directories = splitdir $directories;

                    # put it back together as a unix path (to match MANIFEST)
                    $full_path =
                        File::Spec::Unix->catpath( $volume, File::Spec::Unix->catdir(@directories),
                        $file );

                    # store the attribute into the results hash
                    $results{$full_path} = $attribute;
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
    my $allow_empty = shift;  # should we allow blank values? (default: no)

    $allow_empty = 0 unless defined $allow_empty;

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
        if ($allow_empty && ! defined $actual) {
            $actual = "";
        }
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

sub git_svn_metadata {
    my $attribute   = shift;
    my $results_ref = shift;

GIT_SVN:
    for my $line (@git_svn_metadata) {

        # Determine file name and attribute value for the files we want
        my ( $filename, $value ) = $line =~ m/prop: (\S+) $attribute (\S+)/;
        next GIT_SVN unless $filename && exists $results_ref->{$filename};

        # Unescape hex values that are in git-svn log and remove any newlines
        $value =~ s/%([0-9A-F]{2})/chr(hex($1))/gie;
        chomp($value);

        $results_ref->{$filename} = $value;
    }
    return $results_ref;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

#!perl
# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use File::Find qw( find );
use File::Basename qw( fileparse );
use File::Spec::Functions qw( canonpath catdir catfile );
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
and 'all "text/plain" files have keyword expansion enabled'.

NOTE: these tests take a B<LONG> time to run.

=cut

## all test files have "text/plain" mime-type
TEST_MIME: {
	my $test_dir = 't';
	my $test_suffix = '.t';

	my @test_files;


	# find test files
	find { no_chdir => 1,
			wanted => sub{ files_of_type( \@test_files, $test_suffix ) },
		} => canonpath catdir( $PConfig{build_dir}, $test_dir );


	my @cmd = qw(svn pg svn:mime-type);

	my $msg = "test file has 'text/plain' mime-type";
	diag $msg;

	is(
		sub{ my $r = qx(@cmd $_); chomp $r; "$_ ($r)" }->(),
		"$_ (text/plain)",
		"$msg ($_)"
	) for @test_files;
} # TEST_MIME

## keyword expansion
KEYWORD_EXP: {
	my @all_files;

	diag "this may take a while...";

	# get files listed in MANIFEST
	@all_files = sort keys %{maniread( catfile $PConfig{build_dir}, 'MANIFEST' )};

	my @cmd = qw(svn pg svn:mime-type);

	my @plain_files = grep { $_ if qx(@cmd $_) =~ m!text/plain! } @all_files;
	chomp @plain_files;

	@cmd = qw(svn pg svn:keywords);

	my $msg = "'text/plain' file has keyword expansion";
	diag $msg;

	is(
		sub{ my $r = qx(@cmd $_); chomp $r; "$_ ($r)" }->(),
		"$_ (Author Date Id Revision)",
		"$msg ($_)"
	) for @plain_files;
} # KEYWORD_EXP


# remember to change the number of tests :-)
BEGIN {
	unless( $Parrot::Revision::svn_entries or `svk ls .` )
	{ plan skip_all => 'not a working copy'; }
	else
	{ plan 'no_plan' };
}



exit;



sub files_of_type
{
	my( $listref, $ext ) = @_;

	return unless -f $File::Find::name
		&& $File::Find::name =~ m/\Q$ext\E$/;

	push @$listref => $File::Find::name;
}


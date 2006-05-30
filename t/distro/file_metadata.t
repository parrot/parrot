#!perl
# Copyright (C) 2006, The Perl Foundation.
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


# get files listed in MANIFEST
my @manifest_files =
	sort keys %{maniread( catfile $PConfig{build_dir}, 'MANIFEST' )};


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
	diag "this may take a while...";

	my @cmd = qw(svn pg svn:mime-type);

	my @plain_files =
		grep { $_ if qx(@cmd $_) =~ m!text/plain! } @manifest_files;
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

	my @cmd = qw(svn pg Copyright);

	my $msg = 'Copyright property matches official copyright';
	diag $msg;

	is(
		sub{ my $r = qx(@cmd $_); chomp $r; "$_: $r" }->(),
		"$_: $official_copyright",
		"$msg ($_)"
	) for @manifest_files;
} # COPYRIGHT
} # SKIP

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


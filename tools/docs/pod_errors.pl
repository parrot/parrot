#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

tools/docs/pod_errors.pl - Reports POD errors

=head1 SYNOPSIS

    % perl tools/docs/pod_errors.pl [dir] [files-to-ignore-regex]

=head1 DESCRIPTION

This script reports on any POD errors found in the files.

=cut

use lib 'lib';
use Parrot::Docs::Directory;

my $dir = Parrot::Docs::Directory->new(shift || '.');
my $ignore = shift || '^(CVS|icu)$';

foreach my $file ($dir->files(1, $ignore))
{
	next unless $file->contains_pod;
	next unless $file->num_pod_errors;
	
	my $errors = $file->pod_errors;
	
	print "\n",
		$file->path, 
		' has ', 
		$file->num_pod_errors, 
		' error',
		$file->num_pod_errors != 1 ? 's' : '', 
		":\n",
		$errors;
}

exit 0;

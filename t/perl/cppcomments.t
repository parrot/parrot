#! perl
# Copyright: 2001-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;


=head1 NAME

t/src/cppcomments.t - checks for C++ style comments

=head1 SYNOPSIS

	% prove t/src/cppcomments.t

=head1 DESCRIPTION

Checks that no source file in the distribution uses C++ style comments.

=cut


my @globs = qw(
    compilers/ast/*.c
    compilers/ast/*.h
    compilers/imcc/*.c
    compilers/imcc/*.h
    include/parrot/*.h
    include/parrot/oplib/*.h
    jit/*/*.h
    src/*.c
    src/classes/*.pmc
    src/classes/*.c
    src/dynpmc/*.pmc
    src/encodings/*.c
    src/io/*.c
    src/io/*.h
    src/ops/*.ops
    src/ops/*.c
    src/packfile/*.c
);

my @comments;

foreach my $glob ( @globs ) {
    foreach my $file ( glob $glob ) {
	my $i = 0;
	
	open FILE, "<$file" or die "Can not open '$file' for reading!\n";
	foreach my $line ( <FILE> ) {
	    ++$i;
	    next unless $line =~ m|//|;
	    next if $line =~ m|://|; # skip ftp:// http:// etc
	    
	    push @comments, "$file:$i: $line"
	}
	close FILE;
    }
}

ok( ! scalar(@comments), 'C++ style comments')
or diag( "C++ style comments found:\n@comments" );

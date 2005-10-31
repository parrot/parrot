#! perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/src/cppcomments.t - checks for C++ style comments

=head1 SYNOPSIS

	% perl -Ilib t/src/cppcomments.t

=head1 DESCRIPTION

Checks that no source file in the distribution uses C++ style comments.

=cut

use strict;
use Test::More tests => 1;

my @globs = qw(
    ast/*.c
    ast/*.h
    classes/*.pmc
    classes/*.c
    dynclasses/*.pmc
    encodings/*.c
    imcc/*.c
    imcc/*.h
    include/parrot/*.h
    include/parrot/oplib/*.h
    io/*.c
    io/*.h
    jit/*/*.h
    ops/*.ops
    ops/*.c
    pf/*.c
    src/*.c
    types/*.c
    types/*.h
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

ok ( !@comments, 'C++ style comments')
or diag( "C++ style comments found:\n@comments" );

#! perl
# Copyright: 2001-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use 5.008;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;


=head1 NAME

t/src/cppcomments.t - checks for C++ style comments

=head1 SYNOPSIS

    % prove t/src/cppcomments.t

=head1 DESCRIPTION

Checks that no source file in the distribution uses C++ style comments.

=head1 TODO

't/perl' is not really the correct location for this test.

Use Parrot::Distribution for looking for C-source files.

=cut


my @globs = qw(
    compilers/ast/*.c
    compilers/ast/*.h
    compilers/imcc/*.c
    compilers/imcc/*.h
    include/parrot/*.h
    include/parrot/oplib/*.h
    src/*.c
    src/charset/*.c
    src/charset/*.h
    src/dynoplibs/*.ops
    src/dynpmc/*.pmc
    src/encodings/*.c
    src/encodings/*.h
    src/io/*.c
    src/io/*.h
    src/jit/*/*.h
    src/ops/*.ops
    src/pmc/*.pmc
    src/packfile/*.c
);

my @comments;

foreach my $glob ( @globs ) {
    foreach my $file ( glob $glob ) {
        
        open FILE, "<$file" or die "Can not open '$file' for reading!\n";
        foreach my $line ( <FILE> ) {
            next unless $line =~ m{//};
            next if $line =~ m{://};     # skip ftp:// http:// etc
            next if $line =~ m{"//};     # skip printf("//= ")
            
            push @comments, "$file: $line"
        }
        close FILE;
    }
}

ok( ! scalar(@comments), 'C++ style comments')
or diag( "C++ style comments found:\n@comments" );

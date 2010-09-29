#! perl
# Copyright (C) 2010, Parrot Foundation.
# $Id$

use strict;
use warnings;

use lib qw[ . lib ../lib ../../lib ];
use Test::More tests => 1;
use Parrot::Distribution;

my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? <@ARGV> : $DIST->get_c_language_files();

check_enums(@files);

exit;

sub check_enums {
    my @trailing_comma;

    foreach my $file (@_) {
	my $path = @ARGV ? $file : $file->path();
	my $buf  = $DIST->slurp($path);

        # strip ', ", and C comments
        $buf =~ s{ (?:
                       (?: (') (?: \\\\ | \\' | [^'] )* (') ) # remove ' string
                     | (?: (") (?: \\\\ | \\" | [^"] )* (") ) # remove " string
                     | /(\*) .*? (\*)/                        # remove C comment
                   )
                }{defined $1 ? "$1$2" : defined $3 ? "$3$4" : "$5$6"}egsx;

	if ($buf =~ /enum \s+ (?: (\w+) \s+ )? {
			[^}]+,
		    \s+ } (?: \s+ (\w+) )?/x) {
	    my $name = $1 || $2 || '(anonymous)';
	    push @trailing_comma => "$path: $name";
	}
    }

    is( join("\n", @trailing_comma), "", <<END_DESCRIPTION );
trailing commas in enums are not legal C89
END_DESCRIPTION
}

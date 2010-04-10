#!perl -w
# Copyright (C) 2010, Parrot Foundation.
# $Id$
#
# perl script that deliver all filenames and the associated chapters
#

use Getopt::Long ();

my $item_list_ref = [ ['intro.pod', 'Introduction to Parrot'],
                      ['overview.pod', 'Overview'],
                    ];

my $lang = @$item_list_ref;

my ( $result, $give_out, $b_out);

$result = Getopt::Long::GetOptions (
	"print" => \$give_out,
	"b_out" => \$b_out,
);

if ($give_out)  {
	for ( my $i=0; $i<$lang; $i++ )
		{ print $$item_list_ref[$i][0], ' ' }
	exit;
};

if ($b_out) {
	for ( my $i=0; $i<$lang; $i++ )
		{ print 'build/modified_pod/', $$item_list_ref[$i][0], ' ' }
	exit;
};


for (my $i=0; $i<$lang; $i++)
	{ `sed -e '4,6c\=head0 $$item_list_ref[$i][1]' $$item_list_ref[$i][0] > build/modified_pod/$$item_list_ref[$i][0]` }




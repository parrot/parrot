#!/usr/bin/perl -w
#
no warnings 'once';
$parpath='../../../languages/imcc/imcc';
if (! -d $parpath) {
	$parpath='../../..';
}

unlink "test.pbc";

#$a=system("perl -I$parpath $parpath/assemble.pl -o _test.pbc TARG_test.pasm");
system("$parpath @ARGV TARG_test.pasm");

#!/usr/bin/perl -w
#
no warnings 'once';
$parpath='../../../languages/imcc/imcc';
if (! -d $parpath) {
	$parpath='../../..';
}

unlink "_test.pbc";

$a=system("perl -I$parpath $parpath/assemble.pl -o _test.pbc TARG_test.pasm");
system("$parpath/parrot _test.pbc");

#!/usr/bin/perl -w
#
no warnings 'once';
$parpath='..\..\..';
if (! -d $parpath) {
	$parpath='..\..\..';
}

unlink "test.pbc";

$a=system("perl -I$parpath $parpath/assemble.pl -o _test.pbc TARG_test.pasm");
system("$parpath\\parrot.exe @ARGV _test.pbc");

#! perl -w

no warnings 'once';
$parpath='../../../languages/imcc/';
if (! -d $parpath) {
	$parpath='../../..';
}

unlink "_test.pbc";

$a=system("$parpath/imcc.exe TARG_test.imc");

#! perl -w

no warnings 'once';
$parpath='../../../';

unlink "_test.pbc";

# XXX - This file should be generated at config time, so as to get
# the appropriate path and executable name.
$a=system("$parpath/parrot TARG_test.imc");

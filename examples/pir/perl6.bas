1 rem Copyright (C) 2009, Parrot Foundation.
3 rem
10 rem +----------------------------------------------------------------------+
20 rem + perl6.bas                                                             +
30 rem + A test of the pirric basic interpreter                               +
40 rem + First build perl6                                                    +
50 rem + Then do:                                                             +
60 rem + ../../parrot -L /yourparrotdir/languages/perl6 pirric.pir perl6.bas  +
70 rem +----------------------------------------------------------------------+
80 rem
1010 load "perl6.pbc",b
1020 perl= compreg("Perl6")
1030 t=perl.compile("say 'Perl6 called from pirric';")
1040 n= t()
1050 exit

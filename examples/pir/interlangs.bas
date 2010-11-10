1 REM Copyright (C) 2009, Parrot Foundation.
3 REM
110 REM +--------------------------------------------------------------------+
120 REM + interlangs.bas                                                     +
130 REM + A test of parrot HLL languages interoperability                    +
140 REM + from pirric basic interpreter                                      +
150 REM + First build perl6, ecmascript and pipp                             +
160 REM + Then do:                                                           +
170 REM + ../../parrot -L /yourparrotdir/languages/rakudo \                  +
180 REM +              -L /yourparrotdir/languages/ecmascript \              +
190 REM +              -L /yourparrotdir/languages/pipp \                    +
200 REM +               pirric.pir interlang.bas                             +
210 REM +--------------------------------------------------------------------+
220 REM
1000 REM Load languages
1010 GOSUB 2000
1020 REM Compile code
1030 GOSUB 3000
1200 REM Execute compiled code
1210 REM Forget the return value from ecmascript
1220 unused= jsblock()
1230 REM The perl6 block return the sub we need
1240 perl6sub= perl6block()
1300 REM Now start playing
1310 REM Get the javascript function created
1318 REM Get the function from the js HLL.
1319 REM *** This syntax is subject to change ***
1320 myfunc= js.myecmascriptfunc
1330 REM Call the perl6 sub passing the ecmascript function as second argument
1340 PRINT perl6sub("pirric", myfunc)
1400 REM Call the perl6 sub passing the pipp function as second argument
1410 mypippfunc= pipp.phpfunc
1420 PRINT perl6sub("pirric", mypippfunc)
1600 REM First the ecmascript function PRINT his message,
1610 REM then the parrot sub returns a string,
1620 REM that is printed by pirric.
1630 REM The output must be:
1640 REM
1650 REM Hello from ecmascript, perl6->pirric
1660 REM Hello from a perl6 sub, pirric
1670 REM
1680 REM Followed by the same with pipp
1900 REM That's all folks!
1910 EXIT
2000 REM
2010 REM Load languages
2020 REM
2100 ON ERROR GOTO 2900
2110 LOAD "perl6.pbc", b
2120 perl6compiler = COMPREG("Perl6")
2200 ON ERROR GOTO 2920
2210 LOAD "js.pbc", b
2220 ecmascriptcompiler= COMPREG("JS")
2300 ON ERROR GOTO 2940
2310 LOAD "pipp.pbc", b
2320 pippcompiler= COMPREG("Pipp")
2800 ON ERROR GOTO 0
2810 RETURN
2900 PRINT "Can't load perl6"
2910 EXIT 1
2920 PRINT "Can't load ecmascript"
2930 EXIT 1
2940 PRINT "Can't load pipp"
2950 EXIT 1
3000 REM
3010 REM Compile code
3020 REM
3100 REM Perl6 code that return an anonymous sub
3110 ON ERROR GOTO 3900
3120 perl6block=perl6compiler.compile("sub ($a, $b){$b('perl6->' ~ $a); 'Hello from a perl6 sub, ' ~ $a; };")
3200 REM ecmascript code that defines a function
3210 ON ERROR GOTO 3920
3220 jsblock=ecmascriptcompiler.compile("function myecmascriptfunc(n) { print ('Hello from ecmascript,', n); }")
3310 ON ERROR GOTO 3940
3320 pippblock= pippcompiler.compile("<?php function phpfunc ($msg) { echo ""Hello from pipp, $msg\n""; } phpfunc(); ?>")
3800 ON ERROR GOTO 0
3810 RETURN
3900 PRINT "Error compiling perl6"
3910 EXIT 1
3920 PRINT "Error compiling ecmascript"
3930 EXIT 1
3940 PRINT "Error compiling pipp"
3950 EXIT 1

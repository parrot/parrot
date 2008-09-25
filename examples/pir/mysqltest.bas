1 rem Copyright (C) 2008, The Perl Foundation.
2 rem $Id$
3 rem
10 rem +----------------------------------------------------------------------+
20 rem + mysqltest.bas                                                        +
30 rem + A test of the pirric basic interpreter                               +
40 rem + First build the Mysql module in examples/nci                         +
50 rem + Then do:                                                             +
60 rem + ../../parrot -L /yourparrotdir/examples/nci pirric.pir mysqltest.bas +
70 rem +----------------------------------------------------------------------+
80 rem
100 load "Mysql.pbc",b
110 my = new("Mysql")
120 a = my.connect("localhost","parrot","baDworD","parrot")
130 q = my.query("select * from hello")
140 result = my.use_result()
150 e = result.field_count()
160 print "Fields: "; e
1000 rows = 0
1010 row = result.fetch_row()
1020 if row then goto 1100
1030 print "Rows: "; rows
1040 end
1100 rows = rows + 1
1140 for i= 1 to e
1160 print "'"; row.get(i - 1); "'";
1180 if i < e then print ", ";
1190 next
2000 print
2010 goto 1010

1 rem Copyright (C) 2008, The Perl Foundation.
2 rem $Id$
3 rem
10 rem Hello
100 rem ------------------
110 rem Generating program
120 rem ------------------
130 p = new("Program")
140 v = p.storeline(10, "rem Hello, world")
150 v = p.storeline(20, "print ""Hello, world""")
160 v = p.storeline(30, "?""Bye""")
170 v = p.storeline(100, "exit")
200 rem -------------------------------------------
210 v= p.list(20, 30)
1000 rem -------------------------
1010 rem Run the generated program
1020 rem -------------------------
1030 r = new("Runner")
1040 v= r.setprogram(p)
1050 print "----Running----"
1060 v= r.runloop(1)
1070 print "----Finished---"
1080 exit

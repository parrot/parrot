1 rem Copyright (C) 2008, Parrot Foundation.
3 rem
10 rem Hello
20 on error exit 1
100 rem ------------------
110 rem Generating program
120 rem ------------------
130 p = new("Program")
140 v = p.storeline(10, "rem Hello, world")
150 v = p.storeline(20, "hello = ""Hello, world""")
160 v = p.storeline(30, "print hello")
170 v = p.storeline(40, "?""Bye""")
180 v = p.storeline(100, "on error exit 42")
190 v = p.storeline(110, "error 10")
200 rem -------------------------------------------
210 v= p.list(20, 40)
1000 rem -------------------------
1010 rem Run the generated program
1020 rem -------------------------
1030 r = new("Runner")
1040 v= r.set_program(p)
1050 print "----Running----"
1060 v= r.runloop(1)
1070 print "----Finished---"
1080 print "Exit code: "; v
1090 hello = r.get_var("hello")
1100 print "hello: "; hello
2000 exit

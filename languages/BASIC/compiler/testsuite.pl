#! perl -w

# Relies on "testrun.pl" being setup correctly.
#
#
$tn=0;
while(1) {
	{
		local $/="";
		$_=<DATA>;
	}
	if (/type / or /select/) { # /function/
		print "Skipped\n";
		next;
	}
	last unless $_;
	last if /STOPPLEASE/;
	@c=m/^'\s*(.*)/gm;
	print join("\n", @c), "\n====================== $tn\n" if @c;
	$tn++;
	open(OF, ">_testsuite.bas") || die;
	print OF $_;
	close(OF);
	if ( ! system("perl compile.pl _testsuite.bas")) {
		system("perl testrun.pl > _output2");
		open(O, "_output2") || die;
		print <O>;
		close(O);
		print "\n";
	}
	
}

__DATA__
input a$,
print a$

STOPPLEASE
' Expect 10
sub second(b() )
	b(5)=10
end sub
sub first(a() )
	call second(a())
end sub
dim t(),f()
call first(t())
print t(5)

' Keys test, "interesting"
dim a$(),b$()
b$("Key 1")="This is"
b$("Key 2")="an"
B$("Hi Mom!")="interesting"
B$(0)="development.
keys a$(), b$()
i=0
do
	t$=a$(i)
	print t$,
	print tab$(10),b$(t$)
	i=i+1
loop while t$ <> ""

' 5 and PI
dim a$(), m()
a$(1)="5"
print a$(1)
m(99)=3.14
print m(99)

' basic I/O  1..5
open "_testfile" for output as #3
for i=1 to 5
	print #3, i
next i
close #3
open "_testfile" for input as #5
for i = 1 to 5
	input #5,a$
	print a$,
next i
close #5
print

' Expect 5, 0, "Hello"
common i, a$
sub mysub
	print "In the sub\n"
	print i
	print j
	print a$
	print c$
end sub
j=2
i=5
a$="Hello"
c$="WRONG"
call mysub()


' Expect 10
sub second(b() )
	b(5)=10
end sub
sub first(a() )
	call second(a())
end sub
dim t(),f()
call first(t())
print t(5)


' Expect OK
y=59.7363
x=19.506
if ( y > 0 ) and (x > 0) then
	print "OK"
end if



' Passing string arrays, expect 99 and "Hello"
function foo(i, thing$())
	print i
	print thing$(10)
	foo=1
end function
dim fool$()
fool$(10)="Hello"
a=foo(99, fool$())

' String Arrays, expect "One"
dim g$()
g$(5)="One"
g$(6)="Two"
print g$(5)

' Evil BASIC bug, expect 55
dim B(1), z(1)
Z(54,6)=54
B(54)=1
Z1= 54
Z(Z1,6)= 54
B(Z(Z1,6))= 55
print B(Z(Z1,6))


' Comparison operator tests
if 4<5 then print "Ok" else print "Wrong"
if 5<5 then print "Wrong" else print "Ok"
if 6<5 then print "Wrong" else print "OK"
if 4<=5 then print "Ok" else print "Wrong"
if 5<=5 then print "Ok" else print "Wrong"
if 6<=5 then print "Wrong" else print "OK"
if 4=5 then print "Wrong" else print "Ok"
if 5=4 then print "Wrong" else print "Ok"
if 5=5 then print "Ok" else print "Wrong"
if 5>4 then print "Ok" else print "Wrong"
if 5>5 then print "Wrong" else print "Ok"
if 4>5 then print "Wrong" else print "OK"
if 5>=4 then print "Ok" else print "Wrong"
if 5>=5 then print "Ok" else print "Wrong"
if 4>=5 then print "Wrong" else print "OK"

' Exit for, count 1-3
for i=1 to 5
  if i=4 then exit for
  print i
next i

' Branch test, all OK in sequence
PRINT "1 in module-level code"
GOSUB Sub1
PRINT "ERR this line in main routine should be skipped"
Label1:
   PRINT "5 back in module-level code"
   END
Sub1:
   PRINT "2 in subroutine one"
   GOSUB Sub2
   PRINT "ERR this line in subroutine one should be skipped"
Label2:
   PRINT "4 back in subroutine one"
   RETURN Label1
Sub2:
   PRINT "3 in subroutine two"
   RETURN Label2   'Cannot return from here to main
                   'program - only to SUB1.
' Exit tests
sub mysub(b,c)
	print "Print me"
	exit sub
	print "Don't print me"
end sub
function foo$
	foo$="Right one"
	exit function
	foo$="Wrong one"
end function
call mysub( 78, 80)
t$=foo$
print t$
t=0
do
	print "This is right"
	exit do
	print "This is wrong"
	t=t+1
loop until t>1

' Mathmagic
dim m(1), ba(1)
fa=-1
m0=48100
m=48000
w=-19
t=3
m(t)=-100
ba(fa+1)=9
w=w+M(T)+INT(M(T) * BA(FA + 1) / (BA(FA + 1) + 1) * (M0 - M) * .0001)
print w

' INT madness.  0, 0, 0, -1, -1, 3
print int(.8),
print int(.3),
print int(0),
print int(-.8),
print int(-.3),
print int(3.14)

' Simple subs, Made it here
sub mysub()
	print "Made it here"
end sub
call mysub()

' Arguments.  Expect 2 and 4
sub twice(a)
	print a
	a=a*2
end sub
t=2
call twice t
print t

' Passing arrays, twice, expect 12
function aftwo(y())
	print y(4)
end function
function arrfunc(x())
	u=aftwo(x())
	arrfunc=55
end function
dim g(10)
g(5)=666
g(4)=12
a=g(5)+0
y=arrfunc(g())

' Passing arrays (expect 12)
function arrfunc(x())
	print x(4)
	arrfunc=55
end function
dim g(10)
g(4)=12
y=arrfunc(g())

' Function Array scopes, expect 4, 5.6
function mine(a)
	dim t(6)
	s=32
	t(3)=2
	mine=a*2
	print t(3)*2
end function
dim t(7)
z=55
t(3)=5.6
a=mine(5)
print t(3)

1740 print "Branched"
	end
' Logical Operators 
print "      AND   OR    XOR   EQV   IMP   a & ! b"
for i = 0 to 1
for j = 0 to 1
print i; j;
if i and j then a$="True  " else a$="False "
if i or  j then b$="True  " else b$="False "
if i eqv j then d$="True  " else d$="False "
if i imp j then e$="True  " else e$="False "
if i and not j then f$="True   " else f$="False "
print a$;b$;c$;d$;e$;f$
next j,i

' Function Array scopes, expect 4, 5.6
function mine(a)
	dim t(6)
	t(3)=2
	mine=a*2
	print t(3)*2
end function
dim t(7)
t(3)=5.6
a=mine(5)
print t(3)

' Unary minus goodness
Dim t7(1),w(10)
w=20
w(2)=5
t7(0)=0
w=w-(T7(0) * T7(0) * 12)
' Expect 20
print w
' Expect -20
print -w
' Expect -5
print -w(2)
' Expect 3
print 5-2
' Expect 3 also
print 5+-2
' Expect 0
print 6-abs(-6)


' Some register confusion, expect .PTFCDR
Dim c(10), a$(10), u(10)
510 FOR I = 0 TO 6
520 READ A$(I), U(I)
    print A$(I);
530 NEXT I
540 DATA ".",0,"P",100,"T",500,"F",350
550 DATA "C",325,"D",900,"R",20000

' Read/data  Hello World -
10 read a$
print a$
if a$ = "-" then end
goto 10
100 data "Hello", "World", "-", 56.6

' Compilation bug, expect "Ok"
i$="N"
if i$="N" then goto 35
end
35 print "Ok"
end

' Compilation bug, expect "Ok"
dim s(1)
goto 10
INPUT S(0, 1), S(0, 2), S(0, 3), S(0, 4)
10 print "Ok"
end

' Odd bug in static strings.  Expect "Ok"
dim O(1)
IF E$ <> "O" THEN 5030
print "Wrong!"
end
5030 print "Ok"
	end

' Equals bug, should print = greeting
dim a$(1)
a$(2)="World"
a$="Hello"
A$ = A$ + "=" + A$(2)
print a$


' Do/While/Loop stuff.  All 5
a=0
do while a<5
	a=a+1
loop
print a
a=0
do until a>4
	a=a+1
loop
print a
a=0
do
	a=a+1
loop while a<5
print a
a=0
do
	a=a+1
loop until a>4
print a


' Swap
a$="Hello"
b$="Goodbye"
print a$,b$
swap a$,b$
print a$,b$

' Bubble sort cities
TRUE=1
FALSE=0
DIM A$(4)
A$(1) = "New York"
A$(2) = "Boston"
A$(3) = "Chicago"
A$(4) = "Seattle"
Max = 4 'UBOUND(A$)
Exchange=TRUE           ' Force first pass through the array.
WHILE Exchange          ' Sort until no elements are exchanged.
   Exchange=FALSE
   ' Compare the array elements by pairs. When two are exchanged,
   ' force another pass by setting Exchange to TRUE.
   FOR I = 2 TO Max
      IF A$(I-1) > A$(I) THEN
         Exchange = TRUE
         B$=A$(I-1)
         A$(I-1)=A$(I)
         A$(I)=B$
         ' SWAP A$(I - 1), A$(I)
      END IF
   NEXT
WEND
 ' CLS
FOR I = 1 TO 4
   PRINT A$(I)
NEXT I
END

' mid/left/right  2-9, 1-5, 6-0
t$="1234567890"
print mid$(t$, 2, 8)
print left$(t$, 5)
print right$(t$, 5)
' instr
s1$="The longer string"
found$="longer"
bogus$="not"
print "Found  (5): ", instr(s1$, found$)
print "Bogus  (0): ", instr(s1$, bogus$)
print "Null   (1): ", instr(s1$, "")
print "Start (11): ", instr(6, s1$, " ")
print "Inval  (0): ", instr(4, bogus$, "t")
' instr() tests
s1$="Mixed case"
print ucase$(s1$);" Upper"
print lcase$(s1$);" Lower"
a$="   Flush   "
print ">";ltrim$(a$)
print rtrim$(a$);"<"
' A's and -'s
print string$(10,75-10)
print string$(20, "-")

' ON..GOTO   200! and then Oats..
t=2
on t goto 100, 200, 300
print "No match\n"
FIN:
for i = 1 to 3
	on i gosub oats, peas, beans
next i
print
end
100 print "100!"
    goto FIN
200 print "200!"
    goto FIN
300 print "300!"
    goto FIN
oats:
	print "Oats",
	return
peas:
	print "Peas",
	return
beans:
	print "Beans",
	return

' Truth
s$="Hello"
if s$ then print "This is true" else print "Oops (string)"
s$=""
if s$ then print "Should not happen (string)"
i%=0
if i% then print "Should not happen (int)"
i%=54
if i% then print "This is true" else print "Oops (int)"
i=0
if i then print "Should not happen (flo)"
i=55
if i then print "This is true" else print "Oops (flo)"

' Expect OK
if 2 > 1 then
	print "Ok"
else
	print "All is not right"
end if

' Count from 9 to 0, print 5
dim y(10)
i=10
tloop:
	y(i)=i
	i=i-1
	print i
	if i then goto tloop
print y(5)


' Column alignment
print "Hello";tab$(15);"World"
print "Foo";tab$(15);"Stuff"
print "I am the very model of a modern";tab$(15);"More"
print "Hello","Again",d
dim c$(1)
for i = 1 to 20 : read c$(i) : next
print
for i = 1 to 20 step 4
  print c$(i);tab$(12);c$(i+1);tab$(22);c$(i+2);tab$(32);c$(i+3)
next
print
data "ABANDON","CHART","COMPUTER"
data "DAMAGES","DESTRUCT","DOCK","IDLE","IMPULSE","LRSCAN","NAVIGATE","PHASERS","QUIT"
data "SHIELDS","SOS","SRSCAN","STATUS","TORPEDO","TRANSFER","VISUAL","WARP"

' Random number distribution
randomize timer
max=10
dim a(max)
for i = 0 to 100
	b=rnd*max+1
	a(b)=a(b)+1
next i
for i = 1 to max
	print ,
	for j = 0 to a(i)
		print "*";
	next j
	print 
next i

' Trig
w=15
dim a$(w)
for i = 0 to (22/7)*2 step 0.40
	for j = 1 to w*2
		a$(j)=" "
	next j
	a$(w+w*sin(i)+1)="*"
	a$(w+w*cos(i)+1)="+"
	for j = 1 to w*2
		print a$(j);
	next j
	print
next i

' Expect Correct
DIM A(1,1)
RO=1
IF A(RO,5)=0 THEN GOSUB 20: REM GOO
   end
20 print "Correct"
   return

' Expect Hello A World
print "Hello " + chr$(65);
print " World"

' Expect 21 and "Correct"
print 1+int(20)
if t = 6 then 
	print "Hi"
elseif t=1 then
	print "Wrong"
else
	print "Correct"
end if
if p$ = "Hello" then print "Whoa"

' Count by .5's and True! after 3
for t=1 to 10 step 0.5
print t,
print sqr(t),
if t=3 then print "True!"
next t


' Expect OK
if 2 > 1 then
	print "Ok"
else
	print "All is not right"
end if

' Three random numbers
print str$(rnd)
print str$(rnd())
print str$(rnd(1))


' Expect Hello A World
print "Hello " + chr$(65);
print " World"

' Expect nothing
Dim A(10)
z=3
c=c+a(z)

' String function, whoa
function a$
	a$="Whoa"
end function
print a$


' Changed ref'd var from 5 to 12
function myfunc(a)
	print a
	a=12
        myfunc=80
end function
z=5
T=myfunc(z)
print z

' Basic Hello
a$="Hello"
print a$

' Simplest function, return 10
function twice(number)
	twice=2*number
end function
a=twice(5)
print a


' Expect -7
t%=-7
print t%

' Expect 9
print (2+3*5-(6+abs(0-3)))+1


' Expect a Hello, World!
print "Hello, ";	' COmment
print "World!"

' Expect Correct
DIM A(1,1)
RO=1
IF A(RO,5)=0 THEN GOSUB 20: REM GOO
   end
20 print "Correct"
   return


' Expect Correct
t=0
g=0
if t then
	print "Wrong"
else 
	if g then
		print "Wrong again"
	else 
		print "Correct"
	end if
end if

' Expect Correct
t=0
g=0
if t then
	' t is false, don't go here.
	print "Mistake"
elseif g then
	print "Also a mistake"
else 
	print "Correct"
end if

' Simple variable assignment, expect 7
a=0
b=7
a=b
print a

' Expect rough PI
print 22/7

' Expect 6.00000
t=6
print t

' Expect -7
t%=-7
print t%

' Expect 7
t%=7
print t%*1

' Also expect 7
t%=7
print 1*t%

' Expect correct
t=0
if t then print "Wrong" else print "Correct"

' Expect correct
t=0
if t then
	print "Wrong"
else 
	print "Correct"
end if

' Expect correct
t=1
if t then
	print "Correct"
else 
	print "Wrong"
end if

' Factorial of 5 is 120
function factorial(a)
	if a then factorial=a*factorial(a-1) else factorial=1
end function
T=factorial(5)
print T!

' Correct and factorial of 4 is 24
function factorial(a)
	if a then factorial=a*factorial(a-1) else factorial=1
end function
t=0
g=0
if t then
	print "Mistake"
elseif g then
	print "Also a mistake"
else 
	print "Correct now 24"
	print factorial(4)
end if

' Changed ref'd var from 5 to 12
function myfunc(a)
	print a
	a=12
        myfunc=80
end function
z=5
T=myfunc(z)
print z

' Basic Hello
a$="Hello"
print a$

' Concatenation greeting
a$="Hello,"
b$=" world!"
c$=a$+b$
print c$

' String function, whoa
function a$
	a$="Whoa"
end function
print a$

' String reference, no way
function a$(u$)
	u$="No way"
	a$="Hello"
end function
t$="Not me"
e$=a$(t$)
print t$

' references to references, expect 99
function last(t)
	t=99
	last=0
end function
function middle(s)
	middle=last(s)
end function
function start(r)
	start=middle(r)
end function
h=12
y=start(h)
print h

' Basic structure  6, Hello and PI
type newtype
	foo as integer
	bar as string
	narf as double
end type
dim t as newtype
t.foo=6
t.bar="Hello"
t.narf=3.1415
print t.foo
print t.bar
print t.narf

' Variable-depth structure references
type first
	foo as integer
	bar as string
end type
type second
	other as first
	narf as integer
	pnext as first
end type
type third
	number as integer
	start as second
end type
dim t as first
dim u as second
dim v as third
' Results in 6, 15, and "Hello"
t.foo=6
print t.foo
u.other.foo=15
print u.other.foo
v.start.pnext.bar="Hello"
print v.start.pnext.bar

' Member functions, give 0 and 3 (modified)
type first
	foo as integer
	bar as string
end type
type second
	other as first
	narf as double
	pnext as first
end type
type third
	number as integer
	start as second
end type
dim y as third
t=y.start.narf+3
print y.start.narf
print t

' Deep-copy of structures, 34 (NOT 99)
type first
	foo as integer
	bar as string
end type
type second
	link as first
end type
type third
	poit as integer
	fwd as second
end type
dim x as third
dim y as third
dim k as second
x.fwd.link.foo=34
y.fwd=x.fwd
x.fwd.link.foo=99
print y.fwd.link.foo

' Structure assignment torture
' Expect: 99, 1, "user-type first"
type first
	foo as integer
	bar as string
end type
type second
	other as first
	narf as integer
	pnext as first
end type
dim x as second
dim y as second
dim t as first
x.other.foo=1
x.other.bar="one"
x.narf=99
x.pnext.foo=2
x.pnext.bar="two"
y=x
print y.narf
t=x.other
print t.foo
print t

' Passing structures
' Expect:  100, 12 and 103
type first
	foo as integer
	bar as string
end type
function mine (a, b, c as first)
	a=12
	b=99
	c.foo=103
	mine=100
end function
dim z as first
z.foo=13
print mine(foo,20,z)
print foo
print z.foo

' Should print 100, 103
type first
	foo as integer
	bar as string
end type
type second
	pointer as first
	number as integer
end type
function mine (a, b, q as first)
	q.foo=103
	mine=100
end function
dim z as second
z.number=13
z.pointer.foo=12
print mine(foo,20,z.pointer)
print z.pointer.foo

' Array access, 132
type first
	foo as integer
	bar as string
end type
dim y(5)
y(3)=66
dim u(5) as first
print y(3)*2

' Array structure access, 56/0
type first
	foo as integer
	bar as string
end type
dim u(5) as first
u(2).foo=56
print u(2).foo

' Array assignment, 78
dim y(5)
y(1)=78
print y(1)

' Casting with arrays, 5.00000
dim y!(10)
j=2
i%=5.34
y!(i)=i%
print y!(i)

' Count from 9 to 0, print 5
dim y(10)
i=10
tloop:
	y(i)=i
	i=i-1
	print i
	if i then goto tloop
print y(5)

' Truth
s$="Hello"
if s$ then print "This is true" else print "Oops (string)"
s$=""
if s$ then print "Should not happen (string)"
i%=0
if i% then print "Should not happen (int)"
i%=54
if i% then print "This is true" else print "Oops (int)"
i=0
if i then print "Should not happen (flo)"
i=55
if i then print "This is true" else print "Oops (flo)"

' Passing arrays (expect 12)
function arrfunc(x())
	print x(4)
	arrfunc=55
end function
dim g(10)
g(5)=666
g(4)=12
a=g(5)+0
y=arrfunc(g())

' Passing arrays, twice, expect 12
function aftwo(y())
	print y(4)
end function
function arrfunc(x())
	u=aftwo(x())
	arrfunc=55
end function
dim g(10)
g(5)=666
g(4)=12
a=g(5)+0
y=arrfunc(g())

' For loops, by two and backwards
for i = 0 to 10 step 2
	print i,
next i
print
for i = 10 to 3 step -1
	print i
next i
print

' For loops.  3..6 nested in 1..3
function foo
	for y=3 to 6
	print y,
	next y
	foo=99
end function
for t%=1 to 3
  h=foo()
  print "    ", t%
next t%

' Swap
a$="Hello"
b$="Goodbye"
print a$,b$
swap a$,b$
print a$,b$


' Anti-crawling, gives 0
function foo
	print y
	foo=99
end function
y=66.66
u=foo()

' Bubble sort cities
TRUE=1
FALSE=0
DIM A$(4)
A$(1) = "New York"
A$(2) = "Boston"
A$(3) = "Chicago"
A$(4) = "Seattle"
Max = 4 'UBOUND(A$)
Exchange=TRUE           ' Force first pass through the array.
WHILE Exchange          ' Sort until no elements are exchanged.
   Exchange=FALSE
   ' Compare the array elements by pairs. When two are exchanged,
   ' force another pass by setting Exchange to TRUE.
   FOR I = 2 TO Max
      IF A$(I-1) > A$(I) THEN
         Exchange = TRUE
         B$=A$(I-1)
         A$(I-1)=A$(I)
         A$(I)=B$
         ' SWAP A$(I - 1), A$(I)
      END IF
   NEXT
WEND
 ' CLS
FOR I = 1 TO 4
   PRINT A$(I)
NEXT I
END

' Do/While/Loop stuff.  All 5
a=0
do while a<5
	a=a+1
loop
print a
a=0
do until a>4
	a=a+1
loop
print a
a=0
do
	a=a+1
loop while a<5
print a
a=0
do
	a=a+1
loop until a>4
print a

' Branch test, all OK in sequence
PRINT "1 in module-level code"
GOSUB Sub1
PRINT "ERR this line in main routine should be skipped"
Label1:
   PRINT "5 back in module-level code"
   END
Sub1:
   PRINT "2 in subroutine one"
   GOSUB Sub2
   PRINT "ERR this line in subroutine one should be skipped"
Label2:
   PRINT "4 back in subroutine one"
   RETURN Label1
Sub2:
   PRINT "3 in subroutine two"
   RETURN Label2   'Cannot return from here to main
                   'program - only to SUB1.
' Exit tests
sub mysub(b,c)
	print "Print me"
	exit sub
	print "Don't print me"
end sub
function foo$
	foo$="Right one"
	exit function
	foo$="Wrong one"
end function
call mysub 78, 80
t$=foo$
print t$
t=0
do
	print "This is right"
	exit do
	print "This is wrong"
	t=t+1
loop until t>1

' Function test:  A, 3, 90
print chr$(65)
print int(3.1415)
print asc("Z")

' Logical Operators (not NOT)
print "      AND   OR    XOR   EQV   IMP"
for i = 0 to 1
for j = 0 to 1
print i; j;
if i and j then a$="True  " else a$="False "
if i or  j then b$="True  " else b$="False "
if i xor j then c$="True  " else c$="False "
if i eqv j then d$="True  " else d$="False "
if i imp j then e$="True  " else e$="False "
print a$;b$;c$;d$;e$
next j,i

' Select-case (all positive)
t=50
select case t
case 10
	print "Wrong"
case 50
	select case g
	case 6
		print "Wrong again!"
	case 0
		print "Right (nest)!"
	end select
	print "Ongoing (right also)"
end select
select case t*1+0
case 1 to 10, t*2, >100
	print "Wrong 1!"
case 49 to 49, t*2, g
	print "Wrong 2!"
case t
	print "Ok!"
end select
select case h
case 99
	print "Wrong 3!"
case <5
	print "Ok!"
case <10   ' Fallthrough
	print "Ok (not!)"
end select
select case h
case 1
	print "Nothing!"
case 2
	print "Wrong-o!"
case else
	print "Right!"
end select
a$="one"
select case a$
case "zero"
	print "Bzzt"
case "two"
	print "not"
case "one"
	print "Correct!"
end select

' mid/left/right  2-9, 1-5, 6-0
t$="1234567890"
print mid$(t$, 2, 8)
print left$(t$, 5)
print right$(t$, 5)
' instr
s1$="The longer string"
found$="longer"
bogus$="not"
print "Found  (5): ", instr(s1$, found$)
print "Bogus  (0): ", instr(s1$, bogus$)
print "Null   (1): ", instr(s1$, "")
print "Start (11): ", instr(6, s1$, " ")
print "Inval  (0): ", instr(4, bogus$, "t")
' instr() tests
s1$="Mixed case"
print ucase$(s1$);" Upper"
print lcase$(s1$);" Lower"
a$="   Flush   "
print ">";ltrim$(a$)
print rtrim$(a$);"<"
' A's and -'s
print string$(10,75-10)
print string$(20, "-")

' Read, data, restore
' Numbers, symbols in two rows and then two rows of identical numbers
type foo
	first as integer
end type
dim y as foo
read a,b,y.first
read a$,t$,d$
print a,b,y.first
print a$,t$,d$
for i=1 to 5
	read h
	print h,
next i
print
restore 20
for i=1 to 5
	read h
	print h,
next i
print 
data 56, -78, 12.3, "Foo", lol, +#^
20 data 10,20,30,40,50

' basic I/O  1..5
open "_testfile" for output as #3
for i=1 to 5
	print #3, i
next i
close #3
open "_testfile" for input as #2
for i = 1 to 5
	input #2,a$
	print a$,
next i
close #2
print

' ON..GOTO   200! and then Oats..
t=2
on t goto 100, 200, 300
print "No match\n"
FIN:
for i = 1 to 3
	on i gosub oats, peas, beans
next i
print
end
100 print "100!"
    goto FIN
200 print "200!"
    goto FIN
300 print "300!"
    goto FIN
oats:
	print "Oats",
	return
peas:
	print "Peas",
	return
beans:
	print "Beans",
	return

' Random number distribution
randomize timer
max=10
dim a(max)
for i = 0 to 100
	b=rnd*max+1
	a(b)=a(b)+1
next i
for i = 1 to max
	print ,
	for j = 0 to a(i)
		print "*";
	next j
	print 
next i

' Square roots and sgn
print 10,sqr(10)
print 32767,sqr(32767)
print 0,sqr(0)
print 0.5,sqr(0.5)
print 2,sqr(2)
for i = -1 to 1
	print "Sign of ";i;" is ",sgn(i)
next i


' "shared" Whoa, 66666, Goodbye, 909090, 101010
type struct
	first as integer
end type
sub foo
	shared thing$
	shared narf as struct
	shared bar()
	shared lot$()
	shared poit() as struct
	thing$="Whoa"
	bar(5)=66666
	lot$(2)="Goodbye"
	narf.first=909090
	poit(4).first=101010
end sub
dim narf as struct
dim bar(1)
dim lot$(1)
dim poit(1) as struct
dim h$(1)
thing$="Hello"
bar(5)=55555
lot$(2)="Aloha"
narf.first=999
poit(4).first=111111
call foo()
print thing$,
print bar(5),
print lot$(2),
print narf.first,
print poit(4).first

' ADD bug, Return OK
function foo$
	foo$="Return OK"
	a$="Blah"
end function
print foo$()

' Some assembly required
print "Hello, world"
_STARTASM
	print "Include me in the assembly.\n"
_ENDASM
print "Goodbye, world"

' Column alignment
print "Hello";tab$(15);"World"
print "Foo";tab$(15);"Stuff"
print "I am the very model of a modern";tab$(15);"More"
print "Hello","Again",d
dim c$(1)
for i = 1 to 20 : read c$(i) : next
print
for i = 1 to 20 step 4
  print c$(i);tab$(12);c$(i+1);tab$(22);c$(i+2);tab$(32);c$(i+3)
next
print
data "ABANDON","CHART","COMPUTER"
data "DAMAGES","DESTRUCT","DOCK","IDLE","IMPULSE","LRSCAN","NAVIGATE","PHASERS","QUIT"
data "SHIELDS","SOS","SRSCAN","STATUS","TORPEDO","TRANSFER","VISUAL","WARP"

' Nested if/else bug
bump=1
LOOPY:
	if bump < -1 then goto LAST
	if bump < 1 then
		if bump = 0 then
			print "Second"
		else 
			print "Third"
		end if
	end if
	print "First, and every"
	bump=bump-1
	goto LOOPY
LAST:
	print "All done"

' Mystery typeshift bug (OK)
type foo
	first as integer
end type
dim a as foo
print a.first=x
print a.first
print "OK"

' Default case fallthrough
t=3
select case t
	case 1
		print "One"
	case 2
		print "Two"
	case 3
		print "Correct"
	case else
		print "WRONG!"
end select
print "All done."


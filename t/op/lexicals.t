#! perl -w

use Parrot::Test tests => 3;

output_is(<<CODE, <<OUTPUT, "simple store and fetch");
	new_pad
	new P0, .PerlInt
	new P1, .PerlInt
	set P0, 12
	set P1, 7
	store_lex "Integer", P0
	find_lex P1, "Integer"
	print P1
        print "\\n"
	end
CODE
12
OUTPUT

output_is(<<CODE, <<OUTPUT, "Repeated stores with the same key");
	new_pad
	new P0, .PerlInt
	new P1, .PerlInt
        set I0, 0
LOOP:
	set P0, I0
	store_lex "a", P0
	find_lex P1, "a"
	print P1
        print "\\n"
        inc I0
        lt I0, 10, LOOP
	end
CODE
0
1
2
3
4
5
6
7
8
9
OUTPUT

output_is(<<CODE, <<OUTPUT, "nested scopes");
  new P0, .PerlInt
  new P1, .PerlInt
  new P2, .PerlInt
  new P3, .PerlInt
  set P0, 0
  set P1, 1
  set P2, 2
  
  # outer most lexical scope
  new_pad
  store_lex "a", P0
  find_lex P3, "a"
  print P3
  print "\\n"

    new_pad
    store_lex "a", P1

      new_pad
      store_lex "c", P2
      find_lex P3, "c"
      print P3
      print "\\n"
      pop_pad

    find_lex P3, "a"
    print P3
    print "\\n"

    pop_pad

  find_lex P3, "a"
  print P3
  print "\\n"
  end
CODE
0
2
1
0
OUTPUT

1;


#! perl -w

use Parrot::Test tests => 2;

output_is(<<CODE, <<OUTPUT, "simple store and fetch");
	new_pad
	new P0, .PerlInt
	new P1, .PerlInt
	set P0, 12
	set P1, 7
	store_lex P0, "Integer"
	find_lex P1, "Integer"
	print P1
        print "\\n"
	end
CODE
12
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
  store_lex P0, "a"
  find_lex P3, "a"
  print P3
  print "\\n"

    new_pad
    store_lex P1, "a"

      new_pad
      store_lex P2, "c"
      find_lex P3, "c"
      print P3
      print "\\n"
      pop_pad

    pop_pad

  find_lex P3, "a"
  print P3
  print "\\n"
  end
CODE
0
2
0
OUTPUT

1;


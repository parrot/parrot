#
# lexicals.pasm
#
# A program to demonstrate lexical scopes.
#
# $Id$
#

new P0, .PerlInt
new P1, .PerlInt
new P2, .PerlInt
new P3, .PerlInt
set P0, 0
set P1, 1
  
# outer most lexical scope
new_pad 0
store_lex -1, "a", P0
find_lex P3, "a"
print P3 # prints 0
print "\n"

new_pad 1
store_lex -1, "b", P1
store_lex "a", P1

find_lex P3, "a"
print P3 # prints 1
print "\n"

find_lex P3, "b"
print P3 # prints 1
print "\n"

pop_pad

find_lex P3, "a"
print P3 # prints 0
print "\n"
end




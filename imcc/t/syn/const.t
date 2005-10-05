#!perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test;

pir_output_is(<<'CODE', <<'OUT', "globalconst 1");

.sub 'main' :main
	.globalconst int N = 5
	bsr _main
.end

.sub '_sub1'
	print N
	print "\n"
	ret
.end

.sub '_main'
	bsr _sub1
	ret
.end
CODE
5
OUT

pir_output_is(<<'CODE', <<'OUT', "globalconst 2");
.sub 'test' :main
	.globalconst int N = 5
	bsr _main
.end

.sub '_sub1'
	.local int x
	x = 10 + N
	print x
	print "\n"
	ret
.end

.sub '_main'
	bsr _sub1
	ret
.end
CODE
15
OUT

pir_output_is(<<'CODE', <<'OUT', "globalconst 3");

.sub 'call_sub1'
    'sub1'()
.end

.sub 'test' :main
    .globalconst int N = 5
    'call_sub1'()
.end

.sub 'sub1'
    print N
    print "\n"
.end

CODE
5
OUT


pir_output_is(<<'CODE', <<'OUT', "array/hash consts");
.sub 'main' :main
   .local Array ar
   .local pmc ha
   .local string key1
   .const string key2 = "key2"
   .local int idx1
   .const int idx2 = 2
   ar = new Array
   ar = 3
   ha = new Hash
   key1 = "key1"
   idx1 = 1
   ha[key1] = idx1
   ha[key2] = idx2
   $I0 = ha[key1]
   $I1 = ha[key2]
   ar[idx1] = $I0
   ar[idx2] = $I1
   $I2 = ar[idx1]
   $I3 = ar[idx2]
   print $I2
   print $I3
   print "\n"
.end
CODE
12
OUT


pir_output_is(<<'CODE', <<'OUT', "escaped");
.sub 'main' :main
   $S0 = "\""
   print $S0
   print "\\"
   $S0 = "\"\\\"\n"
   print $S0
.end
CODE
"\"\"
OUT
# fix editor highlighting "


pir_output_is(<<'CODE', <<'OUT', "PMC const 1 - Sub");
.sub 'main' :main
    .const .Sub $P0 = "foo"
    print "ok 1\n"
    $P0()
    print "ok 3\n"
.end
.sub foo
    print "ok 2\n"
.end
CODE
ok 1
ok 2
ok 3
OUT


pir_output_is(<<'CODE', <<'OUT', "PMC const 2 - Sub ident");
.sub 'main' :main
    .const .Sub func = "foo"
    print "ok 1\n"
    func()
    print "ok 3\n"
.end
.sub foo
    print "ok 2\n"
.end
CODE
ok 1
ok 2
ok 3
OUT


output_is(<<'CODE', <<'OUT', "const I/N mismatch");
    set I0, 2.0
    print I0
    print "\n"
    set N0, 2
    print N0
    print "\nok\n"
    end
CODE
2
2.000000
ok
OUT


pir_output_is(<<'CODE', <<'OUT', "const I/N mismatch 2");
.sub 'main' :main
    .const int i = 2.0
    print i
    print "\n"
    .const float n = 2
    print n
    print "\nok\n"
    .const string s = ascii:"ok 2\n"
    print s
.end
CODE
2
2.000000
ok
ok 2
OUT


pir_output_is(<<'CODE', <<'OUT', 'PIR heredocs: accepts double quoted terminator');
.sub 'main' :main
    $S0 = <<"quotage"
I want an elephant
Oh, I want an elephat!
Oh, woo, elephants, yeah :-O
quotage

    print $S0
.end
CODE
I want an elephant
Oh, I want an elephat!
Oh, woo, elephants, yeah :-O
OUT


pir_output_is(<<'CODE', <<'OUT', 'PIR heredocs: accepts inline with concat');
.sub 'main' :main
    $S0 = ""
    $I0 = 0
LOOP:
    $S0 = concat <<"end"
ending
end
    inc $I0
    if $I0 < 5 goto LOOP
    print $S0
.end
CODE
ending
ending
ending
ending
ending
OUT


pir_output_is(<<'CODE', <<'OUT', "PIR heredoc: accepts terminator with any word chars");
.sub 'main' :main
    $S0 = <<"AnY_w0Rd_ch4rS"
so much depends
upon

a red wheel
barrow

glazed with rain
water

beside the white
chickens
AnY_w0Rd_ch4rS

    print $S0
.end
CODE
so much depends
upon

a red wheel
barrow

glazed with rain
water

beside the white
chickens
OUT


pir_output_like(<<'CODE', <<'OUT', 'PIR heredoc: rejects single quoted terminator');
.sub 'main' :main
    $S0 = <<'Jabberwocky'
`Twas brillig, and the slithy toves
  Did gyre and gimble in the wabe;
All mimsy were the borogoves,
  And the mome raths outgrabe.
Jabberwocky
    print $S0
.end
CODE
/^error:imcc:parse error, unexpected SHIFT_LEFT.*/
OUT


pir_output_like(<<'CODE', <<'OUT', 'PIR heredoc: rejects unquoted terminator');
.sub 'main' :main
    $S0 = <<Jabberwocky
"Beware the Jabberwock, my son!
  The jaws that bite, the claws that catch!
Beware the Jubjub bird, and shun
  The frumious Bandersnatch!"
Jabberwocky
    print $S0
.end
CODE
/^error:imcc:parse error, unexpected SHIFT_LEFT.*/
OUT


pir_output_like(<<'CODE', <<'OUT', "PIR heredoc: rejects inline heredoc");
.sub 'main' :main
    $S0 .= <<Jabberwocky
He took his vorpal sword in hand:
  Long time the manxome foe he sought --
So rested he by the Tumtum tree,
  And stood awhile in thought.
Jabberwocky

    print $S0
.end
CODE
/^error:imcc:parse error, unexpected SHIFT_LEFT.*/
OUT


pir_output_like(<<'CODE', <<'OUT', "PIR heredoc: rejects null terminator");
.sub 'main' :main
    $S0 = <<
And, as in uffish thought he stood,
  The Jabberwock, with eyes of flame,
Came whiffling through the tulgey wood,
  And burbled as it came!

    print $S0
.end
CODE
/^error:imcc:parse error, unexpected SHIFT_LEFT.*/
OUT


pir_output_like(<<'CODE', <<'OUT', "PIR heredoc: rejects terminator with spaces");
.sub 'main' :main
    $S0 = << "terminator with spaces"
One, two! One, two! And through and through
  The vorpal blade went snicker-snack!
He left it dead, and with its head
  He went galumphing back.
terminator with spaces

    print $S0
.end
CODE
/^error:imcc:parse error, unexpected SHIFT_LEFT.*/
OUT


pir_output_is(<<'CODE', <<'OUT', "PIR heredoc: accepts terminator with non-word chars");
.sub 'main' :main
    $S0 = <<"#non$word-chars."
'And, has thou slain the Jabberwock?
  Come to my arms, my beamish boy!
O frabjous day! Callooh! Callay!'
  He chortled in his joy.
#non$word-chars.

    print $S0
.end
CODE
'And, has thou slain the Jabberwock?
  Come to my arms, my beamish boy!
O frabjous day! Callooh! Callay!'
  He chortled in his joy.
OUT


pir_output_is(<<'CODE', <<'OUT', "PIR heredoc: accepts terminator with unprintable chars");
.sub 'main' :main
    $S0 = <<"\0\1\2\3"
`Twas brillig, and the slithy toves
  Did gyre and gimble in the wabe;
All mimsy were the borogoves,
  And the mome raths outgrabe.
\0\1\2\3
    print $S0
.end
CODE
`Twas brillig, and the slithy toves
  Did gyre and gimble in the wabe;
All mimsy were the borogoves,
  And the mome raths outgrabe.
OUT


pir_output_like(<<'CODE', <<'OUT', "PIR heredoc: rejects interpolated terminator");
.sub 'main' :main
    $S1 = 'e_e_cummings'
    $S0 = <<$S1
l(a

le
af

fa
ll
s)

one
l
iness
e_e_cummings
    print $S0
.end
CODE
/^error:imcc:parse error, unexpected SHIFT_LEFT.*/
OUT


pir_output_is(<<'CODE', <<'OUT', "PIR heredoc: rejects variable interpolation");
.sub 'main' :main
    $S0 = 'parrot'
    print <<"*<:-O"
Happy Birthday to you,
Happy Birthday to you.
Happy Birthday dear $S0,
Happy Birthday to you!
*<:-O
.end
CODE
Happy Birthday to you,
Happy Birthday to you.
Happy Birthday dear $S0,
Happy Birthday to you!
OUT


## remember to change the number of tests!
BEGIN { plan tests => 21; }

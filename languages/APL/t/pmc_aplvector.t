#!/usr/bin/perl

use strict;
use warnings;

use lib qw( APL . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 9;
use Test::More;

diag("don't forget to write tests for slices");

pir_output_is(<<'CODE', <<'OUT', 'load dynamic library');
  .sub test :main
     $P0 = loadlib 'apl_group'
     if $P0 goto ok
     print 'not '
  ok:
     say "ok"
  .end
CODE
ok
OUT

pir_output_is(<<'CODE', <<'OUT', 'instantiate PMC');
  .sub test :main
     $P0 = loadlib 'apl_group'
     if $P0 goto ok
     say 'urk'
     end
  ok:
     $P1 = new 'APLVector'
     $S0 = typeof $P1
     say $S0
  .end
CODE
APLVector
OUT

pir_output_is(<<'CODE', <<'OUT', 'shape, 1D');
  .sub test :main
     $P0 = loadlib 'apl_group'
     if $P0 goto ok
     say 'urk'
     end
  ok:
     $P1 = new 'APLVector'
     push $P1, 1
     push $P1, 2
     push $P1, 3
     push $P1, 4
     $P2 = $P1.'get_shape'()
     $I1 = $P2
     print 'size:'
     print $I1
     say ''
     $P3 = $P2[0]
     print 'dim1:'
     say $P3
  .end
CODE
size:1
dim1:4
OUT

pir_output_is(<<'CODE', <<'OUT', 'reshape 1x4 to 2x2');
  .sub test :main
     $P0 = loadlib 'apl_group'
     if $P0 goto ok
     say 'urk'
     end
  ok:
     $P1 = new 'APLVector'
     push $P1, 1
     push $P1, 2
     push $P1, 3
     push $P1, 4
     #  Vector is now a 1x4 vector

     $P2 = new 'APLVector'
     push $P2, 2
     push $P2, 2

     $P1.'set_shape'($P2)
     #  Vector is now a 2x2 vector

     $P3 = $P1.'get_shape'()
     $I1 = $P3
     print 'size:'
     print $I1
     say ''
     $P4 = $P3[0]
     print 'dim1:'
     say $P4
     $P4 = $P3[1]
     print 'dim2:'
     say $P4
  .end
CODE
size:2
dim1:2
dim2:2
OUT

SKIP: {
    skip "not implemented", 5;

pir_output_is(<<'CODE', <<'OUT', 'index 1D');
  .sub test :main
     $P0 = loadlib 'apl_group'
     if $P0 goto ok
     say 'urk'
     end
  ok:
     $P1 = new 'APLVector'
     push $P1, 1
     push $P1, 2
     push $P1, 3
     push $P1, 4

     $I0 = 1
   loop:
     if $I0 > 4 goto loop_end
     $P2 = $P1[$I0]
     say $P2
     inc $I0
     goto loop
   loop_end:
  .end
CODE
1
2
3
4
OUT

pir_output_is(<<'CODE', <<'OUT', 'index 2D');
  .sub test :main
     $P0 = loadlib 'apl_group'
     if $P0 goto ok
     say 'urk'
     end
  ok:
     $P1 = new 'APLVector'
     push $P1, 1
     push $P1, 2
     push $P1, 3
     push $P1, 4
     #  Vector is now a 1x4 vector

     $P2 = new 'APLVector'
     push $P2, 2
     push $P2, 2

     $P1.'set_shape'($P2)
     #  Vector is now a 2x2 vector

     $P3 = $P1[1;1]
     say $P3
     $P3 = $P1[1;2]
     say $P3
     $P3 = $P1[2;1]
     say $P3
     $P3 = $P1[2;2]
     say $P3
CODE
1
2
3
4
OUT

pir_output_is(<<'CODE', <<'OUT', 'reshape with fewer elements');
  .sub test :main
     $P0 = loadlib 'apl_group'
     if $P0 goto ok
     say 'urk'
     end
  ok:
     $P1 = new 'APLVector'
     push $P1, 1
     push $P1, 2
     push $P1, 3
     #  Vector is now a 1x3 vector

     $P2 = new 'APLVector'
     push $P2, 2
     push $P2, 2

     $P1.'set_shape'($P2)
     #  Vector is now a 2x2 vector

     $P3 = $P1[1;1]
     say $P3
     $P3 = $P1[1;2]
     say $P3
     $P3 = $P1[2;1]
     say $P3
     $P3 = $P1[2;2]
     say $P3
CODE
1
2
3
1
OUT

pir_output_is(<<'CODE', <<'OUT', 'reshape with more elements');
  .sub test :main
     $P0 = loadlib 'apl_group'
     if $P0 goto ok
     say 'urk'
     end
  ok:
     $P1 = new 'APLVector'
     push $P1, 1
     push $P1, 2
     push $P1, 3
     push $P1, 4
     push $P1, 5
     #  Vector is now a 1x5 vector

     $P2 = new 'APLVector'
     push $P2, 2
     push $P2, 2

     $P1.'set_shape'($P2)
     #  Vector is now a 2x2 vector

     $P3 = $P1[1;1]
     say $P3
     $P3 = $P1[1;2]
     say $P3
     $P3 = $P1[2;1]
     say $P3
     $P3 = $P1[2;2]
     say $P3
CODE
1
2
3
4
OUT

pir_output_is(<<'CODE', <<'OUT', '3-dimensional');
  .sub test :main
     $P0 = loadlib 'apl_group'
     if $P0 goto ok
     say 'urk'
     end
  ok:
     $P1 = new 'APLVector'
     push $P1, 1
     push $P1, 2
     push $P1, 3
     push $P1, 4
     push $P1, 5
     push $P1, 6
     push $P1, 7
     push $P1, 8
     #  Vector is now a 1x8 vector

     $P2 = new 'APLVector'
     push $P2, 2
     push $P2, 2
     push $P2, 2

     $P1.'set_shape'($P2)
     #  Vector is now a 2x2x2 vector

     $P3 = $P1[1;1;1]
     say $P3
     $P3 = $P1[1;1;2]
     say $P3
     $P3 = $P1[1;2;1]
     say $P3
     $P3 = $P1[1;2;2]
     say $P3
     $P3 = $P1[2;1;1]
     say $P3
     $P3 = $P1[2;1;2]
     say $P3
     $P3 = $P1[2;2;1]
     say $P3
     $P3 = $P1[2;2;2]
     say $P3
CODE
1
2
3
4
5
6
7
8
OUT

}

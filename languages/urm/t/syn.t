# $Id$

use FindBin;
use lib "$FindBin::Bin/../lib";

use URM::Test tests => 1;

# Test parsing of URM code

output_is(<< 'CODE', << 'OUT', 'from testpars.urm', 42, 43);
# 2003 (c) by Marcus Thiesen
# <marcus@cpan.org>
# This program is under GPL
# See the LICENSE file
# Testing the URM Parser

#This should work
in(r3,r2); out(r3); 

#Well formated
1: r1 <- r1 + 1

#Not that nice
2:r1<-r1-1

#Even more crap
3:    r3     <-    r3     -       1

#This should work too
4: r3 <- r3 + 1 #More comments

# Test the register code 
5: r5 <- 0
6: r6 <- 0
7: r7 <- 0
8: r8 <- 0
9: r9 <- 0
10: r10 <- 0
11: r11 <- 0
12: r12 <- 0
13: r13 <- 0
CODE
42
OUT

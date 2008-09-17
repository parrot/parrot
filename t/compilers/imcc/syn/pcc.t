#!perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;
use Parrot::Test tests => 21;

##############################
# Parrot Calling Conventions

pir_output_is( <<'CODE', <<'OUT', "low-level syntax" );
.sub test :main
    .const .Sub sub = "_sub"
    .const int y = 20
    .begin_call
    .arg 10
    .arg y
    .call sub
    .local string z
    .result z
    .end_call
    print z
    end
.end
.sub _sub
    .param int a
    .param int b
    print a
    print "\n"
    print b
    print "\n"
    .return ("ok\n")
.end
CODE
10
20
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "func() syntax" );
.sub test :main
    .const int y = 20
    .local string z
    z = _sub(10, y)
    print z
    end
.end
.sub _sub
    .param int a
    .param int b
    print a
    print "\n"
    print b
    print "\n"
    .return ("ok\n")
.end
CODE
10
20
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "quoted sub names" );
.sub main :main
    "foo"()
    print "ok\n"
.end

.sub "foo"
    print "foo\n"
    "new"()
.end

.sub "new"
    print "new\n"
.end
CODE
foo
new
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "_func() syntax with var - global" );
.sub test :main
    .local pmc the_sub
    the_sub = global "_sub"
    the_sub(10, 20)
    end
.end
.sub _sub
    .param int a
    .param int b
    print a
    print "\n"
    print b
    print "\n"
    end
.end
CODE
10
20
OUT

pir_output_is( <<'CODE', "42\n", "multiple returns" );
.sub test :main
.local int a, b
  (a, b) = _sub()
  print a
  print b
  print "\n"
.end

.sub _sub
.return ( 4,  2 )
.end
CODE

pir_output_is( <<'CODE', <<'OUT', "tail recursive sub" );
.sub test :main
    .local int count, product, result
    count = 5
    product = 1
    result = _fact(product, count)
    print result
    print "\n"
    end
.end

.sub _fact
   .param int product
   .param int count
   if count > 1 goto recur
   .return (product)
recur:
   product = product * count
   dec count
   .return _fact(product, count)
.end

CODE
120
OUT

####################
# coroutine iterator
#

# pseudo source code:
#       main () {
#         int i=5;
#         foreach addtwo(i) {
#           print $_, "\n";
#         }
#         print "done in main\n";
#       }
#
#       addtwo (int a) {
#         int i;
#         for (i=0; i<10; i++) {
#           yield a+i;
#         }
#         print "done in coroutine\n";
#       }

pir_output_is( <<'CODE', <<'OUT', "coroutine iterator" );
.sub test :main
  .local int i
  i=5
  new $P1, 'Continuation'
  set_addr $P1, after_loop
loop:
  $I2 = _addtwo($P1, i)
    print $I2
    print "\n"
    goto loop
 after_loop:
  .get_results ()
  print "done in main\n"
.end

.sub _addtwo
  .param pmc when_done
  .param int a
  .local int i
  i = 0
 loop:
    if i >= 10 goto done
    $I5 = a+i
    .yield($I5)
    i = i + 1
    goto loop
 done:
  print "done in coroutine\n"
  when_done()
.end
CODE
5
6
7
8
9
10
11
12
13
14
done in coroutine
done in main
OUT

pir_output_is( <<'CODE', <<'OUT', "coroutine iterator - throw stop" );
.sub test :main
  .local int i
  i=5
  push_eh after_loop
loop:
  $I2 = _addtwo(i)
    print $I2
    print "\n"
    goto loop
 after_loop:
  print "done in main\n"
.end

.sub _addtwo
  .param int a
  .local int i
  i = 0
 loop:
    if i >= 10 goto done
    $I5 = a+i
    .yield($I5)
    i = i + 1
    goto loop
 done:
  print "done in coroutine\n"
  new $P0, 'Exception'
  throw $P0
.end
CODE
5
6
7
8
9
10
11
12
13
14
done in coroutine
done in main
OUT

pir_output_is( <<'CODE', <<'OUT', ".arg :flat" );
.sub _main
    .local pmc x, y, z, ar, ar2, s
    x = new 'String'
    x = "first\n"
    y = new 'String'
    y = "middle\n"
    z = new 'String'
    z = "last\n"
    ar = new 'ResizablePMCArray'
    push ar, "ok 1\n"
    push ar, "ok 2\n"
    ar2 = new 'ResizablePMCArray'
    push ar2, "ok 3\n"
    push ar2, "ok 4\n"
    push ar2, "ok 5\n"
    .const .Sub s = "_sub"
    .begin_call
    .arg x
    .arg ar :flat
    .arg y
    .arg ar2 :flat
    .arg z
    .call s
    .end_call
    end
.end
.sub _sub
    .param pmc a
    .param pmc b
    .param pmc c
    .param pmc d
    .param pmc e
    .param pmc f
    .param pmc g
    .param pmc h
    print a
    print b
    print c
    print d
    print e
    print f
    print g
    print h
.end
CODE
first
ok 1
ok 2
middle
ok 3
ok 4
ok 5
last
OUT

pir_output_is( <<'CODE', <<'OUT', "foo (arg :flat)" );
.sub _main
    .local pmc x, y, z, ar, ar2
    x = new 'String'
    x = "first\n"
    y = new 'String'
    y = "middle\n"
    z = new 'String'
    z = "last\n"
    ar = new 'ResizablePMCArray'
    push ar, "ok 1\n"
    push ar, "ok 2\n"
    ar2 = new 'ResizablePMCArray'
    push ar2, "ok 3\n"
    push ar2, "ok 4\n"
    push ar2, "ok 5\n"
    _sub(x, ar :flat, y, ar2 :flat, z)
    end
.end

.sub _sub
    .param pmc a
    .param pmc b
    .param pmc c
    .param pmc d
    .param pmc e
    .param pmc f
    .param pmc g
    .param pmc h
    print a
    print b
    print c
    print d
    print e
    print f
    print g
    print h
.end

CODE
first
ok 1
ok 2
middle
ok 3
ok 4
ok 5
last
OUT

pir_output_is( <<'CODE', <<'OUT', ":main pragma, syntax only" );
.sub _main :main
    print "ok\n"
    end
.end
CODE
ok
OUT

# The result of the code should depend on whether we run parrot with the
# "-o code.pbc -r -r" command line params.
# Strangely, the same output is written
pir_output_like( <<'CODE', <<'OUT', "more pragmas, syntax only" );
.sub _main :main :load :postcomp
    print "ok\n"
    end
.end
CODE
/(ok\n){1,2}/
OUT

pir_output_is( <<'CODE', <<'OUT', "multi 1" );
.sub foo :multi()
    print "ok 1\n"
.end
.sub f1 :multi(int)
.end
.sub f2 :multi(int, float)
.end
.sub f3 :multi(Integer, Any, _)
.end
CODE
ok 1
OUT

pir_output_is( <<'CODE', <<'OUT', "\:main defined twice" );
.sub foo :main
        set S0, 'not ok'
        print S0
        print "\r\n"
        end
.end

.sub bar :main
        set S0, 'ok'
        print S0
        print "\r\n"
        end
.end
CODE
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "\:anon subpragma, syntax only" );
.sub anon :anon
    print "ok\n"
.end
CODE
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "\:anon doesn't install symbol 1" );
.sub main :main
    .local pmc result
    result = get_global 'anon'
    unless null result goto callit
    result = get_global 'ok'
  callit:
    result()
.end

.sub anon :anon
    print "not ok\n"
.end

.sub ok
    print "ok\n"
.end
CODE
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "\:anon doesn't install symbol 2" );
.sub main :main
    .local pmc result
    result= get_global 'anon'
    result()
.end

.sub anon
    print "ok\n"
.end

.sub anon :anon
    print "not ok\n"
.end
CODE
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "multiple \:anon subs with same name" );
.sub main :main
    .local pmc result
    result= get_global 'anon'
    unless null result goto callit
    result = get_global 'ok'
  callit:
    result()
.end

.sub anon :anon
    print "nok 1\n"
.end

.sub anon :anon
    print "nok 2\n"
.end

.sub ok
    print "ok\n"
.end
CODE
ok
OUT

pir_output_is( <<'CODE', <<'OUT', "()=foo() syntax, no return values" );
.sub main :main
        () = foo()
.end
.sub foo
        print "foo\n"
.end
CODE
foo
OUT

pir_output_is( <<'CODE', <<'OUT', "()=foo() syntax, skip returned value" );
.sub main :main
        () = foo()
.end
.sub foo
        print "foo\n"
    .return(1)
.end
CODE
foo
OUT

#RT #58866 calling a PIR sub with 206 params segfaults parrot
pir_output_is( <<'CODE', <<'OUT', "calling a sub with way too many params" );
.sub main :main
    'foo'(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654,655,656,657,658,659,660,661,662,663,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,693,694,695,696,697,698,699,700,701,702,703,704,705,706,707,708,709,710,711,712,713,714,715,716,717,718,719,720,721,722,723,724,725,726,727,728,729,730,731,732,733,734,735,736,737,738,739,740,741,742,743,744,745,746,747,748,749,750,751,752,753,754,755,756,757,758,759,760,761,762,763,764,765,766,767,768,769,770,771,772,773,774,775,776,777,778,779,780,781,782,783,784,785,786,787,788,789,790,791,792,793,794,795,796,797,798,799,800,801,802,803,804,805,806,807,808,809,810,811,812,813,814,815,816,817,818,819,820,821,822,823,824,825,826,827,828,829,830,831,832,833,834,835,836,837,838,839,840,841,842,843,844,845,846,847,848,849,850,851,852,853,854,855,856,857,858,859,860,861,862,863,864,865,866,867,868,869,870,871,872,873,874,875,876,877,878,879,880,881,882,883,884,885,886,887,888,889,890,891,892,893,894,895,896,897,898,899,900,901,902,903,904,905,906,907,908,909,910,911,912,913,914,915,916,917,918,919,920,921,922,923,924,925,926,927,928,929,930,931,932,933,934,935,936,937,938,939,940,941,942,943,944,945,946,947,948,949,950,951,952,953,954,955,956,957,958,959,960,961,962,963,964,965,966,967,968,969,970,971,972,973,974,975,976,977,978,979,980,981,982,983,984,985,986,987,988,989,990,991,992,993,994,995,996,997,998,999,1000)
    say "didn't segfault"
.end

.sub foo
.end
CODE
didn't segfault
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

#! perl -w

use strict;

use FindBin;
use lib $FindBin::Bin;

use P6CTest tests => 4;

##########################################
check_parse {
    name => "error test 1",

    pgm => <<'END',
while (1) {
  $a = 3;
  $b = 5;
  # comment1 } {}{}}{{
  qqqqq{}
  #comment 2
  $c = 50;
  "some{}{}{};;;string";
  zzz::()!&*^%aa{"ssoiodf;;;;"  # a comment ;}
  }
  $d = 50;
}
END

    exp_errs => [
        ['Invalid statement near "qqqqq{}"', 5],
        ['Invalid statement near "zzz::()!&*^%aa{"ssoiodf;;;;"  # a comment ;}"', 9],
    ],
};

##########################################
check_parse {
    name => "error test 2",

    pgm => <<'END',
if (1) {
    if (2) {
        print ddd d d dd;
        $a = 6;
    }
    print ddddddddd ddddd ddddd;
}
$b = 6666;
dssdds{}
$c = 6;
END

    exp_errs => [
        ['Invalid statement near "print ddd d d dd;"', 3],
        ['Invalid statement near "print ddddddddd ddddd ddddd;"', 6],
        ['Invalid statement near "dssdds{}"', 9],
    ],
};

##########################################
check_parse {
    name => "error test 3",

    pgm => 'print "hello',

    exp_errs => [
        ['Invalid statement near "print "hello"', 1],
	# XXX - why a duplicate?
        ['Invalid statement near "print "hello"', 1],
    ],
};

##########################################
check_parse {
    name => "error test 4",

    pgm => <<'END',
print "hello
if (1) {
   f("xxx");
}
exit 0;
END

    exp_errs => [
        ['Invalid statement near "print "hello"', 1],
	# XXX - why a duplicate?
        ['Invalid statement near "print "hello"', 1],
    ],
};

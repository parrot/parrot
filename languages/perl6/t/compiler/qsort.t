#!perl

use strict;
use P6C::TestCompiler tests => 1;

##############################
output_is(<<'CODE', <<'OUT', "'quick' sort");
sub qsort(@a, $lo, $hi) {
    my $l = $lo;
    my $h = $hi;
    my $p = @a[$l++];
    while $l < $h {
	$l++ while $p < @a[$l] && $l < $h;
	$h-- while $p > @a[$h] && $h > $l;
	@a[$l,$h] = @a[$h,$l];
    }
    if @a[$l] > $p {
	@a[$lo] = @a[$l];
	@a[$l] = $p;
    } else {
	@a[$lo] = $p;
    }
    qsort @a, $lo, $l - 1 if $lo < $l - 1;
    qsort @a, $l, $hi if $l < $hi;
}

sub main() {
    my @a = 1..10;
    qsort @a, 0, @a - 1;
    print @a >>~<< "\n";
    @a = (10,9,8,7,6,5,4,3,2,1);
    qsort @a, 0, @a - 1;
    print @a >>~<< "\n";
}
CODE
10
9
8
7
6
5
4
3
2
1
10
9
8
7
6
5
4
3
2
1
OUT

#!perl
use strict;
use P6C::TestCompiler tests => 3;
use Test::More qw(skip);

##############################
output_is(<<'CODE', <<'OUT', "grep");
sub main() {
	@array = ("perl6", "is", "fun");
	print grep {$_ > 1} 1, 2, 3;
	print "\n";
	@newarr = grep {$_ eq "is"} @array;
	print @newarr;
	print "\n";
	print @array, "\n";
}
CODE
23
is
perl6isfun
OUT

##############################
output_is(<<'CODE', <<'OUT', "reverse");
sub main() {
	@array = ("perl6", "is", "fun");
	print @array, "\n";
	print reverse @array;
	print "\n", @array, "\n";
}
CODE
perl6isfun
funisperl6
perl6isfun
OUT

##############################
SKIP: {
skip 'no map yet', 1;
output_is(<<'CODE', <<'OUT', "reverse");
sub main() {
    my @array = ("perl6", "is", "fun");
    print map { $_ + 1 } 1, 2, 3;
    print "\n";
    my @newarr = map { $_ _ " " } @array;
    print @newarr;
    print "\n";
    print @array, "\n";
}
CODE
234
perl6 is fun 
perl6isfun
OUT
}

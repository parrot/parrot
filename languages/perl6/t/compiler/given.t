#!perl
use strict;
use P6C::TestCompiler tests => 3;

##############################
output_is(<<'CODE', <<'OUT', "given 1");
sub main() {
    given 1 {
	when '1' { print "1\n"; skip }
	print "1.1\n";
	when '2' { print "2\n"; skip }
	print "2.1\n";
	when 1   { print "3\n"; skip }
	print "3.1\n";
	when 1.0 { print "4\n"; skip }
	print "4.1\n";
	default  { print "5\n" }
	print "5.1\n";
    }
    print "--\n";
    given "2" {
	when '1' { print "1\n" }
	print "1.1\n";
	when 2.1 { print "2\n" }
	print "2.1\n";
	when 2   { print "3\n" }
	print "3.1\n";
	when "2" { print "4\n" }
	print "4.1\n";
    }
}
CODE
1
1.1
2.1
3
3.1
4
4.1
5
--
1.1
2.1
3
OUT

# XXX: a couple of these are strange/wrong --
# - "3" doesn't numify in the "given @a"
# - 1.1 doesn't stringify to "1.1" in the "given %h"
##############################
output_is(<<'CODE', <<'OUT', "given 2");
sub main() {
    my @a = -2..2;
    my %h; %h{0} = 1; %h{1} = 0; %h{2} = ""; %h{'1.1'} = 2;
    
    given 0 {
	when %h  { print "1\n"; skip }
	print "1.1\n";
	when @a  { print "2\n" }
	print "2.1\n";
    }
    print "--\n";
    given 2 {
	when %h  { print "1\n"; skip }
	print "1.1\n";
	when @a  { print "2\n" }
	print "2.1\n";
    }
    print "--\n";
    given @a {
	when 0 { print "1\n"; skip }
	print "1.1\n";
	when 1 { print "2\n"; skip }
	print "2.1\n";
	when 2 { print "3\n"; skip }
	print "3.1\n";
	when 3.1 { print "4\n"; skip }
	print "4.1\n";
	when "3" { print "5\n"; skip }
	print "5.1\n";
	when 6 { print "6\n";skip }
	print "6.1\n";
    }
    print "--\n";
    given %h {
	when 0 { print "1\n"; skip }
	print "1.1\n";
	when 1 { print "2\n"; skip }
	print "2.1\n";
	when 1.1 { print "3\n"; skip }
	print "3.1\n";
	when "1.1" { print "4\n"; skip }
	print "4.1\n";
	when "3" { print "5\n"; skip }
	print "5.1\n";
    }
}
CODE
1
1.1
2
--
1.1
2.1
--
1
1.1
2
2.1
3.1
4
4.1
5.1
6.1
--
1
1.1
2.1
3.1
4
4.1
5.1
OUT

##############################
output_is(<<'CODE', <<'OUT', "given 3");
sub main() {
    my $x = 23;
    my $y = "foo";
outer: given $x {
	when 23    {
	    print "1\n";
	inner: given $y {
		    when 23 { print "a\n" }
		    print "a.1\n";
		    when "foo" { print "b\n"; skip }
		    print "b.1\n";
		    when 'foo' { print "c\n"; skip outer }
		    print "c.1\n";
	    }
	}
	print "1.1\n";
	when 'foo' { print "2\n" }
	print "2.1\n";
	when '23'  { print "3\n" }
	print "3.1\n";
    }
}
CODE
1
a.1
b
b.1
c
1.1
2.1
3
OUT

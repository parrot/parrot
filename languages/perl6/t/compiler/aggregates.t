#!perl
use strict;
use P6C::TestCompiler tests => 8;

##############################
output_is(<<'CODE', <<'OUT', 'Initializers');
sub main() {
    my @a = (2,3,4);
    my $a = (2,3,4);
    my ($b, $c) = (2,3,4);
    my ($d, $e, $f) = (5,6);
    print1(@a[0] ~ ' ' ~ @a[1] ~ ' ' ~ @a[2]);
    print1($a);
    print1($b);
    print1($c);
    print1($d);
    print1($e);
    print1($f);
}

CODE
2 3 4
4
2
3
5
6

OUT

##############################
output_is(<<'CODE', <<'OUT', 'Arrays');
sub main() {
    my @a = (1,2,3,4);
    my @b = @a[0,2];
    print1(@b[0] ~ ', ' ~ @b[1]);
    print1(@a[0] ~ ', ' ~ @a[2]);
    print1(@a[1] ~ ', ' ~ @a[3]);
    my @c = @a;
    @a[2] = 5;
    @c[0] = 6;
    print @a, @c, "\n"
}

CODE
1, 3
1, 3
2, 4
12546234
OUT

##############################
output_is(<<'CODE', <<'OUT', 'Hash');
sub main() {
    my %x;
    my $x = 23;
    my $b = 'b';
    %x{a} = 'ay?';
    %x{b} = 'be!';
    %x{$x} = 'twenty-three';
    print1(%x{a} ~', ' ~%x{$b} ~', ' ~%x{23});
}

CODE
ay?, be!, twenty-three
OUT

##############################
output_is(<<'CODE', <<'OUT', 'Hash 2');
sub main() {
    my %x;
    my $x = 23;
    my $b = 'b';
    %x{a} = 'ay?';
    %x{b} = 'be!';
    %x{$x} = 'twenty-three';
    my @x = %x{'b', 'a', $x};
    print1(@x[0] ~@x[1] ~@x[2]);
    my %y = %x;
    %y{a} = 'ay!';
    %x{b} = 'be?';
    print %x{'b', 'a', $x}, "\n";
    print %y{'b', 'a', $x}, "\n";
}

CODE
be!ay?twenty-three
be?ay?twenty-three
be!ay!twenty-three
OUT

##############################
output_is(<<'CODE', <<'OUT', "Flattening");
sub foo {
    print1(@_[0]~' '~@_[2]);
}

sub main() {
    my @a = 1..4;
    my $b = 23;
    my @c = (@a[0], -$b, @a);
    my @d = @a;
    foo @a;
    foo @a[0], @a[2], -$b;
    foo @a[1..3];
    foo -$b, @a;
    foo @c;
    foo @d;
}
CODE
1 3
1 -23
2 4
-23 2
1 1
1 3
OUT

##############################
output_is(<<'CODE', <<'OUT', "Real flattening");

sub main() {
    my @a = 1..4;
    my $b = 10;
    my @c = (*@a, $b);
    print "@c\n";
}
CODE
1 2 3 4 10
OUT

##############################
output_is(<<'CODE', <<'OUT', "Array slices");
sub main() {
    my @a = 10..14;
    my @i = 1..3;
    my @b = @a[@i];
    my @c = @a[1..3];
    my ($d, $e) = @a[1..3];
    print1(@b[0] ~ ' ' ~ @b[1] ~ ' ' ~ @b[2]);
    print1(@c[0] ~ ' ' ~ @c[1] ~ ' ' ~ @c[2]);
    print1($d ~ ' ' ~ $e);
}

CODE
11 12 13
11 12 13
11 12
OUT

##############################
output_is(<<'CODE', <<'OUT', "Array slices 2");
sub main() {
    my @a = 1..100;
    my @b;
    my @c = 0..4;
    @b[@c] = @a[5..9];
    print @b, "\n";
    @b[0..4] = @a[10..14];
    print @b, "\n";
}
CODE
678910
1112131415
OUT

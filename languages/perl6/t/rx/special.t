#!perl
use strict;
use P6C::TestCompiler tests => 2;
use Test::More qw(skip);

##############################
output_is(<<'CODE', <<'OUT', "Escaped characters.");
sub main() {
    my $s = "a\rb\nc\td\x1Bf\fg\x55h";
    print "ok 1\n" if $s =~ /\rb/;
    print "ok 2\n" if $s =~ /\nc/;
    print "ok 3\n" if $s =~ /\td/;
    print "ok 4\n" if $s =~ /\ef/;
    print "ok 5\n" if $s =~ /\fg/;
    print "ok 6\n" if $s =~ /\x55h/;
    print "ok 7\n"  if $s !~ /\ra/;
    print "ok 8\n"  if $s !~ /\na/;
    print "ok 9\n"  if $s !~ /\ta/;
    print "ok 10\n" if $s !~ /\ea/;
    print "ok 11\n" if $s !~ /\fa/;
    print "ok 12\n" if $s !~ /\x55a/;
    print "ok 13\n" if $s =~ /\0125h/;
    print "ok 14\n" if $s !~ /\0125a/;
}
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
ok 8
ok 9
ok 10
ok 11
ok 12
ok 13
ok 14
OUT

##############################
output_is(<<'CODE', <<'OUT', "Negated esc chars.");
sub main() {
    my $s = "a\rb\nc\td\x1Bf\fg\x55h";
    print "ok 1\n" if $s !~ /\Rb/;
    print "ok 2\n" if $s !~ /\Nc/;
    print "ok 3\n" if $s !~ /\Td/;
    print "ok 4\n" if $s !~ /\Ef/;
    print "ok 5\n" if $s !~ /\Fg/;
    print "ok 6\n" if $s !~ /\X55h/;
    print "ok 7\n"  if $s =~ /\Rh/;
    print "ok 8\n"  if $s =~ /\Nh/;
    print "ok 9\n"  if $s =~ /\Th/;
    print "ok 10\n" if $s =~ /\Eh/;
    print "ok 11\n" if $s =~ /\Fh/;
    print "ok 12\n" if $s =~ /\X55b/;
}
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
ok 8
ok 9
ok 10
ok 11
ok 12
OUT

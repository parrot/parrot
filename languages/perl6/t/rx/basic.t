#!perl
use strict;
use P6C::TestCompiler tests => 8;
use Test::More qw(skip);

##############################
output_is(<<'CODE', <<'OUT', "Simple atoms.");
sub main() {
    my $s = "hello";
    my $t = "ell";
    print "ok 2\n" if $s =~ /{ print "ok 1\n" }/;
    print "ok 3\n" if $s =~ /hell/;
    print "ok 4\n" if $s =~ /$t/;
    print "ok 5\n" if $s =~ /\0154/; # == 'l'
    print "ok 6\n" if $s =~ /\0154\0154/;
    print "ok 7\n" if $s =~ /\x6c\x6C/;
    print "ok 8\n" if $s =~ /./;
    print "ok 9\n" if $s =~ /<[asdfl]>/;
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
OUT

##############################
output_is(<<'CODE', <<'OUT', "Character classes.");
sub main() {
    my $s = "hello";
    print "ok 1\n" if $s =~ /<[asdfl]>/;
    print "ok 2\n" if $s !~ /<[asdf]>/;
    print "ok 3\n" if $s =~ /<[a-f]>/;
    print "ok 4\n" if $s !~ /<[a-d]>/;
    print "ok 5\n" if $s =~ /<[a-ee]>/;
    print "ok 6\n" if $s !~ /<[a-df-g]>/;
    print "ok 7\n" if $s =~ /<[a-dc-g]>/;
}
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
OUT

##############################
output_is(<<'CODE', <<'OUT', "Alternation.");
sub main() {
    my $s = 'aaacacaaba';
    print "ok 1\n" if $s =~ /aaa | ac | a/;
    print "ok 2\n" if $s =~ /^ [aaaa | ac | b |]/;
    print "ok 3\n" if $s =~ /^ [[aaaa |] | ac | b]/;
    print "ok 4\n" if $s =~ /^ [[aaaa |] ac | b |]/;
    print "ok 5\n" if $s =~ /^ [[[[[aaaa | aaa] | b] | c] | d] | e]/;
    print "ok 6\n" if $s =~ /^ [e | [d | [c | [b | [aaaa | aaa]]]]]/;
    print "ok 7\n" if $s =~ /[[[[[aaaa | a] | b] | c] | d] | e]$/;
    print "ok 8\n" if $s =~ /[e | [d | [c | [b | [aaaa | a]]]]]$/;
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
OUT

##############################
output_is(<<'CODE', <<'OUT', "Greedy repetition.");
sub main() {
    my $s = 'accaacaacaaba';
    my $s4 = 'aaaa';
    my $s5 = 'aaaaa';
    my $s7 = 'aaaaaaa';
    print "ok 1\n" if $s =~ /aca*/;
    print "ok 2\n" if $s =~ /aca+/;
    print "ok 3\n" if $s =~ /aca?/;
    print "ok 4\n" if $s =~ /aca<2>/;
    print "ok 5\n" if $s =~ /aca<0,2>/;
    print "ok 6\n" if $s =~ /aca<2,1000>/;
    my ($n, $m) = (2, 34);
    print "ok 7\n" if $s =~ /aca<2,$m>/;
    print "ok 8\n" if $s !~ /aca<3,$m>/;
    print "ok 9\n" if $s =~ /abb?/;
    print "ok 10\n" if $s !~ /abb+/;
    print "ok 11\n" if $s =~ /abb*/;
    print "ok 12\n" if $s4 =~ /^ [ a<2,3> ]<1,2> $/;
    print "ok 13\n" if $s5 =~ /^ [ a<2,3> ]<1,2> $/;
    print "ok 14\n" if $s4 =~ /^ [ a<2,3>? ]<1,2>? $/;
    print "ok 15\n" if $s5 =~ /^ [ a<2,3>? ]<1,2>? $/;
    print "ok 16\n" if $s7 !~ /^ [ a<2,3> ]<1,2> $/;
    print "ok 17\n" if $s5 !~ /^a<1,2>$/;
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
ok 15
ok 16
ok 17
OUT

##############################
output_is(<<'CODE', <<'OUT', "Frugal repetition.");
sub main() {
    my $s = 'accaacaacaaba';
    print "ok 1\n" if $s =~ /aca*?/;
    print "ok 2\n" if $s =~ /aca+?/;
    print "ok 3\n" if $s =~ /aca??/;
    print "ok 4\n" if $s =~ /aca<2>?/;
    print "ok 5\n" if $s =~ /aca<0,2>?/;
    print "ok 6\n" if $s =~ /aca<2,1000>?/;
    my ($n, $m) = (2, 34);
    print "ok 7\n" if $s =~ /aca<2,$m>?/;
    print "ok 8\n" if $s !~ /aca<3,$m>?/;
    print "ok 9\n" if $s =~ /abb??/;
    print "ok 10\n" if $s !~ /abb+?/;
    print "ok 11\n" if $s =~ /abb*?/;
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
OUT

##############################
output_is(<<'CODE', <<'OUT', "Interp array.");
sub main() {
    my @a = ('aaa', 'ac', 'a');
    my $s = 'aaacacaaba';
    print "ok 1\n" if $s =~ /@a/;
    print "ok 2\n" if $s =~ /@a @a/;
    print "ok 3\n" if $s =~ /@a @a @a @a/;
    print "ok 4\n" if $s =~ /@a @a @a @a @a @a/;
    print "ok 5\n" if $s !~ /@a @a @a @a @a @a @a/;
    print "ok 6\n" if $s =~ /@a a @a ac/;
    print "ok 7\n" if $s =~ /^@a+ b/;
    print "ok 8\n" if $s =~ /^@a*? b/;
    print "ok 9\n" if $s !~ /@a+ .$/;
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
OUT

##############################
output_is(<<'CODE', <<'OUT', "Anonymous rules (end check)");
sub main() {
    my $s = "8";
    my $r2 = rx / 8 /;
    print "ok 1\n" if $s =~ / .* <$r2> /; # Don't ask
}
CODE
ok 1
OUT

##############################
output_is(<<'CODE', <<'OUT', "Anonymous rules.");
sub main() {
    my $s = " 12 112213455898898992020 ";
    my $r = rule { @_[0]<2> };
    my $r2 = rx / 89+9 /;
    print "ok 1\n" if $s =~ /<$r2>/;
    print "ok 2\n" if $s =~ /<$r(1)><$r(2)>/;
    print "ok 3\n" if $s =~ /<$r(2)> .* <$r2>/;
}
CODE
ok 1
ok 2
ok 3
OUT


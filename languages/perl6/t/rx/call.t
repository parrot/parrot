#!perl
use strict;
use P6C::TestCompiler tests => 2;
use Test::More qw(skip);

##############################
output_is(<<'CODE', <<'OUT', "Called rules.");
rule thing() {
    <[a-z]>+
}

rule parens() {
    \( [ <thing> | <parens> | \s ]* \)
}

# ]] # to fool cperl-mode

sub main() {
    my $s = "asdf.234.fad.bad";
    print "ok 1\n" if $s =~ /<thing>/;
    print "ok 2\n" if $s =~ /<thing>\.<thing>/;
    print "ok 3\n" if $s !~ /<thing>\.<thing>\.<thing>/;
    print "ok 4\n" if $s =~ /<thing>$/;

    my $t = "()()(((blah blah () blah))(blah))";
    my $t2 = $t _ ")";
    print "ok 5\n" if $t =~ /<parens>/;
    print "ok 6\n" if $t2 =~ /<parens>/;
    print "ok 7\n" if $t =~ /^ <parens>+ $/;
    print "ok 8\n" if $t2 !~ /^ <parens> $/;
    print "ok 9\n" if $t2 =~ /^ <parens>/;
# XXX: skip this one, since it seems to take forever -- bug?
#    print "ok 10\n" if $t2 !~ / <parens> $/;
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
output_is(<<'CODE', <<'OUT', "Rule arguments.");
rule two_of {
    @_<2>
}

rule balanced($open, $close) {
    $open <balanced($open, $close)>* $close
}

# ]] # to fool cperl-mode

sub main() {
    my $s = " 12 112213455898898992020 ";
    print "ok 1\n" if $s =~ /<two_of(1..10)>/;
    print "ok 2\n" if $s =~ /<two_of(1..30)>\s$/;
    print "ok 3\n" if $s =~ /5<balanced(8, 9)>+20/;
    print "ok 4\n" if $s =~ /<two_of(1..10)><2> .<6> <balanced(9,8)>/;
    print "ok 5\n" if $s =~ /<two_of:20>/;
}
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUT

#!perl
use strict;
use P6C::TestCompiler tests => 6;
use Test::More;

##############################
output_is(<<'CODE', <<'OUT', "string interpolation 1 - single,double,embedded");
sub main() {
    my $action="said"; #double
    my $person='Gimli.'; #single
    my $speech="\q{"You have not seen, so I forgive your jest,"}"; #embedded
    # qq + interpolation
    print(qq|$speech $action $person\n"But you speak like a fool."\n|);
    # obviously refering to those folks who think Perl6 is a "bad thing." :)
    print "\"pass " ~ 'test"' ~ "\n"; # backslash quotes + spacing
}
CODE
"You have not seen, so I forgive your jest," said Gimli.
"But you speak like a fool."
"pass test"
OUT

##############################
output_is(<<'CODE', <<'OUT', "string interpolation 2 - \$(), \@()");
sub main() {
    my $x=3;

    # $()
    print "$(1)\n";
    print "$("testing")\n";
    print "$("we","are","testing")\n";
    print "$(qq(foo""bar))\n";

    # @()
    print "@(2)\n";
    print "@("testing")\n";
    print "@("we","are","testing")\n";
    print "@($x,$x)\n";

    # %() and &() are unimp

    # misc
    print "$x + 3\n";
    print "on $(q(both)) sides\n";
}
CODE
1
testing
testing
foo""bar
2
testing
we are testing
3 3
3 + 3
on both sides
OUT

##############################
output_is(<<'CODE', <<'OUT', "string interpolation 3 - hex escapes");
sub main() {
    print "\x0a"; # Hex
    print "\0x010\n";  # Number
}
CODE

16
OUT

##############################
SKIP: {
skip("running on a perl without charnames", 2)
    unless eval "use charnames (); 1";
output_is(<<'CODE', <<'OUT', "string interpolation 4 - named chars");
sub main() {
    print "\c[^J]"; # Control-Char
    print "\c[REVERSE SOLIDUS]\n"; # Named Unicode
    print "\c[INVERTED EXCLAMATION MARK;CENT SIGN]\n"; # Named-Unicode m-block
    print "\0[0x010]\n"; # Number block
    print "\x[40;50]\n";
}
CODE

\
¡¢
16
@P
OUT

##############################
output_is(<<'CODE', <<'OUT', "string interpolation 5 - up- and down-casing");
sub main() {
    print "\ux\n"; # Uppercase Single
    print "\lX\n"; # Lowercase Single
    print "\U[xxx]\n";   # Uppercase block
    print "\L[XXX]\n";   # Lowercase block
}
CODE
X
x
XXX
xxx
OUT

}
##############################
output_is(<<'CODE', <<'OUT', "string interpolation 6 - stopping");
sub main() {
    @code = ("hi");
    print "@code\Q[0]\n"; # Stop interpolation
}
CODE
hi0
OUT

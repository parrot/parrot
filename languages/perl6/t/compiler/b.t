#!perl
use strict;
use P6C::TestCompiler tests => 2;

##############################
output_is(<<'CODE', <<'OUT', "string interpolation 1");
sub main() {
    my $action="said"; #double
    my $person='Gimli.'; #single
    my $speech="\q{"You have not seen, so I forgive your jest,"}"; #embedded
    # qq + interpolation
    print(qq|$speech $action $person\n"But you speak like a fool."\n|);
    # obviously refering to those folks who think Perl6 is a "bad thing." :)
    print "\"pass " _ 'test"' _ "\n"; # backslash quotes + spacing
}
CODE
"You have not seen, so I forgive your jest," said Gimli.
"But you speak like a fool."
"pass test"
OUT

##############################
output_is(<<'CODE', <<'OUT', "string interpolation 2");
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

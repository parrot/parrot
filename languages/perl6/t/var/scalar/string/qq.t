#!perl
use strict;
use P6C::TestCompiler tests => 4;
use Test::More;

##############################
output_is(<<'CODE', <<'OUT', "string interpolation - single");
    my $person='Gimli';
    # qq + interpolation
    print(qq|$person\n|);
CODE
Gimli
OUT

output_is(<<'CODE', <<'OUT', "string interpolation - double");
sub main() {
    my $action="said";
    my $person='Gimli';
    # qq + interpolation
    print(qq|$action $person\n|);
}
CODE
said Gimli
OUT

output_is(<<'CODE', <<'OUT', "string interpolation - embedded");
sub main() {
    my $speech="\q{"You have not seen, so I forgive your jest,"}"; #embedded
    # qq + interpolation
    print(qq|$speech\n|);
}
CODE
"You have not seen, so I forgive your jest,"
OUT

output_is(<<'CODE', <<'OUT', "string interpolation - single,double,embedded");
sub main() {
    my $action="said"; #double
    my $person='Gimli.'; #single
    my $speech="\q{"You have not seen, so I forgive your jest,"}"; #embedded
    # qq + interpolation
    print(qq|$speech $action $person\n"But you speak like a fool."\n|);
    # obviously refering to those folks who think Perl6 is a "bad thing." :)
}
CODE
"You have not seen, so I forgive your jest," said Gimli.
"But you speak like a fool."
OUT

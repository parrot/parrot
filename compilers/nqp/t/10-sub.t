#!./parrot nqp.pbc

# check subs

say('1..11');

sub one ( ) {
    say("ok 1 # sub def and call");
}

one();

{
    sub two ( ) {
        say("ok 2 # sub def and call inside block");
    }
    two();
}

sub three ( ) { say("ok 3 # sub def; sub call on same line"); }; three();

sub four_five ($arg1) {
    say($arg1);
}
four_five('ok 4 # passed in 1 arg');

{
    four_five('ok 5 # calling sub in outer scope');
}

{
    sub six ( ) {
        say("ok 6 # def in inner scope, called from outer scope");
    }
}
six();

sub seven () {
    "ok 7 # return string literal from sub";
}

say(seven());

sub eight () {
    "ok 8 # bind sub return to variable";
}

my $retVal := eight();

unless $retVal {
    print("not ");
}
say($retVal);

sub add_stomp ($first, $last) {
    my $sum := $first + $last;
    $first  := $last - $first;
    $sum;
}

print("ok "); print(add_stomp(3,6)); say(" # returning the result of operating on arguments");

my $five  := 5;
my $seven := 7;

add_stomp($five, $seven);

if $five != 5 {
    print("not ");
}
say("ok 10 # subroutines that operate on args do not affect the original arg outside the sub");

sub eleven ($arg) {
    say("ok 11 # parameter with a trailing comma");
}
eleven( 'dummy', ); 

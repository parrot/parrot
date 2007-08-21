#!./parrot

# check comparisons

say('1..10');

##Integers, positive and negative

if 1 == 1 { say("ok 1 # numeric equality, integers"); }

unless 1 == 2 {
    say("ok 2 # numeric equality, integers, not equal");
}

if -3 == -3 { say("ok 3 # numeric equality, negative integers"); }

if 1 != 2 { say("ok 4 # numeric inequality, integers"); }

unless 1 != 1 {
    say("ok 5 # numeric inequality, equal, integers");
}

unless -2 != -2 {
    say("ok 6 # numeric inequality, equal, negative integers");
}

##Strings

if "eq" eq "eq" { say("ok 7 # string equality"); }

unless "one" eq "two" {
    say("ok 8 # string equality, not equal");
}

if "ONE" ne "TWO" { say("ok 9 # string inequality"); }

unless "STRING" ne "STRING" {
    say("ok 10 # string inequality, equal");
}

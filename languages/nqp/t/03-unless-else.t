#!./parrot

# check literals

say('1..4');

unless 0 { say("ok 1 # on one line with else"); } else { say("not ok 1 # on one
line with else")}

say("ok 2 # statements following unless with else are okay");

unless 0 {
    say("ok 3 # multi-line unless with else");
}
else {
    say("not ok 3 # multi-line unless with else");
}

unless 1 {
    say("not ok 4 # multi-line unless, else branch");
}
else {
    say("ok 4 # multi-line unless, else branch");
}


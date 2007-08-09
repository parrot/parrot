#!./parrot

# check literals

say('1..4');

if 1 { say("ok 1 # on one line with else"); } else { say("not ok 1 # on one line with else")}

say("ok 2 # statements following if with else are okay");

if 1 {
    say("ok 3 # multi-line if with else");
}
else {
    say("not ok 3 # multi-line if with else");
}

if 0 {
    say("not ok 4 # multi-line if, else branch");
}
else {
    say("ok 4 # multi-line if, else branch");
}

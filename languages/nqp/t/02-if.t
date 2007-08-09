#!./parrot

# check literals

say('1..3');

if 1 { say("ok 1 # on one line"); }

say("ok 2 # statements following if are okay");

if 1 {
    say("ok 3 # multi-line if");
}

if 0 {
    say("not ok 4 # multi-line if");
}

#!./parrot

# check literals

say('1..3');

unless 0 { say("ok 1 # on one line"); }

say("ok 2 # statements following unless are okay");

unless 0 {
    say("ok 3 # multi-line unless");
}

unless 1 {
    say("not ok 4 # testing conditional");
}

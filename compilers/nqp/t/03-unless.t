#!./parrot nqp.pbc

# check control structure 'unless'

say('1..4');

unless 0 { say("ok 1 # on one line"); }

say("ok 2 # statements following unless are okay");

unless 0 {
    say("ok 3 # multi-line unless");
}

unless 1 {
    print("not ");
}
say("ok 4 # testing conditional");

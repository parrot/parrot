#!./parrot

# check literals

say('1..4');

unless 0 { say("ok 1 # on one line with else"); } else { say("not ok 1 # on one
line with else")}

say("ok 2 # statements following unless with else are okay");

unless 0 {
    print("ok 3");
}
else {
    print("not ok 3");
}
say(" # multi-line unless with else");

unless 1 {
    print("not ok 4");
}
else {
    print("ok 4");
}
say(" # multi-line unless, else branch");


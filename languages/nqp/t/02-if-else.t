#!./parrot

# check literals

say('1..4');

if 1 { say("ok 1 # on one line with else"); } else { say("not ok 1 # on one line with else")}

say("ok 2 # statements following if with else are okay");

if 1 {
    print("ok 3");
}
else {
    print("not ok 3");
}
say(" # multi-line if with else");

if 0 {
    print("not ok 4");
}
else {
    print("ok 4");
}
say(" # multi-line if, else branch");

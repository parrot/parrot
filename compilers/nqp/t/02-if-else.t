#!./parrot

# check control structure 'if ... else'

say('1..7');

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

if 0 {
}
else {
    print("ok 5");
}
say(" # empty if-block");

if 0 {
    print("not ok 6");
}
else {
}
print("ok 6");
say(" # empty else-block");

if 0 {
}
else {
}
print("ok 7");
say(" # empty if- and else-block");

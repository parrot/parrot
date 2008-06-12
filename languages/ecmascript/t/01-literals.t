print("1..11\n");
print("ok 1\n");

try {
    print("ok 2\n");
}
catch(exc) {
    print("nok 2\n");
}

if (1) {
    print("ok 3\n");
}
else {
    throw "nok 3\n";
}

if (1) {
    print("ok 4\n");
}

while (0) {
    print ("nok 4\n");
}

print("ok 5\n");

print("ok ");
print(1+1+1+3);
print("\n");
print("ok ");
print(10-3);
print("\nok ");
print(1*8);
print("\nok ");
print(18/2);
print("\n");

var x = 1;
x += 9;
print("ok ");
print(x);
print("\n");

function foo() {
    return "ok 11\n";
}

print(foo());

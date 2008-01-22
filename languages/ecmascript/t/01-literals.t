print("1..5\n")
print("ok 1\n")

try {
    print("ok 2\n")
}
catch(exc) {
    print("nok 2\n")
}

if (1) {
    print("ok 3\n")
}
else {
    throw "nok 3\n";
}

if (1) {
    print("ok 4\n")
}

while (0) {
    print ("nok 4\n")
}

print("ok 5\n")



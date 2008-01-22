print("1..2\n")
print("ok 1\n")

try {
    print("ok 2\n")
}
catch(exc) {
    print("nok 2\n")

    throw "nok 3\n";
}

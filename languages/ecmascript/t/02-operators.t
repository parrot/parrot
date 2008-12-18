// Test the relational ops

print ("1..8\n");

if (1 < 7) { print("ok 1\n"); } else { print("nok 1\n"); }
if (7 < 1) { print("nok 2\n"); } else { print("ok 2\n"); }
if (1 <= 7) { print("ok 3\n"); } else { print("nok 3\n"); }
if (7 <= 7) { print("ok 4\n"); } else { print("nok 4\n"); }

if (7 > 3) { print("ok 5\n"); } else { print("nok 5\n"); }
if (3 > 7) { print("nok 6\n"); } else { print("ok 6\n"); }
if (7 >= 3) { print("ok 7\n"); } else { print("nok 7\n"); }
if (3 >= 3) { print("ok 8\n"); } else { print("nok 8\n"); }

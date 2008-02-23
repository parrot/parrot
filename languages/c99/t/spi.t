


void main() {
    puts("1..6");
    puts("ok 1");

    if (0)
        puts("nok 2");
    else {
        puts("ok 2");
    }


    if (1) {
        puts("ok 3");
    }
    else
        puts("nok 3");

    do {
        puts("ok 4");
    }
    while(0);

    while(0) {
        puts("nok 5");
    }
    puts("ok 5");

    1 ? puts("ok 6") : puts("nok 6");
}


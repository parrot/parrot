#! perl -w

use Parrot::Test tests => 2;

TODO: {
    local $TODO="t/src doesn't work on Windows" if $^O =~ /Win32/;
    $TODO=$TODO;  #warnings

    c_output_is(<<'CODE', <<'OUTPUT', "hello world");
#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int do_test(struct Parrot_Interp* interpreter) {
    STRING *S;
    PMC *pmc;
    INTVAL ival;
    UINTVAL uval;
    float fval;
    double dval;
    FLOATVAL fltval;
    char *fmt;
    char dest[20];
    char *temp;

    Parrot_snprintf(interpreter, dest, 2, "%s", "CERT");
    printf("%s\n",dest);

    S = Parrot_sprintf_c(interpreter, "Hello, %%%s%%\n", "Parrot!");
    temp = string_to_cstring(interpreter, S);
    fputs(temp, stdout);
    free(temp);

    S = Parrot_sprintf_c(interpreter, "PerlHash[0x%x]\n", 256);
    temp = string_to_cstring(interpreter, S);
    fputs(temp, stdout);
    free(temp);

    S = Parrot_sprintf_c(interpreter, "PerlHash[0x%lx]\n", 256);
    temp = string_to_cstring(interpreter, S);
    fputs(temp, stdout);
    free(temp);

    S = Parrot_sprintf_c(interpreter, "Hello, %.2s!\n", "Parrot");
    temp = string_to_cstring(interpreter, S);
    fputs(temp, stdout);
    free(temp);

    S = Parrot_sprintf_c(interpreter, "Hello, %Ss", S);
    temp = string_to_cstring(interpreter, S);
    fputs(temp, stdout);
    free(temp);

    pmc=pmc_new(interpreter, enum_class_PerlInt);
    pmc->vtable->set_integer_native(interpreter, pmc, 1);
    S = Parrot_sprintf_c(interpreter, "== %Pd\n", pmc);
    printf("%d %s", 1, string_to_cstring(interpreter, S));

    ival = -255;
    S = Parrot_sprintf_c(interpreter, "== %vd\n", ival);
    printf("%d %s", (int) ival, string_to_cstring(interpreter, S));

    uval = 256;
    S = Parrot_sprintf_c(interpreter, "== %vu\n", uval);
    printf("%u %s", (unsigned) uval, string_to_cstring(interpreter, S));

    fval = 0.5;
    S = Parrot_sprintf_c(interpreter, "== %vf\n", fval);
    printf("%f %s", fval, string_to_cstring(interpreter, S));

    dval = 0.5;
    S = Parrot_sprintf_c(interpreter, "== %5.3f\n", dval);
    printf("%5.3f %s", dval, string_to_cstring(interpreter, S));

    dval = 0.001;
    S = Parrot_sprintf_c(interpreter, "== %g\n", dval);
    printf("%g %s", dval, string_to_cstring(interpreter, S));

    dval = 1.0e6;
    S = Parrot_sprintf_c(interpreter, "== %g\n", dval);
    printf("%g %s", dval, string_to_cstring(interpreter, S));

    fltval = 0.5;
    S = Parrot_sprintf_c(interpreter, "== %3.3vg\n", fltval);
    printf("%3.3g %s", (double) fltval, string_to_cstring(interpreter, S));

    ival = 32;
    S = Parrot_sprintf_c(interpreter, "== %#vx\n", ival);
    printf("0x%x %s", (int) ival, string_to_cstring(interpreter, S));

    /* test several flags */
        ival = 25;
    S = Parrot_sprintf_c(interpreter, "== % 5vd\n", ival);
    printf("% 5d %s", (int) ival,
           string_to_cstring(interpreter, S));
    S = Parrot_sprintf_c(interpreter, "== %-5vd|\n", ival);
    printf("%-5d %s", (int) ival,
           string_to_cstring(interpreter, S));
    S = Parrot_sprintf_c(interpreter, "== %05vd\n", ival);
    printf("%05d %s", (int) ival,
           string_to_cstring(interpreter, S));
    S = Parrot_sprintf_c(interpreter, "== %2vd\n", ival);
    printf("%2d %s", (int) ival,
           string_to_cstring(interpreter, S));

    ival = -1;
    S = Parrot_sprintf_c(interpreter, "== %#vx\n", ival);
    printf("0x%x %s", (int) ival,
           string_to_cstring(interpreter, S));
    S = Parrot_sprintf_c(interpreter, "== %08vd\n", ival);
    printf("%08d %s", (int) ival,
           string_to_cstring(interpreter, S));

    /* Test we've not left junk behind on the stack */
    S = Parrot_sprintf_c(interpreter, "That's all, %s\n", "folks!");
    fputs(string_to_cstring(interpreter, S), stdout);

    return 0;
}

int main(int argc, char* argv[]) {
    int dummy_var;
    struct Parrot_Interp * interpreter;

    interpreter = Parrot_new();
    Parrot_init(interpreter, (void*) &dummy_var);
    do_test(interpreter);

    return 0;
}
CODE
C
Hello, %Parrot!%
PerlHash[0x100]
PerlHash[0x100]
Hello, Pa!
Hello, Hello, Pa!
1 == 1
-255 == -255
256 == 256
0.500000 == 0.500000
0.500 == 0.500
0.001 == 0.001
1e+06 == 1e+06
0.5 == 0.5
0x20 == 0x20
   25 ==    25
25    == 25   |
00025 == 00025
25 == 25
0xffffffff == 0xffffffff
-0000001 == -0000001
That's all, folks!
OUTPUT

c_output_like (<<'CODE', "/[0-9a-f]*\nok\n/", "many printfs");
#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main ()
{
    INTVAL i;
    struct Parrot_Interp *interp = NULL;

    interp = Parrot_new ();
    Parrot_init(interp, (void*) &i);

    for (i=0; i<10000; i++) {
         PIO_printf(interp, "%vx", i);
    }

    PIO_printf(interp, "\nok\n");

    return 0;
}
CODE
}

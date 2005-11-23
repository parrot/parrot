#! perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 3;


=head1 NAME

t/src/sprintf.t - Name

=head1 SYNOPSIS

	% prove t/src/sprintf.t

=head1 DESCRIPTION

Tests the various C<Parrot_sprintf_*> functions.

=cut


c_output_like(<<'CODE', <<'OUTPUT', "xxxVAL_FMT");
#include "parrot/parrot.h"
int main(int argc, char* argv[]) {
    PIO_printf(NULL, INTVAL_FMT "\n", (INTVAL) 42);
    PIO_printf(NULL, FLOATVAL_FMT "\n", (FLOATVAL) 42.0);
    Parrot_exit(0);
    return 0;
}
CODE
/42\n
42\.0+\n
/x
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "hello world");
#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int do_test(Interp* interpreter) {
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

    S = Parrot_sprintf_c(interpreter, "Hash[0x%x]\n", 256);
    temp = string_to_cstring(interpreter, S);
    fputs(temp, stdout);
    free(temp);

    S = Parrot_sprintf_c(interpreter, "Hash[0x%lx]\n", 256);
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

    pmc=pmc_new(interpreter, enum_class_Integer);
    VTABLE_set_integer_native(interpreter, pmc, 1);
    S = Parrot_sprintf_c(interpreter, "== %Pd\n", pmc);
    printf("%d %s", 1, string_to_cstring(interpreter, S));

    ival = -255;
    S = Parrot_sprintf_c(interpreter, "== %vd\n", (INTVAL)ival);
    printf("%d %s", (int) ival, string_to_cstring(interpreter, S));

    uval = 256;
    S = Parrot_sprintf_c(interpreter, "== %vu\n", (UINTVAL)uval);
    printf("%u %s", (unsigned) uval, string_to_cstring(interpreter, S));

    fval = 0.5;
    S = Parrot_sprintf_c(interpreter, "== %vf\n", (FLOATVAL)fval);
    printf("%f %s", fval, string_to_cstring(interpreter, S));

    dval = 0.5;
    S = Parrot_sprintf_c(interpreter, "== %5.3f\n", dval);
    printf("%5.3f %s", dval, string_to_cstring(interpreter, S));

    dval = 0.001;
    S = Parrot_sprintf_c(interpreter, "== %g\n", dval);
    printf("%g %s", dval, string_to_cstring(interpreter, S));

/* Note: does not work on Win32, and testing for _native_ printf
         behaviour on floats is probably just asking for trouble

    dval = 1.0e6;
    S = Parrot_sprintf_c(interpreter, "== %g\n", dval);
    printf("%g %s", dval, string_to_cstring(interpreter, S));
*/

    fltval = 0.5;
    S = Parrot_sprintf_c(interpreter, "== %3.3vg\n", (FLOATVAL)fltval);
    printf("%3.3g %s", (double) fltval, string_to_cstring(interpreter, S));

    ival = 32;
    S = Parrot_sprintf_c(interpreter, "== %#vx\n", (INTVAL)ival);
    printf("0x%x %s", (int) ival, string_to_cstring(interpreter, S));

    /* test several flags */
        ival = 25;
    S = Parrot_sprintf_c(interpreter, "== % 5vd\n", (INTVAL)ival);
    printf("% 5d %s", (int) ival,
           string_to_cstring(interpreter, S));
    S = Parrot_sprintf_c(interpreter, "== %-5vd|\n", (INTVAL)ival);
    printf("%-5d %s", (int) ival,
           string_to_cstring(interpreter, S));
    S = Parrot_sprintf_c(interpreter, "== %05vd\n", (INTVAL)ival);
    printf("%05d %s", (int) ival,
           string_to_cstring(interpreter, S));
    S = Parrot_sprintf_c(interpreter, "== %2vd\n", (INTVAL)ival);
    printf("%2d %s", (int) ival,
           string_to_cstring(interpreter, S));

    ival = -1;
/* INVALID FOR 64-BIT PLATFORMS?
    S = Parrot_sprintf_c(interpreter, "== %#vx\n", (INTVAL)ival);
    printf("0x%x %s", (int) ival,
           string_to_cstring(interpreter, S));
*/
    S = Parrot_sprintf_c(interpreter, "== %08vd\n", (INTVAL)ival);
    printf("%08d %s", (int) ival,
           string_to_cstring(interpreter, S));
     /* test string_nprintf() */
     {
 	STRING *S2;
 	ival = 1000000;
 	S = string_nprintf(interpreter, NULL, 0, "== %d\n", (int) ival);
 	printf("%d %s", (int) ival, string_to_cstring(interpreter, S));
 	S2 = string_from_cstring(interpreter,"Parrot", 0);
 	S = string_nprintf(interpreter, S2, 0, "== %d\n", (int) ival);
 	printf("%d %s", (int) ival, string_to_cstring(interpreter, S));
 	printf("%s\n", (S == S2) ? "ok" : "different?!?");
 	S = string_nprintf(interpreter, NULL, 42, "== %d\n", (int) ival);
 	printf("%d %s", (int) ival, string_to_cstring(interpreter, S));
 	S = string_nprintf(interpreter, NULL, 6, "== %d\n", (int) ival);
 	printf("100 %s\n", string_to_cstring(interpreter, S));
 	S = string_nprintf(interpreter, S2, 6, "== %d\n", (int) ival);
 	printf("100 %s\n", string_to_cstring(interpreter, S));
     }

    /* Test we've not left junk behind on the stack */
    S = Parrot_sprintf_c(interpreter, "That's all, %s\n", "folks!");
    fputs(string_to_cstring(interpreter, S), stdout);

    return 0;
}

int main(int argc, char* argv[]) {
    Interp * interpreter;

    interpreter = Parrot_new(NULL);
    Parrot_init_stacktop(interpreter, &interpreter);
    do_test(interpreter);

    Parrot_exit(0);
    return 0;
}
CODE
C
Hello, %Parrot!%
Hash[0x100]
Hash[0x100]
Hello, Pa!
Hello, Hello, Pa!
1 == 1
-255 == -255
256 == 256
0.500000 == 0.500000
0.500 == 0.500
0.001 == 0.001
0.5 == 0.5
0x20 == 0x20
   25 ==    25
25    == 25   |
00025 == 00025
25 == 25
-0000001 == -0000001
1000000 == 1000000
1000000 == 1000000
ok
1000000 == 1000000
100 == 100
100 == 100
That's all, folks!
OUTPUT

c_output_like (<<'CODE', "/[0-9a-f]*\nok\n/", "many printfs");
#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main ()
{
    INTVAL i;
    Interp *interp = NULL;

    interp = Parrot_new (NULL);
    Parrot_init_stacktop(interp, &interp);
    interp->lo_var_ptr = &i; /* we don't have a run-loop so ... */

    for (i=0; i<10000; i++) {
         PIO_printf(interp, "%vx", i);
    }

    PIO_printf(interp, "\nok\n");

    return 0;
}
CODE

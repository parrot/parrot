#! perl -w
# Tests the extension API

use Parrot::Test tests => 2;

c_output_is(<<'CODE', <<'OUTPUT', "set/get_intreg");

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/extend.h"

int main(int argc, char* argv[]) {
    Interp* interpreter;
    Parrot_Int parrot_reg, value, new_value;

    /* Interpreter set-up */
    interpreter = Parrot_new();
    if ( interpreter == NULL ) return 1;
    Parrot_init(interpreter);

    parrot_reg = 0;
    value = 42;

    Parrot_set_intreg(interpreter, parrot_reg, value);
    new_value = Parrot_get_intreg(interpreter, parrot_reg);

    printf("%d\n", (int)new_value);

    return 0;
}

CODE
42
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "set/get_numreg");

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/extend.h"

int main(int argc, char* argv[]) {
    Interp* interpreter;
    Parrot_Int parrot_reg;
    Parrot_Float value, new_value;

    /* Interpreter set-up */
    interpreter = Parrot_new();
    if ( interpreter == NULL ) return 1;
    Parrot_init(interpreter);

    parrot_reg = 1;
    value = 2.5;

    Parrot_set_numreg(interpreter, parrot_reg, value);
    new_value = Parrot_get_numreg(interpreter, parrot_reg);

    printf("%.1f\n", (double)new_value);

    return 0;
}

CODE
2.5
OUTPUT

1;

#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$
# Tests the extension API

=head1 NAME

t/src/extend.t - Parrot Extension API

=head1 SYNOPSIS

	% perl t/src/extend.t

=head1 DESCRIPTION

Tests the extension API.

=cut

use Parrot::Test tests => 13;
use Parrot::Config;

c_output_is(<<'CODE', <<'OUTPUT', "set/get_intreg");

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int main(int argc, char* argv[]) {
    Parrot_Interp interpreter;
    Parrot_Int parrot_reg, value, new_value;

    /* Interpreter set-up */
    interpreter = Parrot_new(NULL);
    if ( interpreter == NULL ) return 1;
    Parrot_init(interpreter);

    parrot_reg = 0;
    value = 42;

    Parrot_set_intreg(interpreter, parrot_reg, value);
    new_value = Parrot_get_intreg(interpreter, parrot_reg);

    printf("%d\n", (int)new_value);

    Parrot_exit(0);
    return 0;
}

CODE
42
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "set/get_numreg");

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int main(int argc, char* argv[]) {
    Parrot_Interp interpreter;
    Parrot_Int parrot_reg;
    Parrot_Float value, new_value;

    /* Interpreter set-up */
    interpreter = Parrot_new(NULL);
    if ( interpreter == NULL ) return 1;
    Parrot_init(interpreter);

    parrot_reg = 1;
    value = 2.5;

    Parrot_set_numreg(interpreter, parrot_reg, value);
    new_value = Parrot_get_numreg(interpreter, parrot_reg);

    printf("%.1f\n", (double)new_value);

    Parrot_exit(0);
    return 0;
}

CODE
2.5
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "Parrot_new_string");

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int main(int argc, char* argv[]) {
    Parrot_Interp interpreter;
    Parrot_STRING output;

    /* Interpreter set-up */
    interpreter = Parrot_new(NULL);
    if ( interpreter == NULL ) return 1;
    Parrot_init(interpreter);

    output = Parrot_new_string(interpreter, "Test", 4, "iso-8859-1", 0);
    PIO_eprintf(interpreter, "%S\n", output);

    Parrot_exit(0);
    return 0;
}

CODE
Test
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "set/get_strreg");

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int main(int argc, char* argv[]) {
    Parrot_Interp interpreter;
    Parrot_Int parrot_reg;
    Parrot_STRING value, new_value;

    /* Interpreter set-up */
    interpreter = Parrot_new(NULL);
    if ( interpreter == NULL ) return 1;
    Parrot_init(interpreter);

    parrot_reg = 2;
    value = Parrot_new_string(interpreter, "Test", 4, "iso-8859-1", 0);
    Parrot_set_strreg(interpreter, parrot_reg, value);
    new_value = Parrot_get_strreg(interpreter, parrot_reg);
    PIO_eprintf(interpreter, "%S\n", new_value);

    Parrot_exit(0);
    return 0;
}

CODE
Test
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "PMC_set/get_intval");

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int main(int argc, char* argv[]) {
    Parrot_Interp interpreter;
    Parrot_Int type, value, new_value;
    Parrot_PMC testpmc;

    /* Interpreter set-up */
    interpreter = Parrot_new(NULL);
    if ( interpreter == NULL ) return 1;
    Parrot_init(interpreter);

    type = Parrot_PMC_typenum(interpreter, "PerlInt");
    testpmc = Parrot_PMC_new(interpreter, type);

    value = 101010;
    Parrot_PMC_set_intval(interpreter, testpmc, value);
    new_value = Parrot_PMC_get_intval(interpreter, testpmc);

    printf("%ld\n", (long)new_value);

    Parrot_exit(0);
    return 0;
}
CODE
101010
OUTPUT


c_output_is(<<'CODE', <<'OUTPUT', "PMC_set/get_intval_intkey");

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/extend.h"

static opcode_t*
the_test(Parrot_Interp interpreter, opcode_t *cur_op, opcode_t *start)
{
    Parrot_Int type, value, key, new_value;
    Parrot_PMC array;
    type = Parrot_PMC_typenum(interpreter, "PerlArray");
    array = Parrot_PMC_new(interpreter, type);

    value = 12345;
    key   = 10;
    Parrot_PMC_set_intval_intkey(interpreter, array, key, value);

    new_value = Parrot_PMC_get_intval_intkey(interpreter, array, key);

    printf("%ld\n", (long)new_value);
    return NULL;
}

int main(int argc, char* argv[]) {
    Parrot_Interp interpreter;

    /* Interpreter set-up */
    interpreter = Parrot_new(NULL);
    if ( interpreter == NULL ) return 1;
    Parrot_init(interpreter);
    Parrot_run_native(interpreter, the_test);
    Parrot_exit(0);
    return 0;
}
CODE
12345
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "set/get_pmcreg");

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int main(int argc, char* argv[]) {
    Parrot_Interp interpreter;
    Parrot_Int type, value, new_value, parrot_reg;
    Parrot_PMC testpmc, newpmc;

    /* Interpreter set-up */
    interpreter = Parrot_new(NULL);
    if ( interpreter == NULL ) return 1;
    Parrot_init(interpreter);

    type = Parrot_PMC_typenum(interpreter, "PerlInt");
    testpmc = Parrot_PMC_new(interpreter, type);

    value = -123;
    Parrot_PMC_set_intval(interpreter, testpmc, value);

    parrot_reg = 31;
    Parrot_set_pmcreg(interpreter, parrot_reg, testpmc);

    newpmc = Parrot_get_pmcreg(interpreter, parrot_reg);
    new_value = Parrot_PMC_get_intval(interpreter, newpmc);
    printf("%d\n", (int)new_value);

    Parrot_exit(0);
    return 0;
}
CODE
-123
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "PMC_set/get_numval");

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int main(int argc, char* argv[]) {
    Parrot_Interp interpreter;
    Parrot_Int type;
    Parrot_Float value, new_value;
    Parrot_PMC testpmc;

    /* Interpreter set-up */
    interpreter = Parrot_new(NULL);
    if ( interpreter == NULL ) return 1;
    Parrot_init(interpreter);

    type = Parrot_PMC_typenum(interpreter, "PerlNum");
    testpmc = Parrot_PMC_new(interpreter, type);

    value = 3.1415927;
    Parrot_PMC_set_numval(interpreter, testpmc, value);
    new_value = Parrot_PMC_get_numval(interpreter, testpmc);

    printf("%.7f\n", (double)new_value);

    Parrot_exit(0);
    return 0;
}
CODE
3.1415927
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "PMC_set/get_string");

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int main(int argc, char* argv[]) {
    Parrot_Interp interpreter;
    Parrot_Int type;
    Parrot_STRING value, new_value;
    Parrot_PMC testpmc;

    /* Interpreter set-up */
    interpreter = Parrot_new(NULL);
    if ( interpreter == NULL ) return 1;
    Parrot_init(interpreter);

    type = Parrot_PMC_typenum(interpreter, "PerlString");
    testpmc = Parrot_PMC_new(interpreter, type);

    value = Parrot_new_string(interpreter, "Pumpking", 8, "iso-8859-1", 0);
    Parrot_PMC_set_string(interpreter, testpmc, value);
    new_value = Parrot_PMC_get_string(interpreter, testpmc);

    PIO_eprintf(interpreter, "%S\n", new_value);

    Parrot_exit(0);
    return 0;
}
CODE
Pumpking
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "PMC_set/get_cstring");

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int main(int argc, char* argv[]) {
    Parrot_Interp interpreter;
    Parrot_Int type;
    Parrot_PMC testpmc;
    char* new_value;

    /* Interpreter set-up */
    interpreter = Parrot_new(NULL);
    if ( interpreter == NULL ) return 1;
    Parrot_init(interpreter);

    type = Parrot_PMC_typenum(interpreter, "PerlString");
    testpmc = Parrot_PMC_new(interpreter, type);

    Parrot_PMC_set_cstring(interpreter, testpmc, "Wibble");
    new_value = Parrot_PMC_get_cstring(interpreter, testpmc);

    printf("%s\n", new_value);

    Parrot_free_cstring(new_value);

    Parrot_exit(0);
    return 0;
}
CODE
Wibble
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "PMC_set/get_cstringn");

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int main(int argc, char* argv[]) {
    Parrot_Interp interpreter;
    Parrot_Int type, length;
    Parrot_Int new_len;
    Parrot_PMC testpmc;
    char* new_value;

    /* Interpreter set-up */
    interpreter = Parrot_new(NULL);
    if ( interpreter == NULL ) return 1;
    Parrot_init(interpreter);

    type = Parrot_PMC_typenum(interpreter, "PerlString");
    testpmc = Parrot_PMC_new(interpreter, type);

    length = 6;

    Parrot_PMC_set_cstringn(interpreter, testpmc, "Wibble", length);
    new_value = Parrot_PMC_get_cstringn(interpreter, testpmc, &new_len);

    printf("%s\n", new_value);
    printf("%d\n", (int)(new_len));

    Parrot_free_cstring(new_value);

    Parrot_exit(0);
    return 0;
}
CODE
Wibble
6
OUTPUT

my $temp = 'temp';;
SKIP: { skip("Hangs on cygwin", 1) if $^O eq 'cygwin';
open S, ">$temp.pasm" or die "Can't write $temp.pasm";
print S <<'EOF';
  .pcc_sub _sub1:
  printerr "in sub1\n"
  invoke P1
  .pcc_sub _sub2:
  printerr P5
  printerr "in sub2\n"
  invoke P1
EOF
close S;
# compile to pbc
system(".$PConfig{slash}parrot$PConfig{exe} -o $temp.pbc $temp.pasm");

c_output_is(<<'CODE', <<'OUTPUT', "call a parrot sub");

#include <parrot/parrot.h>
#include <parrot/embed.h>

static opcode_t *the_test(Parrot_Interp, opcode_t *, opcode_t *);

int main(int argc, char* argv[])
{
    Parrot_Interp interpreter = Parrot_new(NULL);
    if (!interpreter) {
        return 1;
    }
    Parrot_init(interpreter);

    Parrot_run_native(interpreter, the_test);

    Parrot_exit(0);
    return 0;
}

/* also both the test PASM and the_test() print to stderr
 * so that buffering in PIO is not an issue
 */

static opcode_t*
the_test(Parrot_Interp interpreter, opcode_t *cur_op, opcode_t *start)
{
    struct PackFile *pf;
    PMC *key, *sub, *arg;

    pf = Parrot_readbc(interpreter, "temp.pbc");
    Parrot_loadbc(interpreter, pf);
    key = key_new_cstring(interpreter, "_sub1");
    sub = VTABLE_get_pmc_keyed(interpreter,
			       interpreter->globals->stash_hash, key);
    Parrot_call(interpreter, sub, 0);
    PIO_eprintf(interpreter, "back\n");

    /* win32 seems to buffer stderr ? */
    PIO_flush(interpreter, PIO_STDERR(interpreter));

    key = key_new_cstring(interpreter, "_sub2");
    sub = VTABLE_get_pmc_keyed(interpreter,
			       interpreter->globals->stash_hash, key);
    arg = pmc_new(interpreter, enum_class_PerlString);
    VTABLE_set_string_native(interpreter, arg,
			     string_from_cstring(interpreter, "hello ", 0));
    Parrot_call(interpreter, sub, 1, arg);
    PIO_eprintf(interpreter, "back\n");

    return NULL;
}
CODE
in sub1
back
hello in sub2
back
OUTPUT
};

open S, ">$temp.pasm" or die "Can't write $temp.pasm";
print S <<'EOF';
  .pcc_sub _sub1:
  printerr "in sub1\n"
  new_pad 0
  find_lex P2, "no_such_var"
  printerr "never\n"
  invoke P1
EOF
close S;
# compile to pbc
system(".$PConfig{slash}parrot$PConfig{exe} -o $temp.pbc $temp.pasm");

c_output_is(<<'CODE', <<'OUTPUT', "call a parrot sub, catch exception");

#include <parrot/parrot.h>
#include <parrot/embed.h>

static opcode_t *the_test(Parrot_Interp, opcode_t *, opcode_t *);

int main(int argc, char* argv[])
{
    Parrot_Interp interpreter = Parrot_new(NULL);
    if (!interpreter) {
        return 1;
    }
    Parrot_init(interpreter);

    Parrot_run_native(interpreter, the_test);

    Parrot_exit(0);
    return 0;
}

/* also both the test PASM and the_test() print to stderr
 * so that buffering in PIO is not an issue
 */

static opcode_t*
the_test(Parrot_Interp interpreter, opcode_t *cur_op, opcode_t *start)
{
    struct PackFile *pf;
    PMC *key, *sub;
    Parrot_exception jb;

    pf = Parrot_readbc(interpreter, "temp.pbc");
    Parrot_loadbc(interpreter, pf);
    key = key_new_cstring(interpreter, "_sub1");
    sub = VTABLE_get_pmc_keyed(interpreter,
			       interpreter->globals->stash_hash, key);

    if (setjmp(jb.destination)) {
	PIO_eprintf(interpreter, "caught\n");
    }
    else {
	push_new_c_exception_handler(interpreter, &jb);
	Parrot_call(interpreter, sub, 0);
    }
    PIO_eprintf(interpreter, "back\n");

    return NULL;
}
CODE
in sub1
caught
back
OUTPUT

unlink "$temp.pasm", "$temp.pbc";


1;

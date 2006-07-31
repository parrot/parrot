# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test;
use Parrot::Config;

plan $^O =~ m/MSWin32/ ? (skip_all => 'broken on win32') : (tests => 15);

=head1 NAME

t/src/extend.t - Parrot Extension API

=head1 SYNOPSIS

    % prove t/src/extend.t

=head1 DESCRIPTION

Tests the extension API.

=cut


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

    parrot_reg = 0;
    value = 42;

    Parrot_set_intreg(interpreter, parrot_reg, value);
    new_value = Parrot_get_intreg(interpreter, parrot_reg);

    printf("%d\n", (int)new_value);

    Parrot_exit(interpreter, 0);
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

    parrot_reg = 1;
    value = 2.5;

    Parrot_set_numreg(interpreter, parrot_reg, value);
    new_value = Parrot_get_numreg(interpreter, parrot_reg);

    printf("%.1f\n", (double)new_value);

    Parrot_exit(interpreter, 0);
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

    output = Parrot_new_string(interpreter, "Test", 4, "iso-8859-1", 0);
    PIO_eprintf(interpreter, "%S\n", output);

    Parrot_exit(interpreter, 0);
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

    parrot_reg = 2;
    value = Parrot_new_string(interpreter, "Test", 4, "iso-8859-1", 0);
    Parrot_set_strreg(interpreter, parrot_reg, value);
    new_value = Parrot_get_strreg(interpreter, parrot_reg);
    PIO_eprintf(interpreter, "%S\n", new_value);

    Parrot_exit(interpreter, 0);
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

    type = Parrot_PMC_typenum(interpreter, "Integer");
    testpmc = Parrot_PMC_new(interpreter, type);

    value = 101010;
    Parrot_PMC_set_intval(interpreter, testpmc, value);
    new_value = Parrot_PMC_get_intval(interpreter, testpmc);

    printf("%ld\n", (long)new_value);

    Parrot_exit(interpreter, 0);
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
    type = Parrot_PMC_typenum(interpreter, "ResizablePMCArray");
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
    Parrot_run_native(interpreter, the_test);
    Parrot_exit(interpreter, 0);
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

    type = Parrot_PMC_typenum(interpreter, "Integer");
    testpmc = Parrot_PMC_new(interpreter, type);

    value = -123;
    Parrot_PMC_set_intval(interpreter, testpmc, value);

    parrot_reg = 31;
    Parrot_set_pmcreg(interpreter, parrot_reg, testpmc);

    newpmc = Parrot_get_pmcreg(interpreter, parrot_reg);
    new_value = Parrot_PMC_get_intval(interpreter, newpmc);
    printf("%d\n", (int)new_value);

    Parrot_exit(interpreter, 0);
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

    type = Parrot_PMC_typenum(interpreter, "Float");
    testpmc = Parrot_PMC_new(interpreter, type);

    value = 3.1415927;
    Parrot_PMC_set_numval(interpreter, testpmc, value);
    new_value = Parrot_PMC_get_numval(interpreter, testpmc);

    printf("%.7f\n", (double)new_value);

    Parrot_exit(interpreter, 0);
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

    type = Parrot_PMC_typenum(interpreter, "String");
    testpmc = Parrot_PMC_new(interpreter, type);

    value = Parrot_new_string(interpreter, "Pumpking", 8, "iso-8859-1", 0);
    Parrot_PMC_set_string(interpreter, testpmc, value);
    new_value = Parrot_PMC_get_string(interpreter, testpmc);

    PIO_eprintf(interpreter, "%S\n", new_value);

    Parrot_exit(interpreter, 0);
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

    type = Parrot_PMC_typenum(interpreter, "String");
    testpmc = Parrot_PMC_new(interpreter, type);

    Parrot_PMC_set_cstring(interpreter, testpmc, "Wibble");
    new_value = Parrot_PMC_get_cstring(interpreter, testpmc);

    printf("%s\n", new_value);

    Parrot_free_cstring(new_value);

    Parrot_exit(interpreter, 0);
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

    type = Parrot_PMC_typenum(interpreter, "String");
    testpmc = Parrot_PMC_new(interpreter, type);

    length = 6;

    Parrot_PMC_set_cstringn(interpreter, testpmc, "Wibble", length);
    new_value = Parrot_PMC_get_cstringn(interpreter, testpmc, &new_len);

    printf("%s\n", new_value);
    printf("%d\n", (int)(new_len));

    Parrot_free_cstring(new_value);

    Parrot_exit(interpreter, 0);
    return 0;
}
CODE
Wibble
6
OUTPUT

my $temp = 'temp';;
open S, ">$temp.pasm" or die "Can't write $temp.pasm";
print S <<'EOF';
  .pcc_sub _sub1:
  get_params "()"
  printerr "in sub1\n"
  set_returns "()"
  returncc
  .pcc_sub _sub2:
  get_params "(0)", P5
  printerr P5
  printerr "in sub2\n"
  set_returns "()"
  returncc
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

    Parrot_run_native(interpreter, the_test);

    Parrot_exit(interpreter, 0);
    return 0;
}

/* also both the test PASM and the_test() print to stderr
 * so that buffering in PIO is not an issue
 */

static opcode_t*
the_test(Parrot_Interp interpreter, opcode_t *cur_op, opcode_t *start)
{
    struct PackFile *pf;
    PMC *sub, *arg;
    STRING *name;

    pf = Parrot_readbc(interpreter, "temp.pbc");
    Parrot_loadbc(interpreter, pf);
    name = const_string(interpreter, "_sub1");
    sub = Parrot_find_global_cur(interpreter, name);
    Parrot_call_sub(interpreter, sub, "v");
    PIO_eprintf(interpreter, "back\n");

    /* win32 seems to buffer stderr ? */
    PIO_flush(interpreter, PIO_STDERR(interpreter));

    name = const_string(interpreter, "_sub2");
    sub = Parrot_find_global_cur(interpreter, name);
    arg = pmc_new(interpreter, enum_class_String);
    VTABLE_set_string_native(interpreter, arg,
                 string_from_cstring(interpreter, "hello ", 0));
    Parrot_call_sub(interpreter, sub, "vP", arg);
    PIO_eprintf(interpreter, "back\n");

    return NULL;
}
CODE
in sub1
back
hello in sub2
back
OUTPUT

open S, ">$temp.pasm" or die "Can't write $temp.pasm";
print S <<'EOF';
  .pcc_sub _sub1:
  get_params "()"
  printerr "in sub1\n"
  find_lex P2, "no_such_var"
  printerr "never\n"
  returncc
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

    Parrot_run_native(interpreter, the_test);

    Parrot_exit(interpreter, 0);
    return 0;
}

/* also both the test PASM and the_test() print to stderr
 * so that buffering in PIO is not an issue
 */

static opcode_t*
the_test(Parrot_Interp interpreter, opcode_t *cur_op, opcode_t *start)
{
    struct PackFile *pf;
    PMC *sub;
    STRING *name;
    Parrot_exception jb;

    pf = Parrot_readbc(interpreter, "temp.pbc");
    Parrot_loadbc(interpreter, pf);
    name = const_string(interpreter, "_sub1");
    sub = Parrot_find_global_cur(interpreter, name);

    if (setjmp(jb.destination)) {
    PIO_eprintf(interpreter, "caught\n");
    }
    else {
    push_new_c_exception_handler(interpreter, &jb);
    Parrot_call_sub(interpreter, sub, "v");
    }
    PIO_eprintf(interpreter, "back\n");

    return NULL;
}
CODE
in sub1
caught
back
OUTPUT

open S, ">$temp.pir" or die "Can't write $temp.pir";
print S <<'EOF';
.sub main :main
    .param pmc argv

    .local pmc compiler
    compreg compiler, 'PIR'

    .local string code
    code = argv[0]

    .local pmc compiled_sub
    compiled_sub = compiler( code )

    compiled_sub()
    end
.end
EOF
close S;
# compile to pbc
system(".$PConfig{slash}parrot$PConfig{exe} -o $temp.pbc $temp.pir");

c_output_is(<<'CODE', <<'OUTPUT', "eval code through a parrot sub - #39669");

#include <parrot/parrot.h>
#include <parrot/embed.h>

int main(int argc, char* argv[])
{
    Parrot_PackFile packfile;
	char * code[] = { ".sub foo\nprint\"Hello from foo!\\n\"\n.end\n" };

    Parrot_Interp interpreter = Parrot_new(NULL);
    if (!interpreter) {
		printf( "Hiss\n" );
        return 1;
    }

    packfile = Parrot_readbc( interpreter, "temp.pbc" );

    if (!packfile) {
		printf( "Boo\n" );
        return 1;
    }

    Parrot_loadbc( interpreter, packfile );
    Parrot_runcode( interpreter, 1, code );

    Parrot_destroy( interpreter );

    Parrot_exit(interpreter, 0);
    return 0;
}
CODE
Hello from foo!
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "compile string in a fresh interp - #39986");

#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/extend.h>

int main(int argc, char* argv[])
{
    Parrot_PMC    retval;
    Parrot_PMC    sub;
    Parrot_Interp interp = Parrot_new(NULL);
    char   * code      = ".sub foo\nprint\"Hello from foo!\\n\"\n.end\n";
    STRING * code_type;
    STRING * error;
    STRING * foo_name;
    Parrot_PackFile packfile;

    if (!interp) {
        printf( "Hiss\n" );
        return 1;
    }

    packfile = PackFile_new_dummy(interp, "dummy");

    code_type = const_string( interp, "PIR" );
    retval    = Parrot_compile_string( interp, code_type, code, &error );

    if (!retval) {
        printf( "Boo\n" );
        return 1;
    }

    foo_name = const_string( interp, "foo" );
    sub      = Parrot_find_global_cur( interp, foo_name );

    retval   = Parrot_call_sub( interp, sub, "V", "" );

    Parrot_exit(interp, 0);
    return 0;
}
CODE
Hello from foo!
OUTPUT

unlink "$temp.pasm", "$temp.pir", "$temp.pbc" unless $ENV{POSTMORTEM};


1;

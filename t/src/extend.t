#!perl
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

int
main(int argc, char* argv[]) {
    Parrot_Interp interp;
    Parrot_Int parrot_reg, value, new_value;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if ( interp == NULL ) return 1;

    parrot_reg = 0;
    value = 42;

    Parrot_set_intreg(interp, parrot_reg, value);
    new_value = Parrot_get_intreg(interp, parrot_reg);

    printf("%d\n", (int)new_value);

    Parrot_exit(interp, 0);
    return 0;
}

CODE
42
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "set/get_numreg");

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int
main(int argc, char* argv[]) {
    Parrot_Interp interp;
    Parrot_Int parrot_reg;
    Parrot_Float value, new_value;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if ( interp == NULL ) return 1;

    parrot_reg = 1;
    value = 2.5;

    Parrot_set_numreg(interp, parrot_reg, value);
    new_value = Parrot_get_numreg(interp, parrot_reg);

    printf("%.1f\n", (double)new_value);

    Parrot_exit(interp, 0);
    return 0;
}

CODE
2.5
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "Parrot_new_string");

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int
main(int argc, char* argv[]) {
    Parrot_Interp interp;
    Parrot_STRING output;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if ( interp == NULL ) return 1;

    output = Parrot_new_string(interp, "Test", 4, "iso-8859-1", 0);
    PIO_eprintf(interp, "%S\n", output);

    Parrot_exit(interp, 0);
    return 0;
}

CODE
Test
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "set/get_strreg");

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int
main(int argc, char* argv[]) {
    Parrot_Interp interp;
    Parrot_Int parrot_reg;
    Parrot_STRING value, new_value;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if ( interp == NULL ) return 1;

    parrot_reg = 2;
    value = Parrot_new_string(interp, "Test", 4, "iso-8859-1", 0);
    Parrot_set_strreg(interp, parrot_reg, value);
    new_value = Parrot_get_strreg(interp, parrot_reg);
    PIO_eprintf(interp, "%S\n", new_value);

    Parrot_exit(interp, 0);
    return 0;
}

CODE
Test
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "PMC_set/get_intval");

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int
main(int argc, char* argv[]) {
    Parrot_Interp interp;
    Parrot_Int type, value, new_value;
    Parrot_PMC testpmc;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if ( interp == NULL ) return 1;

    type = Parrot_PMC_typenum(interp, "Integer");
    testpmc = Parrot_PMC_new(interp, type);

    value = 101010;
    Parrot_PMC_set_intval(interp, testpmc, value);
    new_value = Parrot_PMC_get_intval(interp, testpmc);

    printf("%ld\n", (long)new_value);

    Parrot_exit(interp, 0);
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
the_test(Parrot_Interp interp, opcode_t *cur_op, opcode_t *start)
{
    Parrot_Int type, value, key, new_value;
    Parrot_PMC array;
    type = Parrot_PMC_typenum(interp, "ResizablePMCArray");
    array = Parrot_PMC_new(interp, type);

    value = 12345;
    key   = 10;
    Parrot_PMC_set_intval_intkey(interp, array, key, value);

    new_value = Parrot_PMC_get_intval_intkey(interp, array, key);

    printf("%ld\n", (long)new_value);
    return NULL;
}

int
main(int argc, char* argv[]) {
    Parrot_Interp interp;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if ( interp == NULL ) return 1;
    Parrot_run_native(interp, the_test);
    Parrot_exit(interp, 0);
    return 0;
}
CODE
12345
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "set/get_pmcreg");

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int
main(int argc, char* argv[]) {
    Parrot_Interp interp;
    Parrot_Int type, value, new_value, parrot_reg;
    Parrot_PMC testpmc, newpmc;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if ( interp == NULL ) return 1;

    type = Parrot_PMC_typenum(interp, "Integer");
    testpmc = Parrot_PMC_new(interp, type);

    value = -123;
    Parrot_PMC_set_intval(interp, testpmc, value);

    parrot_reg = 31;
    Parrot_set_pmcreg(interp, parrot_reg, testpmc);

    newpmc = Parrot_get_pmcreg(interp, parrot_reg);
    new_value = Parrot_PMC_get_intval(interp, newpmc);
    printf("%d\n", (int)new_value);

    Parrot_exit(interp, 0);
    return 0;
}
CODE
-123
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "PMC_set/get_numval");

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int
main(int argc, char* argv[]) {
    Parrot_Interp interp;
    Parrot_Int type;
    Parrot_Float value, new_value;
    Parrot_PMC testpmc;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if ( interp == NULL ) return 1;

    type = Parrot_PMC_typenum(interp, "Float");
    testpmc = Parrot_PMC_new(interp, type);

    value = 3.1415927;
    Parrot_PMC_set_numval(interp, testpmc, value);
    new_value = Parrot_PMC_get_numval(interp, testpmc);

    printf("%.7f\n", (double)new_value);

    Parrot_exit(interp, 0);
    return 0;
}
CODE
3.1415927
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "PMC_set/get_string");

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int
main(int argc, char* argv[]) {
    Parrot_Interp interp;
    Parrot_Int type;
    Parrot_STRING value, new_value;
    Parrot_PMC testpmc;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if ( interp == NULL ) return 1;

    type = Parrot_PMC_typenum(interp, "String");
    testpmc = Parrot_PMC_new(interp, type);

    value = Parrot_new_string(interp, "Pumpking", 8, "iso-8859-1", 0);
    Parrot_PMC_set_string(interp, testpmc, value);
    new_value = Parrot_PMC_get_string(interp, testpmc);

    PIO_eprintf(interp, "%S\n", new_value);

    Parrot_exit(interp, 0);
    return 0;
}
CODE
Pumpking
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "PMC_set/get_cstring");

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int
main(int argc, char* argv[]) {
    Parrot_Interp interp;
    Parrot_Int type;
    Parrot_PMC testpmc;
    char* new_value;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if ( interp == NULL ) return 1;

    type = Parrot_PMC_typenum(interp, "String");
    testpmc = Parrot_PMC_new(interp, type);

    Parrot_PMC_set_cstring(interp, testpmc, "Wibble");
    new_value = Parrot_PMC_get_cstring(interp, testpmc);

    printf("%s\n", new_value);

    Parrot_free_cstring(new_value);

    Parrot_exit(interp, 0);
    return 0;
}
CODE
Wibble
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "PMC_set/get_cstringn");

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int
main(int argc, char* argv[]) {
    Parrot_Interp interp;
    Parrot_Int type, length;
    Parrot_Int new_len;
    Parrot_PMC testpmc;
    char* new_value;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if ( interp == NULL ) return 1;

    type = Parrot_PMC_typenum(interp, "String");
    testpmc = Parrot_PMC_new(interp, type);

    length = 6;

    Parrot_PMC_set_cstringn(interp, testpmc, "Wibble", length);
    new_value = Parrot_PMC_get_cstringn(interp, testpmc, &new_len);

    printf("%s\n", new_value);
    printf("%d\n", (int)(new_len));

    Parrot_free_cstring(new_value);

    Parrot_exit(interp, 0);
    return 0;
}
CODE
Wibble
6
OUTPUT

my $temp = 'temp';;
open my $S, '>', "$temp.pasm" or die "Can't write $temp.pasm";
print $S <<'EOF';
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
close $S;
# compile to pbc
system(".$PConfig{slash}parrot$PConfig{exe} -o $temp.pbc $temp.pasm");

c_output_is(<<'CODE', <<'OUTPUT', "call a parrot sub");

#include <parrot/parrot.h>
#include <parrot/embed.h>

static opcode_t *the_test(Parrot_Interp, opcode_t *, opcode_t *);

int
main(int argc, char* argv[])
{
    Parrot_Interp interp = Parrot_new(NULL);
    if (!interp) {
        return 1;
    }

    Parrot_run_native(interp, the_test);

    Parrot_exit(interp, 0);
    return 0;
}

/* also both the test PASM and the_test() print to stderr
 * so that buffering in PIO is not an issue
 */

static opcode_t*
the_test(Parrot_Interp interp, opcode_t *cur_op, opcode_t *start)
{
    struct PackFile *pf;
    PMC *sub, *arg;
    STRING *name;

    pf = Parrot_readbc(interp, "temp.pbc");
    Parrot_loadbc(interp, pf);
    name = const_string(interp, "_sub1");
    sub = Parrot_find_global_cur(interp, name);
    Parrot_call_sub(interp, sub, "v");
    PIO_eprintf(interp, "back\n");

    /* win32 seems to buffer stderr ? */
    PIO_flush(interp, PIO_STDERR(interp));

    name = const_string(interp, "_sub2");
    sub = Parrot_find_global_cur(interp, name);
    arg = pmc_new(interp, enum_class_String);
    VTABLE_set_string_native(interp, arg,
                 string_from_cstring(interp, "hello ", 0));
    Parrot_call_sub(interp, sub, "vP", arg);
    PIO_eprintf(interp, "back\n");

    return NULL;
}
CODE
in sub1
back
hello in sub2
back
OUTPUT

open $S, '>', "$temp.pasm" or die "Can't write $temp.pasm";
print $S <<'EOF';
  .pcc_sub _sub1:
  get_params "()"
  printerr "in sub1\n"
  find_lex P2, "no_such_var"
  printerr "never\n"
  returncc
EOF
close $S;
# compile to pbc
system(".$PConfig{slash}parrot$PConfig{exe} -o $temp.pbc $temp.pasm");

c_output_is(<<'CODE', <<'OUTPUT', "call a parrot sub, catch exception");

#include <parrot/parrot.h>
#include <parrot/embed.h>

static opcode_t *
the_test(Parrot_Interp, opcode_t *, opcode_t *);

int
main(int argc, char* argv[])
{
    Parrot_Interp interp = Parrot_new(NULL);
    if (!interp) {
        return 1;
    }

    Parrot_run_native(interp, the_test);

    Parrot_exit(interp, 0);
    return 0;
}

/* also both the test PASM and the_test() print to stderr
 * so that buffering in PIO is not an issue
 */

static opcode_t*
the_test(Parrot_Interp interp, opcode_t *cur_op, opcode_t *start)
{
    struct PackFile *pf;
    PMC *sub;
    STRING *name;
    Parrot_exception jb;

    pf = Parrot_readbc(interp, "temp.pbc");
    Parrot_loadbc(interp, pf);
    name = const_string(interp, "_sub1");
    sub = Parrot_find_global_cur(interp, name);

    if (setjmp(jb.destination)) {
        PIO_eprintf(interp, "caught\n");
    }
    else {
        interp->current_runloop_id++;      /* pretend the EH was pushed
                                                   by the sub call. */
        push_new_c_exception_handler(interp, &jb);
        Parrot_call_sub(interp, sub, "v");
    }
    PIO_eprintf(interp, "back\n");

    return NULL;
}
CODE
in sub1
caught
back
OUTPUT

open $S, '>', "$temp.pir" or die "Can't write $temp.pir";
print $S <<'EOF';
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
close $S;
# compile to pbc
system(".$PConfig{slash}parrot$PConfig{exe} -o $temp.pbc $temp.pir");

c_output_is(<<'CODE', <<'OUTPUT', "eval code through a parrot sub - #39669");

#include <parrot/parrot.h>
#include <parrot/embed.h>

int
main(int argc, char* argv[])
{
    Parrot_PackFile packfile;
    char * code[] = { ".sub foo\nprint\"Hello from foo!\\n\"\n.end\n" };

    Parrot_Interp interp = Parrot_new(NULL);
    if (!interp) {
        printf( "Hiss\n" );
        return 1;
    }

    packfile = Parrot_readbc( interp, "temp.pbc" );

    if (!packfile) {
        printf( "Boo\n" );
        return 1;
    }

    Parrot_loadbc( interp, packfile );
    Parrot_runcode( interp, 1, code );

    Parrot_destroy( interp );

    Parrot_exit(interp, 0);
    return 0;
}
CODE
Hello from foo!
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "compile string in a fresh interp - #39986");

#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/extend.h>

int
main(int argc, char* argv[])
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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

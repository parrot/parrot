#!perl
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test::Util 'create_tempfile';

use Parrot::Test;
use Parrot::Config;

plan tests => 18;

=head1 NAME

t/src/extend.t - Parrot Extension API

=head1 SYNOPSIS

    % prove t/src/extend.t

=head1 DESCRIPTION

Tests the extension API.

=cut

c_output_is( <<'CODE', <<'OUTPUT', 'set/get_intreg' );

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp  = Parrot_new(NULL);
    Parrot_Int    parrot_reg = 0;
    Parrot_Int    value      = 42;
    Parrot_Int    new_value;

    /* Interpreter set-up */
    if (!interp)
        return 1;

    Parrot_set_intreg(interp, parrot_reg, value);
    new_value = Parrot_get_intreg(interp, parrot_reg);

    printf("%d\n", (int)new_value);

    Parrot_exit(interp, 0);
    return 0;
}

CODE
42
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', 'set/get_numreg' );

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp     = Parrot_new(NULL);
    Parrot_Int    parrot_reg = 1;
    Parrot_Float  value       = 2.5;
    Parrot_Float  new_value;

    /* Interpreter set-up */
    if (!interp)
        return 1;

    Parrot_set_numreg(interp, parrot_reg, value);
    new_value = Parrot_get_numreg(interp, parrot_reg);

    printf("%.1f\n", (double)new_value);

    Parrot_exit(interp, 0);
    return 0;
}

CODE
2.5
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', 'Parrot_new_string' );

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp = Parrot_new(NULL);
    Parrot_String output;

    /* Interpreter set-up */
    if (!interp)
        return 1;

    output = Parrot_new_string(interp, "Test", 4, "iso-8859-1", 0);
    Parrot_eprintf(interp, "%S\n", output);

    Parrot_exit(interp, 0);
    return 0;
}

CODE
Test
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', 'set/get_strreg' );

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp     = Parrot_new(NULL);
    Parrot_Int    parrot_reg = 2;
    Parrot_String value, new_value;

    /* Interpreter set-up */
    if (!interp)
        return 1;

    value = Parrot_new_string(interp, "Test", 4, "iso-8859-1", 0);
    Parrot_set_strreg(interp, parrot_reg, value);

    new_value = Parrot_get_strreg(interp, parrot_reg);
    Parrot_eprintf(interp, "%S\n", new_value);

    Parrot_exit(interp, 0);
    return 0;
}

CODE
Test
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', 'PMC_set/get_integer' );

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp = Parrot_new(NULL);
    Parrot_Int    value  = 101010;
    Parrot_PMC    testpmc;
    Parrot_Int    type, new_value;

    /* Interpreter set-up */
    if (!interp)
        return 1;

    type    = Parrot_PMC_typenum(interp, "Integer");
    testpmc = Parrot_PMC_new(interp, type);

    Parrot_PMC_set_integer_native(interp, testpmc, value);
    new_value = Parrot_PMC_get_integer(interp, testpmc);

    printf("%ld\n", (long)new_value);

    Parrot_exit(interp, 0);
    return 0;
}
CODE
101010
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', 'PMC_set/get_integer_keyed_int' );

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/extend.h"

static opcode_t*
the_test(PARROT_INTERP, opcode_t *cur_op, opcode_t *start)
{
    Parrot_Int type  = Parrot_PMC_typenum(interp, "ResizablePMCArray");
    Parrot_PMC array = Parrot_PMC_new(interp, type);
    Parrot_Int value = 12345;
    Parrot_Int key   = 10;
    Parrot_Int new_value;

    Parrot_PMC_set_integer_keyed_int(interp, array, key, value);

    new_value = Parrot_PMC_get_integer_keyed_int(interp, array, key);

    printf("%ld\n", (long)new_value);
    return NULL;
}

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp = Parrot_new(NULL);

    /* Interpreter set-up */
    if (!interp)
        return 1;

    Parrot_run_native(interp, the_test);
    Parrot_exit(interp, 0);
    return 0;
}
CODE
12345
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', 'set/get_pmcreg' );

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp     = Parrot_new(NULL);
    Parrot_Int    value      = -123;
    Parrot_Int    parrot_reg =  31;
    Parrot_Int    type, new_value;
    Parrot_PMC    testpmc, newpmc;

    /* Interpreter set-up */
    if (!interp)
        return 1;

    type    = Parrot_PMC_typenum(interp, "Integer");
    testpmc = Parrot_PMC_new(interp, type);

    Parrot_PMC_set_integer_native(interp, testpmc, value);

    parrot_reg = 31;
    Parrot_set_pmcreg(interp, parrot_reg, testpmc);

    newpmc    = Parrot_get_pmcreg(interp, parrot_reg);
    new_value = Parrot_PMC_get_integer(interp, newpmc);

    printf("%d\n", (int)new_value);

    Parrot_exit(interp, 0);
    return 0;
}
CODE
-123
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', 'PMC_set/get_number' );

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp = Parrot_new(NULL);
    Parrot_Float  value  = 3.1415927;
    Parrot_Int    type;
    Parrot_Float  new_value;
    Parrot_PMC    testpmc;

    /* Interpreter set-up */
    if (!interp)
        return 1;

    type    = Parrot_PMC_typenum(interp, "Float");
    testpmc = Parrot_PMC_new(interp, type);

    Parrot_PMC_set_number_native(interp, testpmc, value);
    new_value = Parrot_PMC_get_number(interp, testpmc);

    printf("%.7f\n", (double)new_value);

    Parrot_exit(interp, 0);
    return 0;
}
CODE
3.1415927
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', 'PMC_set/get_string' );

#include <stdio.h>
#include "parrot/embed.h"
#include "parrot/extend.h"

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp = Parrot_new(NULL);
    Parrot_Int    type;
    Parrot_String value, new_value;
    Parrot_PMC    testpmc;

    /* Interpreter set-up */
    if (!interp)
        return 1;

    type    = Parrot_PMC_typenum(interp, "String");
    testpmc = Parrot_PMC_new(interp, type);

    value     = Parrot_new_string(interp, "Pumpking", 8, "iso-8859-1", 0);
    Parrot_PMC_set_string_native(interp, testpmc, value);
    new_value = Parrot_PMC_get_string(interp, testpmc);

    Parrot_eprintf(interp, "%S\n", new_value);

    Parrot_exit(interp, 0);
    return 0;
}
CODE
Pumpking
OUTPUT

my ($TEMP, $temp_pasm) = create_tempfile( SUFFIX => '.pasm', UNLINK => 1 );

print $TEMP <<'EOF';
  .pcc_sub _sub1:
  get_params ""
  printerr "in sub1\n"
  set_returns ""
  returncc
  .pcc_sub _sub2:
  get_params "0", P5
  printerr P5
  printerr "in sub2\n"
  set_returns ""
  returncc
EOF
close $TEMP;

# compile to pbc
my (undef, $temp_pbc) = create_tempfile( SUFFIX => '.pbc', UNLINK => 1 );
system(".$PConfig{slash}parrot$PConfig{exe}", '-o', $temp_pbc, $temp_pasm);

c_output_is( <<"CODE", <<'OUTPUT', 'call a parrot sub' );

#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/extend.h>

static opcode_t *the_test(Parrot_Interp, opcode_t *, opcode_t *);

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp = Parrot_new(NULL);
    if (!interp)
        return 1;

    Parrot_run_native(interp, the_test);

    Parrot_exit(interp, 0);
    return 0;
}

/* also both the test PASM and the_test() print to stderr
 * so that buffering in PIO is not an issue */

static opcode_t*
the_test(PARROT_INTERP, opcode_t *cur_op, opcode_t *start)
{
    PackFile      *pf   = Parrot_pbc_read(interp, "$temp_pbc", 0);
    Parrot_String  name = Parrot_str_new_constant(interp, "_sub1");
    PMC           *sub, *arg;

    Parrot_pbc_load(interp, pf);
    sub = Parrot_find_global_cur(interp, name);
    Parrot_ext_call(interp, sub, "->");
    Parrot_eprintf(interp, "back\\n");

    /* win32 seems to buffer stderr ? */
    Parrot_io_flush(interp, Parrot_io_STDERR(interp));

    name = Parrot_str_new_constant(interp, "_sub2");
    sub  = Parrot_find_global_cur(interp, name);
    arg  = Parrot_pmc_new(interp, enum_class_String);

    Parrot_PMC_set_string_native(interp, arg,
                 Parrot_str_new(interp, "hello ", 0));

    Parrot_ext_call(interp, sub, "P->", arg);
    Parrot_eprintf(interp, "back\\n");

    return NULL;
}
CODE
in sub1
back
hello in sub2
back
OUTPUT

c_output_is( <<"CODE", <<'OUTPUT', 'call a parrot sub using the unified interface' );

#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/extend.h>

static opcode_t *the_test(Parrot_Interp, opcode_t *, opcode_t *);

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp = Parrot_new(NULL);
    if (!interp)
        return 1;

    Parrot_run_native(interp, the_test);

    Parrot_exit(interp, 0);
    return 0;
}

/* also both the test PASM and the_test() print to stderr
 * so that buffering in PIO is not an issue */

static opcode_t*
the_test(PARROT_INTERP, opcode_t *cur_op, opcode_t *start)
{
    PackFile      *pf   = Parrot_pbc_read(interp, "$temp_pbc", 0);
    Parrot_String  name = Parrot_str_new_constant(interp, "_sub1");
    PMC           *sub, *arg;

    Parrot_pbc_load(interp, pf);
    sub = Parrot_find_global_cur(interp, name);
    Parrot_ext_call(interp, sub, "->");
    Parrot_eprintf(interp, "back\\n");

    /* win32 seems to buffer stderr ? */
    Parrot_io_flush(interp, Parrot_io_STDERR(interp));

    name = Parrot_str_new_constant(interp, "_sub2");
    sub  = Parrot_find_global_cur(interp, name);
    arg  = Parrot_pmc_new(interp, enum_class_String);

    Parrot_PMC_set_string_native(interp, arg,
                 Parrot_str_new(interp, "hello ", 0));

    Parrot_ext_call(interp, sub, "P->", arg);
    Parrot_eprintf(interp, "back\\n");

    return NULL;
}
CODE
in sub1
back
hello in sub2
back
OUTPUT

($TEMP, my $temp_pir) = create_tempfile( SUFFIX => '.pir', UNLINK => 1 );

print $TEMP <<'EOF';
  .sub foo
      .param pmc input
      printerr input
      printerr "in sub2\n"
      $P0 = new "Integer"
      $P0 = 42
      .return($P0)
  .end
EOF
close $TEMP;

# compile to pbc
(undef, $temp_pbc) = create_tempfile( SUFFIX => '.pbc', UNLINK => 1 );
system(".$PConfig{slash}parrot$PConfig{exe}", '-o', $temp_pbc, $temp_pir);

c_output_is( <<"CODE", <<'OUTPUT', 'call a parrot sub and return an integer' );

#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/extend.h>

static opcode_t *the_test(Parrot_Interp, opcode_t *, opcode_t *);

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp = Parrot_new(NULL);
    if (!interp)
        return 1;

    Parrot_run_native(interp, the_test);

    Parrot_exit(interp, 0);
    return 0;
}

/* also both the test PASM and the_test() print to stderr
 * so that buffering in PIO is not an issue */

static opcode_t*
the_test(PARROT_INTERP, opcode_t *cur_op, opcode_t *start)
{
    PackFile      *pf   = Parrot_pbc_read(interp, "$temp_pbc", 0);
    Parrot_String  name = Parrot_str_new_constant(interp, "foo");
    PMC           *sub, *arg;
    Parrot_Int     result;

    Parrot_pbc_load(interp, pf);
    sub  = Parrot_find_global_cur(interp, name);
    arg  = Parrot_pmc_new(interp, enum_class_String);

    Parrot_PMC_set_string_native(interp, arg,
                 Parrot_str_new(interp, "hello ", 0));

    Parrot_ext_call(interp, sub, "P->I", arg, &result);
    Parrot_eprintf(interp, "result %d\\n", result);
    Parrot_eprintf(interp, "back\\n");

    return NULL;
}
CODE
hello in sub2
result 42
back
OUTPUT

($TEMP, $temp_pasm) = create_tempfile( SUFFIX => '.pasm', UNLINK => 1 );

print $TEMP <<'EOF';
  .pcc_sub _sub1:
  get_params ""
  printerr "in sub1\n"
  find_lex P2, "no_such_var"
  printerr "never\n"
  returncc
EOF
close $TEMP;

# compile to pbc
system(".$PConfig{slash}parrot$PConfig{exe}", '-o', $temp_pbc, $temp_pasm);

c_output_is( <<"CODE", <<'OUTPUT', 'call a parrot sub, catch exception' );

#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/extend.h>

static opcode_t *
the_test(Parrot_Interp, opcode_t *, opcode_t *);

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp = Parrot_new(NULL);
    if (!interp)
        return 1;

    Parrot_run_native(interp, the_test);

    Parrot_exit(interp, 0);
    return 0;
}

/* also both the test PASM and the_test() print to stderr
 * so that buffering in PIO is not an issue */

static opcode_t*
the_test(PARROT_INTERP, opcode_t *cur_op, opcode_t *start)
{
    PackFile      *pf   = Parrot_pbc_read(interp, "$temp_pbc", 0);
    Parrot_String  name = Parrot_str_new_constant(interp, "_sub1");
    PMC           *sub;
    Parrot_runloop jump_point;

    Parrot_pbc_load(interp, pf);
    sub = Parrot_find_global_cur(interp, name);

    if (setjmp(jump_point.resume)) {
        Parrot_eprintf(interp, "caught\\n");
    }
    else {
        /* pretend the EH was pushed by the sub call. */
        interp->current_runloop_id++;

        Parrot_ex_add_c_handler(interp, &jump_point);
        Parrot_ext_call(interp, sub, "->");
    }

    Parrot_eprintf(interp, "back\\n");

    return NULL;
}
CODE
in sub1
caught
back
OUTPUT

($TEMP, $temp_pir) = create_tempfile( SUFFIX => '.pir', UNLINK => 1 );

print $TEMP <<'EOF';
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

.sub add :multi( int, int )
    .param int l
    .param int r

    .local int sum
    sum = l + r
    .return( sum )
.end

.sub add :multi( num, num )
    .param num l
    .param num r

    .local num sum
    sum = l + r
    .return( sum )
.end
EOF
close $TEMP;

# compile to pbc
system(".$PConfig{slash}parrot$PConfig{exe}", '-o', $temp_pbc, $temp_pir);

c_output_is( <<"CODE", <<'OUTPUT', 'eval code through a parrot sub - #39669' );

#include <parrot/parrot.h>
#include <parrot/embed.h>

int
main(int argc, const char *argv[])
{
    Parrot_PackFile packfile;
    const char * code[] = { ".sub foo\\nsay \\"Hello from foo!\\"\\n.end\\n" };

    Parrot_Interp interp = Parrot_new(NULL);
    if (!interp) {
        printf( "Hiss\\n" );
        return 1;
    }

    packfile = Parrot_pbc_read( interp, "$temp_pbc", 0 );

    if (!packfile) {
        printf( "Boo\\n" );
        return 1;
    }

    Parrot_pbc_load( interp, packfile );
    Parrot_runcode( interp, 1, code );

    Parrot_destroy( interp );

    Parrot_exit(interp, 0);
    return 0;
}
CODE
Hello from foo!
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', 'compile string in a fresh interp - #39986' );

#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/extend.h>

int
main(int argc, const char *argv[])
{
    Parrot_Interp   interp    = Parrot_new(NULL);
    const char      *code      = ".sub foo\nprint\"Hello from foo!\\n\"\n.end\n";
    Parrot_PMC      retval;
    Parrot_PMC      sub;
    Parrot_String   code_type, error, foo_name;

    if (!interp) {
        printf( "Hiss\n" );
        return 1;
    }

    code_type = Parrot_str_new_constant( interp, "PIR" );
    retval    = Parrot_compile_string( interp, code_type, code, &error );

    if (!retval) {
        printf( "Boo\n" );
        return 1;
    }

    foo_name = Parrot_str_new_constant( interp, "foo" );
    sub      = Parrot_find_global_cur( interp, foo_name );

    Parrot_ext_call(interp, sub, "->");

    Parrot_exit(interp, 0);
    return 0;
}
CODE
Hello from foo!
OUTPUT

c_output_is( <<"CODE", <<'OUTPUT', 'call multi sub from C - #41511' );
#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/extend.h>

int
main(int argc, const char *argv[])
{
    Parrot_Int      result;
    Parrot_PMC      sub;
    Parrot_PackFile pf;
    Parrot_Interp   interp = Parrot_new(NULL);

    if (!interp) {
        printf( "No interpreter\\n" );
        return 1;
    }

    pf = Parrot_pbc_read( interp, "$temp_pbc", 0 );
    Parrot_pbc_load( interp, pf );

    sub      = Parrot_find_global_cur( interp, Parrot_str_new_constant( interp, "add" ) );
    Parrot_ext_call(interp, sub, "II->I", 100, 200, &result);
    printf( "Result is %d.\\n", result );

    Parrot_exit(interp, 0);
    return 0;
}
CODE
Result is 300.
OUTPUT

c_output_is( <<"CODE", <<'OUTPUT', 'call multi sub from C - unified interface' );
#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/extend.h>

int
main(int argc, const char *argv[])
{
    Parrot_Int      result;
    Parrot_PMC      sub;
    Parrot_PackFile pf;
    Parrot_Interp   interp = Parrot_new(NULL);

    if (!interp) {
        printf( "No interpreter\\n" );
        return 1;
    }

    pf = Parrot_pbc_read( interp, "$temp_pbc", 0 );
    Parrot_pbc_load( interp, pf );

    sub      = Parrot_find_global_cur( interp, Parrot_str_new_constant( interp, "add" ) );
    Parrot_ext_call( interp, sub, "II->I", 100, 200, &result );
    printf( "Result is %d.\\n", result );

    Parrot_exit(interp, 0);
    return 0;
}
CODE
Result is 300.
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', 'multiple Parrot_new/Parrot_exit cycles' );

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

/* this is Parrot_exit without the exit()
 * it will call Parrot_really_destroy() as an exit handler
 */
void interp_cleanup(Parrot_Interp, int);

void interp_cleanup(PARROT_INTERP, int status)
{
    handler_node_t *node = interp->exit_handler_list;

    Parrot_block_GC_mark(interp);
    Parrot_block_GC_sweep(interp);

    while (node) {
        handler_node_t * const next = node->next;
        (node->function)(interp, status, node->arg);
        mem_sys_free(node);
        node = next;
    }
}

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp;
    int i, niter = 2;

    for (i = 1; i <= niter; i++) {
        printf("Starting interp %d\n", i);
        fflush(stdout);
        interp = Parrot_new(NULL);
        if (!interp)
            return 1;

        Parrot_set_flag(interp, PARROT_DESTROY_FLAG);

        printf("Destroying interp %d\n", i);
        fflush(stdout);
        interp_cleanup(interp, 0);
    }

    return 0;
}

CODE
Starting interp 1
Destroying interp 1
Starting interp 2
Destroying interp 2
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

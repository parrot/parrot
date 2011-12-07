#!perl
# Copyright (C) 2001-2011, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test::Util 'create_tempfile';

use Parrot::Test;
use Parrot::Config;
use File::Spec::Functions;

my $parrot_config = "parrot_config" . $PConfig{o};

plan skip_all => 'src/parrot_config.o does not exist' unless -e catfile("src", $parrot_config);

plan tests => 20;

=head1 NAME

t/src/extend.t - Parrot Extension API

=head1 SYNOPSIS

    % prove t/src/extend.t

=head1 DESCRIPTION

Tests the extension API.

=cut

sub linedirective
{
    # Provide a #line directive for the C code in the heredoc
    # starting immediately after where this sub is called.
    my $linenum = shift() + 1;
    return "#line " . $linenum . ' "' . __FILE__ . '"' . "\n";
}

c_output_is( <<'CODE', <<'OUTPUT', 'Parrot_PMC_null' );
#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/extend.h"

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp  = Parrot_interp_new(NULL);
    Parrot_PMC    pmcnull;

    /* Interpreter set-up */
    if (interp) {
        pmcnull  = Parrot_pmc_null();
        Parrot_interp_destroy(interp);
    }
    return 0;
}
CODE
OUTPUT


c_output_is( <<'CODE', <<'OUTPUT', 'Parrot_get_root_namespace/Parrot_(un)register_pmc' );
#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/extend.h"

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp  = Parrot_interp_new(NULL);
    Parrot_PMC    ns;

    /* Interpreter set-up */
    if (interp) {
        ns  = Parrot_ns_get_root_namespace(interp);
        Parrot_pmc_gc_register(interp, ns);
        Parrot_pmc_gc_unregister(interp, ns);

        Parrot_printf(interp,"%P\n", ns);
        Parrot_interp_destroy(interp);
    }
    return 0;
}
CODE

OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', 'Parrot_fprintf');
#include <stdio.h>
// This is to get Parrot_io_STDOUT, is there a better way?
#include "parrot/parrot.h"
#include "parrot/extend.h"

int
main(int argc, const char *argv[])
{
    Parrot_PMC pio;
    Parrot_Interp interp  = Parrot_interp_new(NULL);
    pio = Parrot_io_STDOUT(interp);

    /* Interpreter set-up */
    if (interp) {
        Parrot_fprintf(interp, pio,"42\n");
    }
    return 0;
}

CODE
42
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', 'Parrot_printf/Parrot_eprintf with no interp');
#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/extend.h"

int
main(int argc, const char *argv[])
{
    Parrot_printf(NULL,"42\n");
    Parrot_eprintf(NULL,"42\n");
    return 0;
}

CODE
42
42
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', 'Parrot_new_string' );

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/extend.h"
#include "parrot/misc.h"

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp = Parrot_interp_new(NULL);
    Parrot_String output, output2;

    /* Interpreter set-up */
    if (interp) {
        output = Parrot_str_new(interp, "Test", 4/*, "iso-8859-1", 0*/);
        Parrot_eprintf(interp, "%S\n", output);

        Parrot_interp_destroy(interp);
    }
    return 0;
}

CODE
Test
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', 'Parrot_new_string/Parrot_(un)register_string' );

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/extend.h"

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp = Parrot_interp_new(NULL);
    Parrot_String output, output2;

    /* Interpreter set-up */
    if (interp) {
        output = Parrot_str_new(interp, "Test_reg_unreg", 14/*, "iso-8859-1", 0*/);

        Parrot_str_gc_register(interp, output);
        Parrot_str_gc_unregister(interp, output);

        Parrot_eprintf(interp, "%S\n", output);

        Parrot_interp_destroy(interp);
    }
    return 0;
}

CODE
Test_reg_unreg
OUTPUT


c_output_is( <<'CODE', <<'OUTPUT', 'PMC_set/get_integer' );

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/extend.h"

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp = Parrot_interp_new(NULL);
    Parrot_Int    value  = 101010;
    Parrot_PMC    testpmc;
    Parrot_Int    type, new_value;

    /* Interpreter set-up */
    if (interp) {
        type    = Parrot_PMC_typenum(interp, "Integer");
        testpmc = Parrot_pmc_new(interp, type);

        Parrot_PMC_set_integer_native(interp, testpmc, value);
        new_value = Parrot_PMC_get_integer(interp, testpmc);

        printf("%ld\n", (long)new_value);

        Parrot_interp_destroy(interp);
    }
    return 0;
}
CODE
101010
OUTPUT

c_output_is( linedirective(__LINE__) . <<'CODE', <<'OUTPUT', 'Parrot_free_cstring');
#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/parrot.h"
#include "parrot/extend.h"

static void fail(const char *msg);
static Parrot_String createstring(Parrot_Interp interp, const char * value);
static Parrot_Interp new_interp();

static void fail(const char *msg)
{
    fprintf(stderr, "failed: %s\n", msg);
    exit(EXIT_FAILURE);
}

static Parrot_String createstring(Parrot_Interp interp, const char * value)
{
    return Parrot_str_new(interp, value, strlen(value));
}

static Parrot_Interp new_interp()
{
    Parrot_Interp interp = Parrot_interp_new(NULL);
    if (!interp)
        fail("Cannot create parrot interpreter");
    return interp;

}

int main(int argc, const char **argv)
{
    Parrot_Interp interp;
    Parrot_String err, string;
    Parrot_PMC func_pmc;
    char *str;

    interp = new_interp();

    string = createstring(interp, "PIR");
    str    = Parrot_str_to_cstring(interp, string);

    Parrot_free_cstring(str);

    Parrot_interp_destroy(interp);
    return 0;
}
CODE
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', 'PMC_set/get_integer_keyed_int' );

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/parrot.h"
#include "parrot/extend.h"

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp = Parrot_interp_new(NULL);

    /* Interpreter set-up */
    if (interp) {
        Parrot_Int type  = Parrot_PMC_typenum(interp, "ResizablePMCArray");
        Parrot_PMC array = Parrot_pmc_new(interp, type);
        Parrot_Int value = 12345;
        Parrot_Int key   = 10;
        Parrot_Int new_value;

        Parrot_PMC_set_integer_keyed_int(interp, array, key, value);

        new_value = Parrot_PMC_get_integer_keyed_int(interp, array, key);

        printf("%ld\n", (long)new_value);
        Parrot_interp_destroy(interp);
    }
    return 0;
}
CODE
12345
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', 'PMC_set/get_number' );

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/extend.h"

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp = Parrot_interp_new(NULL);
    Parrot_Float  value  = 3.1415927;
    Parrot_Int    type;
    Parrot_Float  new_value;
    Parrot_PMC    testpmc;

    /* Interpreter set-up */
    if (interp) {
        type    = Parrot_PMC_typenum(interp, "Float");
        testpmc = Parrot_pmc_new(interp, type);

        Parrot_PMC_set_number_native(interp, testpmc, value);
        new_value = Parrot_PMC_get_number(interp, testpmc);

        printf("%.7f\n", (double)new_value);

        Parrot_interp_destroy(interp);
    }
    return 0;
}
CODE
3.1415927
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', 'PMC_set/get_string' );

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/extend.h"

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp = Parrot_interp_new(NULL);
    Parrot_Int    type;
    Parrot_String value, new_value;
    Parrot_PMC    testpmc;

    /* Interpreter set-up */
    if (interp) {
        type    = Parrot_PMC_typenum(interp, "String");
        testpmc = Parrot_pmc_new(interp, type);

        value     = Parrot_str_new(interp, "Pumpking", 8/*, "iso-8859-1", 0*/);
        Parrot_PMC_set_string_native(interp, testpmc, value);
        new_value = Parrot_PMC_get_string(interp, testpmc);

        Parrot_eprintf(interp, "%S\n", new_value);

        Parrot_interp_destroy(interp);
    }
    return 0;
}
CODE
Pumpking
OUTPUT

my ($TEMP, $temp_pasm) = create_tempfile( SUFFIX => '.pasm', UNLINK => 1 );

print $TEMP <<'EOF';
  .pcc_sub _sub1:
  get_params ""
  print "in sub1\n"
  set_returns ""
  returncc
  .pcc_sub _sub2:
  get_params "0", P5
  print P5
  print "in sub2\n"
  set_returns ""
  returncc
EOF
close $TEMP;

# compile to pbc
my (undef, $temp_pbc) = create_tempfile( SUFFIX => '.pbc', UNLINK => 1 );
system(".$PConfig{slash}parrot$PConfig{exe}", '-o', $temp_pbc, $temp_pasm);

c_output_is( <<"CODE", <<'OUTPUT', 'call a parrot sub' );

#include <parrot/parrot.h>
#include <parrot/parrot.h>
#include <parrot/extend.h>

/* also both the test PASM and the_test() print to stderr
 * so that buffering in PIO is not an issue */

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp = Parrot_interp_new(NULL);
    if (interp) {
        Parrot_String   temp_pbc_str = Parrot_str_new(interp, "$temp_pbc", 0);
        PackFile* pf   = Parrot_pf_read_pbc_file(interp, temp_pbc_str);
        Parrot_String   name = Parrot_str_new_constant(interp, "_sub1");
        PMC            *sub, *arg;
        Parrot_PMC      pbc  = Parrot_pf_get_packfile_pmc(interp, pf, STRINGNULL);

        Parrot_pf_set_current_packfile(interp, pbc);
        sub = Parrot_ns_find_current_namespace_global(interp, name);
        Parrot_ext_call(interp, sub, "->");
        Parrot_eprintf(interp, "back\\n");

        /* win32 seems to buffer stderr ? */
        Parrot_io_flush_handle(interp, Parrot_io_STDERR(interp));

        name = Parrot_str_new_constant(interp, "_sub2");
        sub  = Parrot_ns_find_current_namespace_global(interp, name);
        arg  = Parrot_pmc_new(interp, enum_class_String);

        Parrot_PMC_set_string_native(interp, arg,
                     Parrot_str_new(interp, "hello ", 0));

        Parrot_ext_call(interp, sub, "P->", arg);
        Parrot_eprintf(interp, "back\\n");

        Parrot_interp_destroy(interp);
    }
    return 0;
}

CODE
in sub1
back
hello in sub2
back
OUTPUT

c_output_is( <<"CODE", <<'OUTPUT', 'call a parrot sub using the unified interface' );

#include <parrot/parrot.h>
#include <parrot/extend.h>

/* also both the test PASM and the_test() print to stderr
 * so that buffering in PIO is not an issue */

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp = Parrot_interp_new(NULL);
    if (interp) {
        Parrot_String   temp_pbc_str = Parrot_str_new(interp, "$temp_pbc", 0);
        PackFile * pf   = Parrot_pf_read_pbc_file(interp, temp_pbc_str);
        Parrot_String   name = Parrot_str_new_constant(interp, "_sub1");
        PMC            *sub, *arg;
        Parrot_PMC      pbc  = Parrot_pf_get_packfile_pmc(interp, pf, STRINGNULL);

        Parrot_pf_set_current_packfile(interp, pbc);
        sub = Parrot_ns_find_current_namespace_global(interp, name);
        Parrot_ext_call(interp, sub, "->");
        Parrot_eprintf(interp, "back\\n");

        /* win32 seems to buffer stderr ? */
        Parrot_io_flush_handle(interp, Parrot_io_STDERR(interp));

        name = Parrot_str_new_constant(interp, "_sub2");
        sub  = Parrot_ns_find_current_namespace_global(interp, name);
        arg  = Parrot_pmc_new(interp, enum_class_String);

        Parrot_PMC_set_string_native(interp, arg,
                     Parrot_str_new(interp, "hello ", 0));

        Parrot_ext_call(interp, sub, "P->", arg);
        Parrot_eprintf(interp, "back\\n");

        Parrot_interp_destroy(interp);
    }
    return 0;
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
      print input
      print "in sub2\n"
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
#include <parrot/extend.h>

/* also both the test PASM and the_test() print to stderr
 * so that buffering in PIO is not an issue */

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp = Parrot_interp_new(NULL);
    if (interp) {
        Parrot_String   temp_pbc_str = Parrot_str_new(interp, "$temp_pbc", 0);
        PackFile* pf   = Parrot_pf_read_pbc_file(interp, temp_pbc_str);
        Parrot_String   name = Parrot_str_new_constant(interp, "foo");
        PMC            *sub, *arg;
        Parrot_Int      result;
        Parrot_PMC      pbc  = Parrot_pf_get_packfile_pmc(interp, pf, STRINGNULL);

        Parrot_pf_set_current_packfile(interp, pbc);
        sub  = Parrot_ns_find_current_namespace_global(interp, name);
        arg  = Parrot_pmc_new(interp, enum_class_String);

        Parrot_PMC_set_string_native(interp, arg,
                Parrot_str_new(interp, "hello ", 0));

        Parrot_ext_call(interp, sub, "P->I", arg, &result);
        Parrot_eprintf(interp, "result %d\\n", result);
        Parrot_eprintf(interp, "back\\n");

        Parrot_interp_destroy(interp);
    }
    return 0;
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
  print "in sub1\n"
  set I1, 0                             # Divide by 0 to force exception.
  div I2, I1, 0
  print "never\n"
  returncc
EOF
close $TEMP;

# compile to pbc
system(".$PConfig{slash}parrot$PConfig{exe}", '-o', $temp_pbc, $temp_pasm);

c_output_is( <<"CODE", <<'OUTPUT', 'call a parrot sub, catch exception' );

#include <parrot/parrot.h>
#include <parrot/extend.h>

/* also both the test PASM and the_test() print to stderr
 * so that buffering in PIO is not an issue */

int
main(int argc, const char *argv[])
{
    Parrot_Interp interp = Parrot_interp_new(NULL);
    if (interp) {
        Parrot_String   temp_pbc_str = Parrot_str_new(interp, "$temp_pbc", 0);
        PackFile* pf   = Parrot_pf_read_pbc_file(interp, temp_pbc_str);
        Parrot_String   name = Parrot_str_new_constant(interp, "_sub1");
        PMC            *sub;
        Parrot_runloop  jump_point;
        Parrot_PMC      pbc  = Parrot_pf_get_packfile_pmc(interp, pf, STRINGNULL);

        Parrot_pf_set_current_packfile(interp, pbc);
        sub = Parrot_ns_find_current_namespace_global(interp, name);

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

        Parrot_interp_destroy(interp);
    }
    return 0;
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

c_output_is( <<"CODE", <<'OUTPUT', 'eval code through a parrot sub - #39669', todo => "Must explicitly set a PIR compreg");

#include <parrot/parrot.h>

int
main(int argc, const char *argv[])
{
    PackFile* packfile;
    const char * code[] = { ".sub foo\\nsay \\"Hello from foo!\\"\\n.end\\n" };
    Parrot_PMC pbc;

    Parrot_Interp interp = Parrot_interp_new(NULL);
    if (interp) {
        Parrot_String   temp_pbc_str = Parrot_str_new(interp, "$temp_pbc", 0);
        packfile   = Parrot_pf_read_pbc_file(interp, temp_pbc_str);

        if (packfile) {
            pbc  = Parrot_pf_get_packfile_pmc(interp, pf, STRINGNULL);
            Parrot_pf_set_current_packfile(interp, pbc);
            Parrot_runcode( interp, 1, code );
        }

        Parrot_interp_destroy( interp );
    }
    return 0;
}
CODE
Hello from foo!
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', 'compile string in a fresh interp - #39986', todo => "Must explicitly set a PIR compreg" );

#include <parrot/parrot.h>
#include <parrot/extend.h>

int
main(int argc, const char *argv[])
{
    Parrot_Interp   interp    = Parrot_interp_new(NULL);
    const char      *code      = ".sub foo :main\nprint\"Hello from foo!\\n\"\n.end\n";
    Parrot_PMC      retval;
    Parrot_PMC      sub;
    Parrot_String   code_type, error, foo_name;

    if (interp) {
        code_type = Parrot_str_new_constant( interp, "PIR" );
        retval    = Parrot_compile_string( interp, code_type, code, &error );

        if (retval) {
            foo_name = Parrot_str_new_constant( interp, "foo" );
            sub      = Parrot_ns_find_current_namespace_global( interp, foo_name );

            Parrot_ext_call(interp, sub, "->");
        }
        Parrot_interp_destroy(interp);
    }
    return 0;
}
CODE
Hello from foo!
OUTPUT

c_output_is( <<"CODE", <<'OUTPUT', 'call multi sub from C - #41511' );
#include <parrot/parrot.h>
#include <parrot/extend.h>

int
main(int argc, const char *argv[])
{
    Parrot_Int      result;
    Parrot_PMC      sub, pbc;
    PackFile* pf;
    Parrot_Interp   interp = Parrot_interp_new(NULL);

    if (interp) {
        Parrot_String   temp_pbc_str = Parrot_str_new(interp, "$temp_pbc", 0);
        pf   = Parrot_pf_read_pbc_file(interp, temp_pbc_str);
        pbc  = Parrot_pf_get_packfile_pmc(interp, pf, STRINGNULL);
        Parrot_pf_set_current_packfile(interp, pbc);

        sub      = Parrot_ns_find_current_namespace_global( interp, Parrot_str_new_constant( interp, "add" ) );
        Parrot_ext_call(interp, sub, "II->I", 100, 200, &result);
        printf( "Result is %d.\\n", result );
        Parrot_interp_destroy(interp);
    }
    return 0;
}
CODE
Result is 300.
OUTPUT

c_output_is( <<"CODE", <<'OUTPUT', 'call multi sub from C - unified interface' );
#include <parrot/parrot.h>
#include <parrot/extend.h>

int
main(int argc, const char *argv[])
{
    Parrot_Int      result;
    Parrot_PMC      sub, pbc;
    PackFile* pf;
    Parrot_Interp   interp = Parrot_interp_new(NULL);

    if (interp) {
        Parrot_String   temp_pbc_str = Parrot_str_new(interp, "$temp_pbc", 0);
        pf   = Parrot_pf_read_pbc_file(interp, temp_pbc_str);
        pbc  = Parrot_pf_get_packfile_pmc(interp, pf, STRINGNULL);
        Parrot_pf_set_current_packfile(interp, pbc);

        sub      = Parrot_ns_find_current_namespace_global( interp, Parrot_str_new_constant( interp, "add" ) );
        Parrot_ext_call( interp, sub, "II->I", 100, 200, &result );
        printf( "Result is %d.\\n", result );
        Parrot_interp_destroy(interp);
    }
    return 0;
}
CODE
Result is 300.
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', 'multiple Parrot_interp_new/Parrot_x_exit cycles' );

#include <stdio.h>
#include "parrot/parrot.h"

/* this is Parrot_x_exit without the exit()
 * it will call Parrot_interp_really_destroy() as an exit handler
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
        interp = Parrot_interp_new(NULL);
        if (interp) {
            Parrot_interp_set_flag(interp, PARROT_DESTROY_FLAG);

            printf("Destroying interp %d\n", i);
            fflush(stdout);
            interp_cleanup(interp, 0);
        }
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

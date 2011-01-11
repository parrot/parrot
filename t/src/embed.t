#! perl
# Copyright (C) 2001-2010, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;
use File::Spec::Functions;

plan skip_all => 'src/parrot_config.o does not exist' unless -e catfile(qw/src parrot_config.o/);

plan tests => 30;

=head1 NAME

t/src/embed.t - Embedding parrot

=head1 SYNOPSIS

    % prove t/src/embed.t

=head1 DESCRIPTION

Embedding parrot in C

=cut

sub linedirective
{
    # Provide a #line directive for the C code in the heredoc
    # starting immediately after where this sub is called.
    my $linenum = shift() + 1;
    return "#line " . $linenum . ' "' . __FILE__ . '"' . "\n";
}


my $common = linedirective(__LINE__) . <<'CODE';
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parrot/embed.h"
#include "parrot/extend.h"
#include "parrot/extend_vtable.h"

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
    return Parrot_new_string(interp, value, strlen(value), (const char*)NULL, 0);
}

static Parrot_Interp new_interp()
{
    Parrot_Interp interp = Parrot_new(NULL);
    if (!interp)
        fail("Cannot create parrot interpreter");
    return interp;

}

CODE

sub extend_vtable_output_is
{
    my ($code, $expected_output, $msg) = @_;
    c_output_is(
        $common . linedirective(__LINE__) . <<CODE,
int main(void)
{
    Parrot_Interp interp;
    Parrot_PMC pmc, pmc2, pmc3;
    Parrot_Int type, value, integer;
    Parrot_String string;
    Parrot_Float number;

    interp = new_interp();

    type   = Parrot_PMC_typenum(interp, "Integer");
    pmc    = Parrot_PMC_new(interp, type);
    pmc2   = Parrot_PMC_new(interp, type);
    pmc3   = Parrot_PMC_new(interp, type);
    string = Parrot_PMC_new(interp, Parrot_PMC_typenum(interp,"String"));

$code

    Parrot_destroy(interp);
    printf("Done!\\n");
    return 0;
}
CODE
        $expected_output, $msg
    );

}

c_output_is(linedirective(__LINE__) . <<'CODE', <<'OUTPUT', "Minimal embed, using just the embed.h header" );

#include <stdio.h>
#include <stdlib.h>
#include "parrot/embed.h"

void fail(const char *msg);

void fail(const char *msg)
{
    fprintf(stderr, "failed: %s\n", msg);
    exit(EXIT_FAILURE);
}

int main(int argc, const char **argv)
{
    Parrot_Interp interp;
    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");

    puts("Done");
    Parrot_destroy(interp);
    return 0;
}
CODE
Done
OUTPUT

c_output_is(linedirective(__LINE__) . <<'CODE', <<'OUTPUT', "Minimal embed, create multiple interps" );

#include <stdio.h>
#include <stdlib.h>
#include "parrot/embed.h"

void fail(const char *msg);

void fail(const char *msg)
{
    fprintf(stderr, "failed: %s\n", msg);
    exit(EXIT_FAILURE);
}

int main(int argc, const char **argv)
{
    Parrot_Interp interp1, interp2;
    interp1 = Parrot_new(NULL);
    if (!interp1)
        fail("Cannot create 1st parrot interpreter");

    interp2 = Parrot_new(interp1);

    if (!interp2)
        fail("Cannot create 2nd parrot interpreter");

    puts("Done");
    Parrot_destroy(interp1);
    Parrot_destroy(interp2);
    puts("Really done");
    return 0;
}
CODE
Done
Really done
OUTPUT

c_output_is(linedirective(__LINE__) . <<'CODE', <<'OUTPUT', "Minimal embed, create multiple interps without giving 1st interp to Parrot_new ", todo => 'TT #1880 : Parrot_new requires the 1st interp created as an argument');

#include <stdio.h>
#include <stdlib.h>

#include "parrot/embed.h"

void fail(const char *msg);

void fail(const char *msg)
{
    fprintf(stderr, "failed: %s\n", msg);
    exit(EXIT_FAILURE);
}

int main(int argc, const char **argv)
{
    Parrot_Interp interp1, interp2;
    interp1 = Parrot_new(NULL);
    if (!interp1)
        fail("Cannot create 1st parrot interpreter");

    interp2 = Parrot_new(NULL);

    if (!interp2)
        fail("Cannot create 2nd parrot interpreter");

    puts("Done");
    Parrot_destroy(interp1);
    Parrot_destroy(interp2);
    puts("Really done");
    return 0;
}
CODE
Done
Really done
OUTPUT

c_output_is($common . linedirective(__LINE__) . <<'CODE', <<'OUTPUT', 'Parrot_compile_string populates the error string when an opcode is given improper arguments');

int main(int argc, const char **argv)
{
    Parrot_Interp interp;
    Parrot_String err, lang;
    Parrot_PMC func_pmc;
    char *str;

    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");
    lang = createstring(interp, "PIR");

    func_pmc = Parrot_compile_string(interp, lang, ".sub foo\n copy\n.end", &err);
    Parrot_printf(interp, "%Ss\n", err);
    Parrot_destroy(interp);
    return 0;
}
CODE
The opcode 'copy' (copy<0>) was not found. Check the type and number of the arguments
OUTPUT

c_output_is($common . linedirective(__LINE__) . <<'CODE', <<'OUTPUT', 'Parrot_compile_string populates the error string when given invalid language string');

int main(int argc, const char **argv)
{
    Parrot_Interp interp;
    Parrot_String err, lang;
    Parrot_PMC func_pmc;
    char *str;

    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");
    lang = createstring(interp, "Foo");

    func_pmc = Parrot_compile_string(interp, lang, "This doesn't matter", &err);
    Parrot_printf(interp, "%Ss\n", err);
    Parrot_destroy(interp);
    return 0;
}
CODE
Invalid interpreter type
OUTPUT


c_output_is($common . linedirective(__LINE__) . <<'CODE', <<'OUTPUT', 'Parrot_compile_string populates the error string when there is an IMCC syntax error', 'todo' => 'TT #1610 : does not properly catch IMCC errors');

int main(int argc, const char **argv)
{
    Parrot_Interp interp;
    Parrot_String err, lang;
    Parrot_PMC func_pmc;
    char *str;

    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");
    lang = createstring(interp, "PIR");

    func_pmc = Parrot_compile_string(interp, lang, "The sleeper must awake", &err);
    Parrot_printf(interp,"Caught exception\n");
    Parrot_printf(interp, "%Ss\n", err);
    Parrot_destroy(interp);
    return 0;
}
CODE
Caught exception
error:imcc:syntax error, unexpected IDENTIFIER ('The')
OUTPUT


c_output_is($common . linedirective(__LINE__) . <<'CODE', <<'OUTPUT', "Hello world from main" );

int main(void)
{
    Parrot_Interp interp;
    Parrot_String compiler, errstr;
    Parrot_PMC code;

    /* Create the interpreter and show a message using parrot io */
    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");
    Parrot_printf(interp, "Hello, parrot\n");

    /* Compile and execute a pir sub */
    compiler = createstring(interp, "PIR");
    code = Parrot_compile_string(interp, compiler,
".sub main :main\n"
"  say 'Hello, pir'\n"
"\n"
".end\n"
"\n",
        &errstr
    );
    Parrot_ext_call(interp, code, "->");

    Parrot_destroy(interp);
    return 0;
}
CODE
Hello, parrot
Hello, pir
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_add_float" );
    Parrot_PMC_set_integer_native(interp, pmc, -42);
    number = 43.0;

    pmc3 = Parrot_PMC_add_float(interp, pmc, number, pmc3);
    number = Parrot_PMC_get_number(interp, pmc3);
    Parrot_io_printf(interp,"%.2f\n", number);
CODE
1.00
Done!
OUTPUT


extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_absolute" );

    Parrot_PMC_set_integer_native(interp, pmc, -42);
    Parrot_PMC_i_absolute(interp, pmc);

    value = Parrot_PMC_get_integer(interp, pmc);
    printf("%d\n", (int) value);
CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(increment|decrement)" );

    Parrot_PMC_set_integer_native(interp, pmc, -42);

    Parrot_PMC_increment(interp, pmc);
    value = Parrot_PMC_get_integer(interp, pmc);
    printf("%d\n", (int) value);

    Parrot_PMC_decrement(interp, pmc);
    value = Parrot_PMC_get_integer(interp, pmc);
    printf("%d\n", (int) value);
CODE
-41
-42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_neg" );
    Parrot_PMC_set_integer_native(interp, pmc, -42);

    Parrot_PMC_i_neg(interp, pmc);
    value = Parrot_PMC_get_integer(interp, pmc);
    printf("%d\n", (int) value);
CODE
42
Done!
OUTPUT


extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_floor_divide" );
    Parrot_PMC_set_integer_native(interp, pmc,  7);
    Parrot_PMC_set_integer_native(interp, pmc2, 3);
    Parrot_PMC_set_integer_native(interp, pmc3, 0);

    /*
       We must pass in the destination, but the return
       value of the function must be used. This is broken.
    */
    pmc3 = Parrot_PMC_floor_divide(interp, pmc, pmc2, pmc3);
    value = Parrot_PMC_get_integer(interp, pmc);
    printf("%d\n", (int) value);
    value = Parrot_PMC_get_integer(interp, pmc2);
    printf("%d\n", (int) value);
    value = Parrot_PMC_get_integer(interp, pmc3);
    printf("%d\n", (int) value);
CODE
7
3
2
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_multiply" );

    Parrot_PMC_set_integer_native(interp, pmc,  21);
    Parrot_PMC_set_integer_native(interp, pmc2, 2);
    Parrot_PMC_set_integer_native(interp, pmc3, 0);

    /*
       We must pass in the destination, but the return
       value of the function must be used. This is broken.
    */
    pmc3 = Parrot_PMC_multiply(interp, pmc, pmc2, pmc3);
    value = Parrot_PMC_get_integer(interp, pmc);
    printf("%d\n", (int) value);
    value = Parrot_PMC_get_integer(interp, pmc2);
    printf("%d\n", (int) value);
    value = Parrot_PMC_get_integer(interp, pmc3);
    printf("%d\n", (int) value);
CODE
21
2
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_divide" );
    Parrot_PMC_set_integer_native(interp, pmc,  42);
    Parrot_PMC_set_integer_native(interp, pmc2, 21);
    Parrot_PMC_set_integer_native(interp, pmc3, 0);

    /*
       We must pass in the destination, but the return
       value of the function must be used. This is broken.
    */
    pmc3 = Parrot_PMC_divide(interp, pmc, pmc2, pmc3);
    value = Parrot_PMC_get_integer(interp, pmc);
    printf("%d\n", (int) value);
    value = Parrot_PMC_get_integer(interp, pmc2);
    printf("%d\n", (int) value);
    value = Parrot_PMC_get_integer(interp, pmc3);
    printf("%d\n", (int) value);
CODE
42
21
2
Done!
OUTPUT

extend_vtable_output_is(<<'CODE',<<'OUTPUT', "Parrot_PMC_modulus" );
    Parrot_PMC_set_integer_native(interp, pmc,  50);
    Parrot_PMC_set_integer_native(interp, pmc2, 42);
    Parrot_PMC_set_integer_native(interp, pmc3, 0);

    pmc3 = Parrot_PMC_modulus(interp, pmc, pmc2, pmc3);
    value = Parrot_PMC_get_integer(interp, pmc);
    printf("%d\n", (int) value);
    value = Parrot_PMC_get_integer(interp, pmc2);
    printf("%d\n", (int) value);
    value = Parrot_PMC_get_integer(interp, pmc3);
    printf("%d\n", (int) value);
CODE
50
42
8
Done!
OUTPUT

# TODO: Does this look right?
extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_defined" );
    Parrot_PMC_set_integer_native(interp, pmc2, -42);

    integer = Parrot_PMC_defined(interp, pmc);
    printf("%d\n", (int) integer);

    integer = Parrot_PMC_defined(interp, pmc2);
    printf("%d\n", (int) integer);

CODE
1
1
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_is_equal" );
    Parrot_PMC_set_integer_native(interp, pmc, -42);
    Parrot_PMC_set_integer_native(interp, pmc2, 42);

    pmc3 = Parrot_PMC_is_equal(interp, pmc, pmc2);
    printf("%d\n", (int) pmc3);

    Parrot_PMC_set_integer_native(interp, pmc2, -42);

    pmc3 = Parrot_PMC_is_equal(interp, pmc, pmc2);
    printf("%d\n", (int) pmc3);
CODE
0
1
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_subtract" );

    Parrot_PMC_set_integer_native(interp, pmc,  52);
    Parrot_PMC_set_integer_native(interp, pmc2, 10);

    pmc3 = Parrot_PMC_subtract(interp, pmc, pmc2, pmc3);
    Parrot_io_printf(interp, "%P\n", pmc3);
    pmc3 = Parrot_PMC_subtract(interp, pmc2, pmc, pmc3);
    Parrot_io_printf(interp, "%P\n", pmc3);

CODE
42
-42
Done!
OUTPUT


extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_cmp" );
    Parrot_PMC_set_integer_native(interp, pmc, 42);
    Parrot_PMC_set_integer_native(interp, pmc2, 17);

    pmc3 = Parrot_PMC_cmp(interp, pmc, pmc2);
    Parrot_io_printf(interp,"%d\n", pmc3 );

    Parrot_PMC_set_integer_native(interp, pmc, 17);
    Parrot_PMC_set_integer_native(interp, pmc2, 42);

    pmc3 = Parrot_PMC_cmp(interp, pmc, pmc2);
    Parrot_io_printf(interp,"%d\n", pmc3 );

    Parrot_PMC_set_integer_native(interp, pmc, 42);

    pmc3 = Parrot_PMC_cmp(interp, pmc, pmc2);
    Parrot_io_printf(interp,"%d\n", pmc3 );
CODE
1
-1
0
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_add" );
    Parrot_PMC_set_integer_native(interp, pmc, -42);
    Parrot_PMC_set_integer_native(interp, pmc2, 1000);

    Parrot_PMC_i_add(interp, pmc, pmc2);
    value = Parrot_PMC_get_integer(interp, pmc);
    printf("%d\n", (int) value);
CODE
958
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_add" );
    Parrot_PMC_set_integer_native(interp, pmc, -42);
    Parrot_PMC_set_integer_native(interp, pmc2, 1000);

    pmc3 = Parrot_PMC_add(interp, pmc, pmc2, pmc3);
    value = Parrot_PMC_get_integer(interp, pmc3);
    printf("%d\n", (int) value);
CODE
958
Done!
OUTPUT


extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_assign_pmc" );
    Parrot_PMC_set_integer_native(interp, pmc, -42);
    Parrot_PMC_set_integer_native(interp, pmc2, 1000);
    Parrot_PMC_set_integer_native(interp, pmc3, 420);

    value = Parrot_PMC_get_integer(interp, pmc3);
    printf("%d\n", (int) value);

    Parrot_PMC_assign_pmc(interp, pmc3, pmc);

    value = Parrot_PMC_get_integer(interp, pmc3);
    printf("%d\n", (int) value);
CODE
420
-42
Done!
OUTPUT

c_output_is($common . linedirective(__LINE__) . <<'CODE', <<'OUTPUT', "Hello world from a sub" );

int main(void)
{
    Parrot_Interp interp;
    Parrot_String compiler;
    Parrot_String errstr;
    Parrot_PMC code;
    Parrot_PMC rootns;
    Parrot_String parrotname;
    Parrot_PMC parrotns;
    Parrot_String subname;
    Parrot_PMC sub;

    /* Create the interpreter */
    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");

    /* Compile pir code */
    compiler = createstring(interp, "PIR");
    code = Parrot_compile_string(interp, compiler,
".sub main :main\n"
"  say 'Must not be seen!'\n"
"\n"
".end\n"
"\n"
".sub hello\n"
"  say 'Hello, sub'\n"
"\n"
".end\n"
"\n",
        &errstr
    );

    /* Get parrot namespace */
    rootns = Parrot_get_root_namespace(interp);
    parrotname = createstring(interp, "parrot");
    parrotns = Parrot_PMC_get_pmc_keyed_str(interp, rootns,  parrotname);
    /* Get the sub */
    subname = createstring(interp, "hello");
    sub = Parrot_PMC_get_pmc_keyed_str(interp, parrotns,  subname);
    /* Execute it */
    Parrot_ext_call(interp, sub, "->");

    Parrot_destroy(interp);
    return 0;
}
CODE
Hello, sub
OUTPUT

c_output_is($common . linedirective(__LINE__) . <<'CODE', <<'OUTPUT', "calling a sub with string argument and return a string" );

int main(void)
{
    Parrot_Interp interp;
    Parrot_String compiler;
    Parrot_String errstr;
    Parrot_PMC code;
    Parrot_PMC rootns;
    Parrot_String parrotname;
    Parrot_PMC parrotns;
    Parrot_String subname;
    Parrot_PMC sub;
    Parrot_String msg;
    Parrot_String retstr;

    /* Create the interpreter */
    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");

    /* Compile pir code */
    compiler = createstring(interp, "PIR");
    code = Parrot_compile_string(interp, compiler,
".sub main :main\n"
"  say 'Must not be seen!'\n"
"\n"
".end\n"
"\n"
".sub hello\n"
"  .param string s\n"
"  print s\n"
"  .return('world!')\n"
"\n"
".end\n"
"\n",
        &errstr
    );

    /* Get parrot namespace */
    rootns = Parrot_get_root_namespace(interp);
    parrotname = createstring(interp, "parrot");
    parrotns = Parrot_PMC_get_pmc_keyed_str(interp, rootns,  parrotname);
    /* Get the sub */
    subname = createstring(interp, "hello");
    sub = Parrot_PMC_get_pmc_keyed_str(interp, parrotns,  subname);

    /* Execute it */
    msg = createstring(interp, "Hello, ");
    Parrot_ext_call(interp, sub, "S->S", msg, &retstr);
    Parrot_printf(interp, "%Ss\n", retstr);

    Parrot_destroy(interp);
    return 0;
}
CODE
Hello, world!
OUTPUT

c_output_is($common . linedirective(__LINE__) . <<'CODE', <<'OUTPUT', "returning a Float PMC" );

int main(void)
{
    Parrot_Interp interp;
    Parrot_PMC code, rootns, parrotns, sub, ret;
    Parrot_String compiler, errstr, parrotname, subname, msg;

    /* Create the interpreter */
    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");

    /* Compile pir code */
    compiler = createstring(interp, "PIR");
    code = Parrot_compile_string(interp, compiler,
".sub main :main\n"
"  say 'Must not be seen!'\n"
"\n"
".end\n"
"\n"
".sub hello\n"
"  .param string s\n"
"  .param pmc extra :optional\n"
"  .local pmc foo\n"
"  foo = new 'Float'\n"
"  foo = 42.0\n"
"  .return(foo)\n"
"\n"
".end\n"
"\n",
        &errstr
    );

    /* Get parrot namespace */
    rootns     = Parrot_get_root_namespace(interp);
    parrotname = createstring(interp, "parrot");
    parrotns   = Parrot_PMC_get_pmc_keyed_str(interp, rootns,  parrotname);

    /* Get the sub */
    subname = createstring(interp, "hello");
    sub     = Parrot_PMC_get_pmc_keyed_str(interp, parrotns,  subname);

    /* Execute it */
    msg = createstring(interp, "Hello, ");
    Parrot_ext_call(interp, sub, "S->P", msg, &ret);
    Parrot_printf(interp, "%.1Pf is the answer. What is the question?\n", ret);

    Parrot_destroy(interp);
    return 0;
}
CODE
42.0 is the answer. What is the question?
OUTPUT

c_output_is($common . linedirective(__LINE__) . <<'CODE', <<'OUTPUT', "returning two Float PMCs in a ResizablePMCArray" );

int main(void)
{
    Parrot_Interp interp;
    Parrot_PMC code, rootns, parrotns, sub, result;
    Parrot_String compiler, errstr, parrotname, subname, msg;
    Parrot_PMC res1, res2;

    /* Create the interpreter */
    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");

    /* Compile pir code */
    compiler = createstring(interp, "PIR");
    code = Parrot_compile_string(interp, compiler,
".sub main :main\n"
"  say 'Must not be seen!'\n"
"\n"
".end\n"
"\n"
".sub hello\n"
"  .param string s\n"
"  .local pmc foo\n"
"  foo = new 'ResizablePMCArray', 2\n"
"  foo[0] = 42.0\n"
"  foo[1] = 314.0\n"
"  .return(foo)\n"
"\n"
".end\n"
"\n",
        &errstr
    );

    /* Get parrot namespace */
    rootns = Parrot_get_root_namespace(interp);
    parrotname = createstring(interp, "parrot");
    parrotns = Parrot_PMC_get_pmc_keyed_str(interp, rootns,  parrotname);
    /* Get the sub */
    subname = createstring(interp, "hello");
    sub = Parrot_PMC_get_pmc_keyed_str(interp, parrotns,  subname);

    /* Execute it */
    msg = createstring(interp, "Hello, ");
    Parrot_ext_call(interp, sub, "S->P", msg, &result);

    res2 = Parrot_PMC_pop_pmc(interp, result);
    res1 = Parrot_PMC_pop_pmc(interp, result);

    Parrot_printf(interp, "%.1Pf is the answer and pi*100 = %.1Pf\n",
        res1, res2);

    Parrot_destroy(interp);
    return 0;
}
CODE
42.0 is the answer and pi*100 = 314.0
OUTPUT

c_output_is($common . linedirective(__LINE__) . <<'CODE', <<'OUTPUT', "calling a sub with string argument and return a numeric" );

int main(void)
{
    Parrot_Interp interp;
    Parrot_String compiler;
    Parrot_String errstr;
    Parrot_PMC code;
    Parrot_PMC rootns;
    Parrot_String parrotname;
    Parrot_PMC parrotns;
    Parrot_String subname;
    Parrot_PMC sub;
    Parrot_String msg;
    Parrot_Float ret;

    /* Create the interpreter */
    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");

    /* Compile pir code */
    compiler = createstring(interp, "PIR");
    code = Parrot_compile_string(interp, compiler,
".sub main :main\n"
"  say 'Must not be seen!'\n"
"\n"
".end\n"
"\n"
".sub hello\n"
"  .param string s\n"
"  .return(42.0)\n"
"\n"
".end\n"
"\n",
        &errstr
    );

    /* Get parrot namespace */
    rootns = Parrot_get_root_namespace(interp);
    parrotname = createstring(interp, "parrot");
    parrotns = Parrot_PMC_get_pmc_keyed_str(interp, rootns,  parrotname);
    /* Get the sub */
    subname = createstring(interp, "hello");
    sub = Parrot_PMC_get_pmc_keyed_str(interp, parrotns,  subname);

    /* Execute it */
    msg = createstring(interp, "Hello, ");
    Parrot_ext_call(interp, sub, "S->N", msg, &ret);
    Parrot_printf(interp, "%.1f is the answer. What is the question?\n", ret);

    Parrot_destroy(interp);
    return 0;
}
CODE
42.0 is the answer. What is the question?
OUTPUT

c_output_is($common . linedirective(__LINE__) . <<'CODE', <<'OUTPUT', "External sub" );

void hello(Parrot_Interp interp);

void hello(Parrot_Interp interp)
{
    Parrot_printf(interp, "Hello from C\n");
}

int main(void)
{
    Parrot_Interp interp;
    Parrot_String compiler;
    Parrot_String errstr;
    Parrot_PMC code;
    Parrot_PMC hellosub;

    /* Create the interpreter */
    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");

    /* Compile pir */
    compiler = createstring(interp, "PIR");
    code = Parrot_compile_string(interp, compiler,
".sub externcall\n"
"  .param pmc ec\n"
"  ec()\n"
"\n"
".end\n"
"\n",
        &errstr
    );
    hellosub = Parrot_sub_new_from_c_func(interp, (void (*)())& hello, "vJ");
    Parrot_ext_call(interp, code, "P->", hellosub);

    Parrot_destroy(interp);
    return 0;
}
CODE
Hello from C
OUTPUT

c_output_is($common . linedirective(__LINE__) . <<'CODE', <<'OUTPUT', "Insert external sub in namespace" );

void hello(Parrot_Interp interp);

void hello(Parrot_Interp interp)
{
    Parrot_printf(interp, "Hello from C\n");
}

int main(void)
{
    Parrot_Interp interp;
    Parrot_String compiler;
    Parrot_String errstr;
    Parrot_PMC code;
    Parrot_PMC hellosub;
    Parrot_PMC rootns;
    Parrot_String parrotname;
    Parrot_PMC parrotns;
    Parrot_String helloname;
    void *discard;

    /* Create the interpreter */
    interp = Parrot_new(NULL);
    if (! interp)
        fail("Cannot create parrot interpreter");

    /* Compile pir */
    compiler = createstring(interp, "PIR");
    code = Parrot_compile_string(interp, compiler,
".sub externcall\n"
"  hello()\n"
"\n"
".end\n"
"\n",
        &errstr
    );

    /* Create extern sub and insert in parrot namespace */
    rootns = Parrot_get_root_namespace(interp);
    parrotname = createstring(interp, "parrot");
    parrotns = Parrot_PMC_get_pmc_keyed_str(interp, rootns, parrotname);
    hellosub = Parrot_sub_new_from_c_func(interp, (void (*)())& hello, "vJ");
    helloname = createstring(interp, "hello");
    Parrot_PMC_set_pmc_keyed_str(interp, parrotns, helloname, hellosub);

    /* Call it */
    Parrot_ext_call(interp, code, "->");

    Parrot_destroy(interp);
    return 0;
}
CODE
Hello from C
OUTPUT

# Old tests, skipped al

SKIP: {

    skip('TT #306; many symbols not exported, embedding parrot fails', 1);

########################################################################

c_output_is( <<'CODE', <<'OUTPUT', "Parrot Compile API Single call" );

#include <stdio.h>
#include "parrot/embed.h"

static opcode_t *
run(PARROT_INTERP, int argc, cosnt char *argv[])
{
    const char *c_src = ".sub main :main\n" "    print \"ok\\n\"\n" ".end\n";

    Parrot_String *src, *smain;
    PMC *prog, *entry;
    opcode_t *dest;
    Parrot_String *error;

    /* get PIR compiler  - TODO API */
    PMC   *compreg = Parrot_PMC_get_pmc_keyed_int(interp,
                                       interp->iglobals,
                                       IGLOBALS_COMPREG_HASH);
    Parrot_String *pir    = Parrot_str_new_constant(interp, "PIR");
    PMC    *comp   = Parrot_PMC_get_pmc_keyed_str(interp, compreg, pir);

    if (PMC_IS_NULL(comp) || !Parrot_PMC_defined(interp, comp)) {
        Parrot_io_eprintf(interp, "Pir compiler not loaded");
        exit(EXIT_FAILURE);
    }

    /* compile source */
    prog = Parrot_compile_string(interp, pir, c_src, &error);

    if (PMC_IS_NULL(prog) || !Parrot_PMC_defined(interp, prog)) {
        Parrot_io_eprintf(interp, "Pir compiler returned no prog");
        exit(EXIT_FAILURE);
    }

    /* keep eval PMC alive */
    gc_register_pmc(interp, prog);

    /* locate function to run */
    smain = Parrot_str_new_constant(interp, "main");
    entry = Parrot_ns_find_current_namespace_global(interp, smain);

    /* location of the entry */
    interp->current_cont = new_ret_continuation_pmc(interp, NULL);
    dest                 = Parrot_PMC_invoke(interp, entry, NULL);

    /* where to start */
    interp->resume_offset = dest -interp->code->base.data;

    /* and go */
    Parrot_runcode(interp, argc, (char **)argv);
    return NULL;
}

int
main(int margc, const char *margv[])
{
    Parrot_Interp interp;
    PackFile *pf;
    int argc = 1;
    const char *argv[] = { "test", NULL };

    PackFile_Segment *seg;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if (interp == NULL)
        return 1;

    /* dummy pf and segment to get things started */
    pf = PackFile_new_dummy(interp, "test_code");

    /* Parrot_set_flag(interp, PARROT_TRACE_FLAG); */
    run(interp, argc, (char **)argv);
    Parrot_x_exit(interp, 0);
    return 0;
}
CODE
ok
OUTPUT
c_output_is( <<'CODE', <<'OUTPUT', "Parrot Compile API Multiple Calls" );

#include <stdio.h>
#include "parrot/embed.h"

static void
compile_run(PARROT_INTERP, const char *src, Parrot_String *type, int argc,
            const char *argv[])
{
    Parrot_String   *smain;
    PMC      *entry;
    Parrot_String   *error;
    opcode_t *dest;
    PMC      *prog = Parrot_compile_string(interp, type, src, &error);

    if (PMC_IS_NULL(prog) || !Parrot_PMC_defined(interp, prog)) {
        Parrot_io_eprintf(interp, "Pir compiler returned no prog");
        exit(EXIT_FAILURE);
    }

    /* keep eval PMC alive */
    gc_register_pmc(interp, prog);

    /* locate function to run */
    smain = Parrot_str_new_constant(interp, "main");
    entry = Parrot_ns_find_current_namespace_global(interp, smain);

    /* location of the entry */
    interp->current_cont = new_ret_continuation_pmc(interp, NULL);
    dest                 = Parrot_PMC_invoke(interp, entry, NULL);

    /* where to start */
    interp->resume_offset = dest -interp->code->base.data;

    /* and go */
    Parrot_runcode(interp, argc, (char **)argv);
}

static opcode_t *
run(PARROT_INTERP, int argc, const char *argv[])
{
    const char *c_src  = ".sub main :main\n" "    print \"ok\\n\"\n" ".end\n";

    const char *c2_src =
        ".sub main :main\n" "    print \"hola\\n\"\n" ".end\n";

    Parrot_String *src, *smain;

    /* get PIR compiler  - TODO API */
    PMC    *compreg = Parrot_PMC_get_pmc_keyed_int(interp,
                                       interp->iglobals,
                                       IGLOBALS_COMPREG_HASH);
    Parrot_String *pir     = Parrot_str_new_constant(interp, "PIR");
    PMC    *comp    = Parrot_PMC_get_pmc_keyed_str(interp, compreg, pir);

    if (PMC_IS_NULL(comp) || !Parrot_PMC_defined(interp, comp)) {
        Parrot_io_eprintf(interp, "Pir compiler not loaded");
        exit(EXIT_FAILURE);
    }

    compile_run(interp, c_src, pir, argc, argv);
    compile_run(interp, c2_src, pir, argc, argv);
}

int
main(int margc, const char *margv[])
{
    Parrot_Interp interp;
    PackFile *pf;
    int argc = 1;
    const char *argv[] = { "test", NULL };

    PackFile_Segment *seg;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if (interp == NULL)
        return 1;

    /* dummy pf and segment to get things started */
    pf = PackFile_new_dummy(interp, "test_code");

    /* Parrot_set_flag(interp, PARROT_TRACE_FLAG); */
    run(interp, argc, (char **) argv);
    Parrot_x_exit(interp, 0);
    return 0;
}
CODE
ok
hola
OUTPUT
c_output_is( <<'CODE', <<'OUTPUT', "Parrot Compile API Multiple 1st bad PIR" );

#include <stdio.h>
#include "parrot/embed.h"

static void
compile_run(PARROT_INTERP, const char *src, Parrot_String *type, int argc,
            const char *argv[])
{
    Parrot_String   *smain;
    PMC      *entry;
    Parrot_String   *error;
    opcode_t *dest;
    PMC      *prog = Parrot_compile_string(interp, type, src, &error);

    if (PMC_IS_NULL(prog) || !Parrot_PMC_defined(interp, prog)) {
        Parrot_io_eprintf(interp, "Pir compiler returned no prog\n");
        return;
    }

    /* keep eval PMC alive */
    gc_register_pmc(interp, prog);

    /* locate function to run */
    smain = Parrot_str_new_constant(interp, "main");
    entry = Parrot_ns_find_current_namespace_global(interp, smain);

    /* location of the entry */
    interp->current_cont = new_ret_continuation_pmc(interp, NULL);
    dest                 = Parrot_PMC_invoke(interp, entry, NULL);

    /* where to start */
    interp->resume_offset = dest -interp->code->base.data;

    /* and go */
    Parrot_runcode(interp, argc, (char **) argv);
}

static opcode_t *
run(PARROT_INTERP, int argc, const char *argv[])
{
    const char *c_src  = ".sub main :main\n" "    print ok\\n\"\n" ".end\n";

    const char *c2_src =
        ".sub main :main\n" "    print \"hola\\n\"\n" ".end\n";

    Parrot_String *src, *smain;

    /* get PIR compiler  - TODO API */
    PMC    *compreg = Parrot_PMC_get_pmc_keyed_int(interp,
                                       interp->iglobals,
                                       IGLOBALS_COMPREG_HASH);
    Parrot_String *pir     = Parrot_str_new_constant(interp, "PIR");
    PMC    *comp    = Parrot_PMC_get_pmc_keyed_str(interp, compreg, pir);

    if (PMC_IS_NULL(comp) || !Parrot_PMC_defined(interp, comp)) {
        Parrot_io_eprintf(interp, "Pir compiler not loaded");
        return NULL;
    }

    compile_run(interp, c_src, pir, argc, argv);
    compile_run(interp, c2_src, pir, argc, argv);
}

int
main(int margc, const char *margv[])
{
    Parrot_Interp interp;
    PackFile *pf;
    int argc = 1;
    const char *argv[] = { "test", NULL };

    PackFile_Segment *seg;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if (interp == NULL)
        return 1;

    /* dummy pf and segment to get things started */
    pf = PackFile_new_dummy(interp, "test_code");

    /* Parrot_set_flag(interp, PARROT_TRACE_FLAG); */
    run(interp, argc, argv);
    Parrot_x_exit(interp, 0);
    return 0;
}
CODE
Pir compiler returned no prog
hola
OUTPUT
c_output_is( <<'CODE', <<'OUTPUT', "Parrot Compile API Multiple 2nd bad PIR" );

#include <stdio.h>
#include "parrot/embed.h"

static void
compile_run(PARROT_INTERP, const char *src, Parrot_String *type, int argc,
            const char *argv[])
{
    Parrot_String   *smain;
    PMC      *entry;
    Parrot_String   *error;
    opcode_t *dest;
    PMC      *prog = Parrot_compile_string(interp, type, src, &error);

    if (PMC_IS_NULL(prog) || !Parrot_PMC_defined(interp, prog)) {
        Parrot_io_eprintf(interp, "Pir compiler returned no prog\n");
        return;
    }

    /* keep eval PMC alive */
    gc_register_pmc(interp, prog);

    /* locate function to run */
    smain = Parrot_str_new_constant(interp, "main");
    entry = Parrot_ns_find_current_namespace_global(interp, smain);

    /* location of the entry */
    interp->current_cont = new_ret_continuation_pmc(interp, NULL);
    dest                 = Parrot_PMC_invoke(interp, entry, NULL);

    /* where to start */
    interp->resume_offset = dest -interp->code->base.data;

    /* and go */
    Parrot_runcode(interp, argc, (char **)argv);
}

static opcode_t *
run(PARROT_INTERP, int argc, const char *argv[])
{
    const char *c_src  = ".sub main :main\n" "    print ok\\n\"\n" ".end\n";

    const char *c2_src =
        ".sub main :main\n" "    print \"hola\\n\"\n" ".end\n";

    Parrot_String *src, *smain;
    /* get PIR compiler  - TODO API */
    PMC    *compreg = Parrot_PMC_get_pmc_keyed_int(interp,
                                       interp->iglobals,
                                       IGLOBALS_COMPREG_HASH);
    Parrot_String *pir     = Parrot_str_new_constant(interp, "PIR");
    PMC    *comp    = Parrot_PMC_get_pmc_keyed_str(interp, compreg, pir);

    if (PMC_IS_NULL(comp) || !Parrot_PMC_defined(interp, comp)) {
        Parrot_io_eprintf(interp, "Pir compiler not loaded");
        return NULL;
    }

    compile_run(interp, c2_src, pir, argc, argv);
    compile_run(interp, c_src, pir, argc, argv);
}

int
main(int margc, const char *margv[])
{
    Parrot_Interp interp;
    PackFile *pf;
    int argc = 1;
    char *argv[] = { "test", NULL };

    PackFile_Segment *seg;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if (interp == NULL)
        return 1;

    /* dummy pf and segment to get things started */
    pf = PackFile_new_dummy(interp, "test_code");

    /* Parrot_set_flag(interp, PARROT_TRACE_FLAG); */
    run(interp, argc, argv);
    Parrot_x_exit(interp, 0);
    return 0;
}
CODE
hola
Pir compiler returned no prog
OUTPUT
c_output_is( <<'CODE', <<'OUTPUT', "Parrot Compile API Multiple bad PIR" );

#include <stdio.h>
#include "parrot/embed.h"

static void
compile_run(PARROT_INTERP, const char *src, Parrot_String *type, int argc,
            const char *argv[])
{
    Parrot_String   *smain;
    PMC      *entry;
    Parrot_String   *error;
    opcode_t *dest;
    PMC      *prog = Parrot_compile_string(interp, type, src, &error);

    if (PMC_IS_NULL(prog) || !Parrot_PMC_defined(interp, prog)) {
        Parrot_io_eprintf(interp, "Pir compiler returned no prog\n");
        return;
    }

    /* keep eval PMC alive */
    gc_register_pmc(interp, prog);

    /* locate function to run */
    smain = Parrot_str_new_constant(interp, "main");
    entry = Parrot_ns_find_current_namespace_global(interp, smain);

    /* location of the entry */
    interp->current_cont = new_ret_continuation_pmc(interp, NULL);
    dest                 = Parrot_PMC_invoke(interp, entry, NULL);

    /* where to start */
    interp->resume_offset = dest -interp->code->base.data;

    /* and go */
    Parrot_runcode(interp, argc, (char **)argv);
}

static opcode_t *
run(PARROT_INTERP, int argc, const char *argv[])
{
    const char *c_src  = ".sub main :main\n" "    print ok\\n\"\n" ".end\n";

    const char *c2_src = ".sub main :main\n" "    print hola\\n\"\n" ".end\n";

    Parrot_String *src, *smain;
    /* get PIR compiler  - TODO API */
    PMC    *compreg = Parrot_PMC_get_pmc_keyed_int(interp,
                                       interp->iglobals,
                                       IGLOBALS_COMPREG_HASH);
    Parrot_String *pir     = Parrot_str_new_constant(interp, "PIR");
    PMC    *comp    = Parrot_PMC_get_pmc_keyed_str(interp, compreg, pir);

    if (PMC_IS_NULL(comp) || !Parrot_PMC_defined(interp, comp)) {
        Parrot_io_eprintf(interp, "Pir compiler not loaded");
        return NULL;
    }

    compile_run(interp, c_src, pir, argc, argv);
    compile_run(interp, c2_src, pir, argc, argv);
}

int
main(int margc, const char *margv[])
{
    Parrot_Interp interp;
    PackFile *pf;
    int argc = 1;
    char *argv[] = { "test", NULL };

    PackFile_Segment *seg;

    /* Interpreter set-up */
    interp = Parrot_new(NULL);
    if (interp == NULL)
        return 1;

    /* dummy pf and segment to get things started */
    pf = PackFile_new_dummy(interp, "test_code");

    /* Parrot_set_flag(interp, PARROT_TRACE_FLAG); */
    run(interp, argc, argv);
    Parrot_x_exit(interp, 0);
    return 0;
}
CODE
Pir compiler returned no prog
Pir compiler returned no prog
OUTPUT

}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

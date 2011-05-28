# Copyright (C) 2010-2011, Parrot Foundation.
#! perl

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;
use File::Spec::Functions;

plan skip_all => 'src/parrot_config.o does not exist' unless -e catfile(qw/src parrot_config.o/);

plan tests => 139;

=head1 NAME

t/src/extend_vtable.t - tests for src/extend_vtable.c

=head1 SYNOPSIS

    % prove t/src/extend_vtable.t

=head1 DESCRIPTION

Tests for the Parrot vtable extension interface, which lives in src/extend_vtable.c .

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
static void handler(Parrot_Interp interp, Parrot_PMC exception, void *unused);

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
static void handler(Parrot_Interp interp, Parrot_PMC exception, void *unused)
{
    Parrot_printf(interp, "Failed!\n");
    if (exception) {
        Parrot_String key;
        Parrot_Int type;
        Parrot_Int severity;
        Parrot_String message;

        key = createstring(interp, "type");
        type = Parrot_PMC_get_integer_keyed_str(interp, exception, key);
        key = createstring(interp, "severity");
        severity = Parrot_PMC_get_integer_keyed_str(interp, exception, key);
        message = Parrot_PMC_get_string(interp, exception);
        Parrot_printf(interp, "Exception is: type %d severity %d message '%Ss'\n",
                type, severity, message);
    }
}

CODE

sub extend_vtable_output_is
{
    my ($code, $expected_output, $msg, @opts) = @_;
    local $Test::Builder::Level = $Test::Builder::Level + 1;
    c_output_is(
        $common . linedirective(__LINE__) . <<CODE,
PMC* PMCNULL;

#define NOT_NULL(pmc)  (!((pmc) == PMCNULL || (pmc) == NULL))

void dotest(Parrot_Interp interp, void *unused)
{
    Parrot_PMC pmc, pmc2, pmc3, pmc_string, pmc_string2, pmc_string3;
    Parrot_PMC pmc_float, pmc_float2;
    Parrot_PMC rpa, rpa2, fpa, hash, hash_iter, continuation, continuation2, nci;
    Parrot_PMC key_int, key_str, hashkey, ns, object, klass;
    Parrot_Int type, value, integer, integer2;
    Parrot_Float number, number2;
    Parrot_String string, string2;

    type         = Parrot_PMC_typenum(interp, "Integer");
    continuation = Parrot_PMC_new(interp, Parrot_PMC_typenum(interp, "Continuation"));
    continuation2= Parrot_PMC_new(interp, Parrot_PMC_typenum(interp, "Continuation"));
    rpa          = Parrot_PMC_new(interp, Parrot_PMC_typenum(interp, "ResizablePMCArray"));
    rpa2         = Parrot_PMC_new(interp, Parrot_PMC_typenum(interp, "ResizablePMCArray"));
    fpa          = Parrot_PMC_new(interp, Parrot_PMC_typenum(interp, "FixedPMCArray"));
    hash         = Parrot_PMC_new(interp, Parrot_PMC_typenum(interp, "Hash"));
    ns           = Parrot_PMC_new(interp, Parrot_PMC_typenum(interp, "Namespace"));
    nci          = Parrot_PMC_new(interp, Parrot_PMC_typenum(interp, "Nci"));
    pmc          = Parrot_PMC_new(interp, type);
    pmc2         = Parrot_PMC_new(interp, type);
    pmc3         = Parrot_PMC_new(interp, type);
    key_int      = Parrot_PMC_new(interp, Parrot_PMC_typenum(interp, "Key"));
    type         = Parrot_PMC_typenum(interp, "Class");
    klass        = Parrot_PMC_new(interp, type);

    Parrot_PMC_set_integer_native(interp, key_int, 42);

    Parrot_PMC_push_pmc(interp, rpa2, continuation);

    pmc_string  = Parrot_PMC_new(interp, Parrot_PMC_typenum(interp,"String"));
    pmc_string2 = Parrot_PMC_new(interp, Parrot_PMC_typenum(interp,"String"));
    pmc_string3 = Parrot_PMC_new(interp, Parrot_PMC_typenum(interp,"String"));
    pmc_float   = Parrot_PMC_new(interp, Parrot_PMC_typenum(interp,"Float"));
    pmc_float2  = Parrot_PMC_new(interp, Parrot_PMC_typenum(interp,"Float"));

    string  = createstring(interp,"Object");
    Parrot_PMC_assign_string_native(interp, pmc_string, string);

    object       = Parrot_PMC_newclass(interp, pmc_string);

$code

    Parrot_destroy(interp);
    printf("Done!\\n");
}

int main(void)
{
    Parrot_Interp interp;
    interp = new_interp();
    Parrot_ext_try(interp, &dotest, &handler, NULL);
    return 0;
}
CODE
        $expected_output, $msg, @opts
    );

}

# actual tests start here

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_instantiate");
    Parrot_PMC_instantiate(interp, pmc, pmc2);
    string = Parrot_PMC_name(interp, pmc);
    Parrot_printf(interp, "%S\n", string);
CODE
Integer
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(get|set)_attr_str");
    type   = Parrot_PMC_typenum(interp, "Exception");
    pmc    = Parrot_PMC_new(interp, type);
    Parrot_PMC_set_integer_native(interp, pmc2, 42);

    string = createstring(interp,"payload");

    Parrot_PMC_set_attr_str(interp, pmc, string, pmc2);
    pmc3   = Parrot_PMC_get_attr_str(interp, pmc, string);

    Parrot_printf(interp, "%P\n", pmc3);
CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(get|set)_attr_keyed");
    type   = Parrot_PMC_typenum(interp, "Exception");
    pmc    = Parrot_PMC_new(interp, type);
    Parrot_PMC_set_integer_native(interp, pmc2, 42);

    Parrot_PMC_set_attr_keyed(interp, pmc, key_int, createstring(interp, "severity"), pmc2);
    pmc3   = Parrot_PMC_get_attr_keyed(interp, pmc, key_int, createstring(interp, "severity"));
    Parrot_printf(interp, "%P\n", pmc3);
CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(get|set)_integer_keyed_str");
    string = createstring(interp,"foo");
    Parrot_PMC_set_integer_keyed_str(interp, hash, string, 42);
    integer = Parrot_PMC_get_integer_keyed_str(interp, hash, string);
    Parrot_printf(interp,"%d\n", integer);
CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(set|get)_number_keyed_str");
    string = createstring(interp,"foo");
    Parrot_PMC_set_number_keyed_str(interp, hash, string, 42.00);
    number = Parrot_PMC_get_number_keyed_str(interp, hash, string);
    Parrot_printf(interp,"%.6f\n", number);
CODE
42.000000
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(set|get)_pmc_keyed_str");
    string = createstring(interp,"foo");
    Parrot_PMC_set_integer_native(interp, pmc,  50);
    Parrot_PMC_set_pmc_keyed_str(interp, hash, string, pmc);

    pmc2 = Parrot_PMC_get_pmc_keyed_str(interp, hash, string);
    Parrot_printf(interp, "%P\n", pmc2);
CODE
50
Done!
OUTPUT

# TODO: Should it really return 'default' here?
extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_morph");
    Parrot_PMC_morph(interp, fpa, pmc);
    string = Parrot_PMC_name(interp, fpa);
    Parrot_printf(interp, "%S\n", string);
CODE
default
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_repeat_int");
    string  = createstring(interp, "BAR");
    Parrot_PMC_assign_string_native(interp, pmc_string, string);

    pmc_string = Parrot_PMC_repeat_int(interp, pmc_string, 3, pmc_string);
    string = Parrot_PMC_name(interp, pmc_string);
    Parrot_printf(interp, "%S\n%P\n", string, pmc_string);
CODE
String
BARBARBAR
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_repeat_int");
    string  = createstring(interp, "BAR");
    Parrot_PMC_assign_string_native(interp, pmc_string, string);

    Parrot_PMC_i_repeat_int(interp, pmc_string, 3);
    string = Parrot_PMC_name(interp, pmc_string);
    Parrot_printf(interp, "%S\n%P\n", string, pmc_string);
CODE
String
BARBARBAR
Done!
OUTPUT


extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_repeat");
    string  = createstring(interp, "FOO");
    Parrot_PMC_assign_string_native(interp, pmc_string, string);

    Parrot_PMC_set_integer_native(interp, pmc,  5);
    pmc_string = Parrot_PMC_repeat(interp, pmc_string, pmc, pmc_string);
    string = Parrot_PMC_name(interp, pmc_string);
    Parrot_printf(interp, "%S\n%P\n", string, pmc_string);
CODE
String
FOOFOOFOOFOOFOO
Done!
OUTPUT
extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_repeat");
    string  = createstring(interp, "FOO");
    Parrot_PMC_assign_string_native(interp, pmc_string, string);

    Parrot_PMC_set_integer_native(interp, pmc,  5);
    Parrot_PMC_i_repeat(interp, pmc_string, pmc);
    string = Parrot_PMC_name(interp, pmc_string);
    Parrot_printf(interp, "%S\n%P\n", string, pmc_string);
CODE
String
FOOFOOFOOFOOFOO
Done!
OUTPUT

# TODO: Improve this test
extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_init_pmc");
    Parrot_PMC_init_pmc(interp, continuation2, continuation);
CODE
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_init_int");
    Parrot_PMC_init_int(interp, fpa, 10);
    Parrot_printf(interp, "%d\n", Parrot_PMC_elements(interp, fpa));
CODE
10
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_inspect_str");
    pmc2 = Parrot_PMC_inspect_str(interp, klass, createstring(interp, "parents"));
    string = Parrot_PMC_name(interp, pmc2);
    Parrot_printf(interp, "%S\n", string);
CODE
ResizablePMCArray
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_inspect");
    pmc2 = Parrot_PMC_inspect(interp, pmc);
    string = Parrot_PMC_name(interp, pmc2);
    Parrot_printf(interp, "%S\n", string);
CODE
Hash
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_name");
    string = Parrot_PMC_name(interp, fpa);
    Parrot_printf(interp, "%S\n", string);
CODE
FixedPMCArray
Done!
OUTPUT

# TODO: Improve this test
extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_init");
    Parrot_PMC_init(interp, pmc);
CODE
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_isa_pmc");
    integer = Parrot_PMC_isa_pmc(interp, klass, klass);
    Parrot_printf(interp, "%d\n", integer);

    integer = Parrot_PMC_isa_pmc(interp, pmc, klass);
    Parrot_printf(interp, "%d\n", integer);

CODE
1
0
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_isa");
    integer = Parrot_PMC_isa(interp, pmc, createstring(interp, "Integer") );
    Parrot_printf(interp, "%d\n", integer);

    integer = Parrot_PMC_isa(interp, pmc, createstring(interp, "Birdpoop") );
    Parrot_printf(interp, "%d\n", integer);
CODE
1
0
Done!
OUTPUT

# TODO: Improve this test
extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_getprops");
    pmc = Parrot_PMC_getprops(interp, continuation);
CODE
Done!
OUTPUT

extend_vtable_output_is(<<'CODE',<<'OUTPUT', "Parrot_PMC_i_modulus_float" );
    Parrot_PMC_set_number_native(interp, pmc,  50.0);

    Parrot_PMC_i_modulus_float(interp, pmc, 42.0);
    Parrot_printf(interp, "%.2f\n",Parrot_PMC_get_number(interp, pmc));
CODE
8.00
Done!
OUTPUT

extend_vtable_output_is(<<'CODE',<<'OUTPUT', "Parrot_PMC_modulus_float" );
    Parrot_PMC_set_number_native(interp, pmc,  50.0);
    Parrot_PMC_set_number_native(interp, pmc3, 0.0);

    pmc3 = Parrot_PMC_modulus_float(interp, pmc, 42.0, pmc3);
    Parrot_printf(interp, "%P\n%P\n",pmc, pmc3);
CODE
50
8
Done!
OUTPUT

extend_vtable_output_is(<<'CODE',<<'OUTPUT', "Parrot_PMC_modulus_int" );
    Parrot_PMC_set_integer_native(interp, pmc,  50);
    Parrot_PMC_set_integer_native(interp, pmc3, 0);

    pmc3 = Parrot_PMC_modulus_int(interp, pmc, 42, pmc3);
    Parrot_printf(interp, "%P\n%P\n",pmc, pmc3);
CODE
50
8
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_floor_divide_int" );
    Parrot_PMC_set_integer_native(interp, pmc,  7);
    Parrot_PMC_set_integer_native(interp, pmc2, 3);

    value = Parrot_PMC_get_integer(interp, pmc);
    Parrot_printf(interp, "%P\n", pmc);

    Parrot_PMC_i_floor_divide_int(interp, pmc, 3);
    Parrot_printf(interp, "%P\n%P\n", pmc, pmc2);
CODE
7
2
3
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_floor_divide" );
    Parrot_PMC_set_integer_native(interp, pmc,  7);
    Parrot_PMC_set_integer_native(interp, pmc2, 3);

    value = Parrot_PMC_get_integer(interp, pmc);
    Parrot_printf(interp, "%P\n", pmc);

    Parrot_PMC_i_floor_divide(interp, pmc, pmc2);
    Parrot_printf(interp, "%P\n%P\n", pmc, pmc2);
CODE
7
2
3
Done!
OUTPUT


# # Exception is: type 36 severity 2 message 'get_pointer_keyed_int() not implemented in class 'Class''
#extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_get_pointer_keyed_int");
#    /* Need to create object PMC */
#    integer = (Parrot_Int) Parrot_PMC_get_pointer_keyed_int(interp, object, 42);
#    if (integer > 0)
#        Parrot_printf(interp,"Got pointer_keyed_int!\n", integer);
#CODE
#Got pointer_keyed_int!
#Done!
#OUTPUT


extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_substr" );
     string  = createstring(interp, "FOO");

     Parrot_PMC_assign_string_native(interp, pmc_string, string);

     Parrot_PMC_substr(interp, pmc_string, 0, 2, pmc_string2);
     Parrot_printf(interp, "%P\n", pmc_string2);
CODE
FO
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_substr_str" );
     string  = createstring(interp, "FOO");

     Parrot_PMC_assign_string_native(interp, pmc_string, string);

     string2 = Parrot_PMC_substr_str(interp, pmc_string, 0, 1);
     Parrot_printf(interp, "%S\n", string2);
CODE
F
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_is_equal_string");
    Parrot_PMC_set_string_native(interp, pmc_string, createstring(interp, "foo"));
    Parrot_PMC_set_string_native(interp, pmc_string2, createstring(interp, "bar"));

    integer = Parrot_PMC_is_equal_string(interp, pmc_string, pmc_string2);
    Parrot_printf(interp, "%d\n", integer);

    Parrot_PMC_set_string_native(interp, pmc_string2, createstring(interp, "foo"));

    integer = Parrot_PMC_is_equal_string(interp, pmc_string, pmc_string2);
    Parrot_printf(interp,"%d\n", integer);
CODE
0
1
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_does_pmc" );
    pmc2   = Parrot_PMC_new(interp, Parrot_PMC_typenum(interp, "Role"));
    integer = Parrot_PMC_does_pmc(interp,pmc,pmc2);
    Parrot_printf(interp,"%d\n", (int) integer);
CODE
0
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_get_repr");
    string = Parrot_PMC_get_repr(interp, rpa);
    Parrot_printf(interp,"%Ss\n", string);
CODE
[  ]
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_get_pmc_keyed");
    pmc2 = Parrot_PMC_get_pmc_keyed(interp, rpa, key_int);
CODE
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_get_string_keyed_int");
    string = Parrot_PMC_get_string_keyed_int(interp, rpa, 42);
    Parrot_printf(interp,"%Ss\n", string);
CODE

Done!
OUTPUT


extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_get_pmc_keyed_int");
    pmc2 = Parrot_PMC_get_pmc_keyed_int(interp, rpa, 0);
CODE
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_delete_keyed_int");
    Parrot_PMC_delete_keyed_int(interp, rpa, 0);
CODE
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_exists_keyed_int");
    integer = Parrot_PMC_exists_keyed_int(interp, rpa, 0);
    Parrot_printf(interp,"%d\n", integer);
CODE
0
Done!
OUTPUT



extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_exists_keyed_str");
    string = createstring(interp,"foo");
    integer = Parrot_PMC_exists_keyed_str(interp, hash, string);
    Parrot_printf(interp,"%d\n", integer);
CODE
0
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_delete_keyed");
    Parrot_PMC_delete_keyed(interp, rpa, key_int);
CODE
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_exists_keyed");
    integer = Parrot_PMC_exists_keyed(interp, rpa, key_int);
    Parrot_printf(interp,"%d\n", integer);
CODE
0
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_find_method");
    type   = Parrot_PMC_typenum(interp, "Class");
    pmc    = Parrot_PMC_new(interp, type);
    string = createstring(interp,"foo");
    pmc2   = Parrot_PMC_find_method(interp, pmc, string);
    Parrot_printf(interp,"42\n");
CODE
42
Done!
OUTPUT

# TODO: Improve this test
extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_splice");
    Parrot_PMC_splice( interp, rpa, rpa2, 0, 1 );
    Parrot_printf(interp,"42\n");
CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_set_pointer");
    Parrot_PMC_set_pointer(interp, continuation , (void *)42);
    Parrot_printf(interp,"42\n");
CODE
42
Done!
OUTPUT

# These will most likely be removed soon, but here for completeness
extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_share(_ro)");
    Parrot_PMC_share(interp, pmc);
    Parrot_PMC_share_ro(interp, pmc);
CODE
Done!
OUTPUT

# TODO: Improve this test
extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_set_pointer_keyed_int");
    hashkey   = Parrot_PMC_new(interp, Parrot_PMC_typenum(interp, "HashIteratorKey"));
    Parrot_PMC_set_pointer_keyed_int(interp, hashkey, 0, (void*) 42);
    Parrot_printf(interp,"42\n");
CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_set_pmc");
    Parrot_PMC_set_integer_native(interp, pmc, 42);
    Parrot_PMC_set_integer_native(interp, pmc2, 99);
    Parrot_PMC_set_pmc(interp, pmc, pmc2);
    Parrot_printf(interp,"%P\n", pmc);
CODE
99
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_set_pmc_keyed");
    Parrot_PMC_set_integer_native(interp, pmc2, 99);
    Parrot_PMC_set_pmc_keyed(interp, rpa, key_int, pmc2);
    pmc3 = Parrot_PMC_get_pmc_keyed(interp, rpa, key_int);
    Parrot_printf(interp,"%P\n", pmc3);
CODE
99
Done!
OUTPUT

# TODO: Improve this test
extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_set_pmc_keyed_int");
    Parrot_PMC_set_integer_native(interp, pmc2, 99);
    Parrot_PMC_set_pmc_keyed_int(interp, rpa, 0, pmc2);
CODE
Done!
OUTPUT


extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(set|get)_number_keyed");
    Parrot_PMC_set_number_keyed(interp, rpa, key_int, 42.0);
    number = Parrot_PMC_get_number_keyed(interp, rpa, key_int);
    Parrot_printf(interp,"%.02f\n", number);
CODE
42.00
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(set|get)_number_keyed_int");
    Parrot_PMC_set_number_keyed_int(interp, rpa, 0, 42.0);
    number = Parrot_PMC_get_number_keyed_int(interp, rpa, 0);
    Parrot_printf(interp,"%.02f\n", number);
CODE
42.00
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(set|get)_integer_keyed");
    Parrot_PMC_set_integer_keyed(interp, rpa, key_int, 42);
    integer = Parrot_PMC_get_integer_keyed(interp, rpa, key_int);
    Parrot_printf(interp,"%d\n", integer);
CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(set|get)_integer_keyed_int");
    Parrot_PMC_set_integer_keyed_int(interp, rpa, 0, 42);
    integer = Parrot_PMC_get_integer_keyed_int(interp, rpa, 0 );
    Parrot_printf(interp,"%d\n", integer);
CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_delete_keyed_str");
    string = createstring(interp,"foo");
    Parrot_PMC_delete_keyed_str(interp, hash, string);
CODE
Done!
OUTPUT



extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_get_string_keyed_str");
    string = createstring(interp,"foo");
    string = Parrot_PMC_get_string_keyed_str(interp, hash, string);
    Parrot_printf(interp,"%Ss\n", string);
CODE

Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_defined_keyed");
    integer = Parrot_PMC_defined_keyed(interp, hash, key_int);
    Parrot_printf(interp,"%d\n", integer);
CODE
0
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_defined_keyed_int");
    integer = Parrot_PMC_defined_keyed_int(interp, rpa, 42);
    Parrot_printf(interp,"%d\n", integer);
CODE
0
Done!
OUTPUT

# TODO: Improve this test
extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_delete_keyed_str");
    string = createstring(interp,"foo");
    Parrot_PMC_delete_keyed_str(interp, hash, string);
CODE
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_set_string_keyed_str");
    string  = createstring(interp,"nyarlathotep");
    string2 = createstring(interp,"planeteater");
    Parrot_PMC_set_string_keyed_str(interp, hash, string, string2);
    string = Parrot_PMC_get_string_keyed_str(interp, hash, string);
    Parrot_printf(interp,"%S\n", string);
CODE
planeteater
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_set_string_keyed");
    string  = createstring(interp,"nyarlathotep");
    string2 = createstring(interp,"planeteater");

    Parrot_PMC_assign_string_native(interp, pmc_string, string);
    Parrot_PMC_assign_string_native(interp, pmc_string2, string2);

    Parrot_PMC_set_string_keyed(interp, hash, pmc_string, string2);

    string = Parrot_PMC_get_string_keyed(interp, hash, pmc_string);
    Parrot_printf(interp,"%S\n", string);
CODE
planeteater
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_set_string_keyed_int");
    string  = createstring(interp,"nyarlathotep");
    Parrot_PMC_set_string_keyed_int(interp, hash, 42, string);
    string = Parrot_PMC_get_string_keyed_int(interp, hash, 42);
    Parrot_printf(interp,"%S\n", string);
CODE
nyarlathotep
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_defined_keyed_str");
    string = createstring(interp,"foo");
    integer = Parrot_PMC_defined_keyed_str(interp, hash, string);
    Parrot_printf(interp,"%d\n", integer);
CODE
0
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(set|get)_number_keyed_int");
    number  = 42.0;
    number2 = 17.8;
    Parrot_printf(interp,"%.2f\n", number2);
    Parrot_PMC_set_number_keyed_int(interp, rpa, 42, number);
    number2 = Parrot_PMC_get_number_keyed_int(interp, rpa, 42);
    Parrot_printf(interp,"%.2f\n", number2);
CODE
17.80
42.00
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(freeze|thaw|thawfinish)");
    Parrot_PMC_set_integer_native(interp, pmc, 42);
    Parrot_PMC_set_integer_native(interp, pmc2, 99);
    Parrot_printf(interp,"%P\n", pmc);
    Parrot_printf(interp,"%P\n", pmc2);

    /* freeze pmc, thaw to pmc 2 */
    Parrot_PMC_freeze(interp, pmc, rpa);
    Parrot_PMC_thaw(interp, pmc2, rpa);
    Parrot_PMC_thawfinish(interp, pmc2, rpa);

    /* Modify pmc to ensure they are not pointing to the same location */
    Parrot_PMC_set_integer_native(interp, pmc, 1000);
    Parrot_printf(interp,"%P\n", pmc);
    Parrot_printf(interp,"%P\n", pmc2);
CODE
42
99
1000
42
Done!
OUTPUT


extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(add|remove)_attribute");
    type   = Parrot_PMC_typenum(interp, "Class");
    pmc    = Parrot_PMC_new(interp, type);

    string = createstring(interp,"foo");
    Parrot_PMC_set_integer_native(interp, pmc2, 42);

    Parrot_PMC_add_attribute(interp, pmc, string, pmc2);
    Parrot_printf(interp,"42\n");
    Parrot_PMC_remove_attribute(interp, pmc, string);
    Parrot_printf(interp,"42\n");
CODE
42
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(add|remove)_vtable_override");
    type   = Parrot_PMC_typenum(interp, "Class");
    pmc    = Parrot_PMC_new(interp, type);

    string = createstring(interp,"get_bool");
    Parrot_PMC_set_integer_native(interp, pmc2, 42);

    Parrot_PMC_add_vtable_override(interp, pmc, string, pmc2);
    Parrot_printf(interp,"42\n");
    /* TODO: try this on the Object PMC */
    /* Parrot_PMC_remove_vtable_override(interp, pmc, string); */
    Parrot_printf(interp,"42\n");
CODE
42
42
Done!
OUTPUT


extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(add|remove)_method");
    type   = Parrot_PMC_typenum(interp, "Class");
    pmc    = Parrot_PMC_new(interp, type);

    string = createstring(interp,"foo");
    Parrot_PMC_set_integer_native(interp, pmc2, 42);

    Parrot_PMC_add_method(interp, pmc, string, pmc2);
    Parrot_printf(interp,"42\n");
    Parrot_PMC_remove_method(interp, pmc, string);
    Parrot_printf(interp,"42\n");
CODE
42
42
Done!
OUTPUT

# TODO remove_role
extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(add|remove)_role");
    type   = Parrot_PMC_typenum(interp, "Class");
    pmc    = Parrot_PMC_new(interp, type);

    type   = Parrot_PMC_typenum(interp, "Role");
    pmc2   = Parrot_PMC_new(interp, type);

    Parrot_PMC_add_role(interp, pmc, pmc2);
    Parrot_printf(interp,"42\n");
    /*
    Parrot_PMC_remove_role(interp, pmc, pmc2);
    Parrot_printf(interp,"42\n");
    */
CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_setprop");
    string = createstring(interp, "_struct");
    Parrot_PMC_set_integer_native(interp, pmc, 42);
    Parrot_PMC_setprop(interp,continuation , string, pmc);
    pmc2 = Parrot_PMC_getprop(interp,continuation ,string);
    Parrot_printf(interp,"%P\n",pmc2);
CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_delprop");
    type   = Parrot_PMC_typenum(interp, "Class");
    pmc    = Parrot_PMC_new(interp, type);

    Parrot_PMC_delprop(interp, pmc, string);
CODE
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(add|remove)_parent");
    type   = Parrot_PMC_typenum(interp, "Class");
    pmc    = Parrot_PMC_new(interp, type);
    pmc2    = Parrot_PMC_new(interp, type);

    Parrot_PMC_add_parent(interp, pmc, pmc2);
    Parrot_printf(interp,"42\n");
    Parrot_PMC_remove_parent(interp, pmc, pmc2);
    Parrot_printf(interp,"42\n");
CODE
42
42
Done!
OUTPUT


extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_hashvalue");
    Parrot_PMC_set_integer_native(interp, pmc, 42);

    integer = Parrot_PMC_hashvalue(interp, pmc);
    if (integer != 0)
        Parrot_printf(interp,"Got hash!\n", integer);
CODE
Got hash!
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_get_pointer");
    Parrot_PMC_set_integer_native(interp, pmc, 42);

    integer = (Parrot_Int) Parrot_PMC_get_pointer(interp, pmc);
    if (integer > 0)
        Parrot_printf(interp,"Got pointer!\n", integer);
CODE
Got pointer!
Done!
OUTPUT


extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_get_pointer_keyed");
    Parrot_PMC_set_integer_native(interp, pmc, 42);
    Parrot_PMC_set_integer_native(interp, pmc2, 99);

    Parrot_PMC_push_pmc(interp, rpa, pmc);
    Parrot_PMC_push_pmc(interp, rpa, pmc2);
    ns = Parrot_PMC_get_namespace(interp, rpa);

    integer = (Parrot_Int) Parrot_PMC_get_pointer_keyed(interp, ns, key_int);
    if (integer > 0)
        Parrot_printf(interp,"Got pointer_keyed!\n", integer);
CODE
Got pointer_keyed!
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_get_iter");
    Parrot_PMC_set_integer_native(interp, pmc, 42);
    Parrot_PMC_set_integer_native(interp, pmc2, 99);

    Parrot_PMC_push_pmc(interp, rpa, pmc);
    Parrot_PMC_push_pmc(interp, rpa, pmc2);
    pmc3 = Parrot_PMC_get_iter(interp, rpa);
    Parrot_printf(interp,"Great Scott!\n", pmc2);
    /* TODO: Improve this test */
CODE
Great Scott!
Done!
OUTPUT

# TODO: Is this test correct?
extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_get_pmc");
    Parrot_PMC_set_integer_native(interp, pmc, 42);
    Parrot_PMC_push_pmc(interp, rpa, pmc);
    Parrot_PMC_push_pmc(interp, rpa, pmc);
    Parrot_PMC_push_pmc(interp, rpa, pmc);

    pmc3 = Parrot_PMC_get_iter(interp, rpa);
    pmc2 = Parrot_PMC_get_pmc(interp, pmc3);
    Parrot_printf(interp,"%P\n", pmc2);
CODE
3
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_get_namespace");
    Parrot_PMC_set_integer_native(interp, pmc, 42);
    Parrot_PMC_set_integer_native(interp, pmc2, 99);

    Parrot_PMC_push_pmc(interp, rpa, pmc);
    Parrot_PMC_push_pmc(interp, rpa, pmc2);
    pmc3 = Parrot_PMC_get_namespace(interp, rpa);
    Parrot_printf(interp,"Great Scott!\n", pmc2);
    /* TODO: Improve this test */
CODE
Great Scott!
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_clone");
    Parrot_PMC_set_integer_native(interp, pmc, 42);
    pmc2 = Parrot_PMC_clone(interp, pmc);

    Parrot_printf(interp,"%P\n", pmc2);
CODE
42
Done!
OUTPUT


extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_add_float" );
    Parrot_PMC_set_integer_native(interp, pmc, -42);
    number = 43.0;

    Parrot_PMC_i_add_float(interp, pmc, number);
    number = Parrot_PMC_get_number(interp, pmc);
    Parrot_printf(interp,"%.2f\n", number);
CODE
1.00
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(push|pop)_integer" );
    integer  = 42;
    integer2 = 99;

    Parrot_PMC_push_integer(interp, rpa, integer);
    integer2 = Parrot_PMC_pop_integer(interp, rpa);

    Parrot_printf(interp,"%d\n", integer2);
CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_elements" );
    integer  = 42;

    integer = Parrot_PMC_elements(interp,rpa);
    Parrot_printf(interp,"%d\n", integer);

    Parrot_PMC_push_integer(interp, rpa, integer);

    integer = Parrot_PMC_elements(interp,rpa);
    Parrot_printf(interp,"%d\n", integer);
CODE
0
1
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(shift|unshift)_integer" );
    integer  = 42;
    integer2 = 99;

    Parrot_PMC_unshift_integer(interp, rpa, integer);
    integer2 = Parrot_PMC_shift_integer(interp, rpa);

    Parrot_printf(interp,"%d\n", integer2);
CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(push|pop|shift)_pmc" );
    Parrot_PMC_set_integer_native(interp, pmc, 42);
    Parrot_PMC_set_integer_native(interp, pmc2, 99);

    Parrot_PMC_push_pmc(interp, rpa, pmc2);
    Parrot_PMC_push_pmc(interp, rpa, pmc);
    pmc2 = Parrot_PMC_pop_pmc(interp, rpa);
    pmc = Parrot_PMC_shift_pmc(interp,rpa);

    Parrot_printf(interp,"%P\n", pmc);
    Parrot_printf(interp,"%P\n", pmc2);
CODE
99
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(unshift|pop)_pmc" );
    Parrot_PMC_set_integer_native(interp, pmc, 42);
    Parrot_PMC_set_integer_native(interp, pmc2, 99);

    Parrot_PMC_unshift_pmc(interp, rpa, pmc);
    pmc2 = Parrot_PMC_pop_pmc(interp, rpa);

    Parrot_printf(interp,"%P\n", pmc2);
CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(push|pop)_string" );
    string = createstring(interp, "FOO");
    string2 = createstring(interp, "BAR");

    Parrot_PMC_push_string(interp, rpa, string);
    string2 = Parrot_PMC_pop_string(interp, rpa);

    Parrot_printf(interp,"%S\n", string2);
CODE
FOO
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(unshift|shift)_string" );
    string = createstring(interp, "FOO");
    string2 = createstring(interp, "BAR");

    Parrot_PMC_unshift_string(interp, rpa, string);
    string2 = Parrot_PMC_shift_string(interp, rpa);

    Parrot_printf(interp,"%S\n", string2);
CODE
FOO
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(push|pop)_float" );
    number  = 42.0;
    number2 = 99.0;

    Parrot_PMC_push_float(interp, rpa, number);
    number2 = Parrot_PMC_pop_float(interp, rpa);

    Parrot_printf(interp,"%.2f\n", number2);
CODE
42.00
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(unshift|shift)_float" );
    number  = 42.0;
    number2 = 99.0;

    Parrot_PMC_unshift_float(interp, rpa, number);
    number2 = Parrot_PMC_shift_float(interp, rpa);

    Parrot_printf(interp,"%.2f\n", number2);
CODE
42.00
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_add_int" );
    Parrot_PMC_set_integer_native(interp, pmc, -42);
    integer = 43;

    pmc3 = Parrot_PMC_add_int(interp, pmc, integer, pmc3);
    integer = Parrot_PMC_get_integer(interp, pmc3);
    Parrot_printf(interp,"%d\n", integer);
CODE
1
Done!
OUTPUT


extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_absolute" );

    Parrot_PMC_set_integer_native(interp, pmc, -42);
    pmc2 = Parrot_PMC_absolute(interp, pmc, pmc2);

    value = Parrot_PMC_get_integer(interp, pmc2);
    printf("%d\n", (int) value);
CODE
42
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

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_neg" );
    Parrot_PMC_set_integer_native(interp, pmc, -42);

    pmc2 = Parrot_PMC_neg(interp, pmc, pmc2);
    value = Parrot_PMC_get_integer(interp, pmc2);
    printf("%d\n", (int) value);
CODE
42
Done!
OUTPUT


extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_floor_divide" );
    Parrot_PMC_set_integer_native(interp, pmc,  7);
    Parrot_PMC_set_integer_native(interp, pmc2, 3);
    Parrot_PMC_set_integer_native(interp, pmc3, 0);

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

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_floor_divide_float" );
    Parrot_PMC_set_integer_native(interp, pmc,  7);
    number = 3.0;

    Parrot_PMC_i_floor_divide_float(interp, pmc, number);
    number = Parrot_PMC_get_number(interp, pmc);
    printf("%.2f\n", number);
CODE
2.00
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_floor_divide_float" );
    Parrot_PMC_set_integer_native(interp, pmc,  7);
    Parrot_PMC_set_integer_native(interp, pmc3, 0);
    number = 3.0;

    pmc3 = Parrot_PMC_floor_divide_float(interp, pmc, number, pmc3);
    number = Parrot_PMC_get_number(interp, pmc3);
    printf("%.2f\n", number);
CODE
2.00
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_floor_divide_int" );
    Parrot_PMC_set_integer_native(interp, pmc,  7);
    Parrot_PMC_set_integer_native(interp, pmc3, 0);
    integer = 3;

    pmc3 = Parrot_PMC_floor_divide_int(interp, pmc, integer, pmc3);
    integer = Parrot_PMC_get_integer(interp, pmc3);
    printf("%d\n", integer);
CODE
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

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_multiply_int" );

    Parrot_PMC_set_integer_native(interp, pmc,  21);
    Parrot_PMC_set_integer_native(interp, pmc3, 0);
    integer = 2;

    /*
       We must pass in the destination, but the return
       value of the function must be used. This is broken.
    */
    pmc3 = Parrot_PMC_multiply_int(interp, pmc, integer, pmc3);
    integer = Parrot_PMC_get_integer(interp, pmc3);
    printf("%d\n", integer);
CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_multiply" );

    Parrot_PMC_set_integer_native(interp, pmc,  21);
    Parrot_PMC_set_integer_native(interp, pmc2, 2);

    /*
       We must pass in the destination, but the return
       value of the function must be used. This is broken.
    */
    Parrot_PMC_i_multiply(interp, pmc, pmc2);
    integer = Parrot_PMC_get_integer(interp, pmc);
    printf("%d\n", integer);
CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_multiply_int" );

    Parrot_PMC_set_integer_native(interp, pmc,  21);
    integer = 2;

    /*
       We must pass in the destination, but the return
       value of the function must be used. This is broken.
    */
    Parrot_PMC_i_multiply_int(interp, pmc, integer);
    integer = Parrot_PMC_get_integer(interp, pmc);
    printf("%d\n", integer);
CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_multiply_float" );

    Parrot_PMC_set_integer_native(interp, pmc,  21);
    number = 2.0;

    /*
       We must pass in the destination, but the return
       value of the function must be used. This is broken.
    */
    Parrot_PMC_i_multiply_float(interp, pmc, number);
    number = Parrot_PMC_get_integer(interp, pmc);
    printf("%.2f\n", number);
CODE
42.00
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_multiply_float" );

    Parrot_PMC_set_integer_native(interp, pmc,  21);
    Parrot_PMC_set_integer_native(interp, pmc3, 0);
    number = 2.0;

    /*
       We must pass in the destination, but the return
       value of the function must be used. This is broken.
    */
    pmc3 = Parrot_PMC_multiply_float(interp, pmc, number, pmc3);
    number = Parrot_PMC_get_number(interp, pmc3);
    printf("%.2f\n", number);
CODE
42.00
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_divide" );
    Parrot_PMC_set_integer_native(interp, pmc,  42);
    Parrot_PMC_set_integer_native(interp, pmc2, 21);
    Parrot_PMC_set_integer_native(interp, pmc3, 0);

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

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_visit" );
    /* TODO: Test this properly */
    Parrot_PMC_visit(interp, pmc, pmc2);
    printf("42\n", (int) value);
CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_divide" );
    Parrot_PMC_set_integer_native(interp, pmc,  42);
    Parrot_PMC_set_integer_native(interp, pmc2, 21);
    Parrot_PMC_set_integer_native(interp, pmc3, 0);

    Parrot_PMC_i_divide(interp, pmc, pmc2);
    value = Parrot_PMC_get_integer(interp, pmc);
    printf("%d\n", (int) value);
CODE
2
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_divide_int" );
    Parrot_PMC_set_integer_native(interp, pmc,  42);
    integer = 21;

    Parrot_PMC_i_divide_int(interp, pmc, integer);
    integer = Parrot_PMC_get_integer(interp, pmc);
    printf("%d\n", integer);
CODE
2
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_divide_int" );
    Parrot_PMC_set_integer_native(interp, pmc,  42);
    Parrot_PMC_set_integer_native(interp, pmc3, 0);
    integer = 21;

    pmc3 = Parrot_PMC_divide_int(interp, pmc, integer, pmc3);
    integer = Parrot_PMC_get_integer(interp, pmc3);
    printf("%d\n", integer);
CODE
2
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_divide_float" );
    Parrot_PMC_set_integer_native(interp, pmc,  42);
    number = 21.0;
    Parrot_PMC_i_divide_float(interp, pmc, number);
    number = Parrot_PMC_get_number(interp, pmc);
    printf("%.2f\n", number);
CODE
2.00
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_divide_float" );
    Parrot_PMC_set_integer_native(interp, pmc,  42);
    Parrot_PMC_set_integer_native(interp, pmc3, 0);
    number = 21.0;
    pmc3 = Parrot_PMC_divide_float(interp, pmc, number, pmc3);
    number = Parrot_PMC_get_number(interp, pmc3);
    printf("%.2f\n", number);
CODE
2.00
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

extend_vtable_output_is(<<'CODE',<<'OUTPUT', "Parrot_PMC_i_modulus" );
    Parrot_PMC_set_integer_native(interp, pmc,  50);
    Parrot_PMC_set_integer_native(interp, pmc2, 42);
    Parrot_PMC_set_integer_native(interp, pmc3, 0);

    Parrot_PMC_i_modulus(interp, pmc, pmc2);
    value = Parrot_PMC_get_integer(interp, pmc);
    printf("%d\n", value);
    value = Parrot_PMC_get_integer(interp, pmc2);
    printf("%d\n", value);
CODE
8
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE',<<'OUTPUT', "Parrot_PMC_i_modulus_int" );
    Parrot_PMC_set_integer_native(interp, pmc,  50);
    integer = 42;

    Parrot_PMC_i_modulus_int(interp, pmc, integer);
    value = Parrot_PMC_get_integer(interp, pmc);
    printf("%d\n", (int)value);
CODE
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

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_is_same" );
    Parrot_PMC_set_integer_native(interp, pmc, -42);
    Parrot_PMC_set_integer_native(interp, pmc2, 42);

    integer = Parrot_PMC_is_same(interp, pmc, pmc2);
    printf("%d\n", (int) integer);

    Parrot_PMC_set_integer_native(interp, pmc2, -42);

    integer = Parrot_PMC_is_same(interp, pmc, pmc2);
    printf("%d\n", (int) integer);

    integer = Parrot_PMC_is_same(interp, pmc, pmc);
    printf("%d\n", (int) integer);
CODE
0
0
1
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_is_equal" );
    Parrot_PMC_set_integer_native(interp, pmc, -42);
    Parrot_PMC_set_integer_native(interp, pmc2, 42);

    integer = Parrot_PMC_is_equal(interp, pmc, pmc2);
    printf("%d\n", (int) integer);

    Parrot_PMC_set_integer_native(interp, pmc2, -42);

    integer = Parrot_PMC_is_equal(interp, pmc, pmc2);
    printf("%d\n", (int) integer);
CODE
0
1
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_is_equal_num");
    Parrot_PMC_set_number_native(interp, pmc, -42);
    Parrot_PMC_set_number_native(interp, pmc2, 42);

    integer = Parrot_PMC_is_equal_num(interp, pmc, pmc2);
    Parrot_printf(interp, "%d\n", integer);

    Parrot_PMC_set_number_native(interp, pmc2, -42);

    integer = Parrot_PMC_is_equal_num(interp, pmc, pmc2);
    Parrot_printf(interp,"%d\n", integer);
CODE
0
1
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_is_equal_string" );
     string  = createstring(interp, "FOO");
     string2 = createstring(interp, "BAR");

     Parrot_PMC_assign_string_native(interp, pmc_string, string);
     Parrot_PMC_assign_string_native(interp, pmc_string2,string2);

     integer = Parrot_PMC_is_equal(interp, pmc_string, pmc_string2);
     Parrot_printf(interp, "%d\n", (int)integer);

     Parrot_PMC_set_string_native(interp, pmc_string2, string);

     integer = Parrot_PMC_is_equal(interp, pmc_string, pmc_string2);
     Parrot_printf(interp, "%d\n", (int)integer);
CODE
0
1
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_concatenate_str" );
     string  = createstring(interp, "FOO");
     string2 = createstring(interp, "BAR");

     Parrot_PMC_assign_string_native(interp, pmc_string, string);

     pmc_string3 = Parrot_PMC_concatenate_str(interp, pmc_string, string2, pmc_string3);
     Parrot_printf(interp, "%P\n", pmc_string3);
CODE
FOOBAR
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_concatenate" );
     string  = createstring(interp, "FOO");

     Parrot_PMC_assign_string_native(interp, pmc_string, string);

     Parrot_PMC_i_concatenate(interp, pmc_string, pmc_string);
     Parrot_printf(interp, "%P\n", pmc_string);
CODE
FOOFOO
Done!
OUTPUT


extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_concatenate_str" );
     string  = createstring(interp, "FOO");
     string2 = createstring(interp, "BAR");

     Parrot_PMC_assign_string_native(interp, pmc_string, string);

     Parrot_PMC_i_concatenate_str(interp, pmc_string, string2);
     Parrot_printf(interp, "%P\n", pmc_string);
CODE
FOOBAR
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_concatenate" );
     string  = createstring(interp, "FOO");
     string2 = createstring(interp, "BAR");

     Parrot_PMC_assign_string_native(interp, pmc_string, string);
     Parrot_PMC_assign_string_native(interp, pmc_string2,string2);

     pmc_string3 = Parrot_PMC_concatenate(interp, pmc_string, pmc_string2, pmc_string3);
     Parrot_printf(interp, "%P\n", pmc_string3);
CODE
FOOBAR
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_subtract" );

    Parrot_PMC_set_integer_native(interp, pmc,  52);
    Parrot_PMC_set_integer_native(interp, pmc2, 10);

    pmc3 = Parrot_PMC_subtract(interp, pmc, pmc2, pmc3);
    Parrot_printf(interp, "%P\n", pmc3);
    pmc3 = Parrot_PMC_subtract(interp, pmc2, pmc, pmc3);
    Parrot_printf(interp, "%P\n", pmc3);

CODE
42
-42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_subtract" );

    Parrot_PMC_set_integer_native(interp, pmc,  52);
    Parrot_PMC_set_integer_native(interp, pmc2, 10);

    Parrot_PMC_i_subtract(interp, pmc, pmc2);
    Parrot_printf(interp, "%P\n", pmc);

CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_subtract_int" );

    Parrot_PMC_set_integer_native(interp, pmc,  52);
    integer = 10;

    pmc3 = Parrot_PMC_subtract_int(interp, pmc, integer, pmc3);
    Parrot_printf(interp, "%P\n", pmc3);

CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_subtract_float" );

    Parrot_PMC_set_integer_native(interp, pmc,  52);
    number = 10.0;

    pmc3 = Parrot_PMC_subtract_float(interp, pmc, number, pmc3);
    Parrot_printf(interp, "%P\n", pmc3);

CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_subtract_int" );

    Parrot_PMC_set_integer_native(interp, pmc,  52);
    integer = 10;

    Parrot_PMC_i_subtract_int(interp, pmc, integer);
    Parrot_printf(interp, "%P\n", pmc);

CODE
42
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_subtract_float" );

    Parrot_PMC_set_integer_native(interp, pmc,  52);
    number = 10.0;

    Parrot_PMC_i_subtract_float(interp, pmc, number);
    Parrot_printf(interp, "%P\n", pmc);

CODE
42
Done!
OUTPUT


extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_cmp" );
    Parrot_PMC_set_integer_native(interp, pmc, 42);
    Parrot_PMC_set_integer_native(interp, pmc2, 17);

    integer = Parrot_PMC_cmp(interp, pmc, pmc2);
    Parrot_printf(interp,"%d\n", (int) integer);

    Parrot_PMC_set_integer_native(interp, pmc, 17);
    Parrot_PMC_set_integer_native(interp, pmc2, 42);

    integer = Parrot_PMC_cmp(interp, pmc, pmc2);
    Parrot_printf(interp,"%d\n", (int) integer);

    Parrot_PMC_set_integer_native(interp, pmc, 42);

    integer = Parrot_PMC_cmp(interp, pmc, pmc2);
    Parrot_printf(interp,"%d\n", (int) integer);
CODE
1
-1
0
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_cmp_string" );
    Parrot_PMC_set_integer_native(interp, pmc, 42);
    Parrot_PMC_set_integer_native(interp, pmc2, 17);

    integer = Parrot_PMC_cmp_string(interp, pmc, pmc2);
    Parrot_printf(interp,"%d\n", integer );

    Parrot_PMC_set_integer_native(interp, pmc, 17);
    Parrot_PMC_set_integer_native(interp, pmc2, 42);

    integer = Parrot_PMC_cmp_string(interp, pmc, pmc2);
    Parrot_printf(interp,"%d\n", integer );

    Parrot_PMC_set_integer_native(interp, pmc, 42);

    integer = Parrot_PMC_cmp_string(interp, pmc, pmc2);
    Parrot_printf(interp,"%d\n", integer );
CODE
1
-1
0
Done!
OUTPUT


#extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_cmp_pmc" );
#    Parrot_PMC_set_integer_native(interp, pmc, 42);
#    Parrot_PMC_set_integer_native(interp, pmc2, 17);
#
#    pmc3 = Parrot_PMC_cmp_pmc(interp, pmc, pmc2);
#    Parrot_printf(interp,"%P\n", pmc3 );
#
#    Parrot_PMC_set_integer_native(interp, pmc, 17);
#    Parrot_PMC_set_integer_native(interp, pmc2, 42);
#
#    pmc3 = Parrot_PMC_cmp_pmc(interp, pmc, pmc2);
#    Parrot_printf(interp,"%P\n", pmc3 );
#
#    Parrot_PMC_set_integer_native(interp, pmc, 42);
#
#    pmc3 = Parrot_PMC_cmp_pmc(interp, pmc, pmc2);
#    Parrot_printf(interp,"%P\n", pmc3 );
#CODE
#1
#-1
#0
#Done!
#OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_cmp_num" );
    Parrot_PMC_set_integer_native(interp, pmc, 42);
    Parrot_PMC_set_integer_native(interp, pmc2, 17);

    integer = Parrot_PMC_cmp_num(interp, pmc, pmc2);
    Parrot_printf(interp,"%d\n", integer );

    Parrot_PMC_set_integer_native(interp, pmc, 17);
    Parrot_PMC_set_integer_native(interp, pmc2, 42);

    integer = Parrot_PMC_cmp_num(interp, pmc, pmc2);
    Parrot_printf(interp,"%d\n", integer );

    Parrot_PMC_set_integer_native(interp, pmc, 42);

    integer = Parrot_PMC_cmp_num(interp, pmc, pmc2);
    Parrot_printf(interp,"%d\n", integer );
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

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_i_add_int" );
    Parrot_PMC_set_integer_native(interp, pmc, -42);

    Parrot_PMC_i_add_int(interp, pmc, 1000);
    value = Parrot_PMC_get_integer(interp, pmc);
    printf("%d\n", (int) value);
CODE
958
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_add_float" );
    Parrot_PMC_set_integer_native(interp, pmc, -42);
    number = 1000.0;

    pmc3 = Parrot_PMC_add_float(interp, pmc, number, pmc3);
    number = Parrot_PMC_get_number(interp, pmc3);
    printf("%.2f\n", number);
CODE
958.00
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

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_(set|get)_bool" );
    Parrot_PMC_set_bool(interp, pmc, 1);
    integer = Parrot_PMC_get_bool(interp, pmc);
    printf("%d\n", (int) integer);

    Parrot_PMC_set_bool(interp, pmc, 0);
    integer = Parrot_PMC_get_bool(interp, pmc);
    printf("%d\n", (int) integer);
CODE
1
0
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_type" );
    Parrot_PMC_set_integer_native(interp, pmc, -42);

    integer = Parrot_PMC_type(interp, pmc);

    if (integer > 0)
        Parrot_printf(interp,"42\n", integer);
CODE
42
Done!
OUTPUT


extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_get_class" );
    Parrot_PMC_set_integer_native(interp, pmc, -42);

    pmc_string = Parrot_PMC_get_class(interp, pmc);

    Parrot_printf(interp,"%P\n", pmc_string);
CODE
Integer
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_can" );
    Parrot_PMC_set_integer_native(interp, pmc, -42);

    string = createstring(interp, "foo");
    integer = Parrot_PMC_can(interp,pmc,string);
    printf("%d\n", (int) integer);

    string = createstring(interp, "add");
    integer = Parrot_PMC_can(interp,pmc,string);
    printf("%d\n", (int) integer);
CODE
0
1
Done!
OUTPUT

extend_vtable_output_is(<<'CODE', <<'OUTPUT', "Parrot_PMC_does" );
    Parrot_PMC_set_integer_native(interp, pmc, -42);

    string = createstring(interp, "foo");
    integer = Parrot_PMC_does(interp,pmc,string);
    printf("%d\n", (int) integer);

    /* TODO: This doesn't seem to work
    string = createstring(interp, "Integer");
    integer = Parrot_PMC_does(interp,pmc,string);
    printf("%d\n", (int) integer);
    */
CODE
0
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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

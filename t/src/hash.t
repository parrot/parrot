#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$
# Tests the hash.h API without reference to PMCs.

=head1 NAME

t/src/hash.t - Hashes

=head1 SYNOPSIS

	% perl t/src/hash.t

=head1 DECSRIPTION

Tests the Hash functions.

=cut

use Parrot::Test tests => 10;

my $main = <<'CODE';
#include <parrot/parrot.h>
#include <parrot/embed.h>

static opcode_t *the_test(Parrot_Interp, opcode_t *, opcode_t *);

int exit_value = 0;

int main(int argc, char* argv[])
{
    Parrot_Interp interpreter = Parrot_new(NULL);
    if (!interpreter) {
        return 1;
    }
    Parrot_init(interpreter);

    Parrot_run_native(interpreter, the_test);

    Parrot_exit(exit_value);
    return exit_value;
}

CODE

c_output_is($main . <<'CODE', <<'OUTPUT', "new_hash");

static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	opcode_t *cur_op, opcode_t *start)
{
    Hash *hash;
    STRING *key;
    HashEntry value;

    UNUSED(cur_op);
    UNUSED(start);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	PIO_eprintf(interpreter, "hash creation failed\n");
	exit_value = 1;
	return NULL;
    }

    PIO_eprintf(interpreter, "ok\n");

    return NULL;
}

CODE
ok
OUTPUT

c_output_is($main . <<'CODE', <<'OUTPUT', "hash_put");

static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	opcode_t *cur_op, opcode_t *start)
{
    Hash *hash;
    STRING *key;
    /* FIXME this is wrong - hash takes pointers only
       when DOD is triggered, this fails
    */
    HashEntry value;

    UNUSED(cur_op);
    UNUSED(start);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	PIO_eprintf(interpreter, "hash creation failed\n");
	exit_value = 1;
	return NULL;
    }

    key = string_from_cstring(interpreter, "fortytwo", 0);
    value.type = enum_hash_int;
    value.val.int_val = 42;
    hash_put(interpreter, hash, key, &value);

    PIO_eprintf(interpreter, "ok\n");

    return NULL;
}

CODE
ok
OUTPUT

c_output_is($main . <<'CODE', <<'OUTPUT', "hash_get");

static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	opcode_t *cur_op, opcode_t *start)
{
    Hash *hash;
    STRING *key;
    HashEntry _value;
    HashEntry *value = &_value;

    UNUSED(cur_op);
    UNUSED(start);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	PIO_eprintf(interpreter, "hash creation failed\n");
	exit_value = 1;
	return NULL;
    }

    key = string_from_cstring(interpreter, "fortytwo", 0);
    value->type = enum_hash_int;
    value->val.int_val = 42;
    hash_put(interpreter, hash, key, value);
    value = hash_get(interpreter, hash, key);

    PIO_eprintf(interpreter, "%i\n", (int)value->val.int_val);

    return NULL;
}

CODE
42
OUTPUT

c_output_is($main . <<'CODE', <<'OUTPUT', "hash_get with NULL key");

static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	opcode_t *cur_op, opcode_t *start)
{
    Hash *hash;
    STRING *key;
    HashEntry _value;
    HashEntry *value = &_value;

    UNUSED(cur_op);
    UNUSED(start);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	PIO_eprintf(interpreter, "hash creation failed\n");
	exit_value = 1;
	return NULL;
    }

    /*
     * It might be worth finding out where this fails to work,
     * no key? fail to put? fail to get?
     *
     * string_from_cstring did segfault
     * it works now exactly as the next (empty key) case
     */

    key = string_from_cstring(interpreter, NULL, 0);
    value->type = enum_hash_int;
    value->val.int_val = 42;
    hash_put(interpreter, hash, key, value);
    value = hash_get(interpreter, hash, key);

    PIO_eprintf(interpreter, "%i\n", (int)value->val.int_val);

    return NULL;
}

CODE
42
OUTPUT

c_output_is($main . <<'CODE', <<'OUTPUT', "hash_get with empty string key");

static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	opcode_t *cur_op, opcode_t *start)
{
    Hash *hash;
    STRING *key;
    HashEntry _value;
    HashEntry *value = &_value;

    UNUSED(cur_op);
    UNUSED(start);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	PIO_eprintf(interpreter, "hash creation failed\n");
	exit_value = 1;
	return NULL;
    }

    key = string_from_cstring(interpreter, "", 0);
    value->type = enum_hash_int;
    value->val.int_val = 42;
    hash_put(interpreter, hash, key, value);
    value = hash_get(interpreter, hash, key);

    PIO_eprintf(interpreter, "%i\n", value->val.int_val);

    return NULL;
}

CODE
42
OUTPUT

c_output_is($main . <<'CODE', <<'OUTPUT', "hash_get with big key");

#define BIGLEN 999999

static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	opcode_t *cur_op, opcode_t *start)
{
    Hash *hash;
    PMC *h;
    STRING *key;
    char *big;
    PMC *i, *j;

    UNUSED(cur_op);
    UNUSED(start);

    h = pmc_new(interpreter, enum_class_PerlHash);
    hash = PMC_struct_val(h);
    i = pmc_new(interpreter, enum_class_PerlInt);

    if ( hash == NULL ) {
	PIO_eprintf(interpreter, "hash creation failed\n");
	exit_value = 1;
	return NULL;
    }

    big = calloc(BIGLEN, sizeof(char));
    big = memset(big, 'x', BIGLEN - 1);

    key = string_from_cstring(interpreter, big, 0);

    VTABLE_set_integer_native(interpreter, i, 42);
    hash_put(interpreter, hash, key, i);
    j = hash_get(interpreter, hash, key);

    PIO_eprintf(interpreter, "%Pi\n", j);

    return NULL;
}

CODE
42
OUTPUT

c_output_is($main . <<'CODE', <<'OUTPUT', "hash_size");

static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	opcode_t *cur_op, opcode_t *start)
{
    Hash *hash;
    STRING *key;
    HashEntry value;

    UNUSED(cur_op);
    UNUSED(start);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	PIO_eprintf(interpreter, "hash creation failed\n");
	exit_value = 1;
	return NULL;
    }

    key = string_from_cstring(interpreter, "fortytwo", 0);
    value.type = enum_hash_int;
    value.val.int_val = 42;
    hash_put(interpreter, hash, key, &value);

    key = string_from_cstring(interpreter, "twocents", 0);
    value.type = enum_hash_num;
    value.val.num_val = 0.02;
    hash_put(interpreter, hash, key, &value);

    key = string_from_cstring(interpreter, "blurb", 0);
    value.type = enum_hash_string;
    value.val.string_val = key;
    hash_put(interpreter, hash, key, &value);

    PIO_eprintf(interpreter, "%i\n", hash_size(interpreter, hash));

    return NULL;
}

CODE
3
OUTPUT

c_output_is($main . <<'CODE', <<'OUTPUT', "hash_delete");

static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	opcode_t *cur_op, opcode_t *start)
{
    Hash *hash;
    STRING *key;
    PMC *value;

    UNUSED(cur_op);
    UNUSED(start);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	PIO_eprintf(interpreter, "hash creation failed\n");
	exit_value = 1;
	return NULL;
    }

    key = string_from_cstring(interpreter, "fortytwo", 0);
    value = pmc_new(interpreter, enum_class_PerlInt);
    VTABLE_set_integer_native(interpreter, value, 42);
    hash_put(interpreter, hash, key, value);

    key = string_from_cstring(interpreter, "twocents", 0);
    value = pmc_new(interpreter, enum_class_PerlNum);
    VTABLE_set_number_native(interpreter, value, 0.02);
    hash_put(interpreter, hash, key, value);

    key = string_from_cstring(interpreter, "blurb", 0);
    value = pmc_new(interpreter, enum_class_PerlString);
    VTABLE_set_string_native(interpreter, value, key);
    hash_put(interpreter, hash, key, value);

    PIO_eprintf(interpreter, "%i\n", hash_size(interpreter, hash));

    hash_delete(interpreter, hash, key);

    PIO_eprintf(interpreter, "%i\n", hash_size(interpreter, hash));

    return NULL;
}

CODE
3
2
OUTPUT

c_output_is($main . <<'CODE', <<'OUTPUT', "hash_clone");

static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	opcode_t *cur_op, opcode_t *start)
{
    Hash *hash;
    Hash *hash2;
    STRING *key;
    PMC *value;

    UNUSED(cur_op);
    UNUSED(start);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	PIO_eprintf(interpreter, "hash creation failed\n");
	exit_value = 1;
	return NULL;
    }

    key = string_from_cstring(interpreter, "fortytwo", 0);
    value = pmc_new(interpreter, enum_class_PerlInt);
    VTABLE_set_integer_native(interpreter, value, 42);
    hash_put(interpreter, hash, key, value);

    value = hash_get(interpreter, hash, key);

    PIO_eprintf(interpreter, "%i\n", (int)VTABLE_get_integer(interpreter, value));

    hash_clone(interpreter, hash, &hash2);

    value = hash_get(interpreter, hash2, key);

    PIO_eprintf(interpreter, "%i\n", (int)VTABLE_get_integer(interpreter, value));

    return NULL;
}

CODE
42
42
OUTPUT

SKIP: {
  skip("changed this useless dump format", 1);
c_output_like($main . <<'CODE', <<'OUTPUT', "dump_hash");

static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	opcode_t *cur_op, opcode_t *start)
{
    Hash *hash;
    STRING *key;
    HashEntry value;

    UNUSED(cur_op);
    UNUSED(start);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	PIO_eprintf(interpreter, "hash creation failed\n");
	exit_value = 1;
	return NULL;
    }

    key = string_from_cstring(interpreter, "fortytwo", 0);
    value.type = enum_hash_int;
    value.val.int_val = 42;
    hash_put(interpreter, hash, key, &value);

    key = string_from_cstring(interpreter, "twocents", 0);
    value.type = enum_hash_num;
    value.val.num_val = 0.02;
    hash_put(interpreter, hash, key, &value);

    key = string_from_cstring(interpreter, "blurb", 0);
    value.type = enum_hash_string;
    value.val.string_val = key;
    hash_put(interpreter, hash, key, &value);

    dump_hash(interpreter, hash);

    return NULL;
}

CODE
/Hashtable\[3\/16\]
  Bucket \d+: \([0-9a-f]*\)
  Bucket \d+: \([0-9a-f]*\) -> \([0-9a-f]*\)
  Bucket \d+: \(0\) -> \(0\) -> \(0\) -> \(0\) -> \(0\) -> \(0\) -> \(0\) -> \(0\) -> \(0\)/
OUTPUT
}

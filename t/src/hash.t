#! perl -w
# Tests the hash.h API without reference to PMCs.

use Parrot::Test tests => 10;

c_output_is(<<'CODE', <<'OUTPUT', "new_hash");

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    Interp* interpreter;
    Hash *hash;
    STRING *key;
    HashEntry value;

    interpreter = Parrot_new(NULL);

    if ( interpreter == NULL ) return 1;

    Parrot_init(interpreter);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	printf("hash creation failed\n");
	return 1;
    }

    printf("ok\n");

    return 0;
}

CODE
ok
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "hash_put");

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    Interp* interpreter;
    Hash *hash;
    STRING *key;
    HashEntry value;

    interpreter = Parrot_new(NULL);

    if ( interpreter == NULL ) return 1;

    Parrot_init(interpreter);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	printf("hash creation failed\n");
	return 1;
    }

    key = string_from_cstring(interpreter, "fortytwo", 0);
    value.type = enum_hash_int;
    value.val.int_val = 42;
    hash_put(interpreter, hash, key, &value);

    printf("ok\n");

    return 0;
}

CODE
ok
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "hash_get");

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    Interp* interpreter;
    Hash *hash;
    STRING *key;
    HashEntry _value;
    HashEntry *value = &_value;

    interpreter = Parrot_new(NULL);

    if ( interpreter == NULL ) return 1;

    Parrot_init(interpreter);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	printf("hash creation failed\n");
	return 1;
    }

    key = string_from_cstring(interpreter, "fortytwo", 0);
    value->type = enum_hash_int;
    value->val.int_val = 42;
    hash_put(interpreter, hash, key, value);
    value = hash_get(interpreter, hash, key);

    printf("%i\n", (int)value->val.int_val);

    return 0;
}

CODE
42
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "hash_get with NULL key");

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    Interp* interpreter;
    Hash *hash;
    STRING *key;
    HashEntry _value;
    HashEntry *value = &_value;

    interpreter = Parrot_new(NULL);

    if ( interpreter == NULL ) return 1;

    Parrot_init(interpreter);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	printf("hash creation failed\n");
	return 1;
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

    printf("%i\n", (int)value->val.int_val);

    return 0;
}

CODE
42
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "hash_get with empty string key");

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    Interp* interpreter;
    Hash *hash;
    STRING *key;
    HashEntry _value;
    HashEntry *value = &_value;

    interpreter = Parrot_new(NULL);

    if ( interpreter == NULL ) return 1;

    Parrot_init(interpreter);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	printf("hash creation failed\n");
	return 1;
    }

    key = string_from_cstring(interpreter, "", 0);
    value->type = enum_hash_int;
    value->val.int_val = 42;
    hash_put(interpreter, hash, key, value);
    value = hash_get(interpreter, hash, key);

    printf("%i\n", value->val.int_val);

    return 0;
}

CODE
42
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "hash_get with big key");

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"
#define BIGLEN 999999

int do_test(Interp *interpreter);

int main(int argc, char* argv[]) {
    Interp* interpreter;
    interpreter = Parrot_new(NULL);

    if ( interpreter == NULL ) return 1;
    interpreter->lo_var_ptr = &interpreter;

    Parrot_init(interpreter);
    return do_test(interpreter);
}

int do_test(Interp *interpreter)
{
    Hash *hash;
    STRING *key;
    HashEntry _value;
    HashEntry *value = &_value;
    char *big;

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	printf("hash creation failed\n");
	return 1;
    }

    big = calloc(BIGLEN, sizeof(char));
    big = memset(big, 'x', BIGLEN - 1);

    key = string_from_cstring(interpreter, big, NULL);

    value->type = enum_hash_int;
    value->val.int_val = 42;
    hash_put(interpreter, hash, key, value);
    value = hash_get(interpreter, hash, key);

    printf("%i\n", value->val.int_val);

    return 0;
}

CODE
42
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "hash_size");

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    Interp* interpreter;
    Hash *hash;
    STRING *key;
    HashEntry value;

    interpreter = Parrot_new(NULL);

    if ( interpreter == NULL ) return 1;

    Parrot_init(interpreter);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	printf("hash creation failed\n");
	return 1;
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

    printf("%i\n", hash_size(interpreter, hash));

    return 0;
}

CODE
3
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "hash_delete");

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    Interp* interpreter;
    Hash *hash;
    STRING *key;
    PMC *value;

    interpreter = Parrot_new(NULL);

    if ( interpreter == NULL ) return 1;

    Parrot_init(interpreter);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	printf("hash creation failed\n");
	return 1;
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

    printf("%i\n", hash_size(interpreter, hash));

    hash_delete(interpreter, hash, key);

    printf("%i\n", hash_size(interpreter, hash));

    return 0;
}

CODE
3
2
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "hash_clone");

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    Interp* interpreter;
    Hash *hash;
    Hash *hash2;
    STRING *key;
    PMC *value;

    interpreter = Parrot_new(NULL);

    if ( interpreter == NULL ) return 1;

    Parrot_init(interpreter);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	printf("hash creation failed\n");
	return 1;
    }

    key = string_from_cstring(interpreter, "fortytwo", 0);
    value = pmc_new(interpreter, enum_class_PerlInt);
    VTABLE_set_integer_native(interpreter, value, 42);
    hash_put(interpreter, hash, key, value);

    value = hash_get(interpreter, hash, key);

    printf("%i\n", (int)VTABLE_get_integer(interpreter, value));

    hash_clone(interpreter, hash, &hash2);

    value = hash_get(interpreter, hash2, key);

    printf("%i\n", (int)VTABLE_get_integer(interpreter, value));

    return 0;
}

CODE
42
42
OUTPUT

c_output_like(<<'CODE', <<'OUTPUT', "dump_hash");

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    Interp* interpreter;
    Hash *hash;
    STRING *key;
    HashEntry value;

    interpreter = Parrot_new(NULL);

    if ( interpreter == NULL ) return 1;

    Parrot_init(interpreter);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	printf("hash creation failed\n");
	return 1;
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

    return 0;
}

CODE
/Hashtable\[3\/16\]
  Bucket \d+: \([0-9a-f]*\)
  Bucket \d+: \([0-9a-f]*\) -> \([0-9a-f]*\)
  Bucket \d+: \(0\) -> \(0\) -> \(0\) -> \(0\) -> \(0\) -> \(0\) -> \(0\) -> \(0\) -> \(0\)/
OUTPUT

#! perl -w
# Tests the hash.h API without reference to PMCs.

use Parrot::Test tests => 12;

c_output_is(<<'CODE', <<'OUTPUT', "new_hash");

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    Interp* interpreter;
    HASH _hash;
    HASH *hash = &_hash;
    STRING *key;
    HASH_ENTRY value;

    interpreter = Parrot_new();

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

SKIP: {
skip "hash_destroy not implemented", 1;
c_output_is(<<'CODE', <<'OUTPUT', "hash_destroy");

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    Interp* interpreter;
    HASH _hash;
    HASH *hash = &_hash;
    STRING *key;
    HASH_ENTRY value;

    interpreter = Parrot_new();

    if ( interpreter == NULL ) return 1;

    Parrot_init(interpreter);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	printf("hash creation failed\n");
	return 1;
    }

    hash_destroy(interpreter, hash);

    printf("ok\n");

    return 0;
}

CODE
ok
OUTPUT
}

c_output_is(<<'CODE', <<'OUTPUT', "hash_put");

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    Interp* interpreter;
    HASH _hash;
    HASH *hash = &_hash;
    STRING *key;
    HASH_ENTRY value;

    interpreter = Parrot_new();

    if ( interpreter == NULL ) return 1;

    Parrot_init(interpreter);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	printf("hash creation failed\n");
	return 1;
    }

    key = string_from_cstring(interpreter, "fortytwo", NULL);
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
    HASH _hash;
    HASH *hash = &_hash;
    STRING *key;
    HASH_ENTRY _value;
    HASH_ENTRY *value = &_value;

    interpreter = Parrot_new();

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
    HASH _hash;
    HASH *hash = &_hash;
    STRING *key;
    HASH_ENTRY _value;
    HASH_ENTRY *value = &_value;

    interpreter = Parrot_new();

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
    HASH _hash;
    HASH *hash = &_hash;
    STRING *key;
    HASH_ENTRY _value;
    HASH_ENTRY *value = &_value;

    interpreter = Parrot_new();

    if ( interpreter == NULL ) return 1;

    Parrot_init(interpreter);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	printf("hash creation failed\n");
	return 1;
    }

    key = string_from_cstring(interpreter, "", NULL);
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
    interpreter = Parrot_new();

    if ( interpreter == NULL ) return 1;
    interpreter->lo_var_ptr = &interpreter;

    Parrot_init(interpreter);
    return do_test(interpreter);
}

int do_test(Interp *interpreter)
[
    HASH _hash;
    HASH *hash = &_hash;
    STRING *key;
    HASH_ENTRY _value;
    HASH_ENTRY *value = &_value;
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
    HASH _hash;
    HASH *hash = &_hash;
    STRING *key;
    HASH_ENTRY value;

    interpreter = Parrot_new();

    if ( interpreter == NULL ) return 1;

    Parrot_init(interpreter);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	printf("hash creation failed\n");
	return 1;
    }

    key = string_from_cstring(interpreter, "fortytwo", NULL);
    value.type = enum_hash_int;
    value.val.int_val = 42;
    hash_put(interpreter, hash, key, &value);

    key = string_from_cstring(interpreter, "twocents", NULL);
    value.type = enum_hash_num;
    value.val.num_val = 0.02;
    hash_put(interpreter, hash, key, &value);

    key = string_from_cstring(interpreter, "blurb", NULL);
    value.type = enum_hash_string;
    value.val.string_val = key;
    hash_put(interpreter, hash, key, &value);

    printf("%i\n", hash_size(interpreter, hash));

    return 0;
}

CODE
3
OUTPUT

SKIP: {
skip "hash_set_size not implemented", 1;
c_output_is(<<'CODE', <<'OUTPUT', "hash_set_size");

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    Interp* interpreter;
    HASH _hash;
    HASH *hash = &_hash;
    STRING *key;
    HASH_ENTRY value;

    interpreter = Parrot_new();

    if ( interpreter == NULL ) return 1;

    Parrot_init(interpreter);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	printf("hash creation failed\n");
	return 1;
    }

    hash_set_size(interpreter, hash, 10);

    printf("%i\n", hash_size(interpreter, hash));

    return 0;
}

CODE
10
OUTPUT
}

c_output_is(<<'CODE', <<'OUTPUT', "hash_delete");

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    Interp* interpreter;
    HASH _hash;
    HASH *hash = &_hash;
    STRING *key;
    HASH_ENTRY value;

    interpreter = Parrot_new();

    if ( interpreter == NULL ) return 1;

    Parrot_init(interpreter);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	printf("hash creation failed\n");
	return 1;
    }

    key = string_from_cstring(interpreter, "fortytwo", NULL);
    value.type = enum_hash_int;
    value.val.int_val = 42;
    hash_put(interpreter, hash, key, &value);

    key = string_from_cstring(interpreter, "twocents", NULL);
    value.type = enum_hash_num;
    value.val.num_val = 0.02;
    hash_put(interpreter, hash, key, &value);

    key = string_from_cstring(interpreter, "blurb", NULL);
    value.type = enum_hash_string;
    value.val.string_val = key;
    hash_put(interpreter, hash, key, &value);

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
    HASH _hash;
    HASH *hash = &_hash;
    HASH _hash2;
    HASH *hash2 = &_hash2;
    STRING *key;
    HASH_ENTRY _value;
    HASH_ENTRY *value = &_value;

    interpreter = Parrot_new();

    if ( interpreter == NULL ) return 1;

    Parrot_init(interpreter);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	printf("hash creation failed\n");
	return 1;
    }

    key = string_from_cstring(interpreter, "fortytwo", NULL);
    value->type = enum_hash_int;
    value->val.int_val = 42;
    hash_put(interpreter, hash, key, value);

    value = hash_get(interpreter, hash, key);

    printf("%i\n", value->val.int_val);

    hash_clone(interpreter, hash, &hash2);

    value = hash_get(interpreter, hash2, key);

    printf("%i\n", value->val.int_val);

    return 0;
}

CODE
42
42
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "dump_hash");

#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    Interp* interpreter;
    HASH _hash;
    HASH *hash = &_hash;
    STRING *key;
    HASH_ENTRY value;

    interpreter = Parrot_new();

    if ( interpreter == NULL ) return 1;

    Parrot_init(interpreter);

    new_hash(interpreter, &hash);

    if ( hash == NULL ) {
	printf("hash creation failed\n");
	return 1;
    }

    key = string_from_cstring(interpreter, "fortytwo", NULL);
    value.type = enum_hash_int;
    value.val.int_val = 42;
    hash_put(interpreter, hash, key, &value);

    key = string_from_cstring(interpreter, "twocents", NULL);
    value.type = enum_hash_num;
    value.val.num_val = 0.02;
    hash_put(interpreter, hash, key, &value);

    key = string_from_cstring(interpreter, "blurb", NULL);
    value.type = enum_hash_string;
    value.val.string_val = key;
    hash_put(interpreter, hash, key, &value);

    dump_hash(interpreter, hash);

    return 0;
}

CODE
Hashtable[3/16]
  Bucket 3: type(-100)
  Bucket 12: type(-98) -> type(-99)
  Bucket 16: type(0) -> type(0) -> type(0) -> type(0) -> type(0) -> type(0) -> type(0) -> type(0) -> type(0)
OUTPUT

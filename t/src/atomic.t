#!perl
# Copyright 2006 The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw(. lib ../lib ../../lib );

use Test::More;
use Parrot::Test;
use Parrot::Config;

=head1 NAME

t/src/atomic.t - Parrot Atomic operations

=head1 SYNPOSIS

    % prove t/src/atomic.t

=head1 DESCRIPTION

Tests atomic operation support.

=cut

# generic tests

plan $^O =~ m/MSWin32/ ? (skip_all => 'broken on win32') : tests => 4;

c_output_is(<<'CODE', <<'OUTPUT', "PARROT_ATOMIC_PTR_GET/SET");

#include <parrot/parrot.h>
#include <parrot/atomic.h>
#include <stdio.h>

int main(int argc, char* argv[])
{
    void * dummy;
    void * result;
    Parrot_atomic_pointer a_ptr;

    dummy = "somewhere";
    result = "somewhere else";

    PARROT_ATOMIC_PTR_INIT(a_ptr);

    PARROT_ATOMIC_PTR_SET(a_ptr, dummy);
    
    PARROT_ATOMIC_PTR_GET(result, a_ptr);

    if (result != dummy) {
        fputs("not ", stdout);
    }

    fputs("ok 1\n", stdout);

    PARROT_ATOMIC_PTR_SET(a_ptr, NULL);

    PARROT_ATOMIC_PTR_GET(result, a_ptr);

    if (result) {
        fputs("not ", stdout);
    }

    fputs("ok 2\n", stdout);
    
    PARROT_ATOMIC_PTR_DESTROY(a_ptr);

    return EXIT_SUCCESS;
}
CODE
ok 1
ok 2
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "PARROT_ATOMIC_INT_GET/SET");

#include <parrot/parrot.h>
#include <parrot/atomic.h>
#include <stdio.h>

int main(int argc, char* argv[])
{
    INTVAL result;
    Parrot_atomic_integer a_int;

    PARROT_ATOMIC_INT_INIT(a_int);

    PARROT_ATOMIC_INT_SET(a_int, 0x7fff);
    
    PARROT_ATOMIC_INT_GET(result, a_int);

    if (result != 0x7fff) {
        fputs("not ", stdout);
    }

    fputs("ok 1\n", stdout);

    PARROT_ATOMIC_INT_SET(a_int, -1);

    PARROT_ATOMIC_INT_GET(result, a_int);

    if (result != -1) {
        fputs("not ", stdout);
    }

    fputs("ok 2\n", stdout);
    
    PARROT_ATOMIC_INT_DESTROY(a_int);

    return EXIT_SUCCESS;
}
CODE
ok 1
ok 2
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "PARROT_ATOMIC_PTR_CAS");

#include <parrot/parrot.h>
#include <parrot/atomic.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
    int success_p;
    void *value;
    Parrot_atomic_pointer a_ptr;
    void *tmp_a;
    void *tmp_b;

    tmp_a = "string a";
    tmp_b = "string b";

    PARROT_ATOMIC_PTR_INIT(a_ptr);

    PARROT_ATOMIC_PTR_SET(a_ptr, NULL);

    PARROT_ATOMIC_PTR_CAS(success_p, a_ptr, tmp_a, tmp_b);
    
    if (success_p) {
        fputs("not ", stdout);
    }
    fputs("ok 1\n", stdout);

    PARROT_ATOMIC_PTR_CAS(success_p, a_ptr, NULL, tmp_a);

    if (!success_p) {
        fputs("not ", stdout);
    }
    fputs("ok 2\n", stdout);
    
    PARROT_ATOMIC_PTR_CAS(success_p, a_ptr, tmp_a, tmp_b);

    if (!success_p) {
        fputs("not ", stdout);
    }
    fputs("ok 3\n", stdout);

    PARROT_ATOMIC_PTR_GET(value, a_ptr);
    if (value != tmp_b) {
        fputs("not ", stdout);
    }

    fputs("ok 4\n", stdout);

    PARROT_ATOMIC_PTR_DESTROY(a_ptr);

    return EXIT_SUCCESS;
}
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "PARROT_ATOMIC_INT_(CAS|INC|DEC)");
#include <parrot/parrot.h>
#include <parrot/atomic.h>
#include <stdio.h>

int main(int argc, char* argv[])
{
    int i;
    Parrot_atomic_integer a_int;

    PARROT_ATOMIC_INT_INIT(a_int);

    PARROT_ATOMIC_INT_SET(a_int, 0x7fff);

    for (i = 0; i < 0x7fff; ++i) {
        int cur;
        PARROT_ATOMIC_INT_DEC(cur, a_int);
        if (cur != 0x7fff - i - 1) {
            printf("DEC: error at i=%d / cur=%d\n", i, cur);
            return EXIT_FAILURE;
        }
    }

    {
        int cur;
        PARROT_ATOMIC_INT_DEC(cur, a_int);
        if (-1 != cur) {
            printf("-1 != cur\n");
            return EXIT_FAILURE;
        }
        PARROT_ATOMIC_INT_INC(cur, a_int);
        if (0 != cur) {
            printf("0 != cur\n");
            return EXIT_FAILURE;
        }
        PARROT_ATOMIC_INT_CAS(cur, a_int, 0, 42);
        if (!cur) {
            printf("CAS failed\n");
            return EXIT_FAILURE;
        }
        PARROT_ATOMIC_INT_INC(cur, a_int);
        if (cur != 43) {
            printf("INC failed after CAS\n");
            return EXIT_FAILURE;
        }
    }

    PARROT_ATOMIC_INT_DESTROY(a_int);

    puts("ok 1");
    return EXIT_SUCCESS;
}
CODE
ok 1
OUTPUT


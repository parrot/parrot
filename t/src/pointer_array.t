#!perl
# Copyright (C) 2006-2010, Parrot Foundation.

use strict;
use warnings;

use lib qw(. lib ../lib ../../lib );

use Test::More;
use Parrot::Test;
use Parrot::Config;
use File::Spec::Functions;

plan skip_all => 'src/parrot_config.o does not exist' unless -e catfile(qw/src parrot_config.o/);

=head1 NAME

t/src/atomic.t - Parrot pointer array operations

=head1 SYNPOSIS

    % prove t/src/pointer_array.t

=head1 DESCRIPTION

Tests atomic operation support.

=cut

# generic tests

plan tests => 3;

c_output_is( <<'CODE', <<'OUTPUT', "Pointer array" );

#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/pointer_array.h>
#include <stdio.h>

int main(int argc, char* argv[])
{
    Interp *interp = Parrot_new(NULL);
    Parrot_Pointer_Array *pa = Parrot_pa_new(interp);
    int i, count;
    void *pi, *pj;

    if (!pa) {
        printf("Fail to create new PA");
        return EXIT_FAILURE;
    }

    printf("ok 1\n");

    /* Push first pointer */
    pi = Parrot_pa_insert(interp, pa, &i);

    if (pa->total_chunks != 1) {
        printf("Fail to allocate 1 chunk");
        return EXIT_FAILURE;
    }
    printf("ok 2\n");

    if (pa->current_chunk != 0) {
        printf("current_chunk is wrong");
        return EXIT_FAILURE;
    }
    printf("ok 3\n");

    /* Insert many pointers */
    for (count = CELL_PER_CHUNK * 2; count; count--) {
        pi = Parrot_pa_insert(interp, pa, &i);
    }
    if (pa->total_chunks < 2) {
        printf("Fail to allocate more chunks");
        return EXIT_FAILURE;
    }
    printf("ok 4\n");

    if (pa->current_chunk != pa->total_chunks - 1) {
        printf("current_chunk is wrong");
        return EXIT_FAILURE;
    }
    printf("ok 5\n");

    return EXIT_SUCCESS;
}
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', "Pointer array (iterating)" );

#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/pointer_array.h>
#include <stdio.h>

int main(int argc, char* argv[])
{
    Interp *interp = Parrot_new(NULL);
    Parrot_Pointer_Array *pa = Parrot_pa_new(interp);
    int i, j, k, count = 0;
    void *pi, *pj, *pk;

    /* Push first pointer */
    pi = Parrot_pa_insert(interp, pa, &i);
    pj = Parrot_pa_insert(interp, pa, &j);
    pk = Parrot_pa_insert(interp, pa, &k);

    POINTER_ARRAY_ITER(pa,
        if (ptr == &i)
            ++count;
        else if (ptr == &j)
            ++count;
        else if (ptr == &k)
            ++count;
        else {
            printf("Unkown poiner! %p - %p %p %p", ptr, pi, pj, pk);
            return EXIT_FAILURE;
        }
    );

    printf("ok 1\n");

    if (count != 3) {
        printf("Didn't iterate all pointers %d", count);
        return EXIT_FAILURE;
    }
    printf("ok 2\n");

    Parrot_pa_remove(interp, pa, pi);
    POINTER_ARRAY_ITER(pa,
        if (ptr == &j)
            ++count;
        else if (ptr == &k)
            ++count;
        else {
            printf("Unkown poiner! %p - %p %p %p", ptr, pi, pj, pk);
            return EXIT_FAILURE;
        }
    );
    if (count != 5) {
        printf("Didn't iterate all pointers %d", count);
        return EXIT_FAILURE;
    }
    printf("ok 3\n");


    Parrot_pa_remove(interp, pa, pk);
    POINTER_ARRAY_ITER(pa,
        if (ptr == &j)
            ++count;
        else {
            printf("Unkown poiner! %p - %p %p %p", ptr, pi, pj, pk);
            return EXIT_FAILURE;
        }
    );
    if (count != 6) {
        printf("Didn't iterate all pointers %d", count);
        return EXIT_FAILURE;
    }
    printf("ok 4\n");

    /* Push stuff back. Twice. */
    pi = Parrot_pa_insert(interp, pa, &i);
    pi = Parrot_pa_insert(interp, pa, &i);
    pk = Parrot_pa_insert(interp, pa, &k);
    pk = Parrot_pa_insert(interp, pa, &k);
    POINTER_ARRAY_ITER(pa,
        if (ptr == &i)
            ++count;
        else if (ptr == &j)
            ++count;
        else if (ptr == &k)
            ++count;
        else {
            printf("Unkown poiner! %p - %p %p %p", ptr, pi, pj, pk);
            return EXIT_FAILURE;
        }
    );

    printf("ok 5\n");

    if (count != 11) {
        printf("Didn't iterate all pointers %d", count);
        return EXIT_FAILURE;
    }
    printf("ok 6\n");

    /* Final check - we should have 5 allocated cells */
    if (pa->chunks[0]->next_free != 5)
        printf("Wrong number of used cells: %d", pa->chunks[0]->next_free);

    printf("ok 7\n");

    return EXIT_SUCCESS;
}
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', "Pointer array (iterators)" );

#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/pointer_array.h>
#include <stdio.h>

static int test_no = 1;
int
ok(int check, const char *msg)
{
    int res = 1;
    if (!check) {
        printf("not ");
        res = 0;
    }
    printf("ok %d - %s\n", test_no++, msg);
    return res;
}

void
is(int l, int r, const char *msg)
{
    if (!ok(l == r, msg)) {
        printf("# %d != %d\n", l, r);
    }
}

int main(int argc, char* argv[])
{
    Interp *interp = Parrot_new(NULL);
    Parrot_Pointer_Array *pa = Parrot_pa_new(interp);
    int i = 42, j = 115200, k = 26122012, count = 0;
    void *pi, *pj, *pk;

    /* Iterator for empty array */
    Parrot_Pointer_Array_Iterator *forward = Parrot_pa_begin(interp, pa);

    ok(forward != NULL, "Iterator created");
    ok(Parrot_pa_iter_is_empty(interp, forward), "Iterator is empty");
    Parrot_pa_iter_destroy(interp, forward);
    ok(1, "Iterator destroyed");

    /* Put _few_ values into PA and check it */
    Parrot_pa_insert(interp, pa, &i);
    Parrot_pa_insert(interp, pa, &j);
    Parrot_pa_insert(interp, pa, &k);

    forward = Parrot_pa_begin(interp, pa);
    ok(!Parrot_pa_iter_is_empty(interp, forward), "Iterator is not empty");

    is(&i, Parrot_pa_iter_get(interp, forward), "Got first item");

    Parrot_pa_iter_next(interp, forward);
    is(&j, Parrot_pa_iter_get(interp, forward), "Got second item");

    Parrot_pa_iter_next(interp, forward);
    is(&k, Parrot_pa_iter_get(interp, forward), "Got third item");

    Parrot_pa_iter_next(interp, forward);
    ok(Parrot_pa_iter_is_empty(interp, forward), "Iterator is now empty");

    return EXIT_SUCCESS;
}
CODE
ok 1 - Iterator created
ok 2 - Iterator is empty
ok 3 - Iterator destroyed
ok 4 - Iterator is not empty
ok 5 - Got first item
ok 6 - Got second item
ok 7 - Got third item
ok 8 - Iterator is now empty
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

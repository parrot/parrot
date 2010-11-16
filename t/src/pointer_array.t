#!perl
# Copyright (C) 2006, Parrot Foundation.

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

plan tests => 1;

c_output_is( <<'CODE', <<'OUTPUT', "Pointer array" );

#include <parrot/parrot.h>
#include <parrot/pointer_array.h>
#include <stdio.h>

int main(int argc, char* argv[])
{
    Interp *interp = Parrot_new(NULL);
    Parrot_Pointer_Array *pa = Parrot_pa_new(interp);
    int i, j;
    void *pi, *pj;

    if (!pa) {
        printf("Fail to create new PA");
        return EXIT_FAILURE;
    }

    printf("ok 1\n");

    /* Push first pointer */
    pi = Parrot_pa_insert(interp, pa, &i);

    if (!pa->total_chunks == 1) {
        printf("Fail to allocate 1 chunk");
        return EXIT_FAILURE;
    }
    printf("ok 2\n");




    return EXIT_SUCCESS;
}
CODE
ok 1
ok 2
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

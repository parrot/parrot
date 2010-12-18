#!perl
# Copyright (C) 2010, Parrot Foundation.

use strict;
use warnings;

use lib qw(. lib ../lib ../../lib );

use Test::More;
use Parrot::Test;
use Parrot::Config;

=head1 NAME

t/src/embed/pmc.t - Parrot API PMC tests

=head1 SYNPOSIS

    % prove t/src/embed/pmc.t

=head1 DESCRIPTION

Tests PMC API support.

=cut

plan tests => 1;

c_output_is( <<'CODE', <<'OUTPUT', "Tests get_keyed_string and set_keyed_string" );

#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/api.h>
#include <stdio.h>

#define TEST_STR "The quick brown fox jumps over the lazy dog"

int main(int argc, char* argv[])
{
    Parrot_Interp interp = Parrot_new(NULL);

    Parrot_PMC interp_pmc = Parrot_pmc_new(interp, enum_class_ParrotInterpreter);
    Parrot_PMC hash_pmc = Parrot_pmc_new(interp, enum_class_Hash);
    Parrot_PMC str_pmc = Parrot_pmc_new(interp, enum_class_String);
    
    Parrot_String test_str = Parrot_str_new(interp, TEST_STR, 0);
    Parrot_api_pmc_set_string(interp_pmc, str_pmc, test_str);

    Parrot_String idx_str = Parrot_str_new(interp, "name", 0);
    Parrot_api_pmc_set_keyed_string(interp_pmc, hash_pmc, idx_str, str_pmc);

    Parrot_PMC str_pmc_out = NULL;
    Parrot_String str_out = NULL;

    Parrot_api_pmc_get_keyed_string(interp_pmc, hash_pmc, idx_str, &str_pmc_out);
    Parrot_api_pmc_get_string(interp_pmc, str_pmc_out, &str_out);

    if (strcmp(Parrot_str_to_cstring(interp, str_out), TEST_STR) != 0) {
        printf("Failed accessing a keyed Hash PMC\n");
        return EXIT_FAILURE;
    }

    printf("ok 1\n");

    Parrot_pmc_destroy(interp, interp_pmc);
    Parrot_pmc_destroy(interp, hash_pmc);
    Parrot_pmc_destroy(interp, str_pmc);

    return 0;
}

CODE
ok 1
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:


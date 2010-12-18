#!perl
# Copyright (C) 2010, Parrot Foundation.

use strict;
use warnings;

use lib qw(. lib ../lib ../../lib );

use Test::More;
use Parrot::Test;
use Parrot::Config;

=head1 NAME

t/src/embed/pmc.t - Parrot API PMC operations

=head1 SYNPOSIS

    % prove t/src/embed/pmc.t

=head1 DESCRIPTION

Tests PMC API support.

=cut

plan tests => 3;

c_output_is( <<'CODE', <<'OUTPUT', "get/set_keyed_int" );

#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/api.h>
#include <stdio.h>

int main(int argc, char* argv[])
{
    Parrot_Interp interp = Parrot_new(NULL);
    Parrot_PMC interpmc = Parrot_pmc_new(interp, enum_class_ParrotInterpreter);

    Parrot_PMC p_pmc = Parrot_pmc_new(interp, enum_class_String), p_keyedstr = NULL;

    Parrot_String s_teststr = NULL, s_outstr = NULL;
    Parrot_api_string_import_ascii(interpmc, "I am a string.", &s_teststr);
    Parrot_api_pmc_set_string(interpmc, p_pmc, s_teststr);

    Parrot_api_pmc_get_keyed_int(interpmc, p_pmc, 0, &p_keyedstr);
    Parrot_api_pmc_get_string(interpmc, p_keyedstr, &s_outstr);
    if (strcmp(Parrot_str_to_cstring(interp, s_outstr), "I") != 0) {
        printf("Failed indexing a String PMC\n");
        return EXIT_FAILURE;
    }

    printf("ok 1\n");

    Parrot_api_string_import_ascii(interpmc, "i", &s_teststr);
    Parrot_api_pmc_set_string(interpmc, p_keyedstr, s_teststr);

    Parrot_api_pmc_set_keyed_int(interpmc, p_pmc, 0, p_keyedstr);
    Parrot_api_pmc_get_string(interpmc, p_pmc, &s_outstr);

    if (strcmp(Parrot_str_to_cstring(interp, s_outstr), "i am a string.") != 0) {
        printf("Failed int-index setting a String PMC\n");
       return EXIT_FAILURE;
    }

    printf("ok 2\n");

    Parrot_pmc_destroy(interp, p_pmc);
    Parrot_pmc_destroy(interp, p_keyedstr);
    Parrot_pmc_destroy(interp, interpmc);

    return 0;
}

CODE
ok 1
ok 2
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', "get/set_keyed" );

#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/api.h>
#include <stdio.h>

int main(int argc, char* argv[])
{
    Parrot_Interp interp = Parrot_new(NULL);
    Parrot_PMC interpmc = Parrot_pmc_new(interp, enum_class_ParrotInterpreter);

    Parrot_PMC p_pmc = Parrot_pmc_new(interp, enum_class_String), p_keyedstr = NULL, p_idx = Parrot_pmc_new(interp, enum_class_Integer);

    Parrot_String s_teststr = NULL, s_outstr = NULL;
    Parrot_api_string_import_ascii(interpmc, "I am a string.", &s_teststr);
    Parrot_api_pmc_set_string(interpmc, p_pmc, s_teststr);

    Parrot_api_pmc_set_integer(interpmc, p_idx, 1);

    Parrot_api_pmc_get_keyed(interpmc, p_pmc, p_idx, &p_keyedstr);
    Parrot_api_pmc_get_string(interpmc, p_keyedstr, &s_outstr);
    if (strcmp(Parrot_str_to_cstring(interp, s_outstr), " ") != 0) {
        printf("Failed indexing a String PMC\n");
        return EXIT_FAILURE;
    }

    printf("ok 1\n");

    Parrot_api_string_import_ascii(interpmc, "n", &s_teststr);
    Parrot_api_pmc_set_string(interpmc, p_keyedstr, s_teststr);

    Parrot_api_pmc_set_integer(interpmc, p_idx, 3);

    Parrot_api_pmc_set_keyed(interpmc, p_pmc, p_idx, p_keyedstr);
    Parrot_api_pmc_get_string(interpmc, p_pmc, &s_outstr);

    if (strcmp(Parrot_str_to_cstring(interp, s_outstr), "I an a string.") != 0) {
        printf("Failed PMC-index setting a String PMC\n");
       return EXIT_FAILURE;
    }

    printf("ok 2\n");

    Parrot_pmc_destroy(interp, p_pmc);
    Parrot_pmc_destroy(interp, p_keyedstr);
    Parrot_pmc_destroy(interp, p_idx);
    Parrot_pmc_destroy(interp, interpmc);

    return 0;
}

CODE
ok 1
ok 2
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', "PMC lookup/instantiation" );

#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/api.h>
#include <stdio.h>

int main(int argc, char* argv[])
{
    Parrot_Interp interp = Parrot_new(NULL);
    Parrot_PMC interpmc = Parrot_pmc_new(interp, enum_class_ParrotInterpreter);
    Parrot_String s_str, s_str2;
    Parrot_PMC p_key, p_class, p_pmc;

    char* string_class[] = { "String" };
    Parrot_api_build_argv_array(interpmc, 1, string_class, &p_key);

    Parrot_api_lookup_class(interpmc, p_key, &p_class);
    Parrot_api_pmc_new_from_class(interpmc, p_class, PMCNULL, &p_pmc);

    Parrot_api_string_import_ascii(interpmc, "This is a string!", &s_str);
    Parrot_api_pmc_set_string(interpmc, p_pmc, s_str);
    Parrot_api_pmc_get_string(interpmc, p_pmc, &s_str2);
    if (strcmp(Parrot_str_to_cstring(interp, s_str2), "This is a string!") != 0) {
        printf("Failed instantiating, setting, and getting a String PMC\n");
        return EXIT_FAILURE;
    }

    printf("ok 1\n");

    char* float_class[] = { "Float" };
    Parrot_api_build_argv_array(interpmc, 1, float_class, &p_key);

    Parrot_api_lookup_class(interpmc, p_key, &p_class);
    Parrot_api_pmc_new_from_class(interpmc, p_class, PMCNULL, &p_pmc);

    Parrot_api_pmc_set_float(interpmc, p_pmc, 3.1415);
    Parrot_api_pmc_get_string(interpmc, p_pmc, &s_str2);
    if (strcmp(Parrot_str_to_cstring(interp, s_str2), "3.1415") != 0) {
        printf("Failed instantiating, setting, and getting a Float PMC\n");
        return EXIT_FAILURE;
    }

    Parrot_pmc_destroy(interp, p_key);
    Parrot_pmc_destroy(interp, p_class);
    Parrot_pmc_destroy(interp, p_pmc);

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

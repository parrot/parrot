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

plan tests => 4;

c_output_is( <<'CODE', <<'OUTPUT', "get/set_keyed_int" );

#include "parrot/api.h"
#include <stdio.h>

int main(int argc, char* argv[])
{
    char * c_outstr = NULL;
    Parrot_Init_Args *initargs = NULL;
    Parrot_PMC interpmc = NULL;
    Parrot_PMC p_str = NULL, p_keyedstr = NULL;
    Parrot_String s_teststr = NULL, s_outstr = NULL;

    GET_INIT_STRUCT(initargs);
    Parrot_api_make_interpreter(NULL, 0, initargs, &interpmc);

    Parrot_api_string_import_ascii(interpmc, "I am a string.", &s_teststr);
    Parrot_api_pmc_box_string(interpmc, s_teststr, &p_str);

    Parrot_api_pmc_get_keyed_int(interpmc, p_str, 0, &p_keyedstr);
    Parrot_api_pmc_get_string(interpmc, p_keyedstr, &s_outstr);
    Parrot_api_string_export_ascii(interpmc, s_outstr, &c_outstr);
    printf("%s\n", c_outstr);


    Parrot_api_string_import_ascii(interpmc, "i", &s_teststr);
    Parrot_api_pmc_set_string(interpmc, p_keyedstr, s_teststr);

    Parrot_api_pmc_set_keyed_int(interpmc, p_str, 0, p_keyedstr);
    Parrot_api_pmc_get_string(interpmc, p_str, &s_outstr);
    Parrot_api_string_export_ascii(interpmc, s_outstr, &c_outstr);
    printf("%s\n", c_outstr);
        return 0;
}

CODE
I
i am a string.
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', "Tests get_keyed_string and set_keyed_string" );

#include <parrot/api.h>
#include <stdio.h>

#define TEST_STR "The quick brown fox jumps over the lazy dog"

int main(int argc, char* argv[])
{
    Parrot_Init_Args *initargs = NULL;
    Parrot_PMC interp_pmc = NULL;
    Parrot_String name_hash = NULL;
    Parrot_PMC name_hash_pmc = NULL;
    Parrot_PMC class_hash = NULL;
    Parrot_PMC hash_pmc = NULL;
    Parrot_String test_str = NULL;
    Parrot_String idx_str = NULL;
    Parrot_PMC str_pmc = NULL;
    Parrot_PMC str_pmc_out = NULL;
    Parrot_String str_out = NULL;
    char * str_out_c = NULL;

    GET_INIT_STRUCT(initargs);
    Parrot_api_make_interpreter(NULL, 0, initargs, &interp_pmc);

    Parrot_api_string_import_ascii(interp_pmc, "Hash", &name_hash);
    Parrot_api_pmc_box_string(interp_pmc, name_hash, &name_hash_pmc);
    Parrot_api_pmc_get_class(interp_pmc, name_hash_pmc, &class_hash);
    Parrot_api_pmc_new_from_class(interp_pmc, class_hash, NULL, &hash_pmc);

    Parrot_api_string_import_ascii(interp_pmc, TEST_STR, &test_str);
    Parrot_api_string_import_ascii(interp_pmc, "name", &idx_str);

    Parrot_api_pmc_box_string(interp_pmc, test_str, &str_pmc);
    Parrot_api_pmc_set_keyed_string(interp_pmc, hash_pmc, idx_str, str_pmc);
    Parrot_api_pmc_get_keyed_string(interp_pmc, hash_pmc, idx_str, &str_pmc_out);
    Parrot_api_pmc_get_string(interp_pmc, str_pmc_out, &str_out);
    Parrot_api_string_export_ascii(interp_pmc, str_out, &str_out_c);

    printf("%s\n", str_out_c);

    return 0;
}

CODE
The quick brown fox jumps over the lazy dog
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', "get/set_keyed" );

#include <parrot/api.h>
#include <stdio.h>

int main(int argc, char* argv[])
{
    Parrot_Init_Args *initargs = NULL;
    Parrot_PMC interpmc = NULL;
    Parrot_PMC p_pmc = NULL;
    Parrot_String s_teststr = NULL, s_outstr = NULL;
    Parrot_PMC p_keyedstr = NULL;
    Parrot_PMC p_idx = NULL;
    char * c_out = NULL;

    GET_INIT_STRUCT(initargs);
    Parrot_api_make_interpreter(NULL, 0, initargs, &interpmc);

    Parrot_api_string_import_ascii(interpmc, "I am a string.", &s_teststr);
    Parrot_api_pmc_box_string(interpmc, s_teststr, &p_pmc);

    Parrot_api_pmc_box_integer(interpmc, 2, &p_idx);

    Parrot_api_pmc_get_keyed(interpmc, p_pmc, p_idx, &p_keyedstr);
    Parrot_api_pmc_get_string(interpmc, p_keyedstr, &s_outstr);
    Parrot_api_string_export_ascii(interpmc, s_outstr, &c_out);
    printf("%s\n", c_out);


    Parrot_api_string_import_ascii(interpmc, "n", &s_teststr);
    Parrot_api_pmc_set_string(interpmc, p_keyedstr, s_teststr);
    Parrot_api_pmc_set_integer(interpmc, p_idx, 3);

    Parrot_api_pmc_set_keyed(interpmc, p_pmc, p_idx, p_keyedstr);
    Parrot_api_pmc_get_string(interpmc, p_pmc, &s_outstr);
    Parrot_api_string_export_ascii(interpmc, s_outstr, &c_out);
    printf("%s\n", c_out);

    return 0;
}

CODE
a
I an a string.
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
    Parrot_api_pmc_wrap_string_array(interpmc, 1, string_class, &p_key);

    Parrot_api_pmc_get_class(interpmc, p_key, &p_class);
    Parrot_api_pmc_new_from_class(interpmc, p_class, NULL, &p_pmc);

    Parrot_api_string_import_ascii(interpmc, "This is a string!", &s_str);
    Parrot_api_pmc_set_string(interpmc, p_pmc, s_str);
    Parrot_api_pmc_get_string(interpmc, p_pmc, &s_str2);
    if (strcmp(Parrot_str_to_cstring(interp, s_str2), "This is a string!") != 0) {
        printf("Failed instantiating, setting, and getting a String PMC\n");
        return EXIT_FAILURE;
    }

    printf("ok 1\n");

    char* float_class[] = { "Float" };
    Parrot_api_pmc_wrap_string_array(interpmc, 1, float_class, &p_key);

    Parrot_api_pmc_get_class(interpmc, p_key, &p_class);
    Parrot_api_pmc_new_from_class(interpmc, p_class, NULL, &p_pmc);

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

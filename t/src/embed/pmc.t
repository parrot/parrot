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

plan tests => 8;

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

c_output_is( <<'CODE', <<'OUTPUT', "pmc_get_{string|float}" );

#include "parrot/api.h"
#include <stdio.h>

int main(int argc, char* argv[])
{
    Parrot_Int i_out;
    Parrot_Float f_out;
    Parrot_Init_Args *initargs = NULL;
    Parrot_PMC interpmc = NULL;
    Parrot_PMC p_float = NULL;
    Parrot_PMC p_key = NULL, p_class = NULL;
    Parrot_String s_numstr = NULL;
    const char * float_class[] = { "Float" };

    GET_INIT_STRUCT(initargs);
    Parrot_api_make_interpreter(NULL, 0, initargs, &interpmc);

    Parrot_api_string_import_ascii(interpmc, "3.14159", &s_numstr);

    Parrot_api_pmc_wrap_string_array(interpmc, 1, float_class, &p_key);
    Parrot_api_pmc_get_class(interpmc, p_key, &p_class);
    Parrot_api_pmc_new_from_class(interpmc, p_class, NULL, &p_float);

    Parrot_api_pmc_set_string(interpmc, p_float, s_numstr);
    Parrot_api_pmc_get_integer(interpmc, p_float, &i_out);
    Parrot_api_pmc_get_float(interpmc, p_float, &f_out);

    printf("%d\n", i_out);
    printf("%.5f\n", f_out);
    return 0;
}

CODE
3
3.14159
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

#include <parrot/api.h>
#include <stdio.h>

int main(int argc, char* argv[])
{
    Parrot_Init_Args *initargs = NULL;
    Parrot_PMC interpmc = NULL;
    Parrot_String s_str, s_str2;
    Parrot_PMC p_key, p_class, p_pmc;
    const char* string_class[] = { "String" };
    const char* float_class[] = { "Float" };
    char *c_out;

    GET_INIT_STRUCT(initargs);
    Parrot_api_make_interpreter(NULL, 0, initargs, &interpmc);

    Parrot_api_pmc_wrap_string_array(interpmc, 1, string_class, &p_key);

    Parrot_api_pmc_get_class(interpmc, p_key, &p_class);
    Parrot_api_pmc_new_from_class(interpmc, p_class, NULL, &p_pmc);

    Parrot_api_string_import_ascii(interpmc, "This is a string!", &s_str);
    Parrot_api_pmc_set_string(interpmc, p_pmc, s_str);
    Parrot_api_pmc_get_string(interpmc, p_pmc, &s_str2);
    Parrot_api_string_export_ascii(interpmc, s_str2, &c_out);
    printf("%s\n", c_out);

    Parrot_api_pmc_wrap_string_array(interpmc, 1, float_class, &p_key);

    Parrot_api_pmc_get_class(interpmc, p_key, &p_class);
    Parrot_api_pmc_new_from_class(interpmc, p_class, NULL, &p_pmc);

    Parrot_api_pmc_set_float(interpmc, p_pmc, 3.1415);
    Parrot_api_pmc_get_string(interpmc, p_pmc, &s_str2);
    Parrot_api_string_export_ascii(interpmc, s_str2, &c_out);
    printf("%s\n", c_out);

    return 0;
}
CODE
This is a string!
3.1415
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', "PMC find_method" );

#include <parrot/api.h>
#include <stdio.h>

int main(int argc, char* argv[])
{
    Parrot_Init_Args *initargs = NULL;
    Parrot_PMC interpmc = NULL;
    Parrot_PMC p_pmc = NULL, p_method = NULL, p_signature = NULL, p_classname = NULL;
    Parrot_PMC p_call_class = NULL, p_toreplace = NULL, p_replacestring = NULL;
    Parrot_String s_teststr = NULL, s_outstr = NULL, s_method = NULL, s_classname = NULL;
    Parrot_String s_signstring = NULL, s_toreplace = NULL, s_replacestring = NULL;
    Parrot_PMC p_keyedstr = NULL;
    Parrot_PMC p_idx = NULL;
    char * c_out = NULL;

    GET_INIT_STRUCT(initargs);
    Parrot_api_make_interpreter(NULL, 0, initargs, &interpmc);

    Parrot_api_string_import_ascii(interpmc, "I love Microsoft!", &s_teststr);
    Parrot_api_pmc_box_string(interpmc, s_teststr, &p_pmc);

    Parrot_api_string_import_ascii(interpmc, "replace", &s_teststr);
    Parrot_api_pmc_find_method(interpmc, p_pmc, s_teststr, &p_method);
    if(p_method != NULL) {
        Parrot_api_string_import_ascii(interpmc, "CallContext", &s_classname);
        Parrot_api_pmc_box_string(interpmc, s_classname, &p_classname);
        Parrot_api_pmc_get_class(interpmc, p_classname, &p_call_class);
        Parrot_api_pmc_new_from_class(interpmc, p_call_class, NULL, &p_signature);

        Parrot_api_string_import_ascii(interpmc, "PiSS->", &s_signstring);
        Parrot_api_pmc_set_string(interpmc, p_signature, s_signstring);
        Parrot_api_pmc_set_keyed_int(interpmc, p_signature, 0, p_pmc);

        Parrot_api_string_import_ascii(interpmc, "Microsoft", &s_toreplace);
        Parrot_api_pmc_box_string(interpmc, s_toreplace, &p_toreplace);
        Parrot_api_pmc_set_keyed_int(interpmc, p_signature, 1, p_toreplace);

        Parrot_api_string_import_ascii(interpmc, "the Open Source community", &s_replacestring);
        Parrot_api_pmc_box_string(interpmc, s_replacestring, &p_replacestring);
        Parrot_api_pmc_set_keyed_int(interpmc, p_signature, 2, p_replacestring);

        Parrot_api_pmc_invoke(interpmc, p_method, p_signature);
        Parrot_api_pmc_get_string(interpmc, p_pmc, &s_outstr);
        Parrot_api_string_export_ascii(interpmc, s_outstr, &c_out);
        printf("%s\n", c_out);
    }
    else printf("error\n");

    return 0;
}

CODE
I love the Open Source community!
OUTPUT


c_output_is( <<'CODE', <<'OUTPUT', "Test Freeze/thaw" );

#include "parrot/api.h"
#include <stdio.h>

int main(int argc, char* argv[])
{
    char * c_outstr = NULL;
    Parrot_Init_Args *initargs = NULL;
    Parrot_PMC interpmc = NULL;
    Parrot_PMC p_str = NULL, p_keyedstr = NULL, p_str_thawed = NULL;
    Parrot_String s_teststr = NULL, s_outstr = NULL, s_frozen = NULL;
    Parrot_Int len;

    GET_INIT_STRUCT(initargs);
    Parrot_api_make_interpreter(NULL, 0, initargs, &interpmc);

    Parrot_api_string_import_ascii(interpmc, "I am a string.", &s_teststr);
    Parrot_api_pmc_box_string(interpmc, s_teststr, &p_str);

    Parrot_api_pmc_serialize(interpmc, p_str, &s_frozen);
    Parrot_api_string_byte_length(interpmc, s_frozen, &len);
    Parrot_api_string_export_ascii(interpmc, s_frozen, &c_outstr);
    Parrot_api_pmc_deserialize_bytes(interpmc, (const unsigned char *)c_outstr, len, &p_str_thawed);

    Parrot_api_pmc_get_string(interpmc, p_str_thawed, &s_outstr);
    Parrot_api_string_export_ascii(interpmc, s_outstr, &c_outstr);
    printf("Frozen and thawed: %s\n", c_outstr);

    Parrot_api_pmc_get_string(interpmc, p_str, &s_outstr);
    Parrot_api_string_export_ascii(interpmc, s_outstr, &c_outstr);
    printf("%s\n", c_outstr);

    return 0;
}

CODE
Frozen and thawed: I am a string.
I am a string.
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', "Test pmc_box and pmc_get" );

#include <parrot/api.h>
#include <stdio.h>

int main(int argc, char* argv[])
{
    Parrot_Init_Args *initargs = NULL;
    Parrot_PMC interpmc = NULL;
    Parrot_PMC p_str = NULL, p_float = NULL, p_int = NULL;
    Parrot_String s_teststr = NULL, s_outstr = NULL;
    Parrot_Float outfloat = 0.0;
    Parrot_Int outint = 0;
    char *c_outstr = NULL;
    int answer = 0;

    GET_INIT_STRUCT(initargs);
    Parrot_api_make_interpreter(NULL, 0, initargs, &interpmc);

    Parrot_api_string_import_ascii(interpmc, "The answer is", &s_teststr);
    Parrot_api_pmc_box_string(interpmc, s_teststr, &p_str);
    Parrot_api_pmc_get_string(interpmc, p_str, &s_outstr);
    Parrot_api_string_export_ascii(interpmc, s_outstr, &c_outstr);
    printf("%s ", c_outstr);

    Parrot_api_pmc_box_float(interpmc, 10.5, &p_float);
    Parrot_api_pmc_get_float(interpmc, p_float, &outfloat);

    Parrot_api_pmc_box_integer(interpmc, 21, &p_int);
    Parrot_api_pmc_get_integer(interpmc, p_int, &outint);

    answer = (int)(2 * outfloat) + (int)outint;
    printf("%i.\n", answer);

    return 0;
}

CODE
The answer is 42.
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

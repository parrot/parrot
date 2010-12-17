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

plan tests => 1;

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
    if (strcmp(c_outstr, "I") != 0) {
        printf("Failed indexing a String PMC\n");
        return EXIT_FAILURE;
    }

    printf("ok 1\n");

    Parrot_api_string_import_ascii(interpmc, "i", &s_teststr);
    Parrot_api_pmc_set_string(interpmc, p_keyedstr, s_teststr);

    Parrot_api_pmc_set_keyed_int(interpmc, p_str, 0, p_keyedstr);
    Parrot_api_pmc_get_string(interpmc, p_str, &s_outstr);
    Parrot_api_string_export_ascii(interpmc, s_outstr, &c_outstr);
    if (strcmp(c_outstr, "i am a string.") != 0) {
        printf("Failed int-index setting a String PMC\n");
       return EXIT_FAILURE;
    }

    printf("ok 2\n");

    return 0;
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

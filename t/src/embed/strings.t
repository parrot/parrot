#!perl
# Copyright (C) 2010, Parrot Foundation.

use strict;
use warnings;

use lib qw(. lib ../lib ../../lib );

use Test::More;
use Parrot::Test;
use Parrot::Config;

=head1 NAME

t/src/embed/strings.t - Parrot API string operations

=head1 SYNPOSIS

    % prove t/src/embed/strings.t

=head1 DESCRIPTION

Tests string API support.

=cut

# generic tests

plan tests => 1;

c_output_is( <<'CODE', <<'OUTPUT', "wchar import / export" );

#include <parrot/api.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <wchar.h>

#define TEST_STR "The quick brown fox jumps over the lazy dog"
#define TEST_STR_L L"The quick brown fox jumps over the lazy dog"

static int
str_is(Parrot_PMC interp_pmc, Parrot_String str, const char *expected)
{
    char *cstr = NULL;
    int   same;

    Parrot_api_string_export_ascii(interp_pmc, str, &cstr);
    same = cstr && strcmp(cstr, expected) == 0;
    Parrot_api_string_free_exported_ascii(interp_pmc, cstr);
    return same;
}

int main(int argc, char* argv[])
{
    Parrot_Init_Args *initargs = NULL;
    Parrot_PMC pmc = NULL;
    Parrot_String str = NULL;
    wchar_t *wcout = NULL;
    const unsigned char bytes[5] = { 'h', 'e', 'l', 'l', 'o' };

    GET_INIT_STRUCT(initargs);
    Parrot_api_make_interpreter(NULL, 0, initargs, &pmc);
    free(initargs);

    Parrot_api_string_import_wchar(pmc, TEST_STR_L, &str);

    if (str_is(pmc, str, TEST_STR)) {
        puts("import a wchar string into a Parrot_string");

        Parrot_api_string_export_wchar(pmc, str, &wcout);

        if (wcout && wcscmp(wcout, TEST_STR_L) == 0) {
            puts("export a wchar string from a Parrot_string");

            Parrot_api_string_import_binary(pmc, bytes, 5, "ascii", &str);

            if (str_is(pmc, str, "hello"))
                puts("import a binary string into a Parrot_string");
        }
    }

    if (wcout)
        Parrot_api_string_free_exported_wchar(pmc, wcout);
    Parrot_api_destroy_interpreter(pmc);

    return EXIT_SUCCESS;
}
CODE
import a wchar string into a Parrot_string
export a wchar string from a Parrot_string
import a binary string into a Parrot_string
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

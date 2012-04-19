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

#include <parrot/parrot.h>
#include <parrot/api.h>
#include <stdio.h>

#define TEST_STR "The quick brown fox jumps over the lazy dog"
#define TEST_STR_L L"The quick brown fox jumps over the lazy dog"

int main(int argc, char* argv[])
{
    Parrot_Interp interp = Parrot_interp_new(NULL);
    Parrot_PMC pmc = Parrot_pmc_new(interp, enum_class_ParrotInterpreter);

    Parrot_String str = NULL;
    wchar_t *wcout;
    const unsigned char bytes[5] = { 'h', 'e', 'l', 'l', 'o' };

    Parrot_api_string_import_wchar(pmc, TEST_STR_L, &str);

    if (strcmp(Parrot_str_to_cstring(interp, str), TEST_STR) == 0) {
        puts("import a wchar string into a Parrot_string");

        Parrot_api_string_export_wchar(pmc, str, &wcout);

        if (wcscmp(wcout, TEST_STR_L) == 0) {
            puts("export a wchar string from a Parrot_string");

            Parrot_api_string_import_binary(pmc, bytes, 5, "ascii", &str);

            if (strcmp(Parrot_str_to_cstring(interp, str), "hello") == 0) {
                puts("import a binary string into a Parrot_string");
	    }
	}
    }

    Parrot_api_string_free_exported_wchar(pmc, wcout);
    Parrot_pmc_destroy(interp, pmc);

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

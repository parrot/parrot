#!/usr/bin/perl

use warnings;
use strict;
use lib qw( . lib ../lib ../../lib );

use Parrot::Test;

# TODO How do I test call to Parrot_api_string_import_ascii()?

plan tests => 2;

my $common = <<'COMMON';
#include <stdio.h>
#include <stdlib.h>
#include "parrot/api.h"

static void fail(const char *msg);

static void
fail(const char *msg)
{
    fprintf(stderr, "[ERROR] %s\n", msg);
    exit(EXIT_FAILURE);
}
COMMON

c_output_isnt($common . <<'CODE', <<'OUTPUT', "Try to allocate interpreter");
int
main(int argc, char *argv[])
{
    Parrot_PMC       interp    = NULL,
                     pbc       = NULL,
                     main_sub  = NULL;
    Parrot_String    file      = NULL;
    Parrot_Init_Args *initargs = NULL;

    GET_INIT_STRUCT(initargs);

    if (!Parrot_api_make_interpreter(NULL, 0, initargs, &interp)) {
        fail("Failed to allocate new interpreter");
    }

    Parrot_api_destroy_interpreter(interp);
    return (0);
}
CODE
[ERROR] Failed to allocate new interpreter
OUTPUT

c_output_isnt($common . <<'CODE', <<'OUTPUT', "Try to register runcore");
int
main(int argc, char *argv[])
{
    Parrot_PMC       interp    = NULL,
                     pbc       = NULL,
                     main_sub  = NULL;
    Parrot_String    file      = NULL;
    Parrot_Init_Args *initargs = NULL;

    GET_INIT_STRUCT(initargs);

    if (!Parrot_api_make_interpreter(NULL, 0, initargs, &interp)) {
        fail("Failed to allocate new interpreter");
    }

    if (!Parrot_api_string_import_ascii(interp, argv[1], &file)) {
        fail("Bad filename");
    }

    if (!Parrot_api_set_runcore(interp, "hbdb", 0)) {
        Parrot_api_destroy_interpreter(interp);
        fail("Failed to register runcore");
    }

    Parrot_api_destroy_interpreter(interp);
    return (0);
}
CODE
[ERROR] Failed to register runcore
OUTPUT


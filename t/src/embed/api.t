#! perl
# Copyright (C) 2001-2010, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;
use File::Spec::Functions;

plan skip_all => 'src/parrot_config.o does not exist' unless -e catfile(qw/src parrot_config.o/);

plan tests => 1;

=head1 NAME

t/src/embed/api.t - Parrot's embedding API

=head1 SYNOPSIS

    % prove t/src/embed/api.t

=head1 DESCRIPTION

Embedding parrot in C

=cut

sub linedirective
{
    # Provide a #line directive for the C code in the heredoc
    # starting immediately after where this sub is called.
    my $linenum = shift() + 1;
    return "#line " . $linenum . ' "' . __FILE__ . '"' . "\n";
}

#c_output_is(linedirective(__LINE__) . <<'CODE', <<'OUTPUT', 'Test set_std_handles');
#
##include <stdio.h>
##include <stdlib.h>
##include <string.h>
##include "parrot/parrot.h"
##include "parrot/api.h"
##include "parrot/embed.h"
##include "parrot/extend.h"
#
#static void fail(const char *msg);
#static Parrot_String createstring(Parrot_Interp interp, const char * value);
#
#static void fail(const char *msg)
#{
#    fprintf(stderr, "failed: %s\n", msg);
#    exit(EXIT_FAILURE);
#}
#
#static Parrot_String createstring(Parrot_Interp interp, const char * value)
#{
#    return Parrot_new_string(interp, value, strlen(value), (const char*)NULL, 0);
#}
#
#
#int main(int argc, const char **argv)
#{
#
#    char * c_outstr = NULL;
#    Parrot_Init_Args *initargs = NULL;
#    Parrot_PMC interpmc = NULL;
#    Parrot_PMC p_str = NULL, p_keyedstr = NULL;
#    Parrot_String s_teststr = NULL, s_outstr = NULL;
#
#    FILE * stdout = fopen("/tmp/stdout", "w");
#    /*FILE * stdin  = fopen("/tmp/stdin", "r");
#    FILE * stderr = fopen("/tmp/stdin", "w");*/
#
#    GET_INIT_STRUCT(initargs);
#    Parrot_api_make_interpreter(NULL, 0, initargs, &interpmc);
#
#    Parrot_api_set_stdhandles(interpmc, stdout, PIO_INVALID_HANDLE, PIO_INVALID_HANDLE);
#    /* Now run a simple PIR program that outputs some text, and make sure that it is
#       writen to the file instead of stdout etc */
#    puts("Done");
#    return 0;
#
#}
#CODE
#OUTPUT

c_output_is(linedirective(__LINE__) . <<'CODE', <<'OUTPUT', "get set compiler" );

#include <stdio.h>
#include <stdlib.h>

#include "parrot/api.h"

void fail(const char *msg);

void fail(const char *msg)
{
    fprintf(stderr, "failed: %s\n", msg);
    exit(EXIT_FAILURE);
}

int main(int argc, const char **argv)
{
    char * c_outstr = NULL;
    Parrot_Init_Args *initargs = NULL;
    Parrot_PMC interpmc = NULL;
    Parrot_PMC apmc = NULL;
    Parrot_PMC bpmc = NULL;
    Parrot_String s_teststr = NULL, s_outstr = NULL;
    int a;

    GET_INIT_STRUCT(initargs);
    Parrot_api_make_interpreter(NULL, 0, initargs, &interpmc);

    Parrot_api_string_import_ascii(interpmc, "PIR", &s_teststr);
    Parrot_api_load_language(interpmc, s_teststr);

    Parrot_api_get_compiler(interpmc, s_teststr, &apmc);
    Parrot_api_set_compiler(interpmc, s_teststr, apmc);
    Parrot_api_get_compiler(interpmc, s_teststr, &bpmc);

    printf ("%s\n", apmc == bpmc ? "True" : "False!");
    puts("Done");
    return 0;
}
CODE
True
Done
OUTPUT

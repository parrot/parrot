#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;

plan $^O =~ m/MSWin32/ ? (skip_all => 'broken on win32') : (tests => 3);

=head1 NAME

t/src/basic.t - Basics

=head1 SYNOPSIS

    % prove t/src/basic.t

=head1 DESCRIPTION

Tests C<printf> and C<internal_exception> functions.

=cut


c_output_is(<<'CODE', <<'OUTPUT', "hello world");
    #include <stdio.h>

    int
    main(int argc, char* argv[])
    {
        printf("Hello, World!\n");
        exit(0);
    }
CODE
Hello, World!
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "direct internal_exception call");
    #include <parrot/parrot.h>
    #include <parrot/exceptions.h>

    int
    main(int argc, char* argv[])
    {
         internal_exception(0, "Blow'd Up(tm)"); /* ' */
    }
CODE
Blow'd Up(tm)
OUTPUT
# vor $EDITOR '

c_output_is(<<'CODE', <<'OUTPUT', "Parrot_run_native");

#include <parrot/parrot.h>
#include <parrot/embed.h>

static opcode_t *the_test(Parrot_Interp, opcode_t *, opcode_t *);

int
main(int argc, char* argv[])
{
    Interp *interp;

    interp = Parrot_new(NULL);
    if (!interp) {
        return 1;
    }

    PIO_eprintf(interp, "main\n");

    Parrot_run_native(interp, the_test);

    PIO_eprintf(interp, "back\n");
    Parrot_exit(interp, 0);
    return 0;
}

static opcode_t*
the_test(Interp *interp,
         opcode_t *cur_op, opcode_t *start)
{
    UNUSED(cur_op);
    UNUSED(start);

    /* tests go here */
    PIO_eprintf(interp, "ok\n");

    return NULL; /* always return 0 or bad things may happen */
}

CODE
main
ok
back
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

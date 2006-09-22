#! perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;

plan $^O =~ m/MSWin32/ ? (skip_all => 'broken on win32') : (tests => 1);

=head1 NAME

t/src/exit.t - Exiting

=head1 SYNOPSIS

    % prove t/src/exit.t

=head1 DESCRIPTION

Tests C<Parrot_exit()> and C<Parrot_on_exit()> functions.

=cut

c_output_is(<<'CODE', <<'OUTPUT', "on_exit - interpreter");
#include <stdio.h>
#include <parrot/parrot.h>
#include <parrot/embed.h>

void
ex1(Parrot_Interp interp, int x, void*p)
{
    printf("ex1\n");
}

void
ex2(Parrot_Interp interp, int x, void*p)
{
    printf("ex2\n");
}

void
ex3(Parrot_Interp interp, int x, void*p)
{
    PIO_printf(interp, "ex3\n");
}

int
main(int argc, char* argv[])
{
    Interp *     interpreter;

    interpreter = Parrot_new(NULL);
    if (!interpreter) {
        return 1;
    }
    Parrot_on_exit(interpreter, ex1, 0);
    Parrot_on_exit(interpreter, ex2, 0);
    Parrot_on_exit(interpreter, ex3, 0);
    Parrot_exit(interpreter, 0);
    exit(0);
}
CODE
ex3
ex2
ex1
OUTPUT

#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/src/basic.t - Basics

=head1 SYNOPSIS

	% perl t/src/basic.t

=head1 DESCRIPTION

Tests C<printf> and C<internal_exception> functions.

=cut

use Parrot::Test tests => 3;

c_output_is(<<'CODE', <<'OUTPUT', "hello world");
        #include <stdio.h>

        int main(int argc, char* argv[]) {
                printf("Hello, World!\n");
              exit(0);
        }
CODE
Hello, World!
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "direct internal_exception call");
        #include <parrot/parrot.h>
        #include <parrot/exceptions.h>

        int main(int argc, char* argv[]) {
                internal_exception(0, "Blow'd Up(tm)\n"); /* ' */
        }
CODE
Blow'd Up(tm)
OUTPUT
# vor $EDITOR '

c_output_is(<<'CODE', <<'OUTPUT', "Parrot_run_native");

#include <parrot/parrot.h>
#include <parrot/embed.h>

static opcode_t *the_test(Parrot_Interp, opcode_t *, opcode_t *);

int main(int argc, char* argv[])
{
    Interp *     interpreter;

    interpreter = Parrot_new(NULL);
    if (!interpreter) {
        return 1;
    }
    Parrot_init(interpreter);

    PIO_eprintf(interpreter, "main\n");

    Parrot_run_native(interpreter, the_test);

    PIO_eprintf(interpreter, "back\n");
    Parrot_exit(0);
    return 0;
}

static opcode_t*
the_test(Interp *interpreter,
	opcode_t *cur_op, opcode_t *start)
{
    UNUSED(cur_op);
    UNUSED(start);

    /* tests go here */
    PIO_eprintf(interpreter, "ok\n");

    return NULL; /* always return 0 or bad things may happen */
}

CODE
main
ok
back
OUTPUT

1;

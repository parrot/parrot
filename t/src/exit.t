#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/src/exit.t - Exiting

=head1 SYNOPSIS

	% perl t/src/exit.t

=head1 DESCRIPTION

Tests C<Parrot_exit()> and C<Parrot_on_exit()> functions.

=cut

use Parrot::Test tests => 3;

c_output_is(<<'CODE', <<'OUTPUT', "Parrot_exit");
        #include <stdio.h>
        #include "parrot/parrot.h"

        int main(int argc, char* argv[]) {
            printf("pre-exit\n");
            Parrot_exit(0);
            printf("post-exit\n");
            return 0;
        }
CODE
pre-exit
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "Parrot_on_exit / Parrot_exit");
        #include <stdio.h>
        #include "parrot/parrot.h"

        void print_message(int status, void* arg) {
            printf("%s", (char*)arg);
        }

        int main(int argc, char* argv[]) {
            Parrot_on_exit(print_message, "exit1\n");
            Parrot_on_exit(print_message, "exit2\n");
            Parrot_on_exit(print_message, "exit3\n");
            printf("pre-exit\n");
            Parrot_exit(0);
            printf("post-exit\n");
        }
CODE
pre-exit
exit3
exit2
exit1
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "on_exit - interpreter");
#include <stdio.h>
#include <parrot/parrot.h>
#include <parrot/embed.h>

void ex1(int x, void*p)
{
    printf("ex1\n");
}

void ex2(int x, void*p)
{
    printf("ex2\n");
}

void ex3(int x, void*p)
{
    Parrot_Interp interpreter = (Parrot_Interp) p;
    PIO_printf(interpreter, "ex3\n");
}

int main(int argc, char* argv[])
{
    struct Parrot_Interp *     interpreter;

    interpreter = Parrot_new(NULL);
    if (!interpreter) {
        return 1;
    }
    Parrot_init(interpreter);
    Parrot_on_exit(ex1, 0);
    Parrot_on_exit(ex2, 0);
    Parrot_on_exit(ex3, interpreter);
    Parrot_exit(0);
    exit(0);
}
CODE
ex3
ex2
ex1
OUTPUT
1;

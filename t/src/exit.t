#! perl
# Copyright (C) 2001-2011, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;
use Parrot::Config;
use File::Spec::Functions;

my $parrot_config = "parrot_config" . $PConfig{o};

plan skip_all => 'src/parrot_config.o does not exist' unless -e catfile("src", $parrot_config);

plan tests => 1;

=head1 NAME

t/src/exit.t - Exiting

=head1 SYNOPSIS

    % prove t/src/exit.t

=head1 DESCRIPTION

Tests C<Parrot_x_exit()> and C<Parrot_x_on_exit()> functions.

=cut

c_output_is( <<'CODE', <<'OUTPUT', "on_exit - interpreter" );
#include <stdio.h>
#include <parrot/parrot.h>

void
ex1(PARROT_INTERP, int x, void*p)
{
    printf("ex1\n");
}

void
ex2(PARROT_INTERP, int x, void*p)
{
    printf("ex2\n");
}

void
ex3(PARROT_INTERP, int x, void*p)
{
    Parrot_io_printf(interp, "ex3\n");
}

int
main(int argc, char* argv[])
{
    Interp *interp;

    interp = Parrot_interp_new(NULL);
    if (interp) {
        Parrot_x_on_exit(interp, ex1, 0);
        Parrot_x_on_exit(interp, ex2, 0);
        Parrot_x_on_exit(interp, ex3, 0);
        Parrot_x_exit(interp, 0);
    }
    exit(0);
}
CODE
ex3
ex2
ex1
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

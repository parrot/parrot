#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id: warnings.t 23381 2007-12-02 21:33:30Z paultcochrane $

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;

plan tests => 3;

my @TODO = ( todo => 'vtable not NULL after destroy' );

=head1 NAME

t/src/vtables.t - Test functions to build and manipulate vtables

=head1 SYNOPSIS

    % prove t/src/vtables.t

=head1 DESCRIPTION

Test functions defined in src/vtables.c

=head1 HISTORY

Hacked from t/src/warnings.t

=cut

c_output_is( <<'CODE', <<'OUTPUT', "Parrot_new_vtable" );

#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/vtables.h>

int
main(int argc, char* argv[])
{
    Interp *interp;
    VTABLE *vtable;

    interp = Parrot_new(NULL);
    if (!interp) {
        return 1;
    }

    vtable = Parrot_new_vtable(interp);
    if (vtable)
        printf("ok\n");
    else
        printf("not ok\n");

    Parrot_exit(interp, 0);
    return 0;
}
CODE
ok
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', "Parrot_clone_vtable" );

#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/vtables.h>

int
main(int argc, char* argv[])
{
    Interp *interp;
    VTABLE *vtable_base;
    VTABLE *vtable_clone;

    interp = Parrot_new(NULL);
    if (!interp) {
        return 1;
    }

    vtable_base = Parrot_new_vtable(interp);
    if (vtable_base)
        printf("ok\n");
    else
        printf("not ok\n");

    vtable_clone = Parrot_clone_vtable(interp, vtable_base);
    if (vtable_clone)
        printf("ok\n");
    else
        printf("not ok\n");

    Parrot_exit(interp, 0);
    return 0;
}
CODE
ok
ok
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', "Parrot_destroy_vtable", @TODO );

#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/vtables.h>

int
main(int argc, char* argv[])
{
    Interp *interp;
    VTABLE *vtable;

    interp = Parrot_new(NULL);
    if (!interp) {
        return 1;
    }

    vtable = Parrot_new_vtable(interp);
    if (vtable)
        printf("ok\n");
    else
        printf("not ok\n");

    Parrot_destroy_vtable(interp, vtable);

    if (!vtable)
        printf("ok\n");
    else
        printf("not ok\n");

    Parrot_exit(interp, 0);
    return 0;
}
CODE
ok
ok
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

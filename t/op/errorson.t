#!parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/op/errorson.t - Test the errorson opcode

=head1 SYNOPSIS

% prove t/op/errorson.t

=head1 DESCRIPTION

Tests that the errorson opcode turns exception-throwing on and off correctly.

=cut

.sub test_main :main
    .include 'test_more.pir'
    .include 'errors.pasm'

    plan(1)
    test_find_name()
.end

.sub test_find_name
       errorson .PARROT_ERRORS_GLOBALS_FLAG
       push_eh myhandler
       $P0 = find_name "i_better_not_exist_or_this_thing_is_crazy"
       pop_eh
       if null $P0 goto wasnull
       ok(0, "variable not null, must have existed somehow. inconceivable!")
       .return()
wasnull:
       todo(0,'errorson did not throw an exception for calling find_name on an unbound variable with PARROT_ERRORS_GLOBALS_FLAG')
       .return()
myhandler:
       pop_eh
       ok(1,'errorson threw an exception for calling find_name on an unbound variable with PARROT_ERRORS_GLOBALS_FLAG')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

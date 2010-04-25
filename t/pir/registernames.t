#!./parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

t/pir/registernames.t - Tests for PIR register variable names

=head1 SYNOPSIS

    % prove t/pir/registernames.t

=head1 DESCRIPTION

Tests for register variable names in PIR.

=cut

.sub 'main' :main
    .include 'test_more.pir'
    plan(1)
    test_I01_is_not_I1()
.end

.sub test_I01_is_not_I1
    $I1  = 1
    $I01 = 2
    isnt($I1,$I01, 'Register variables "$I1" and "$I01" are not the same variable')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:


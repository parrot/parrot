#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/op/00ff-dos.t - DOS File Format

=head1 SYNOPSIS

        % prove t/op/00ff-dos.t

=head1 DESCRIPTION

Tests file formats.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(2)

    test_fileformat_dos()
    test_fileformat_dos_ctrl_z()

.end

.sub test_fileformat_dos
    lives_ok( <<"CODE", 'fileformat dos')
.sub main
    $I0 = 42\r\n
.end
CODE
.end

.sub test_fileformat_dos_ctrl_z
    lives_ok( <<"CODE", 'fileformat dos w ctrl-z')
.sub main
    $I0 = 42\r\n\cZ
.end
CODE
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/op/00ff-unix.t - UNIX File format

=head1 SYNOPSIS

        % prove t/op/00ff-unix.t

=head1 DESCRIPTION

Tests file formats.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(1)

    test_fileformat_unix()
.end

.sub test_fileformat_unix
    lives_ok( <<'CODE', 'fileformat unix' )
.sub main
    print "# testing\n"
.end
CODE
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

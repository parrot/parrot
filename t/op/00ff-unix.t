#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/00ff-unix.t - UNIX File format

=head1 SYNOPSIS

	% perl t/op/00ff-unix.t

=head1 DESCRIPTION

Tests file formats.

=cut

use strict;

use Parrot::Test tests => 1;

output_is(<<'CODE', <<'OUT', "fileformat unix");
    print "ok\n"
    end
CODE
ok
OUT

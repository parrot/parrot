#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/00ff-dos.t - DOS File Format

=head1 SYNOPSIS

	% perl t/op/00ff-dos.t

=head1 DECSRIPTION

Tests file formats.

=cut

use strict;

use Parrot::Test tests => 2;

output_is(<<'CODE', <<'OUT', "fileformat dos");
    print "ok\n"
    end
CODE
ok
OUT

output_is(<<'CODE', <<'OUT', "fileformat dos w ctrl-z");
    print "ok\n"
    end

CODE
ok
OUT

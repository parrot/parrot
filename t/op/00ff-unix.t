#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;


=head1 NAME

t/op/00ff-unix.t - UNIX File format

=head1 SYNOPSIS

	% prove t/op/00ff-unix.t

=head1 DESCRIPTION

Tests file formats.

=cut


output_is(<<'CODE', <<'OUT', "fileformat unix");
    print "ok\n"
    end
CODE
ok
OUT


## remember to change the number of tests :-)
BEGIN { plan tests => 1; }

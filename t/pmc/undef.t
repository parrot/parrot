#! perl -w
# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/undef.t - Undef PMC

=head1 SYNOPSIS

	% perl -Ilib t/pmc/undef.t

=head1 DESCRIPTION

Tests mainly morphing undef to other types.

=cut

use Parrot::Test tests => 1;
use Test::More qw(skip);

output_is(<<'CODE', <<'OUTPUT', "morph to string");
        new P0, .String
        new P1, .Undef
        set P0, "foo"
        concat  P1, P0, P0
	print P1
	print "\n"
        end
CODE
foofoo
OUTPUT

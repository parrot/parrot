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

use Parrot::Test tests => 2;
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

output_is(<< 'CODE', << 'OUTPUT', "check wether interface is done");
##PIR##
.sub _main
    .local pmc pmc1
    pmc1 = new Undef
    .local int bool1
    does bool1, pmc1, "scalar"
    print bool1
    print "\n"
    does bool1, pmc1, "no_interface"
    print bool1
    print "\n"
    end
.end
CODE
1
0
OUTPUT


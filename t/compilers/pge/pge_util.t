#! perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id: pge_globs.t 11501 2006-02-10 18:27:13Z particle $

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;
use Parrot::Test::PGE;


=head1 NAME

t/library/pge_util.t - Parrot Grammar Engine tests of utility rules

=head1 SYNOPSIS

	% prove -Ilib t/library/pge_util.t

=cut

my $str = "How will this\nstring choose\nto explode?\n\nTest";
p6rule_like($str, 'expl <PGE::Util::die: kaboom>', 
    qr/^kaboom at line 3, near "ode\?\\n\\n/, "die");

BEGIN { plan tests => 1; }

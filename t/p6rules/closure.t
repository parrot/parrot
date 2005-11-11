#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib ../../../lib );
use Test::More;
use Parrot::Test;
use Parrot::Test::PGE;


=head1 NAME

t/p6rules/closure.t - PGE closure tests

=head1 DESCRIPTION

These tests are based on L<http://dev.perl.org/perl6/doc/design/syn/S05.html>,
ver. 7, in the B<'Bracket rationalization'> section

=head1 SYNOPSIS

	% prove t/p6rules/closure.t

=cut


p6rule_like("abcd",  "<alpha>**{3} {{ print match }}",
    qr/abcmatched/, "PIR closure");

p6rule_like("123 any",  
    ":lang(PIR) <digit>+ {{ I0 = match \n I0 *= 2 \n print I0 }}",
    qr/246/, "multi-line PIR closure");

p6rule_like("123 any",
    ":lang(PASM) <digit>+ {{{{
        .pcc_sub _foo:
        print \"foo\\n\"
        set_returns \"()\"
        returncc
     }}}}",
     qr/foo/, "multi-line PASM closure");


# remember to change the number of tests :-)
BEGIN { plan tests => 3; }

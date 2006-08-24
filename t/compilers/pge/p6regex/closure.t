#!perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib ../../../lib );
use Test::More;
use Parrot::Test tests => 6;
use Parrot::Test::PGE;


=head1 NAME

t/p6regex/closure.t - PGE closure tests

=head1 DESCRIPTION

These tests are based on L<http://dev.perl.org/perl6/doc/design/syn/S05.html>,
ver. 7, in the B<'Bracket rationalization'> section

=head1 SYNOPSIS

	% prove t/p6regex/closure.t

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

p6rule_like("abcdef",
    ":lang(PIR) abc {{{{
        .return (\"xyz\")
     }}}}",
    qr/xyz/, "PIR closure with return");

p6rule_like("abcdef",
    ":lang(PIR) abc {{{{
        .return (\"xyz\")
     }}}} ghi",
    qr/xyz/, "PIR closure with return always succeeds");

p6rule_like("1234xyz5678",
    ":lang(PIR) 2\\d\\d {{{{
        \$I0 = match
        \$I0 += 123
        .return (\$I0)
     }}}} ghi",
    qr/357/, "PIR closure modifying match");
 

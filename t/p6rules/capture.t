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

t/p6rules/capture.t - PGE capture tests

=head1 DESCRIPTION

These tests are based on L<http://dev.perl.org/perl6/doc/design/syn/S05.html>,
ver. 7, in the B<'Bracket rationalization'> section

=head1 SYNOPSIS

	% prove t/p6rules/capture.t

=cut


p6rule_is  ('zzzabcdefzzz', '(a.)..(..)', 'basic match');
p6rule_like('zzzabcdefzzz', '(a.)..(..)', qr/mob: <abcdef @ 3>/, 'basic $0');
p6rule_like('zzzabcdefzzz', '(a.)..(..)', qr/mob 0: <ab @ 3>/, 'basic $1');
p6rule_like('zzzabcdefzzz', '(a.)..(..)', qr/mob 1: <ef @ 7>/, 'basic $2');

p6rule_is  ('abcd', '(a(b(c))(d))', 'nested match');
p6rule_like('abcd', '(a(b(c))(d))', qr/mob: <abcd @ 0>/, 'nested match');
p6rule_like('abcd', '(a(b(c))(d))', qr/mob 0: <abcd @ 0>/, 'nested match');
p6rule_like('abcd', '(a(b(c))(d))', qr/mob 0 0: <bc @ 1>/, 'nested match');
p6rule_like('abcd', '(a(b(c))(d))', qr/mob 0 0 0: <c @ 2>/, 'nested match');
p6rule_like('abcd', '(a(b(c))(d))', qr/mob 0 1: <d @ 3>/, 'nested match');

p6rule_like('abcd', '((\w+)+)', qr/mob: <abcd @ 0>/, 'nested match');
p6rule_like('abcd', '((\w+)+)', qr/mob 0: <abcd @ 0>/, 'nested match');
p6rule_like('abcd', '((\w+)+)', qr/mob 0 0: <abcd @ 0>/, 'nested match', todo => 'specification not clear');

{
	my $long_string = join('', 'A'..'Z', 'a'..'z') for 1..10;
	p6rule_like($long_string, '((\w+)+)', qr/mob: <\w+ @ 0>/, 'nested match', todo => 'failing on long strings');
	p6rule_like($long_string, '((\w+)+)', qr/mob 0: <\w+ @ 0>/, 'nested match', todo => 'failing on long strings');
	p6rule_like($long_string, '((\w+)+)', qr/mob 0 0: <\w+ @ 0>/, 'nested match', todo => 'failing on long strings, specification unclear');
}


p6rule_like('abcdefg', '(a) [ (bc) (d) | .* (ef) ] .* (g)',
            qr/mob 0: <a @ 0>/, 'alt subpattern before group');
p6rule_like('abcdefg', '(a) [ (bc) (d) | .* (ef) ] .* (g)',
            qr/mob 1: <bc @ 1>/, 'alt subpattern in group');
p6rule_like('abcdefg', '(a) [ (bc) (d) | .* (ef) ] .* (g)',
            qr/mob 2: <d @ 3>/, 'alt subpattern in group');
p6rule_like('abcdefg', '(a) [ (bc) (d) | .* (ef) ] .* (g)',
            qr/mob 3: <g @ 6>/, 'alt subpattern after group');
p6rule_like('abcdefg', '(a) [ (bc) (x) | .* (ef) ] .* (g)',
            qr/mob 1: <ef @ 4>/, '2nd alt subpattern in group');
p6rule_like('abcdefg', '(a) [ (bc) (x) | .* (ef) ] .* (g)',
            qr/mob 3: <g @ 6>/, '2nd alt subpattern after group');

p6rule_like('abc', '( (.) )*', qr/mob 0 1 0: <b @ 1>/,
            'nested repeated captures');
p6rule_like('abc', '[ (.) ]*', qr/mob 0 1: <b @ 1>/,
            'nested repeated captures');
p6rule_like('abc', '( [.] )*', qr/mob 0 1: <b @ 1>/,
            'nested repeated captures');

p6rule_like('abcdefg', '(.) (.) $7:=(.) (.) $4:=(.)', qr/mob 0: <a @ 0>/,
            'numbered aliases $1');
p6rule_like('abcdefg', '(.) (.) $7:=(.) (.) $4:=(.)', qr/mob 1: <b @ 1>/,
            'numbered aliases $2');
p6rule_like('abcdefg', '(.) (.) $7:=(.) (.) $4:=(.)', qr/mob 7: <c @ 2>/,
            'numbered aliases $7');
p6rule_like('abcdefg', '(.) (.) $7:=(.) (.) $4:=(.)', qr/mob 8: <d @ 3>/,
            'numbered aliases $8');
p6rule_like('abcdefg', '(.) (.) $7:=(.) (.) $4:=(.)', qr/mob 4: <e @ 4>/,
            'numbered aliases $4');


p6rule_like('abcdefg', '$1:=[ (.) (.) (.) ] (.)', qr/mob 1: <abc @ 0>/,
            'perl5 numbered captures $1');
p6rule_like('abcdefg', '$1:=[ (.) (.) (.) ] (.)', qr/mob 2: <a @ 0>/,
            'perl5 numbered captures $1');
p6rule_like('abcdefg', '$1:=[ (.) (.) (.) ] (.)', qr/mob 3: <b @ 1>/,
            'perl5 numbered captures $1');
p6rule_like('abcdefg', '$1:=[ (.) (.) (.) ] (.)', qr/mob 4: <c @ 2>/,
            'perl5 numbered captures $1');
p6rule_like('abcdefg', '$1:=[ (.) (.) (.) ] (.)', qr/mob 5: <d @ 3>/,
            'perl5 numbered captures $1');

p6rule_like('   abc = 123', ':w $<key>:=[\w+] = $<val>:=[\S+]',
            qr/mob<key>: <abc @ 3>/, 'named capture');
p6rule_like('   abc = 123', ':w $<key>:=[\w+] = $<val>:=[\S+]',
            qr/mob<val>: <123 @ 9>/, 'named capture');
p6rule_like('   abc def ghi', ':w (\w+) $<foo>:=(\w+) (\w+)',
            qr/mob<foo>: <def @ 7>/, 'mixing named and unnamed capture');
p6rule_like('   abc def ghi', ':w (\w+) $<foo>:=(\w+) (\w+)',
            qr/mob 1: <ghi @ 11>/, 'mixing named and unnamed capture');

p6rule_is  ('bookkeeper', '[(.)$0]+', 'backreference');
p6rule_like('bookkeeper', '[(.)$0]+', 
            qr/mob 0 0: <o @ 1>/, 'backref $1');
p6rule_like('bookkeeper', '[(.)$0]+', 
            qr/mob 0 1: <k @ 3>/, 'backref $1');
p6rule_like('bookkeeper', '[(.)$0]+', 
            qr/mob 0 2: <e @ 5>/, 'backref $1');

p6rule_like('123x', '(.)*x',
            qr/mob: <123x @ 0>/, 'repeated dot capture');


# remember to change the number of tests :-)
BEGIN { plan tests => 44; }

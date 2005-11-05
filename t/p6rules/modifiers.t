# $Id$

use strict;
use warnings;
use Parrot::Test;
use Parrot::Test::PGE;


## tests based on http://dev.perl.org/perl6/doc/design/syn/S05.html, ver. 7
##   in the 'Modifiers' section


## setup template for pir tests
my $pre = <<PRE;
.sub 'main' :main
    load_bytecode "PGE.pbc"
    load_bytecode "dumper.imc"
    load_bytecode "PGE/Dumper.pir"
    load_bytecode "PGE/Glob.pir"
    load_bytecode "PGE/Text.pir"
    load_bytecode "PGE/Util.pir"
    .local string target
    .local string pattern
    .local string modifier
    .local pmc p6rule_compile
    .local pmc rulesub
    .local pmc pir
    .local pmc exp
    .local pmc match
    find_global p6rule_compile, 'PGE', 'p6rule'
    null match
    null rulesub
PRE
my $post = <<'POST';
    goto OK
NOK:
    print "not "
OK:
    print "ok"
END:
	print "\n"
.end
POST


## :i and :ignorecase -- ignore case
## TODO lexical scoping of :i
p6rule_is  ('abcdef', ':i bcd', 'ignorecase (:i)');
p6rule_is  ('aBcdef', ':i bcd', 'ignorecase (:i)');
p6rule_is  ('abCdef', ':i bcd', 'ignorecase (:i)');
p6rule_is  ('abcDef', ':i bcd', 'ignorecase (:i)');
p6rule_isnt('abc-ef', ':i bcd', 'ignorecase (:i)');
p6rule_is  ('abcdef', ':ignorecase bcd', 'ignorecase (:ignorecase)');
p6rule_is  ('aBCDef', ':ignorecase bcd', 'ignorecase (:ignorecase)');
p6rule_isnt('abc-ef', ':ignorecase bcd', 'ignorecase (:ignorecase)');


## :w and :words -- magically ignore whitespace
## TODO lexical scoping of :w
p6rule_is  ('a bcdef', ':w bcd', 'words (:w)');
p6rule_is  ('a bcd ef', ':w bcd', 'words (:w)');
p6rule_isnt('abcdef', ':w bcd', 'words (:w)');
p6rule_isnt('abcd ef', ':w bcd', 'words (:w)');
p6rule_isnt('ab cdef', ':w bcd', 'words (:w)');
p6rule_is  ('a b c d ef', ':w b c d', 'words (:w)');
p6rule_is  ('a b c def', ':w b c d', 'words (:w)');
p6rule_isnt('ab c d ef', ':w b c d', 'words (:w)');
p6rule_isnt('a bcdef', ':w b c d', 'words (:w)');
p6rule_isnt('abcdef', ':w b c d', 'words (:w)');
p6rule_is  ('a bcdef', ':words bcd', 'words (:words)');
p6rule_is  ('a bcd ef', ':words bcd', 'words (:words)');
p6rule_isnt('abcdef', ':words bcd', 'words (:words)');
p6rule_is  ('a b c d ef', ':words b c d', 'words (:words)');
p6rule_is  ('a b c def', ':words b c d', 'words (:words)');
p6rule_isnt('ab c d ef', ':words b c d', 'words (:words)');


## :once -- match only once
# N.B.: the :once modifier doesn't really belong to PGE or
# p6rule matching, but instead is something the caller keeps
# track of.  (pmichaud, 2005-11-05)


## TODO :c, :p, :g, :bytes, :codes, :graphs, :langs


## :perl5 -- use perl5 regexp syntax
p6rule_is  ('a bcd$ef', ':perl5 \A.*? bcd\Q$\E..\z', 'perl5 syntax (:perl5)', todo => 'not yet implemented');
## TODO lexical scoping of :perl5
## TODO add more tests


## TODO integer modifiers, Nth occurance, :ov, :ex, :rw, :keepall
##   user-defined modifiers


## remember to change the number of tests :-)
BEGIN { plan tests => 25; }

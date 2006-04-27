#! perl
# $Id: $

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib ../../../lib );
use Test::More;
use Parrot::Test;

## remember to change the number of tests :-)
BEGIN { plan tests => 35; }

optable_output_is('a', 'term:a',                    'Simple term');
optable_output_is('a+b', 'infix:+(term:a, term:b)', 'Simple infix');
optable_output_is('a-b', 'infix:-(term:a, term:b)', 'Simple infix');
optable_output_is('a+b+c', 
    'infix:+(infix:+(term:a, term:b), term:c)',
    'left associativity');
optable_output_is('a+b-c', 
    'infix:-(infix:+(term:a, term:b), term:c)',
    'left associativity');
optable_output_is('a-b+c', 
    'infix:+(infix:-(term:a, term:b), term:c)',
    'left associativity');

optable_output_is('a+b*c',
    'infix:+(term:a, infix:*(term:b, term:c))',
    'tighter precedence');
optable_output_is('a*b+c', 
    'infix:+(infix:*(term:a, term:b), term:c)',
    'tighter precedence');

optable_output_is('a/b/c', 
    'infix:/(infix:/(term:a, term:b), term:c)',
    'left associativity');
optable_output_is('a*b/c', 
    'infix:/(infix:*(term:a, term:b), term:c)',
    'left associativity');
optable_output_is('a/b*c', 
    'infix:*(infix:/(term:a, term:b), term:c)',
    'left associativity');

optable_output_is('a=b*c', 
    'infix:=(term:a, infix:*(term:b, term:c))',
    'looser precedence');

optable_output_is('a=b=c',
    'infix:=(term:a, infix:=(term:b, term:c))',
    'right associativity');

optable_output_is('a=b,c,d+e',
    'infix:=(term:a, infix:,(term:b, term:c, infix:+(term:d, term:e)))',
    'list associativity');

optable_output_is('a b', 'term:a (pos=1)', 'two terms in sequence');
optable_output_is('a = = b', 'term:a (pos=1)', 'two opers in sequence');
optable_output_is('a +', 'term:a (pos=1)', 'infix missing rhs');

optable_output_is('a++', 'postfix:++(term:a)', 'postfix');
optable_output_is('a--', 'postfix:--(term:a)', 'postfix');
optable_output_is('++a', 'prefix:++(term:a)', 'prefix');
optable_output_is('--a', 'prefix:--(term:a)', 'prefix');

optable_output_is('a*(b+c)',
  'infix:*(term:a, circumfix:( )(infix:+(term:b, term:c)))',
  'circumfix parens');
optable_output_is('a*b+c)+4',
  'infix:+(infix:*(term:a, term:b), term:c) (pos=5)',
  'extra close paren');
optable_output_is('  )a*b+c)+4', 'failed', 'only close paren');
optable_output_is('(a*b+c', 'failed', 'missing close paren');
optable_output_is('(a*b+c]', 'failed', 'mismatch close paren');


optable_output_is('a+++--b',
  'infix:+(postfix:++(term:a), prefix:--(term:b))',
  'mixed tokens');

optable_output_is('=a+4', 'failed', 'missing lhs term');

optable_output_is('a(b,c)', 
  'postcircumfix:( )(term:a, infix:,(term:b, term:c))',
  'postcircumfix');
optable_output_is('a (b,c)',
  'term:a (pos=1)', 
  'nows on postcircumfix');

optable_output_is('a()', 'postcircumfix:( )(term:a, null)', 
  'nullterm in postcircumfix');
optable_output_is('a[]', 'term:a (pos=1)',
  'nullterm disallowed');

optable_output_is('(a=b;c;d)',
    'circumfix:( )(infix:;(infix:=(term:a, term:b), term:c, term:d))',
    'loose list associativity in circumfix');

optable_output_is('(a;b);d',
    'circumfix:( )(infix:;(term:a, term:b)) (pos=5)',
    'top-level stop token');

optable_output_is('a,b;c',
    'infix:,(term:a, term:b) (pos=3)',
    'top-level stop token');



################

sub optable_output_is {
    my($test, $output, $msg, %opt) = @_;
    my($pir) = <<'CODE';
.sub main :main
    load_bytecode 'compilers/pge/PGE.pir'
    load_bytecode 'dumper.pir'
    load_bytecode 'PGE/Dumper.pir'

    .local pmc optable
    optable = new 'PGE::OPTable'

    optable.newtok('infix:+', 'precedence'=>'=')
    optable.newtok('infix:-', 'equiv'=>'infix:+')
    optable.newtok('infix:*', 'tighter'=>'infix:+')
    optable.newtok('infix:/', 'equiv'=>'infix:*')
    optable.newtok('infix:**', 'tighter'=>'infix:*')
    optable.newtok('infix:==', 'looser'=>'infix:+')
    optable.newtok('infix:=', 'looser'=>'infix:==', 'assoc'=>'right')
    optable.newtok('infix:,', 'tighter'=>'infix:=', 'assoc'=>'list')
    optable.newtok('infix:;', 'looser'=>'infix:=', 'assoc'=>'list')

    optable.newtok('prefix:++', 'tighter'=>'infix:**')
    optable.newtok('prefix:--', 'equiv'=>'prefix:++')
    optable.newtok('postfix:++', 'equiv'=>'prefix:++')
    optable.newtok('postfix:--', 'equiv'=>'prefix:++')

    .local pmc ident
    ident = find_global 'PGE::Regex', 'ident'
    optable.newtok('term:', 'tighter'=>'prefix:++', 'parsed'=>ident)
    optable.newtok('circumfix:( )', 'equiv'=>'term:')
    optable.newtok('circumfix:[ ]', 'equiv'=>'term:')
    optable.newtok('postcircumfix:( )', 'looser'=>'term:', 'nows'=>1, 'nullterm'=>1)
    optable.newtok('postcircumfix:[ ]', 'equiv'=>'postcircumfix:( )', 'nows'=>1)

    .local string test
    test = "<<test>>"

    .local pmc match
    match = optable.parse(test, 'stop'=>';')
    unless match goto fail
    $P0 = match['expr']
    tree($P0)
    $I0 = match.to()
    $I1 = length test
    if $I0 == $I1 goto succeed
    print " (pos="
    print $I0
    print ")"
  succeed:
    print "\n"
    goto end
  fail:
    print "failed\n"
  end:
.end
   
.sub 'tree'
    .param pmc match
    .local string type
    $S0 = match
    if $S0 == "" goto print_null
    type = match['type']
    print type
    if type == 'term:' goto print_term
    print '('
    .local pmc iter
    $P0 = match.get_array()
    if null $P0 goto iter_end
    unless $P0 goto iter_end
    iter = new .Iterator, $P0
    iter = 0
    unless iter goto iter_end
  iter_loop:
    $P0 = shift iter
    tree($P0)
    unless iter goto iter_end
    print ', '
    goto iter_loop
  iter_end:
    print ')'
    goto end

  print_null:
    print "null"
    goto end
  print_term:
    print match
  end:
    .return ()
.end
CODE
    $pir =~ s/<<test>>/$test/g;
    $output .= "\n";
    pir_output_is($pir, $output, $msg, %opt);
}

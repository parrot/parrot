# Copyright (C) 2007, The Perl Foundation.
# $Id$

.sub '__onload' :init :load
    $P0 = newclass 'NQP::Grammar::Actions'

    $P0 = new 'ResizablePMCArray'
    set_hll_global ['NQP::Grammar::Actions'], '@?BLOCK', $P0
    .return ()
.end

.namespace [ 'NQP::Grammar::Actions' ]


##    method TOP($/) {
##        return PAST::Block.new($($<statement_list>),
##                               node => $/,
##                               name => 'anon',
##                               );
##    }
.sub 'TOP' :method
    .param pmc match
    .local pmc cpast, past
    $P0 = match['statement_list']
    cpast = $P0.'get_scalar'()
    $P0 = getclass 'PAST::Block'
    past = $P0.'new'(cpast, 'node'=>match, 'name'=>'anon')
    .return (past)
.end


#### Blocks and Statements ####

##    method statement_list($/) {
##        my $past := PAST::Stmts.new(node=>$/)
##        for $<statement> {
##            $past.push($($_));
##        }
##        return $past;
##    }
.sub 'statement_list' :method
    .param pmc match
    .local pmc past
    $P0 = getclass 'PAST::Stmts'
    past = $P0.'new'('node'=>match)
    $P1 = match['statement']
    if null $P1 goto iter_end
    .local pmc iter
    iter = new 'Iterator', $P1
  iter_loop:
    unless iter goto iter_end
    $P2 = shift iter
    $P2 = $P2.'get_scalar'()
    past.'push'($P2)
    goto iter_loop
  iter_end:
    .return (past)
.end


##    method statement($/, $key) {
##        return $($/{$key});
##    }
.sub 'statement' :method
    .param pmc match
    .param string key
    $P0 = match[key]
    .return $P0.'get_scalar'()
.end


##    method if_statement($/) {
##        my $past := PAST::Op.new($($<EXPR>),
##                                 $($<block>[0]),
##                                 pasttype => $<sym>,
##                                 node => $/);
##        if ($<block>[1]) {
##            $past.push($(<block>[1]));
##        }
##        return $past;
.sub 'if_statement' :method
    .param pmc match
    .local pmc block, past
    $P0 = match['EXPR']
    $P0 = $P0.'get_scalar'()
    block = match['block']
    $P1 = block[0]
    $P1 = $P1.'get_scalar'()
    $P2 = getclass 'PAST::Op'
    $S1 = match['sym']
    past = $P2.'new'($P0, $P1, 'pasttype'=>$S1, 'node'=>match)
    $I0 = exists block[1]
    unless $I0 goto end
    $P1 = block[1]
    $P1 = $P1.'get_scalar'()
    past.'push'($P1)
  end:
    .return (past)
.end


##    method block($/, $key) {
##        our $?BLOCK, @?BLOCK;
##        if ($key ne 'close') {
##            $?BLOCK := PAST::Block.new( :blocktype('immediate'),
##                                           :node($/) );
##            unshift @?BLOCK, $?BLOCK;
##        }
##        else {
##            my $past := shift @?BLOCK;
##            $?BLOCK := @?BLOCK[0];
##            $past.push($($<statement_list>));
##            .return ($past);
##        }
##    }
.sub 'block' :method
    .param pmc match
    .param string key
    if key == 'close' goto block_close
  block_open:
    .local pmc past
    $P0 = getclass 'PAST::Block'
    past = $P0.'new'('blocktype'=>'immediate', 'node'=>match)
    set_global '$?BLOCK', past
    $P0 = get_global '@?BLOCK'
    unshift $P0, past
    .return ()
  block_close:
    $P0 = get_global '@?BLOCK'
    past = shift $P0
    $P1 = $P0[0]
    set_global '$?BLOCK', $P1
    $P2 = match['statement_list']
    $P3 = $P2.'get_scalar'()
    past.'push'($P3)
    .return (past)
.end


#### Subroutine and method definitions ####

##    method routine_def($/) {
##        my $past = PAST::Block.new( :name(~$<ident>),
##                                    :blocktype('declaration'),
##                                    :pragma(':method'),
##                                    :node($/) );
##        for $<signature>[0] {
##            $past.push($($_['param_var']));
##        }
##        for $($<block>).iterator() {
##            $past.push($_);
##        }
##        return $past;
##    }
.sub 'routine_def' :method
    .param pmc match
    .local pmc past
    $S0 = match['ident']
    $P0 = getclass 'PAST::Block'
    past = $P0.'new'('name'=>$S0, 'blocktype'=>'declaration', 'node'=>match)
    $S0 = match['declarator']
    if $S0 != 'method' goto add_signature
    past.'pragma'(':method')
  add_signature:
    $P0 = match['signature']
    $P0 = $P0[0]
    unless $P0 goto param_end
    .local pmc iter
    iter = new 'Iterator', $P0
  param_loop:
    unless iter goto param_end
    $P1 = shift iter
    $P1 = $P1['param_var']
    $P1 = $P1.'get_scalar'()
    past.push($P1)
    goto param_loop
  param_end:
    $P0 = match['block']
    $P0 = $P0.'get_scalar'()
    iter = $P0.'iterator'()
  block_loop:
    unless iter goto block_end
    $P0 = shift iter
    past.'push'($P0)
    goto block_loop
  block_end:
    .return (past)
.end


##    method param_var($/) {
##        return PAST::Var.new(:name(~$/),
##                             :scope('parameter'),
##                             :node($/) );
##    }
.sub 'param_var' :method
    .param pmc match
    $S0 = match
    $P0 = getclass 'PAST::Var'
    .return $P0.'new'('name'=>$S0, 'scope'=>'parameter', 'node'=>match)
.end


#### Terms and expressions ####

##    method term($/, $key) {
##        my $past := $($<noun>);
##        for $<methodop> {
##          $past = PAST::Op.new($past,
##                               :name(~$_<ident>),
##                               :pasttype('callmethod'),
##                               :node($_) );
##          if ($<methodop><EXPR>) {
##              $past.push($($<EXPR>[0]));
##          }
##        }
##        return $past;
##    }
.sub 'term' :method
    .param pmc match
    .param pmc key
    .local pmc past
    $P0 = match['noun']
    past = $P0.'get_scalar'()
    $P1 = match['methodop']
    if null $P1 goto iter_end
    .local pmc iter
    iter = new Iterator, $P1
  iter_loop:
    unless iter goto iter_end
    $P2 = shift iter
    $S2 = $P2['ident']
    $P3 = getclass 'PAST::Op'
    past = $P3.'new'(past, 'name'=>$S2, 'pasttype'=>'callmethod', 'node'=>$P2)
    $P4 = $P2['EXPR']
    if null $P4 goto iter_loop
    $P5 = $P4[0]
    $P6 = $P5.'get_scalar'()
    past.push($P6)
    goto iter_loop
  iter_end:
    .return (past)
.end


##    method noun($/, $key) {
##        return $($/{$key});
##    }
.sub 'noun' :method
    .param pmc match
    .param pmc key
    $P0 = match[key]
    .return $P0.'get_scalar'()
.end


##    method colonpair($/) {
##        return PAST::Op.new( PAST::Val.new( :value(~$<ident>),
##                                            :node($<ident>)),
##                             $($<EXPR>),
##                             :name('infix:=>'),
##                             :returns('Pair'),
##                             :node($/)
##                           );
##    }
.sub 'colonpair' :method
    .param pmc match
    $S0 = match['ident']
    $P0 = match['ident']
    $P9 = getclass 'PAST::Val'
    $P1 = $P9.'new'('value'=>$S0, 'node'=>$P0)
    $P2 = match['EXPR']
    $P2 = $P2.'get_scalar'()
    $P9 = getclass 'PAST::Op'
    .return $P9.'new'($P1, $P2, 'name'=>'infix:=>', 'returns'=>'Pair', 'node'=>match)
.end


##    method variable($/, $key) {
##        if ($key eq '$< >') {
##            return PAST::Var.new(
##                       PAST::Var.new(scope=>'lexical', name=>'$/'),
##                       PAST::Val.new(value=>~$[0]),
##                       scope=>'keyed');
##        }
##        return PAST::Var.new(node=>$/, name=>~$/)
##    }
.sub 'variable' :method
    .param pmc match
    .param pmc key
    if key != '$< >' goto past_var
  past_match_keyed:
    $P0 = getclass 'PAST::Var'
    $P1 = $P0.'new'('scope'=>'lexical', 'name'=>'$/')
    $P2 = getclass 'PAST::Val'
    $S0 = match[0]
    $P3 = $P2.'new'('value'=>$S0)
    .return $P0.'new'($P1, $P3, 'scope'=>'keyed')
  past_var:
    $S0 = match
    $P0 = getclass 'PAST::Var'
    .return $P0.'new'('node'=>match, 'name'=>$S0, 'scope'=>'package')
.end


##    method quote($/, $key) {
##        return PAST::Val.new(node=>$/, value=>~($<quote_literal>))
##    }
.sub 'quote' :method
    .param pmc match
    .param pmc key             :optional
    .local string value
    $P0 = match['quote_literal']
    value = $P0.'get_scalar'()
    $P0 = getclass 'PAST::Val'
    .return $P0.'new'('node'=>match, 'value'=>value)
.end


##    method number($/, $key?) {
##        return PAST::Val.new(node=>$/, name=>~$/, vtype=>"Integer");
##    }
.sub 'number' :method
    .param pmc match
    .param pmc key             :optional
    .local pmc past
    $I0 = match
    $P0 = getclass 'PAST::Val'
    past = $P0.'new'('node'=>match, 'value'=>$I0)
    .return (past)
.end


##    method subcall($/, $key?) {
##        my sub subcallarg($arg) {
##            if $arg.returns() eq 'Pair' {
##                $arg[1].named($arg[0]);
##                $arg := $arg[1];
##            }
##            $arg;
##        }
##        my $past = PAST::Op.new(node=>$/, name=>$<name>, pasttype=>'call')
##        if ($<EXPR>) {
##            my $expr := $($<EXPR>[0]);
##            if ($expr.name() eq 'infix:,') {
##                for @($expr) {
##                    $past.push( subcallarg($_) );
##                }
##            }
##            else {
##                $past.push( subcallarg($expr) );
##            }
##        }
##        return $past;
##    }
.sub 'subcall' :method
    .param pmc match
    .param pmc key             :optional
    .local string name
    name = match['name']
    .local pmc past
    $P0 = getclass 'PAST::Op'
    past = $P0.'new'('node'=>match, 'name'=>name, 'pasttype'=>'call')
    $P0 = match['EXPR']
    if null $P0 goto end
    .local pmc expr
    $P1 = $P0[0]
    expr = $P1.'get_scalar'()
    $S0 = expr.'name'()
    if $S0 != 'infix:,' goto one_arg
    .local pmc iter
    iter = expr.'iterator'()
  iter_loop:
    unless iter goto end
    $P0 = shift iter
    $P0 = 'subcallarg'($P0)
    past.'push'($P0)
    goto iter_loop
  one_arg:
    $P0 = 'subcallarg'(expr)
    past.'push'($P0)
  end:
    .return (past)
.end

.sub 'subcallarg'
    .param pmc arg
    $S0 = arg.'returns'()
    unless $S0 == 'Pair' goto end
    $P0 = arg[0]
    $P1 = arg[1]
    $P1.'named'($P0)
    arg = $P1
  end:
    .return (arg)
.end


#### Expressions and operators ####

##    method EXPR($/, $key) {
##        if ($key eq 'end') { return $($<expr>); }
##        my $past := PAST::Op.new(node=>$/, name=>$<type>, pirop=>$<top><pirop>)
##        for @($/) {
##            $past.push($($_));
##        }
##        return $past;
##    }
.sub 'EXPR' :method
    .param pmc match
    .param pmc key
    if key != 'end' goto expr_reduce
  expr_end:
    $P0 = match['expr']
    .return $P0.'get_scalar'()
  expr_reduce:
    .local pmc past
    .local string name, pirop
    name = match['type']
    pirop = match['top';'pirop']
    $P0 = getclass 'PAST::Op'
    past = $P0.'new'('node'=>match, 'name'=>name, 'pirop'=>pirop)
    $P1 = match.'get_array'()
    if null $P1 goto iter_end
    .local pmc iter
    iter = new 'Iterator', $P1
  iter_loop:
    unless iter goto iter_end
    $P2 = shift iter
    $P2 = $P2.'get_scalar'()
    past.'push'($P2)
    goto iter_loop
  iter_end:
    .return (past)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

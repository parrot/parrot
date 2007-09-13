# Copyright (C) 2007, The Perl Foundation.
# $Id$

.sub '__onload' :init :load
    $P0 = newclass 'NQP::Grammar::Actions'

    ##  create the stack for nested lexical blocks
    $P0 = new 'ResizablePMCArray'
    set_hll_global ['NQP::Grammar::Actions'], '@?BLOCK', $P0

    ##  initialize optable with inline PIR
    .local pmc optable
    optable = get_hll_global [ 'NQP::Grammar' ], '$optable'
    optable['prefix:~'; 'inline'] = <<"        END"
        ##  inline prefix:~
        $S0 = %0
        %r = new 'String'
        %r = $S0
        END

    optable['prefix:+'; 'inline'] = <<"        END"
        ##  inline prefix:+
        $I0 = %0
        %r = new 'Integer'
        %r = $I0
        END

    optable['infix:=='; 'inline'] = <<"        END"
        ##  inline infix:==
        $I0 = cmp_num %0, %1
        $I0 = iseq $I0, 0
        %r = new 'Integer'
        %r = $I0
        END

    optable['infix:!='; 'inline'] = <<"        END"
        ##  inline infix:!=
        $I0 = cmp_num %0, %1
        $I0 = isne $I0, 0
        %r = new 'Integer'
        %r = $I0
        END

    optable['infix:eq'; 'inline'] = <<"        END"
        ##  inline infix:eq
        $I0 = cmp_str %0, %1
        $I0 = iseq $I0, 0
        %r = new 'Integer'
        %r = $I0
        END

    optable['infix:ne'; 'inline'] = <<"        END"
        ##  inline infix:ne
        $I0 = cmp_str %0, %1
        $I0 = isne $I0, 0
        %r = new 'Integer'
        %r = $I0
        END

    optable['prefix:!'; 'inline'] = <<"        END"
        ##  inline prefix:!
        $I0 = isfalse %0
        %r = new 'Integer'
        %r = $I0
        END

    optable['prefix:?'; 'inline'] = <<"        END"
        ##  inline prefix:?
        $I0 = istrue %0
        %r = new 'Integer'
        %r = $I0
        END

    .return ()
.end

.namespace [ 'NQP::Grammar::Actions' ]


##    method TOP($/, $key) {
##        return self.block($/, $key);
##    }
.sub 'TOP' :method
    .param pmc match
    .param string key
    .return self.'block'(match, key)
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


##    method for_statement($/) {
##        my $block := $<block>;
##        $block.blocktype('sub');
##        $block.symbol('$_', scope => 'lexical');
##        my $topic_var := PAST::Var.new(name => '$_', scope => 'parameter');
##        push @($block[0]), $topic_var;
##        my $past := PAST::Op.new($($<EXPR>),
##                                 $($<block>),
##                                 pasttype => $<sym>,
##                                 node => $/);
##        return $past;
.sub 'for_statement' :method
    .param pmc match
    .local pmc block, past
    $P0  = match['EXPR']
    $P0  = $P0.'get_scalar'()
    $P1  = match['block']
    block = $P1.'get_scalar'()
    block.'blocktype'('sub')
    .local pmc params, topic_var
    params = block[0]
    $P3 = getclass 'PAST::Var'
    topic_var = $P3.'new'('name'=>'$_', 'scope'=>'parameter')
    params.'push'(topic_var)
    block.'symbol'('$_', 'scope'=>'lexical')
    $P2  = getclass 'PAST::Op'
    $S1  = match['sym']
    past = $P2.'new'($P0, block, 'pasttype'=>$S1, 'node'=>match)
    .return (past)
.end


##    method block($/, $key) {
##        our $?BLOCK, @?BLOCK;
##        if ($key ne 'close') {
##            $?BLOCK := PAST::Block.new( PAST::Stmts.new(),
##                                        :blocktype('immediate'),
##                                        :node($/) );
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
    $P1 = getclass 'PAST::Stmts'
    $P2 = $P1.'new'()
    $P0 = getclass 'PAST::Block'
    past = $P0.'new'($P2, 'blocktype'=>'immediate', 'node'=>match)
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
##        my $past := $($<block>);
##        $past.name(~$<ident>);
##        $past.blocktype('declaration');
##        $past.node($/);
##        if $<declarator> eq 'method' { $past.pragma(':method'); }
##        my $params := $past[0];
##        for $<signature>[0] {
##            my $param_var := $($_<param_var>);
##            $past.symbol($param_var.name(), :scope('lexical'));
##            $params.push($param_var);
##        }
##        return $past;
##    }
.sub 'routine_def' :method
    .param pmc match
    .local pmc past
    $P0 = match['block']
    past = $P0.'get_scalar'()
    $S0 = match['ident']
    past.'name'($S0)
    past.'blocktype'('declaration')
    past.'node'(match)
    $S0 = match['declarator']
    if $S0 != 'method' goto add_signature
    past.'pragma'(':method')
  add_signature:
    .local pmc params
    params = past[0]
    $P0 = match['signature']
    $P0 = $P0[0]
    unless $P0 goto param_end
    .local pmc iter
    iter = new 'Iterator', $P0
  param_loop:
    unless iter goto param_end
    $P1 = shift iter
    .local pmc param_var
    $P2 = $P1['param_var']
    param_var = $P2.'get_scalar'()
    $S0 = param_var['name']
    past.'symbol'($S0, 'scope'=>'lexical')
    params.'push'(param_var)
    goto param_loop
  param_end:
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
##        for $<postfix> {
##            my $term := $past;
##            $past := $($_);
##            $past.unshift($term);
##        }
##        return $past;
##    }
.sub 'term' :method
    .param pmc match
    .param pmc key
    .local pmc past
    $P0 = match['noun']
    past = $P0.'get_scalar'()
    $P1 = match['postfix']
    if null $P1 goto end
    .local pmc iter, term
    iter = new 'Iterator', $P1
  iter_loop:
    unless iter goto end
    $P2 = shift iter
    term = past
    past = $P2.'get_scalar'()
    past.'unshift'(term)
    goto iter_loop
  end:
    .return (past)
.end


##    method postfix($/, $key) {
##        return $($/{$key});
##    }
.sub 'postfix' :method
    .param pmc match
    .param string key
    $P0 = match[key]
    .return $P0.'get_scalar'()
.end


##    method methodop($/, $key) {
##        my $past := $($<arglist>);
##        $past.name(~$<ident>);
##        $past.pasttype('callmethod');
##        $past.node($/);
##        return $past;
##    }
.sub 'methodop' :method
    .param pmc match
    .param string key
    .local pmc past
    $P0 = match['arglist']
    past = $P0.'get_scalar'()
    $S0 = match['ident']
    past.'name'($S0)
    past.'pasttype'('callmethod')
    past.'node'(match)
    .return (past)
.end


##    method postcircumfix($/, $key) {
##        if $key eq '( )' {
##            my $past := $($<arglist>);
##            $past.pasttype('call');
##            $past.node($/);
##            return $past;
##        }
##        if $key eq '< >' {
##            my $value := PAST::Val.new( :value( $($<string_literal>) ) );
##            return PAST::Var.new( $value,
##                                  :scope('keyed'),
##                                  :viviself('Hash'),
##                                  :node( $/ ) );
##        }
##        return PAST::Var.new( $($<EXPR>),
##                              :scope('keyed'),
##                              :node($/) );
##    }
.sub 'postcircumfix' :method
    .param pmc match
    .param string key
    .local pmc past
    if key == '( )' goto subcall
    if key == '< >' goto keyed_const
  keyed_var:
    $P0 = getclass 'PAST::Var'
    $P1 = match['EXPR']
    $P2 = $P1.'get_scalar'()
    .return $P0.'new'( $P2, 'scope'=>'keyed', 'node'=>match )
  subcall:
    $P0 = match['arglist']
    past = $P0.'get_scalar'()
    past.'pasttype'('call')
    past.'node'(match)
    .return (past)
  keyed_const:
    $P0 = getclass 'PAST::Val'
    $P1 = match['string_literal']
    $P2 = $P1.'get_scalar'()
    .local pmc value
    value = $P0.'new'( 'value' => $P2, 'node'=> $P1 )
    $P0 = getclass 'PAST::Var'
    .return $P0.'new'( value, 'scope'=>'keyed', 'viviself'=>'Hash', 'node'=>match)
.end


##method circumfix($/, $key) {
##    my $expr := $($<EXPR>[0]);
##    if $key eq '@( )' {
##        return PAST::Op.new( $expr,
##                             :name('get_array'),
##                             :pasttype('callmethod'),
##                             :node($/) );
##    }
##    if $key eq '$( )' {
##        return PAST::Op.new( $expr,
##                             :name('get_scalar'),
##                             :pasttype('callmethod'),
##                             :node($/) );
##    }
##    return $expr;
##}
.sub 'circumfix' :method
    .param pmc match
    .param string key
    .local pmc past
    $P0 = match['EXPR']
    unless null $P0 goto have_expr
    $P1 = match
    goto get_past
  have_expr:
    $P1 = $P0[0]
  get_past:
    $P1 = $P1.'get_scalar'()
    $P0 = getclass 'PAST::Op'
    if key == '@( )' goto list_context
    if key == '$( )' goto scalar_context
  parenthetical:
    .return ($P1)
  list_context:
    past = $P0.'new'($P1, 'name' => 'get_array',  'pasttype'=>'callmethod', 'node'=>match)
    .return (past)
  scalar_context:
    past = $P0.'new'($P1, 'name' => 'get_scalar', 'pasttype'=>'callmethod', 'node'=>match)
    .return (past)
.end


##    method arglist($/) {
##        sub callarg($arg) {
##            if $arg.returns() eq 'Pair' {
##                $arg[1].named($arg[0]);
##                $arg := $arg[1];
##            }
##            return $arg;
##        }
##
##        my $past := PAST::Op.new( :node($/) );
##        if ($<EXPR>) {
##            my $expr := $($<EXPR>[0]);
##            if ($expr.name() eq 'infix:,') {
##                for @($expr) {
##                    $past.push( callarg($_) );
##                }
##            }
##            else {
##                $past.push( callarg($expr) );
##            }
##        }
##        return $past;
##    }
.sub 'arglist' :method
    .param pmc match
    .local pmc past
    $P0 = getclass 'PAST::Op'
    past = $P0.'new'( 'node'=>match )
    $P1 = match['EXPR']
    if null $P1 goto end
    .local pmc expr, iter
    $P2 = $P1[0]
    expr = $P2.'get_scalar'()
    $S0 = expr.'name'()
    if $S0 != 'infix:,' goto one_arg
  comma_arg:
    .local pmc iter
    iter = expr.'iterator'()
  iter_loop:
    unless iter goto end
    $P0 = shift iter
    $P0 = 'callarg'($P0)
    past.'push'($P0)
    goto iter_loop
  one_arg:
    $P0 = 'callarg'(expr)
    past.'push'($P0)
  end:
    .return (past)
.end

.sub 'callarg'
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


##    method scope_declarator($/) {
##        my $past := $($<variable>);
##        my $name := $past.name();
##        our $?BLOCK;
##        unless $?BLOCK.symbol($name) {
##            $past.'isdecl'(1);
##            my $scope := ($<declarator> eq 'my') ? 'lexical' : 'package';
##            $?BLOCK.symbol($name, :scope($scope));
##        }
##        .return ($past);
##   }
.sub 'scope_declarator' :method
    .param pmc match
    .local pmc past, block
    .local string name
    $P0 = match['variable']
    past = $P0.'get_scalar'()
    name = past.'name'()
    block = get_global '$?BLOCK'
    $P0 = block.'symbol'(name)
    if $P0 goto end
    past.'isdecl'(1)
    .local string scope
    scope = 'package'
    $S0 = match['declarator']
    if $S0 != 'my' goto have_scope
    scope = 'lexical'
  have_scope:
    block.'symbol'(name, 'scope'=>scope)
  end:
    .return (past)
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
    .return $P0.'new'('node'=>match, 'name'=>$S0)
.end


##    method quote($/, $key) {
##        return PAST::Val.new(node=>$/, value=>~($<string_literal>))
##    }
.sub 'quote' :method
    .param pmc match
    .param pmc key             :optional
    .local string value
    $P0 = match['string_literal']
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
##        my $past := $($<arglist>);
##        $past.name(~$<name>);
##        $past.pasttype('call');
##        $past.node($/);
##        return $past;
##    }
.sub 'subcall' :method
    .param pmc match
    .param pmc key             :optional
    .local pmc past
    $P0 = match['arglist']
    past = $P0.'get_scalar'()
    $S0 = match['name']
    past.'name'($S0)
    past.'pasttype'('call')
    past.'node'(match)
    .return (past)
.end


#### Expressions and operators ####

##    method EXPR($/, $key) {
##        if ($key eq 'end') { return $($<expr>); }
##        my $past := PAST::Op.new( :node($/),
##                                  :name($<type>),
##                                  :pasttype($<top><pasttype>),
##                                  :pirop($<top><pirop>),
##                                  :inline($<top><inline>),
##                                  :islvalue($<top><lvalue>)
##                                );
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
    .local string name, pirop, pasttype, inline, lvalue
    name = match['type']
    pirop = match['top';'pirop']
    pasttype = match['top'; 'pasttype']
    inline = match['top'; 'inline']
    lvalue = match['top'; 'lvalue']
    $P0 = getclass 'PAST::Op'
    past = $P0.'new'('node'=>match, 'name'=>name, 'pirop'=>pirop, 'pasttype'=>pasttype, 'inline'=>inline, 'islvalue'=>lvalue)
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

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
        $N0 = %0
        %r = new 'Float'
        %r = $N0
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
##        my $past := $($<statement_block>);
##        my $stmts := $past[1];
##        #  if the top block is really only a single block, return it
##        if (@($stmts) == 1 && $stmts[0].WHAT == 'PAST::Block') {
##            $past := $stmts[0];
##        }
##        $past.blocktype('declaration');
##        make $past;
##    }
.sub 'TOP' :method
    .param pmc match
    .local pmc past
    $P0 = match['statement_block']
    past = $P0.'get_scalar'()
    .local pmc stmts
    stmts = past[1]
    $P0 = stmts.get_array()
    $I0 = elements $P0
    if $I0 != 1 goto have_past
    $P0 = stmts[0]
    $I0 = isa $P0, 'PAST::Block'
    unless $I0 goto have_past
    past = stmts[0]
  have_past:
    past.'blocktype'('declaration')
    match.'result_object'(past)
.end


#### Blocks and Statements ####

##    method statement_block($/, $key) {
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
##            make $past;
##        }
##    }
.sub 'statement_block' :method
    .param pmc match
    .param string key
    if key == 'close' goto block_close
  block_open:
    .local pmc past
    $P1 = get_hll_global ['PAST'], 'Stmts'
    $P2 = $P1.'new'()
    $P0 = get_hll_global ['PAST'], 'Block'
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
    match.'result_object'(past)
.end


##    method statement_list($/) {
##        my $past := PAST::Stmts.new(node=>$/)
##        for $<statement> {
##            $past.push($($_));
##        }
##        make $past;
##    }
.sub 'statement_list' :method
    .param pmc match
    .local pmc past
    $P0 = get_hll_global ['PAST'], 'Stmts'
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
    match.'result_object'(past)
.end


##    method statement($/, $key) {
##        make $($/{$key});
##    }
.sub 'statement' :method
    .param pmc match
    .param string key
    $P0 = match[key]
    $P1 = $P0.'get_scalar'()
    match.'result_object'($P1)
.end


##    method if_statement($/) {
##        my $past := PAST::Op.new($($<EXPR>),
##                                 $($<block>[0]),
##                                 pasttype => $<sym>,
##                                 node => $/);
##        if ($<block>[1]) {
##            $past.push($(<block>[1]));
##        }
##        make $past;
.sub 'if_statement' :method
    .param pmc match
    .local pmc block, past
    $P0 = match['EXPR']
    $P0 = $P0.'get_scalar'()
    block = match['block']
    $P1 = block[0]
    $P1 = $P1.'get_scalar'()
    $P2 = get_hll_global ['PAST'], 'Op'
    $S1 = match['sym']
    past = $P2.'new'($P0, $P1, 'pasttype'=>$S1, 'node'=>match)
    $I0 = exists block[1]
    unless $I0 goto end
    $P1 = block[1]
    $P1 = $P1.'get_scalar'()
    past.'push'($P1)
  end:
    match.'result_object'(past)
.end


##    method while_statement($/) {
##        make PAST::Op.new( $($<EXPR>),
##                           $($<block>),
##                           :pasttype( ~$<sym> ),
##                           :node( $/ )
##                         );
##    }
.sub 'while_statement' :method
    .param pmc match
    $P1 = match['EXPR']
    $P1 = $P1.'get_scalar'()
    $P2 = match['block']
    $P2 = $P2.'get_scalar'()
    $S0 = match['sym']
    $P0 = get_hll_global ['PAST'], 'Op'
    $P5 = $P0.'new'( $P1, $P2, 'pasttype'=>$S0, 'node'=>match)
    match.'result_object'($P5)
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
##        make $past;
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
    $P3 = get_hll_global ['PAST'], 'Var'
    topic_var = $P3.'new'('name'=>'$_', 'scope'=>'parameter')
    params.'push'(topic_var)
    block.'symbol'('$_', 'scope'=>'lexical')
    $P2  = get_hll_global ['PAST'], 'Op'
    $S1  = match['sym']
    past = $P2.'new'($P0, block, 'pasttype'=>$S1, 'node'=>match)
    match.'result_object'(past)
.end


##    method make_statement($/) {
##        make PAST::Op.new( PAST::Var.new( :name('$/'),
##                                          :scope('lexical') ),
##                           $($<EXPR>),
##                           :name('result_object'),
##                           :pasttype('callmethod') );
##    }
.sub 'make_statement' :method
    .param pmc match
    $P0 = get_hll_global ['PAST'], 'Var'
    $P1 = $P0.'new'( 'name'=>'$/', 'scope'=>'lexical' )
    $P2 = match['EXPR']
    $P3 = $P2.'get_scalar'()
    $P4 = get_hll_global ['PAST'], 'Op'
    $P5 = $P4.'new'($P1, $P3, 'name'=>'result_object', 'pasttype'=>'callmethod')
    match.'result_object'($P5)
.end


##    method block($/, $key) {
##        make $($<statement_block>);
##    }
.sub 'block' :method
    .param pmc match
    $P0 = match['statement_block']
    $P0 = $P0.'get_scalar'()
    match.'result_object'($P0)
.end


#### Subroutine and method definitions ####

##    method routine_def($/) {
##        my $past := $($<block>);
##        $past.name(~$<ident>);
##        $past.node($/);
##        $past.blocktype('declaration');
##        my $params := $past[0];
##        if $<declarator> eq 'method' {
##            $past.blocktype('method');
##        }
##        for $<signature>[0] {
##            my $param_var := $($_<param_var>);
##            $past.symbol($param_var.name(), :scope('lexical'));
##            $params.push($param_var);
##        }
##        make $past;
##    }
.sub 'routine_def' :method
    .param pmc match
    .local pmc past
    $P0 = match['block']
    past = $P0.'get_scalar'()
    $S0 = match['ident']
    past.'name'($S0)
    past.'node'(match)
    past.'blocktype'('declaration')
    .local pmc params
    params = past[0]
    $S0 = match['declarator']
    if $S0 != 'method' goto add_signature
    past.'blocktype'('method')
  add_signature:
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
    match.'result_object'(past)
.end


##    method param_var($/) {
##        make PAST::Var.new(:name(~$/),
##                           :scope('parameter'),
##                           :node($/) );
##    }
.sub 'param_var' :method
    .param pmc match
    $S0 = match
    $P0 = get_hll_global ['PAST'], 'Var'
    $P1 = $P0.'new'('name'=>$S0, 'scope'=>'parameter', 'node'=>match)
    match.'result_object'($P1)
.end


#### Terms and expressions ####

##    method term($/, $key) {
##        my $past := $($<noun>);
##        for $<postfix> {
##            my $term := $past;
##            $past := $($_);
##            $past.unshift($term);
##        }
##        make $past;
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
    match.'result_object'(past)
.end


##    method postfix($/, $key) {
##        make $($/{$key});
##    }
.sub 'postfix' :method
    .param pmc match
    .param string key
    $P0 = match[key]
    $P1 = $P0.'get_scalar'()
    match.'result_object'($P1)
.end


##    method methodop($/, $key) {
##        my $past := $($<arglist>);
##        $past.name(~$<ident>);
##        $past.pasttype('callmethod');
##        $past.node($/);
##        make $past;
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
    match.'result_object'(past)
.end


##    method postcircumfix($/, $key) {
##        if $key eq '( )' {
##            my $past := $($<arglist>);
##            $past.pasttype('call');
##            $past.node($/);
##            make $past;
##        }
##        elseif $key eq '< >' {
##            my $value := PAST::Val.new( :value( $($<string_literal>) ) );
##            make PAST::Var.new( $value,
##                                :scope('keyed'),
##                                :vivibase('Hash'),
##                                :viviself('Undef'),
##                                :node( $/ ) );
##        }
##        else {
##            my $vivibase := ($key eq '{ }') ? 'Hash' : 'ResizablePMCArray';
##            make PAST::Var.new( $($<EXPR>),
##                                :scope('keyed'),
##                                :vivibase($vivibase),
##                                :viviself('Undef'),
##                                :node($/) );
##        }
##    }
.sub 'postcircumfix' :method
    .param pmc match
    .param string key
    .local pmc past
    if key == '( )' goto subcall
    if key == '< >' goto keyed_const
  keyed_var:
    .local string vivibase
    vivibase = 'ResizablePMCArray'
    if key != '{ }' goto keyed_array
    vivibase = 'Hash'
  keyed_array:
    $P0 = get_hll_global ['PAST'], 'Var'
    $P1 = match['EXPR']
    $P2 = $P1.'get_scalar'()
    $P3 = $P0.'new'( $P2, 'scope'=>'keyed', 'vivibase'=>vivibase, 'viviself'=>'Undef', 'node'=>match )
    match.'result_object'($P3)
    .return ()
  subcall:
    $P0 = match['arglist']
    past = $P0.'get_scalar'()
    past.'pasttype'('call')
    past.'node'(match)
    match.'result_object'(past)
    .return ()
  keyed_const:
    $P0 = get_hll_global ['PAST'], 'Val'
    $P1 = match['string_literal']
    $P2 = $P1.'get_scalar'()
    .local pmc value
    value = $P0.'new'( 'value' => $P2, 'node'=> $P1 )
    $P0 = get_hll_global ['PAST'], 'Var'
    $P1 = $P0.'new'( value, 'scope'=>'keyed', 'vivibase'=>'Hash', 'viviself'=>'Undef', 'node'=>match)
    match.'result_object'($P1)
.end


##method circumfix($/, $key) {
##    my $expr := $($<EXPR>[0]);
##    if $key eq '@( )' {
##        make PAST::Op.new( $expr,
##                           :name('get_array'),
##                           :pasttype('callmethod'),
##                           :node($/) );
##    }
##    if $key eq '$( )' {
##        make PAST::Op.new( $expr,
##                           :name('get_scalar'),
##                           :pasttype('callmethod'),
##                           :node($/) );
##    }
##    make $expr;
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
    $P0 = get_hll_global ['PAST'], 'Op'
    if key == '@( )' goto list_context
    if key == '$( )' goto scalar_context
  parenthetical:
    match.'result_object'($P1)
    .return ()
  list_context:
    past = $P0.'new'($P1, 'name' => 'get_array',  'pasttype'=>'callmethod', 'node'=>match)
    match.'result_object'(past)
    .return ()
  scalar_context:
    past = $P0.'new'($P1, 'name' => 'get_scalar', 'pasttype'=>'callmethod', 'node'=>match)
    match.'result_object'(past)
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
##        make $past;
##    }
.sub 'arglist' :method
    .param pmc match
    .local pmc past
    $P0 = get_hll_global ['PAST'], 'Op'
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
    match.'result_object'(past)
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
##        make $($/{$key});
##    }
.sub 'noun' :method
    .param pmc match
    .param pmc key
    $P0 = match[key]
    $P1 = $P0.'get_scalar'()
    match.'result_object'($P1)
.end


##    method colonpair($/) {
##        make PAST::Op.new( PAST::Val.new( :value(~$<ident>),
##                                          :node($<ident>)),
##                           $($<EXPR>),
##                           :name('infix:=>'),
##                           :returns('Pair'),
##                           :node($/)
##                         );
##    }
.sub 'colonpair' :method
    .param pmc match
    $S0 = match['ident']
    $P0 = match['ident']
    $P9 = get_hll_global ['PAST'], 'Val'
    $P1 = $P9.'new'('value'=>$S0, 'node'=>$P0)
    $P2 = match['EXPR']
    $P2 = $P2.'get_scalar'()
    $P9 = get_hll_global ['PAST'], 'Op'
    $P3 = $P9.'new'($P1, $P2, 'name'=>'infix:=>', 'returns'=>'Pair', 'node'=>match)
    match.'result_object'($P3)
.end


##    method package_declarator($/, $key) {
##        my $past := $($/{$key});
##        $past.namespace($<name><ident>);
##        make $past;
##    }
.sub 'package_declarator' :method
    .param pmc match
    .param pmc key
    .local pmc past
    $P0 = match[key]
    past = $P0.'get_scalar'()
    $P1 = match['name']
    $P1 = $P1['ident']
    past.'namespace'($P1)
    match.'result_object'(past)
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
##        make $past;
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
    match.'result_object'(past)
.end


##    method variable($/, $key) {
##        if ($key eq '$< >') {
##            make PAST::Var.new(
##                     PAST::Var.new(scope=>'lexical', name=>'$/'),
##                     PAST::Val.new(value=>~$[0]),
##                     scope=>'keyed');
##        }
##        else {
##            make PAST::Var.new(node=>$/, name=>~$/)
##        }
##    }
.sub 'variable' :method
    .param pmc match
    .param pmc key
    if key != '$< >' goto past_var
  past_match_keyed:
    $P0 = get_hll_global ['PAST'], 'Var'
    $P1 = $P0.'new'('scope'=>'lexical', 'name'=>'$/')
    $P2 = get_hll_global ['PAST'], 'Val'
    $S0 = match[0]
    $P3 = $P2.'new'('value'=>$S0)
    $P4 = $P0.'new'($P1, $P3, 'scope'=>'keyed')
    match.'result_object'($P4)
    .return ()
  past_var:
    $S0 = match
    $P0 = get_hll_global ['PAST'], 'Var'
    $P1 = $P0.'new'('node'=>match, 'name'=>$S0, 'viviself'=>'Undef')
    match.'result_object'($P1)
.end


##    method value($/, $key) {
##        make $($/{$key});
##    }
.sub 'value' :method
    .param pmc match
    .param pmc key
    $P0 = match[key]
    $P1 = $P0.'get_scalar'()
    match.'result_object'($P1)
.end


##    method quote($/, $key) {
##        make PAST::Val.new(node=>$/, value=>~($<string_literal>))
##    }
.sub 'quote' :method
    .param pmc match
    .param pmc key             :optional
    .local string value
    $P0 = match['string_literal']
    value = $P0.'get_scalar'()
    $P0 = get_hll_global ['PAST'], 'Val'
    $P1 = $P0.'new'('node'=>match, 'value'=>value)
    match.'result_object'($P1)
.end


##    method typename($/, $key) {
##        my $ns := $<name><ident>.clone();
##        my $name := $ns.pop();
##        make PAST::Var.new( :node($/), 
##                            :scope('package'),
##                            :name($name), 
##                            :namespace($ns) 
##                          );
##    }
.sub 'typename' :method
    .param pmc match
    .param pmc key
    .local pmc ns, name
    $P0 = match['name']
    $P0 = $P0['ident']
    ns = clone $P0
    name = pop ns
    $P0 = get_hll_global ['PAST'], 'Var'
    $P1 = $P0.'new'('node'=>match, 'scope'=>'package', 'name'=>name, 'namespace'=>ns)
    match.'result_object'($P1)
.end


##    method number($/, $key?) {
##        make PAST::Val.new(node=>$/, name=>~$/, vtype=>"Integer");
##    }
.sub 'number' :method
    .param pmc match
    .param pmc key             :optional
    .local pmc past
    $I0 = match
    $P0 = get_hll_global ['PAST'], 'Val'
    past = $P0.'new'('node'=>match, 'value'=>$I0)
    match.'result_object'(past)
.end


##    method subcall($/, $key?) {
##        my $past := $($<arglist>);
##        $past.name(~$<ident>);
##        $past.pasttype('call');
##        $past.node($/);
##        make $past;
##    }
.sub 'subcall' :method
    .param pmc match
    .param pmc key             :optional
    .local pmc past
    $P0 = match['arglist']
    past = $P0.'get_scalar'()
    $S0 = match['ident']
    past.'name'($S0)
    past.'pasttype'('call')
    past.'node'(match)
    match.'result_object'(past)
.end


#### Expressions and operators ####

##    method EXPR($/, $key) {
##        if ($key eq 'end') { make $($<expr>); return; }
##        my $past := PAST::Op.new( :node($/),
##                                  :name($<type>),
##                                  :pasttype($<top><pasttype>),
##                                  :pirop($<top><pirop>),
##                                  :inline($<top><inline>),
##                                  :lvalue($<top><lvalue>)
##                                );
##        for @($/) {
##            $past.push($($_));
##        }
##        make $past;
##    }
.sub 'EXPR' :method
    .param pmc match
    .param pmc key
    if key != 'end' goto expr_reduce
  expr_end:
    $P0 = match['expr']
    $P1 = $P0.'get_scalar'()
    match.'result_object'($P1)
    .return ()
  expr_reduce:
    .local pmc past
    .local string name, pirop, pasttype, inline, lvalue
    name = match['type']
    pirop = match['top';'pirop']
    pasttype = match['top'; 'pasttype']
    inline = match['top'; 'inline']
    lvalue = match['top'; 'lvalue']
    $P0 = get_hll_global ['PAST'], 'Op'
    past = $P0.'new'('node'=>match, 'name'=>name, 'pirop'=>pirop, 'pasttype'=>pasttype, 'inline'=>inline, 'lvalue'=>lvalue)
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
    match.'result_object'(past)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

# Copyright (C) 2007, The Perl Foundation.
# $Id$

.sub '__onload' :init :load
    $P0 = newclass 'NQP::Grammar::Actions'
    .return ()
.end

.namespace [ 'NQP::Grammar::Actions' ]


##    method TOP($/) {
##        return PAST::Block.new($($<statementlist>), 
##                               node => $/,
##                               name => 'anon',
##                               );
##    }
.sub 'TOP' :method
    .param pmc match
    .local pmc cpast, past
    $P0 = match['statementlist']
    cpast = $P0.'get_scalar'()
    $P0 = getclass 'PAST::Block'
    past = $P0.'new'(cpast, 'node'=>match, 'name'=>'anon')
    .return (past)
.end


##    method statementlist($/) {
##        my $past := PAST::Stmts.new(node=>$/)
##        for $<statement> {
##            $past.push($($_));
##        }
##        return $past;
##    }
.sub 'statementlist' :method
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


##    method statement($/, $key?) {
##        return $($<EXPR>);
##    }
.sub 'statement' :method
    .param pmc match
    .param string key          :optional
    $P0 = match['EXPR']
    .return $P0.'get_scalar'()
.end


##    method block($/) {
##        return PAST::Block($($<statementlist>),
##                           node => $/,
##                          );
##    }
.sub 'block' :method
    .param pmc match
    .local pmc cpast, past
    $P0 = match['statementlist']
    cpast = $P0.'get_scalar'()
    $P0 = getclass 'PAST::Block'
    past = $P0.'new'(cpast, 'node'=>match)
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


##    method subcall($/, $key?) {
##        my $past = PAST::Op.new(node=>$/, name=>$<name>, pasttype=>'call')
##        if ($<EXPR>) {
##            $past.push($($<EXPR>[0]));
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
    $P1 = $P0[0]
    $P2 = $P1.'get_scalar'()
    past.'push'($P2)
  end:
    .return (past)
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


# Copyright (C) 2007, The Perl Foundation.
# $Id$

.sub '__onload' :init :load
    $P0 = newclass 'PIR::Grammar::Actions'
.end

.namespace [ 'PIR::Grammar::Actions' ]


##    method TOP($/, $key) {
##        return self.block($/, $key);
##    }
.sub 'TOP' :method
    .param pmc match
    .return self.'program'(match)
.end

.sub 'program' :method
    .param pmc match
    .local pmc past
    $P1 = getclass 'PAST::Stmts'
    $P2 = $P1.'new'()
    $P0 = getclass 'PAST::Block'
    past = $P0.'new'('blocktype'=>'immediate', 'node'=>match)
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
.sub 'compilation_unit' :method
    .param pmc match
    .param string key
    $P0 = match[key]
    .return $P0.'get_scalar'()
.end

.sub 'expansion' :method
    .param pmc match
    .param string key
    $P0 = match[key]
    .return $P0.'get_scalar'()
.end

.sub 'sub_def' :method
    .param pmc match
    .local pmc past
    .local string subname
    $P2 = match['sub_id']
    subname = $P2.'get_scalar'()
    $P1 = getclass 'PAST::Stmts'
    $P3 = $P1.'new'()

    $P0 = getclass 'PAST::Block'

    past = $P0.'new'($P3, 'blocktype'=>'declaration', 'node'=>match, 'name'=>subname)
    .return (past)
.end

 #   $P1 = getclass 'PAST::Stmts'
 #   $P2 = $P1.'new'()
 #   $P0 = getclass 'PAST::Block'
 #   past = $P0.'new'($P2, 'blocktype'=>'immediate', 'node'=>match)


.sub 'sub_id' :method
    .param pmc match
    .param string key
    $P0 = match[key]
    $P1 = $P0.'get_scalar'()
    print $P1
    .return ($P1)
.end


.sub 'sub_pragma' :method
    .param pmc match
    .param string key
.end


.sub 'vtable_pragma' :method
    .param pmc match
.end


.sub 'multi_pragma' :method
    .param pmc match
.end


.sub 'outer_pragma' :method
    .param pmc match
.end

.sub 'multi_type' :method
    .param pmc match
    .param string key
.end

.sub 'parenthesized_string' :method
    .param pmc match
.end

.sub 'const_def' :method
    .param pmc match
.end


.sub 'pragma' :method
    .param pmc match
    .param string key
    $P0 = match[key]
    .return $P0.'get_scalar'()
.end


.sub 'param_decl' :method
    .param pmc match
.end

.sub 'labeled_pir_instr' :method
    .param pmc match
.end

.sub 'labeled_pasm_instr' :method
    .param pmc match
.end


.sub 'emit' :method
    .param pmc match
.end

.sub 'instr' :method
    .param pmc match
    .param string key
    $P0 = match[key]
    .return $P0.'get_scalar'()
.end

##    method statement($/, $key) {
##        return $($/{$key});
##    }
.sub 'pir_instr' :method
    .param pmc match
    .param string key
    .return ()
    print "pir_instr(); key ="

    print key
    print "\n\n"
    $P0 = match[key]
    if null $P0 goto NoKey
    .return $P0.'get_scalar'()
  NoKey:
    printerr "No key object: "
    printerr key
    printerr "\n"
.end

.sub 'local_decl' :method
    .param pmc match
.end

.sub 'lexical_decl' :method
    .param pmc match
.end

.sub 'globalconst_def' :method
    .param pmc match
.end

.sub 'assignment_stat' :method
    .param pmc match
    .param string key
.end

.sub 'open_namespace' :method
    .param pmc match
.end

.sub 'close_namespace' :method
    .param pmc match
.end

.sub 'return_stat' :method
    .param pmc match
    .param string key
    $P0 = match[key]
    .return $P0.'get_scalar'()
.end

.sub 'sub_invocation' :method
    .param pmc match
    .param string key
    $P0 = match[key]
    .return $P0.'get_scalar'()
.end

.sub 'macro_invocation' :method
    .param pmc match
    $P0 = match['macro_id']
    .return ($P0)
.end

.sub 'macro_id' :method
    .param pmc match
.end

.sub 'parenthesized_args' :method
    .param pmc match
.end

.sub 'goto_stat' :method
    .param pmc match
    #print "goto_stat()\n"
    .local pmc past
    $P0 = getclass 'PAST::Op'
    past = $P0.'new'('node'=>match)
    .return (past)
.end

.sub 'source_info' :method
    .param pmc match
.end

.sub 'local_id' :method
    .param pmc match
.end


.sub 'conditional_stat' :method
    .param pmc match
    .local pmc block, past
    #$P0 = match['EXPR']
    #$P0 = $P0.'get_scalar'()
    #block = match['block']
    #$P1 = block[0]
    #$P1 = $P1.'get_scalar'()
    #$P2 = getclass 'PAST::Op'
    #$S1 = match['sym']
    #past = $P2.'new'($P0, $P1, 'pasttype'=>$S1, 'node'=>match)
    #$I0 = exists block[1]
    #unless $I0 goto end
    #$P1 = block[1]
    #$P1 = $P1.'get_scalar'()
    #past.'push'($P1)
  #end:
    .return (past)
.end

.sub 'string_constant' :method
    .param pmc match

.end

.sub 'IDENT' :method
    .param pmc match
    printerr ".sub 'id' :method\n"
    .local pmc past
    $S0 = match
    $P0 = getclass 'PAST::Var'
    past = $P0.'new'('node'=>match, 'value'=>$S0)
    .return (past)
.end

.sub 'const_assign' :method
    .param pmc match
    $P0 = match['id']
    .return $P0.'get_scalar'()
.end

.sub 'const_def_tail' :method
    .param pmc match
    .param string key
.end

.sub 'int_const_def' :method
    .param pmc match
.end

.sub 'float_const_def' :method
    .param pmc match
.end

.sub 'string_const_def' :method
    .param pmc match
.end

.sub 'pmc_const_def' :method
    .param pmc match
.end


.sub 'label_identifier' :method
    .param pmc match
    .param string key
.end

.sub 'conditional_expr' :method
    .param pmc match
    .param string key
.end

.sub 'null_expr' :method
    .param pmc match
.end

.sub 'rel_expr' :method
    .param pmc match
.end

.sub 'expression' :method
    .param pmc match
    .param string key
.end

.sub 'binary_expr' :method
    .param pmc match
.end

.sub 'unary_expr' :method
    .param pmc match
.end


.sub 'simple_expr' :method
    .param pmc match
    .param string key
.end

.sub 'key' :method
    .param pmc match
.end

.sub 'constant' :method
    .param pmc match
    .param string key
.end

.sub 'target' :method
    .param pmc match
.end



.sub 'string_constant' :method
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
.sub 'float_const' :method
    .param pmc match
    .local pmc past
    $N0 = match
    $P0 = getclass 'PAST::Val'
    past = $P0.'new'('node'=>match, 'value'=>$N0)
    .return (past)
.end

.sub 'int_constant' :method
    .param pmc match
    .local pmc past
    $I0 = match
    $P0 = getclass 'PAST::Val'
    past = $P0.'new'('node'=>match, 'value'=>$I0)
    .return (past)
.end





# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:



# Copyright (C) 2007, The Perl Foundation.
# $Id$

.sub '__onload' :init :load
    $P0 = newclass 'PIR::Grammar::Actions'
.end

.namespace [ 'PIR::Grammar::Actions' ]


.sub 'TOP' :method
    .param pmc match

    $P0 = match['program']
    $P1 = $P0.'get_scalar'()

    $P2 = getclass 'PAST::Block'
    $P3 = $P2.'new'($P1, 'node'=>match)
    .return ($P3)
.end

.sub 'program' :method
    .param pmc match
    #printerr "program()\n"

    .local pmc iter, past, compunits
    $P1 = getclass 'PAST::Stmts'
    compunits = $P1.'new'('node'=>match)

    goto comp_units_end

    $P0 = match['compilation_unit']
    if null $P0 goto comp_units_end
    iter  = new 'Iterator', $P0
    if null iter goto comp_units_end

  comp_units_loop:
    unless iter goto comp_units_end
    $P10 = shift iter
    $P11 = $P10.'get_scalar'()

    ##
    #$S0 = typeof $P11
    #print $S0
    #print "\n"
    ##
    compunits.'push'($P11)
    goto comp_units_loop

  comp_units_end:
    .return (compunits)
.end


.sub 'compilation_unit' :method
    .param pmc match
    .param string key
    #print "compilation_unit()\n"
    print key
    print "\n"
    $P0 = match[key]
    .return $P0.'get_scalar'()
.end

.sub 'expansion' :method
    .param pmc match
    .param string key
    #print "expansion()\n"
    #.return()

    $P0 = match[key]
    .return $P0.'get_scalar'()
.end

.sub 'include' :method
    .param pmc match
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'pasm_constant' :method
    .param pmc match
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'macro_def' :method
    .param pmc match
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'sub_def' :method
    .param pmc match
    .local pmc past, instructions
    .local string subname
    $P0 = match['sub_id']
    $P1 = $P0.'get_scalar'()
    subname = $P1

    $P1 = getclass 'PAST::Stmts'
    instructions = $P1.'new'('node'=>match)


    ##HACK
    goto instr_end
    ###

    .local pmc iter, instr
    instr = match['labeled_pir_instr']
    if null instr goto instr_end
    iter  = new 'Iterator', instr
    if null iter goto instr_end

  instr_loop:
    unless iter goto instr_end
    $P10 = shift iter
    $P11 = $P10.'get_scalar'()
    instructions.'push'($P11)
    goto instr_loop

  instr_end:
    $P0 = getclass 'PAST::Block'
    past = $P0.'new'(instructions, 'node'=>match, 'name'=>subname, 'blocktype'=>'declaration')
    .return (past)
.end

.sub 'sub_id' :method
    .param pmc match
    .param string key
    $P0 = match[key]
    .return $P0.'get_scalar'()
.end


.sub 'sub_pragma' :method
    .param pmc match
    .param string key
    print "sub_pragma()\n"
    .return()

.end


.sub 'vtable_pragma' :method
    .param pmc match
    #print "vtable_pragma()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end


.sub 'multi_pragma' :method
    .param pmc match
    #print "multi_pragma()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end


.sub 'outer_pragma' :method
    .param pmc match
    #print "outer_pragma()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'multi_type' :method
    .param pmc match
    .param string key
   # print "multi_type()\n"
   # .return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'parenthesized_string' :method
    .param pmc match
    #print "parenthesized_string()\n"
    $P0 = match['string_constant']
    .return $P0.'get_scalar'()
.end

.sub 'const_def' :method
    .param pmc match
    #print "const_def()\n"
    #.return()
    $P0 = match['const_def_tail']
    $P1 = getclass 'PAST::Op'
    .return $P1.'new'('node'=>$P0)
.end


.sub 'pragma' :method
    .param pmc match
    .param string key
    #print "pragma()\n"
    #.return()

    $P0 = match[key]
    .return $P0.'get_scalar'()
.end


.sub 'param_decl' :method
    .param pmc match
    #print "param_decl()\n"
    #.return()

    $S0 = match
    $P0 = getclass 'PAST::Var'
    .return $P0.'new'('name'=>$S0, 'scope'=>'parameter', 'node'=>match)
.end

.sub 'labeled_pir_instr' :method
    .param pmc match
    #print "labeled_pir_instr()\n"
    #.return()
    #$P0 = match['instr']
    #if null $P0 goto no_instr
    #.return $P0.'get_scalar'()
  no_instr:
    $P1 = getclass 'PAST::Op'
    .return $P1.'new'('node'=>match)
.end

.sub 'labeled_pasm_instr' :method
    .param pmc match
    #print "labeled_pasm_instr()\n"

    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end


.sub 'emit' :method
    .param pmc match
    #print "emit()\n"
    .return()
.end

.sub 'instr' :method
    .param pmc match
    .param string key
    #print "instr()\n"
    #.return()

    $P0 = match[key]
    .return $P0.'get_scalar'()
.end

.sub 'pir_instr' :method
    .param pmc match
    .param string key
    #print "pir_instr()\n"
    #.return()

    $P0 = match[key]
    .return $P0.'get_scalar'()
.end

.sub 'local_decl' :method
    .param pmc match
    #print "local_decl()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)

.end

.sub 'lexical_decl' :method
    .param pmc match
    #print "lexical_decl()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'globalconst_def' :method
    .param pmc match
    #print "globalconst_def()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'assignment_stat' :method
    .param pmc match
    .param string key
    #print "assignment_stat()\n"
    #.return()

    #printerr "assignment: "
    #printerr key
    #printerr "\n"
    $P0 = find_global key
    .return self.$P0(match)
.end

.sub 'simple_assign' :method
    .param pmc match

    #print "simple_assign()\n"
    #.return()

    $P10 = match['target']
    $P11 = $P10.'get_scalar'()
    $P12 = match['rhs']
    $P13 = $P12.'get_scalar'()
    $P0 = getclass 'PAST::Op'
    $P1 = $P0.'new'('node'=>match, 'pasttype'=>'assign')
    $P1.'push'($P10)
    $P1.'push'($P11)
    .return ($P1)
.end

.sub 'augment_assign' :method
    .param pmc match
    #print "augment_assign()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'key_assign' :method
    .param pmc match
    #print "key_assign()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'subcall_assign' :method
    .param pmc match

    #print "subcall_assign()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'rhs' :method
    .param pmc match
    .param string key
    #print "rhs()\n"
    #.return()

    #printerr match
    #printerr "\n"
    #printerr key
    #printerr "\n"
    $P0 = find_global key
    #printerr "rhs(): "
    #printerr $P0
    #printerr "\n"
    ##self.$P0(match, key)

    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'open_namespace' :method
    .param pmc match
    #print "open_namespace()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'close_namespace' :method
    .param pmc match
    #print "close_namespace()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'return_stat' :method
    .param pmc match
    .param string key
    #print "return_stat()\n"
    #.return()


    $P0 = match[key]
    .return $P0.'get_scalar'()
.end

.sub 'sub_invocation' :method
    .param pmc match
    .param string key
    #print "sub_invocation()\n"
    #.return()

    $P0 = match[key]
    .return $P0.'get_scalar'()
.end

.sub 'macro_invocation' :method
    .param pmc match
    #print "macro_invocation()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'macro_id' :method
    .param pmc match
    #print "macro_id()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'parenthesized_args' :method
    .param pmc match
    #print "parenthesized_args()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'goto_stat' :method
    .param pmc match
    #print "goto_stat()\n"
    #.return()

    .local pmc past
    $P0 = getclass 'PAST::Op'
    past = $P0.'new'('node'=>match)
    .return (past)
.end

.sub 'source_info' :method
    .param pmc match
    #print "source_info()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'local_id' :method
    .param pmc match
    #print "local_id()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end


.sub 'conditional_stat' :method
    .param pmc match
    #print "conditional_stat()\n"
    #.return()

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

    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
    .return (past)
.end

.sub 'IDENT' :method
    .param pmc match
    #printerr "IDENT()\n"
    #.return()

    .local pmc past
    $S0 = match
    $P0 = getclass 'PAST::Var'
    past = $P0.'new'('node'=>match, 'value'=>$S0)
    .return (past)
.end

.sub 'const_assign' :method
    .param pmc match
    #print "const_assign()\n"
    #.return()

    $P0 = match['id']
    .return $P0.'get_scalar'()
.end

.sub 'const_def_tail' :method
    .param pmc match
    .param string key
    #print "const_def_tail()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'int_const_def' :method
    .param pmc match
    #print "int_const_def()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'float_const_def' :method
    .param pmc match
    #print "float_const_def()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'string_const_def' :method
    .param pmc match
    #print "string_const_def()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'pmc_const_def' :method
    .param pmc match
    #print "pmc_const_def()\n"
    #.return()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end


.sub 'label_identifier' :method
    .param pmc match
    .param string key
    #print "label_identifier()\n"
    $P0 = match[key]
    .return $P0.'get_scalar'()
.end

.sub 'conditional_expr' :method
    .param pmc match
    .param string key
    #print "conditional_expr()\n"
    $P0 = find_global key
    .return self.$P0(match)
.end

.sub 'null_expr' :method
    .param pmc match
    #print "null_expr()\n"
    #.return ()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'rel_expr' :method
    .param pmc match
    #print "rel_expr()\n"
    #.return ()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'expression' :method
    .param pmc match
    .param string key :optional

    #print "expression()\n"
    #.return ()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'binary_expr' :method
    .param pmc match

    #printerr "binary_expr()\n"
    #.return ()

   # $P0 = find_global 'simple_expr'
   # $P1 = self.$P0(match)
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'unary_expr' :method
    .param pmc match
    #printerr "unary_expr()\n"
    #.return ()

    $P0 = match['simple_expr']
    .return $P0.'get_scalar'()
.end


.sub 'simple_expr' :method
    .param pmc match
    .param string key
    #print "simple_expr()\n"
    #.return ()

    $P0 = match[key]
    .return $P0.'get_scalar'()
.end

.sub 'key' :method
    .param pmc match
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end

.sub 'constant' :method
    .param pmc match
    .param string key
    #printerr "constant()\n"
    #.return ()

    $P0 = match[key]
    .return $P0.'get_scalar'()
.end

.sub 'target' :method
    .param pmc match
    #printerr "target()\n"
    #.return ()
    $P0 = getclass 'PAST::Op'
    .return $P0.'new'('node'=>match)
.end



.sub 'string_constant' :method
    .param pmc match
    .param pmc key             :optional
    #print "string_constant()\n"
    #.return ()

    .local string value
    $P0 = match['string_literal']
    value = $P0.'get_scalar'()
    $P0 = getclass 'PAST::Val'
    .return $P0.'new'('node'=>match, 'value'=>value)
.end

.sub 'FLOAT_CONST' :method
    .param pmc match
    #print "FLOAT_CONST()\n"
    #.return ()

    .local pmc past
    $N0 = match
    $P0 = getclass 'PAST::Val'
    past = $P0.'new'('node'=>match, 'value'=>$N0)
    #print "float_const::value = "
    #print $N0
    #print "\n"
    .return (past)
.end

.sub 'INT_CONST' :method
    .param pmc match
    #print "INT_CONST()\n"
    #.return ()

    .local pmc past
    $I0 = match
    $P0 = getclass 'PAST::Val'
    past = $P0.'new'('node'=>match, 'value'=>$I0)
    #print "int_const::value = "
    #print $I0
    #print "\n"
    .return (past)
.end





# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:


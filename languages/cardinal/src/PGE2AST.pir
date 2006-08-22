.namespace [ 'Cardinal::ASTGrammar' ]

.include 'languages/cardinal/src/preamble'
.include 'languages/cardinal/src/ASTGrammar.pir'

.sub '__onload' :load
    $I0 = find_type 'Cardinal::ASTGrammar'
    if $I0 == 0 goto error
    $P0 = getclass 'Cardinal::ASTGrammar'
    addattribute $P0, 'scope_stack'
    .return ()
error:
    print "Cardinal::ASTGrammar class not found\n"
    end
.end

.namespace [ 'Cardinal::ASTGrammar' ]
.sub 'attr' :method
    .param string attrname
    .param pmc value
    .param int setvalue
    if setvalue goto set
    value = getattribute self, attrname
    unless null value goto end
    value = new .Undef
  set:
    setattribute self, attrname, value
  end:
    .return (value)
.end

.sub 'scope_stack' :method
    .param pmc attr           :optional
    .param int has_attr       :opt_flag
    .local pmc value
    value = self.'attr'('scope_stack', attr, has_attr)
    $I0 = defined value
    if $I0 goto end
    value = new .ResizablePMCArray
    value = self.'attr'('scope_stack', value, 1)
  end:
    .return (value)
.end

.sub 'push_scope_stack' :method
    .param pmc value
    .local pmc stack
    stack = self.'scope_stack'()
    push stack, value
    .return (value)
.end

.sub 'pop_scope_stack' :method
    .local pmc value
    .local pmc stack
    stack = self.'scope_stack'()
    value = pop stack
    .return (value)
.end

.sub 'top_scope_stack' :method
    .local pmc value
    .local pmc stack
    stack = self.'scope_stack'()
    $I0 = elements stack
    unless $I0 goto end
    $I0 -= 1
    value = stack[$I0]
    .return (value)
  end:
    print "Error: top_scope_stack is empty"
    end
.end

.sub 'add_to_current_block' :method
    .param string key
    .param pmc value
    .local pmc scope
    scope = self.'top_scope_stack'()
    $I0 = isa scope, 'Cardinal::PAST::Block' 
    unless $I0 goto end
    scope.'vardecl'(key, value)
    .return ()
  end:
    print "Error: top_scope_stack is empty"
    end
.end

.include "iterator.pasm"

.sub 'variable_scope' :method
    .param pmc name
    .local pmc value
    .local pmc stack
    .local pmc block
    .local pmc vdecl

    stack = self.'scope_stack'()
    new $P0, .Iterator, stack
    set $P0, .ITERATE_FROM_END
    $I1 = 0
  iter_loop:
    $I1 += 1
    unless $P0, iter_end
    pop block, $P0
    vdecl = block.'vardecl'(name)
    if_null vdecl, iter_loop
    $I0 = isa vdecl, 'Cardinal::PAST::Var'
    unless $I0 goto not_var
    unless $I1 == 1 goto not_local
    .return ('local')
  not_local:
    .return ('outer')
  iter_end:
    .return ('lexical')

  not_var:
    $I0 = isa vdecl, 'Cardinal::PAST::Block'
    unless $I0 goto iter_loop
    .return ('func')
.end



.namespace [ 'Cardinal::OSTGrammar' ]

.include "iterator.pasm"
.include 'languages/cardinal/src/preamble'
.include 'languages/cardinal/src/OSTGrammar.pir'

.sub '__onload' :load
    $I0 = find_type 'Cardinal::OSTGrammar'
    if $I0 == 0 goto error
    $P0 = getclass 'Cardinal::OSTGrammar'
    addattribute $P0, 'post_scope_stack'
    addattribute $P0, 'past_scope_stack'
    addattribute $P0, 'BEGIN_blocks'
    addattribute $P0, 'END_blocks'
    addattribute $P0, 'namespaces'
    .return ()
error:
    print "Cardinal::OSTGrammar class not found\n"
    end
.end

.namespace [ 'Cardinal::OSTGrammar' ]
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

.sub 'post_scope_stack' :method
    .param pmc attr           :optional
    .param int has_attr       :opt_flag
    .return self.'attr'('post_scope_stack', attr, has_attr)
.end

.sub 'past_scope_stack' :method
    .param pmc attr           :optional
    .param int has_attr       :opt_flag
    .return self.'attr'('past_scope_stack', attr, has_attr)
.end

.sub 'push_BEGIN_block' :method
    .param pmc value           :optional
    .param int has_value       :opt_flag
    .local pmc stack 
    stack = self.'attr'('BEGIN_blocks', 0, 0)
    $I0 = defined stack 
    if $I0 goto test_value
    stack = new .ResizablePMCArray
    stack = self.'attr'('BEGIN_blocks', stack, 1)
  test_value:
    unless has_value goto end
    push stack, value
  end:
    .return (stack)
.end

.sub 'push_END_block'     :method
    .param pmc value      :optional
    .param int has_value  :opt_flag
    .local pmc stack 
    stack = self.'attr'('END_blocks', 0, 0)
    $I0 = defined stack
    if $I0 goto test_value
    stack = new .ResizablePMCArray
    stack = self.'attr'('END_blocks', stack, 1)
  test_value:
    unless has_value goto end
    push stack, value
  end:
    .return (stack)
.end

.sub 'push_namespace'     :method
    .param pmc value      :optional
    .param int has_value  :opt_flag
    .local pmc stack 
    stack = self.'attr'('namespaces', 0, 0)
    $I0 = defined stack
    if $I0 goto test_value
    stack = new .ResizablePMCArray
    stack = self.'attr'('namespaces', stack, 1)
  test_value:
    unless has_value goto end
    push stack, value
  end:
    .return (stack)
.end

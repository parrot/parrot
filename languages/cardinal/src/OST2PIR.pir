.namespace [ 'Cardinal::PIRGrammar' ]

.include 'languages/cardinal/src/preamble'
.include 'languages/cardinal/src/PIRGrammar.pir'

.sub '__onload' :load
    $I0 = find_type 'Cardinal::PIRGrammar'
    if $I0 == 0 goto error
    $P0 = getclass 'Cardinal::PIRGrammar'
    addattribute $P0, 'scope_stack'
    addattribute $P0, 'sub_stack'
    .return ()
error:
    print "Cardinal::PIRGrammar class not found\n"
    end
.end

.namespace [ 'Cardinal::PIRGrammar' ]
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

.sub 'add_sub' :method
    .param pmc subcode
    $P0 = self.'sub_stack'()
    push $P0, subcode
    .return ()
.end

.sub 'gen_subs' :method
    $S0 = ""
    $P0 = self.'sub_stack'()
    .local pmc iter
    iter = new .Iterator, $P0
  iter_loop:
    unless iter goto iter_end
    $P0 = shift iter
    $S1 = $P0
    $S0 .= $S1
    goto iter_loop
  iter_end:
    .return ($S0)
.end

.sub 'sub_stack' :method
    .param pmc attr           :optional
    .param int has_attr       :opt_flag
    .local pmc value
    value = self.'attr'('sub_stack', attr, has_attr)
    $I0 = defined value
    if $I0 goto end
    value = new .ResizablePMCArray
    value = self.'attr'('sub_stack', value, 1)
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

.sub 'top_scope_stack' :method
    .local pmc value
    value = self.'attr'('scope_stack', $P0, 0)
    $I0 = elements value
    unless $I0 goto end
    $I0 -= 1
    $P0 = value[$I0]
    .return ($P0)
  end:
    print "Error: top_scope_stack is empty"
    end
.end

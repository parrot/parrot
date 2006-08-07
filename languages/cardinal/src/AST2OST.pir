.namespace [ 'Cardinal::OSTGrammar' ]

.include 'languages/cardinal/src/preamble'
.include 'languages/cardinal/src/OSTGrammar.pir'

.sub '__onload' :load
    $I0 = find_type 'Cardinal::OSTGrammar'
    if $I0 == 0 goto error
    $P0 = getclass 'Cardinal::OSTGrammar'
    addattribute $P0, 'post_scope_stack'
    addattribute $P0, 'past_scope_stack'
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

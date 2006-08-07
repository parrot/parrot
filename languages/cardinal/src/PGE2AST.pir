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
    .return self.'attr'('scope_stack', attr, has_attr)
.end



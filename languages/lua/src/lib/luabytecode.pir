# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/luabytecode.pir - Lua bytecode Library

=head1 DESCRIPTION

=cut


.namespace ['Lua::Bytecode']

.sub '__onload' :anon :load :init
    #~ load_bytecode 'Protoobject.pbc'
    #~ new $P0, 'Protomaker'
    #~ $P0.'new_subclass'('Integer', 'Lua::Bytecode', 'version', 'format', 'endian', 'size_of_int', 'size_of_size_t', 'size_of_opcode', 'size_of_number', 'integral', 'top')
    #~ $P0.'new_subclass'('FixedPMCArray', 'Lua::Function', 'source_name', 'line_defined', 'last_line_defined', 'number_of_upvalues', 'number_of_parameters', 'is_vararg_flag', 'maximum_stack_size')
    #~ $P0.'new_subclass'('FixedIntegerArray', 'Lua::InstructionList')
    #~ $P0.'new_subclass'('FixedPMCArray', 'Lua::ConstantList')
    #~ $P0.'new_subclass'('Undef', 'Lua::Nil')
    #~ $P0.'new_subclass'('Boolean', 'Lua::Boolean')
    #~ $P0.'new_subclass'('Float', 'Lua::Number')
    #~ $P0.'new_subclass'('String', 'Lua::String')
    #~ $P0.'new_subclass'('FixedPMCArray', 'Lua::PrototypeList')
    #~ $P0.'new_subclass'('FixedIntegerArray', 'Lua::LineList')
    #~ $P0.'new_subclass'('FixedPMCArray', 'Lua::LocalList')
    #~ $P0.'new_subclass'('String', 'Lua::Local', 'startpc', 'endpc')
    #~ $P0.'new_subclass'('FixedPMCArray', 'Lua::UpvalueList')
    #~ $P0.'new_subclass'('String', 'Lua::Upvalue')

    $P0 = subclass 'Integer', 'Lua::Bytecode'
    addattribute $P0, 'version'
    addattribute $P0, 'format'
    addattribute $P0, 'endian'
    addattribute $P0, 'size_of_int'
    addattribute $P0, 'size_of_size_t'
    addattribute $P0, 'size_of_opcode'
    addattribute $P0, 'size_of_number'
    addattribute $P0, 'integral'
    addattribute $P0, 'top'
    $P0 = subclass 'FixedPMCArray', 'Lua::Function'
    addattribute $P0, 'source_name'
    addattribute $P0, 'line_defined'
    addattribute $P0, 'last_line_defined'
    addattribute $P0, 'number_of_upvalues'
    addattribute $P0, 'number_of_parameters'
    addattribute $P0, 'is_vararg_flag'
    addattribute $P0, 'maximum_stack_size'
    $P0 = subclass 'FixedIntegerArray', 'Lua::InstructionList'
    $P0 = subclass 'FixedPMCArray', 'Lua::ConstantList'
    $P0 = subclass 'Undef', 'Lua::Nil'
    $P0 = subclass 'Boolean', 'Lua::Boolean'
    $P0 = subclass 'Float', 'Lua::Number'
    $P0 = subclass 'String', 'Lua::String'
    $P0 = subclass 'FixedPMCArray', 'Lua::PrototypeList'
    $P0 = subclass 'FixedIntegerArray', 'Lua::LineList'
    $P0 = subclass 'FixedPMCArray', 'Lua::LocalList'
    $P0 = subclass 'String', 'Lua::Local'
    addattribute $P0, 'startpc'
    addattribute $P0, 'endpc'
    $P0 = subclass 'FixedPMCArray', 'Lua::UpvalueList'
    $P0 = subclass 'String', 'Lua::Upvalue'
.end

.sub 'load'
    .param string bytecode
    .local int idx
    .local pmc script
    idx = 0
    $S0 = substr bytecode, idx, 4
    if $S0 == "\x1BLua" goto L1
    die "not a Lua bytecode"
  L1:
    idx += 4
    script = new 'Lua::Bytecode'
    $S0 = bytecode[idx]
    $I0 = ord $S0
    if $I0 == 0x51 goto L2
    die "only Lua 5.1 bytecode is supported"
  L2:
    new $P0, 'Integer'
    set $P0, $I0
    setattribute script, 'version', $P0
    idx += 1
    $S0 = bytecode[idx]
    $I0 = ord $S0
    new $P0, 'Integer'
    set $P0, $I0
    setattribute script, 'format', $P0
    idx += 1
    $S0 = bytecode[idx]
    $I0 = ord $S0
    new $P0, 'Boolean'
    set $P0, $I0
    setattribute script, 'endian', $P0
    idx += 1
    $S0 = bytecode[idx]
    $I0 = ord $S0
    new $P0, 'Integer'
    set $P0, $I0
    setattribute script, 'size_of_int', $P0
    idx += 1
    $S0 = bytecode[idx]
    $I0 = ord $S0
    new $P0, 'Integer'
    set $P0, $I0
    setattribute script, 'size_of_size_t', $P0
    idx += 1
    $S0 = bytecode[idx]
    $I0 = ord $S0
    new $P0, 'Integer'
    set $P0, $I0
    setattribute script, 'size_of_opcode', $P0
    idx += 1
    $S0 = bytecode[idx]
    $I0 = ord $S0
    new $P0, 'Integer'
    set $P0, $I0
    setattribute script, 'size_of_number', $P0
    idx += 1
    $S0 = bytecode[idx]
    $I0 = ord $S0
    new $P0, 'Boolean'
    set $P0, $I0
    setattribute script, 'integral', $P0
    idx += 1
    new $P0, 'Lua::Function'
    idx = $P0.'init'(script, bytecode, idx)
    setattribute script, 'top', $P0
    $I0 = length bytecode
    if idx == $I0 goto L3
    die "bad length"
  L3:
    .return (script)
.end

.sub 'brief' :method
    .param string filename
    print "; source chunk: "
    print filename
    print "\n"
    $P0 = getattribute self, 'top'
    $P0.'brief'(0, 1)
.end

.sub 'get_int' :method
    .param string str
    .local int endian
    $P0 = getattribute self, 'endian'
    endian = $P0
    .local int ret
    $P0 = split '', str
    ret = 0
  L1:
    unless $P0 goto L2
    unless endian goto L3
    $P1 = pop $P0
    goto L4
  L3:
    $P1 = shift $P0
  L4:
    $S1 = $P1
    $I0 = ord $S1
    ret <<= 8
    ret += $I0
    goto L1
  L2:
    .return (ret)
.end

.sub 'get_Integer' :method
    .param string str
    .local pmc ret
    $I0 = self.'get_int'(str)
    new ret, 'Integer'
    set ret, $I0
    .return (ret)
.end

.sub 'get_number' :method
    .param string str
    .local num ret
    new $P0, 'Lua'
    ret = $P0.'float_from_bytecode'(str)
#    ret = 0.0
    .return (ret)
.end


.namespace ['Lua::Function']

.sub 'init' :method
    .param pmc script
    .param string bytecode
    .param int idx
    set self, 6
    .local int size_t
    $P0 = getattribute script, 'size_of_size_t'
    size_t = $P0
    $S0 = substr bytecode, idx, size_t
    $I0 = script.'get_int'($S0)
    idx += size_t
    unless $I0 goto L1
    $S0 = substr bytecode, idx, $I0
    new $P0, 'String'
    set $P0, $S0
    setattribute self, 'source_name', $P0
    idx += $I0
  L1:
    .local int size
    $P0 = getattribute script, 'size_of_int'
    size = $P0
    $S0 = substr bytecode, idx, size
    $P0 = script.'get_Integer'($S0)
    setattribute self, 'line_defined', $P0
    idx += size
    $S0 = substr bytecode, idx, size
    $P0 = script.'get_Integer'($S0)
    setattribute self, 'last_line_defined', $P0
    idx += size
    $S0 = bytecode[idx]
    $I0 = ord $S0
    new $P0, 'Integer'
    set $P0, $I0
    setattribute self, 'number_of_upvalues', $P0
    idx += 1
    $S0 = bytecode[idx]
    $I0 = ord $S0
    new $P0, 'Integer'
    set $P0, $I0
    setattribute self, 'number_of_parameters', $P0
    idx += 1
    $S0 = bytecode[idx]
    $I0 = ord $S0
    new $P0, 'Integer'
    set $P0, $I0
    setattribute self, 'is_vararg_flag', $P0
    idx += 1
    $S0 = bytecode[idx]
    $I0 = ord $S0
    new $P0, 'Integer'
    set $P0, $I0
    setattribute self, 'maximum_stack_size', $P0
    idx += 1
    $P0 = new 'Lua::InstructionList'
    idx = $P0.'init'(script, bytecode, idx)
    self[0] = $P0
    $P0 = new 'Lua::ConstantList'
    idx = $P0.'init'(script, bytecode, idx)
    self[1] = $P0
    $P0 = new 'Lua::PrototypeList'
    idx = $P0.'init'(script, bytecode, idx)
    self[2] = $P0
    $P0 = new 'Lua::LineList'
    idx = $P0.'init'(script, bytecode, idx)
    self[3] = $P0
    $P0 = new 'Lua::LocalList'
    idx = $P0.'init'(script, bytecode, idx)
    self[4] = $P0
    $P0 = new 'Lua::UpvalueList'
    idx = $P0.'init'(script, bytecode, idx)
    self[5] = $P0

    .return (idx)
.end

.sub 'brief' :method
    .param int i
    .param int level
    .local int number_of_upvalues
    $P0 = getattribute self, 'number_of_upvalues'
    number_of_upvalues = $P0
    .local int number_of_parameters
    $P0 = getattribute self, 'number_of_parameters'
    number_of_parameters = $P0
    .local int is_vararg_flag
    $P0 = getattribute self, 'is_vararg_flag'
    is_vararg_flag = $P0
    .local int maximum_stack_size
    $P0 = getattribute self, 'maximum_stack_size'
    maximum_stack_size = $P0
    print "\n; function ["
    print i
    print "] definition (level "
    print level
    print ")\n"
    print "; "
    print number_of_upvalues
    print " upvalues, "
    print number_of_parameters
    print " params, "
    print maximum_stack_size
    print " stacks\n"
    print ".function  "
    print number_of_upvalues
    print " "
    print number_of_parameters
    print " "
    print is_vararg_flag
    print " "
    print maximum_stack_size
    print "\n"
    $P0 = self[4]   # local list
    $P0.'brief'()
    $P0 = self[5]   # upvalue list
    $P0.'brief'()
    $P0 = self[1]   # constant list
    $P0.'brief'()
    $P0 = self[2]   # prototype function list
    inc level
    $P0.'brief'(level)
    $P0 = self[0]   # instruction list
    $P0.'brief'()
    print "; end of function\n\n"
.end

.namespace ['Lua::InstructionList']

.sub 'init' :method
    .param pmc script
    .param string bytecode
    .param int idx
    .local int size
    $P0 = getattribute script, 'size_of_int'
    size = $P0
    .local int n
    $S0 = substr bytecode, idx, size
    n = script.'get_int'($S0)
    set self, n
    idx += size
    $P0 = getattribute script, 'size_of_opcode'
    size = $P0
    .local int i
    i = 0
  L1:
    unless i < n goto L2
    $S0 = substr bytecode, idx, size
    $I0 = script.'get_int'($S0)
    self[i] = $I0
    idx += size
    inc i
    goto L1
  L2:
    .return (idx)
.end


.namespace ['Lua::ConstantList']

.sub 'init' :method
    .param pmc script
    .param string bytecode
    .param int idx
    .local int size
    $P0 = getattribute script, 'size_of_int'
    size = $P0
    .local int n
    $S0 = substr bytecode, idx, size
    n = script.'get_int'($S0)
    set self, n
    idx += size
    .local int i
    i = 0
  L1:
    unless i < n goto L2
    $S0 = bytecode[idx]
    $I0 = ord $S0
    idx += 1
    unless $I0 == 0 goto L3
    $P0 = new 'Lua::Nil'
    goto L9
  L3:
    unless $I0 == 1 goto L4
    $P0 = new 'Lua::Boolean'
    idx = $P0.'init'(script, bytecode, idx)
    goto L9
  L4:
    unless $I0 == 3 goto L5
    $P0 = new 'Lua::Number'
    idx = $P0.'init'(script, bytecode, idx)
    goto L9
  L5:
    unless $I0 == 4 goto L6
    $P0 = new 'Lua::String'
    idx = $P0.'init'(script, bytecode, idx)
    goto L9
  L6:
    $S0 = "invalid type of constant"
    die $S0
  L9:
    self[i] = $P0
    inc i
    goto L1
  L2:
    .return (idx)
.end

.sub 'brief' :method
    .local int i, n
    n = self
    i = 0
  L1:
    unless i < n goto L2
    $P0 = self[i]
    $P0.'brief'(i)
    inc i
    goto L1
  L2:
.end


.namespace ['Lua::Nil']

.sub 'brief' :method
    .param int i
    print ".const  nil  ; "
    print i
    print "\n"
.end


.namespace ['Lua::Boolean']

.sub 'init' :method
    .param pmc script
    .param string bytecode
    .param int idx
    $S0 = bytecode[idx]
    $I0 = ord $S0
    set self, $I0
    .return (idx)
.end

.sub 'brief' :method
    .param int i
    print ".const  "
    print self
    print "  ; "
    print i
    print "\n"
.end


.namespace ['Lua::Number']

.sub 'init' :method
    .param pmc script
    .param string bytecode
    .param int idx
    .local int size
    $P0 = getattribute script, 'size_of_number'
    size = $P0
    $S0 = substr bytecode, idx, size
    $N0 = script.'get_number'($S0)
    idx += size
    set self, $N0
    .return (idx)
.end

.sub 'brief' :method
    .param int i
    print ".const  "
    print self
    print "  ; "
    print i
    print "\n"
.end


.namespace ['Lua::String']

.sub 'init' :method
    .param pmc script
    .param string bytecode
    .param int idx
    .local int size_t
    $P0 = getattribute script, 'size_of_size_t'
    size_t = $P0
    $S0 = substr bytecode, idx, size_t
    $I0 = script.'get_int'($S0)
    idx += size_t
    $S0 = ''
    unless $I0 goto L1
    $S0 = substr bytecode, idx, $I0
    idx += $I0
    dec $I0
    $S0 = substr $S0, 0, $I0
  L1:
    set self, $S0
    .return (idx)
.end

.sub 'brief' :method
    .param int i
    print ".const  \""
    $S0 = self
    $S1 = escape $S0
    print $S1
    print "\"  ; "
    print i
    print "\n"
.end


.namespace ['Lua::PrototypeList']

.sub 'init' :method
    .param pmc script
    .param string bytecode
    .param int idx
    .local int size
    $P0 = getattribute script, 'size_of_int'
    size = $P0
    .local int n
    $S0 = substr bytecode, idx, size
    n = script.'get_int'($S0)
    set self, n
    idx += size
    .local int i
    i = 0
  L1:
    unless i < n goto L2
    new $P0, 'Lua::Function'
    idx = $P0.'init'(script, bytecode, idx)
    self[i] = $P0
    inc i
    goto L1
  L2:
    .return (idx)
.end

.sub 'brief' :method
    .param int level
    .local int i, n
    n = self
    i = 0
  L1:
    unless i < n goto L2
    $P0 = self[i]
    $P0.'brief'(i, level)
    inc i
    goto L1
  L2:
.end


.namespace ['Lua::LineList']

.sub 'init' :method
    .param pmc script
    .param string bytecode
    .param int idx
    .local int size
    $P0 = getattribute script, 'size_of_int'
    size = $P0
    .local int n
    $S0 = substr bytecode, idx, size
    n = script.'get_int'($S0)
    set self, n
    idx += size
    .local int i
    i = 0
  L1:
    unless i < n goto L2
    $S0 = substr bytecode, idx, size
    $P0 = script.'get_Integer'($S0)
    idx += size
    self[i] = $P0
    inc i
    goto L1
  L2:
    .return (idx)
.end


.namespace ['Lua::LocalList']

.sub 'init' :method
    .param pmc script
    .param string bytecode
    .param int idx
    .local int size
    $P0 = getattribute script, 'size_of_int'
    size = $P0
    .local int n
    $S0 = substr bytecode, idx, size
    n = script.'get_int'($S0)
    set self, n
    idx += size
    .local int i
    i = 0
  L1:
    unless i < n goto L2
    new $P0, 'Lua::Local'
    idx = $P0.'init'(script, bytecode, idx)
    self[i] = $P0
    inc i
    goto L1
  L2:
    .return (idx)
.end

.sub 'brief' :method
    .local int i, n
    n = self
    i = 0
  L1:
    unless i < n goto L2
    $P0 = self[i]
    $P0.'brief'(i)
    inc i
    goto L1
  L2:
.end


.namespace ['Lua::Local']

.sub 'init' :method
    .param pmc script
    .param string bytecode
    .param int idx
    .local int size_t
    $P0 = getattribute script, 'size_of_size_t'
    size_t = $P0
    $S0 = substr bytecode, idx, size_t
    $I0 = script.'get_int'($S0)
    idx += size_t
    $S0 = ''
    unless $I0 goto L1
    $S0 = substr bytecode, idx, $I0
    idx += $I0
    dec $I0
    $S0 = substr $S0, 0, $I0
  L1:
    set self, $S0
    .local int size
    $P0 = getattribute script, 'size_of_int'
    size = $P0
    $S0 = substr bytecode, idx, size
    $P0 = script.'get_Integer'($S0)
    setattribute self, 'startpc', $P0
    idx += size
    $S0 = substr bytecode, idx, size
    $P0 = script.'get_Integer'($S0)
    setattribute self, 'endpc', $P0
    idx += size
    .return (idx)
.end

.sub 'brief' :method
    .param int i
    print ".local  \""
    print self
    print "\"  ; "
    print i
    print "\n"
.end


.namespace ['Lua::UpvalueList']

.sub 'init' :method
    .param pmc script
    .param string bytecode
    .param int idx
    .local int size
    $P0 = getattribute script, 'size_of_int'
    size = $P0
    .local int n
    $S0 = substr bytecode, idx, size
    n = script.'get_int'($S0)
    set self, n
    idx += size
    .local int i
    i = 0
  L1:
    unless i < n goto L2
    new $P0, 'Lua::Upvalue'
    idx = $P0.'init'(script, bytecode, idx)
    self[i] = $P0
    inc i
    goto L1
  L2:
    .return (idx)
.end

.sub 'brief' :method
    .local int i, n
    n = self
    i = 0
  L1:
    unless i < n goto L2
    $P0 = self[i]
    $P0.'brief'(i)
    inc i
    goto L1
  L2:
.end


.namespace ['Lua::Upvalue']

.sub 'init' :method
    .param pmc script
    .param string bytecode
    .param int idx
    .local int size_t
    $P0 = getattribute script, 'size_of_size_t'
    size_t = $P0
    $S0 = substr bytecode, idx, size_t
    $I0 = script.'get_int'($S0)
    idx += size_t
    $S0 = ''
    unless $I0 goto L1
    $S0 = substr bytecode, idx, $I0
    idx += $I0
    dec $I0
    $S0 = substr $S0, 0, $I0
  L1:
    set self, $S0
    .return (idx)
.end

.sub 'brief' :method
    .param int i
    print ".upvalue  \""
    print self
    print "\"  ; "
    print i
    print "\n"
.end


.include 'languages/lua/src/lib/luabytecode_gen.pir'

=head1 AUTHOR

Francois Perrad.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

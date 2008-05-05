# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/luabytecode.pir - Lua bytecode Library

=head1 DESCRIPTION

=cut


.namespace ['Lua::Bytecode']

.sub '__onload' :anon :load :init
    $P0 = newclass 'Lua::Bytecode'
    addattribute $P0, 'version'
    addattribute $P0, 'format'
    addattribute $P0, 'endian'
    addattribute $P0, 'sizeof_int'
    addattribute $P0, 'sizeof_size_t'
    addattribute $P0, 'sizeof_opcode'
    addattribute $P0, 'sizeof_number'
    addattribute $P0, 'integral'
    addattribute $P0, 'top'
    $P0 = newclass 'Lua::Function'
    addattribute $P0, 'source'
    addattribute $P0, 'linedefined'
    addattribute $P0, 'lastlinedefined'
    addattribute $P0, 'nups'
    addattribute $P0, 'numparams'
    addattribute $P0, 'is_vararg'
    addattribute $P0, 'maxstacksize'
    addattribute $P0, 'code'
    addattribute $P0, 'k'
    addattribute $P0, 'p'
    addattribute $P0, 'lineinfo'
    addattribute $P0, 'locvars'
    addattribute $P0, 'upvalues'
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

.sub 'undump'
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
    setattribute script, 'sizeof_int', $P0
    idx += 1
    $S0 = bytecode[idx]
    $I0 = ord $S0
    new $P0, 'Integer'
    set $P0, $I0
    setattribute script, 'sizeof_size_t', $P0
    idx += 1
    $S0 = bytecode[idx]
    $I0 = ord $S0
    new $P0, 'Integer'
    set $P0, $I0
    setattribute script, 'sizeof_opcode', $P0
    idx += 1
    $S0 = bytecode[idx]
    $I0 = ord $S0
    new $P0, 'Integer'
    set $P0, $I0
    setattribute script, 'sizeof_number', $P0
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
    .local int size_t
    $P0 = getattribute script, 'sizeof_size_t'
    size_t = $P0
    $S0 = substr bytecode, idx, size_t
    $I0 = script.'get_int'($S0)
    idx += size_t
    unless $I0 goto L1
    $S0 = substr bytecode, idx, $I0
    new $P0, 'String'
    set $P0, $S0
    setattribute self, 'source', $P0
    idx += $I0
  L1:
    .local int size
    $P0 = getattribute script, 'sizeof_int'
    size = $P0
    $S0 = substr bytecode, idx, size
    $P0 = script.'get_Integer'($S0)
    setattribute self, 'linedefined', $P0
    idx += size
    $S0 = substr bytecode, idx, size
    $P0 = script.'get_Integer'($S0)
    setattribute self, 'lastlinedefined', $P0
    idx += size
    $S0 = bytecode[idx]
    $I0 = ord $S0
    new $P0, 'Integer'
    set $P0, $I0
    setattribute self, 'nups', $P0
    idx += 1
    $S0 = bytecode[idx]
    $I0 = ord $S0
    new $P0, 'Integer'
    set $P0, $I0
    setattribute self, 'numparams', $P0
    idx += 1
    $S0 = bytecode[idx]
    $I0 = ord $S0
    new $P0, 'Integer'
    set $P0, $I0
    setattribute self, 'is_vararg', $P0
    idx += 1
    $S0 = bytecode[idx]
    $I0 = ord $S0
    new $P0, 'Integer'
    set $P0, $I0
    setattribute self, 'maxstacksize', $P0
    idx += 1
    $P0 = new 'Lua::InstructionList'
    idx = $P0.'init'(script, bytecode, idx)
    setattribute self, 'code', $P0
    $P0 = new 'Lua::ConstantList'
    idx = $P0.'init'(script, bytecode, idx)
    setattribute self, 'k', $P0
    $P0 = new 'Lua::PrototypeList'
    idx = $P0.'init'(script, bytecode, idx)
    setattribute self, 'p', $P0
    $P0 = new 'Lua::LineList'
    idx = $P0.'init'(script, bytecode, idx)
    setattribute self, 'lineinfo', $P0
    $P0 = new 'Lua::LocalList'
    idx = $P0.'init'(script, bytecode, idx)
    setattribute self, 'locvars', $P0
    $P0 = new 'Lua::UpvalueList'
    idx = $P0.'init'(script, bytecode, idx)
    setattribute self, 'upvalues', $P0
    .return (idx)
.end

.sub 'brief' :method
    .param int i
    .param int level
    .local int nups
    $P0 = getattribute self, 'nups'
    nups = $P0
    .local int numparams
    $P0 = getattribute self, 'numparams'
    numparams = $P0
    .local int is_vararg
    $P0 = getattribute self, 'is_vararg'
    is_vararg = $P0
    .local int maxstacksize
    $P0 = getattribute self, 'maxstacksize'
    maxstacksize = $P0
    print "\n; function ["
    print i
    print "] definition (level "
    print level
    print ")\n"
    print "; "
    print nups
    print " upvalues, "
    print numparams
    print " params, "
    print maxstacksize
    print " stacks\n"
    print ".function  "
    print nups
    print " "
    print numparams
    print " "
    print is_vararg
    print " "
    print maxstacksize
    print "\n"
    $P0 = getattribute self, 'locvars'
    $P0.'brief'()
    $P0 = getattribute self, 'upvalues'
    $P0.'brief'()
    $P0 = getattribute self, 'k'
    $P0.'brief'()
    $P0 = getattribute self, 'p'
    inc level
    $P0.'brief'(level)
    $P0 = getattribute self, 'code'
    $P0.'brief'()
    print "; end of function\n\n"
.end

.namespace ['Lua::InstructionList']

.sub 'init' :method
    .param pmc script
    .param string bytecode
    .param int idx
    .local int size
    $P0 = getattribute script, 'sizeof_int'
    size = $P0
    .local int n
    $S0 = substr bytecode, idx, size
    n = script.'get_int'($S0)
    set self, n
    idx += size
    $P0 = getattribute script, 'sizeof_opcode'
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
    $P0 = getattribute script, 'sizeof_int'
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
    $P0 = getattribute script, 'sizeof_number'
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
    $P0 = getattribute script, 'sizeof_size_t'
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
    $P0 = getattribute script, 'sizeof_int'
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
    $P0 = getattribute script, 'sizeof_int'
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
    $P0 = getattribute script, 'sizeof_int'
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
    $P0 = getattribute script, 'sizeof_size_t'
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
    $P0 = getattribute script, 'sizeof_int'
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
    $P0 = getattribute script, 'sizeof_int'
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
    $P0 = getattribute script, 'sizeof_size_t'
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

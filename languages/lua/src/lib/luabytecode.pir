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

.sub 'brief' :method
    .param string filename
    print "; source chunk: "
    print filename
    print "\n"
    $P0 = getattribute self, 'top'
    $P0.'brief'(0, 1)
.end


.namespace ['Lua::Function']

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


.namespace ['Lua::ConstantList']

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

.sub 'brief' :method
    .param int i
    print ".const  "
    print self
    print "  ; "
    print i
    print "\n"
.end


.namespace ['Lua::Number']

.sub 'brief' :method
    .param int i
    print ".const  "
    print self
    print "  ; "
    print i
    print "\n"
.end


.namespace ['Lua::String']

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


.namespace ['Lua::LocalList']

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

.sub 'brief' :method
    .param int i
    print ".local  \""
    print self
    print "\"  ; "
    print i
    print "\n"
.end


.namespace ['Lua::UpvalueList']

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

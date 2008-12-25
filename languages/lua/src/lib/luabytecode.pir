# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/luabytecode.pir - Lua bytecode translation Library

=head1 DESCRIPTION

=cut


.namespace ['Lua'; 'Bytecode']

.sub '__onload' :anon :load :init
    $P0 = newclass ['Lua'; 'Bytecode']
    addattribute $P0, 'version'
    addattribute $P0, 'format'
    addattribute $P0, 'endian'
    addattribute $P0, 'sizeof_int'
    addattribute $P0, 'sizeof_size_t'
    addattribute $P0, 'sizeof_opcode'
    addattribute $P0, 'sizeof_number'
    addattribute $P0, 'integral'
    addattribute $P0, 'top'
    $P0 = newclass ['Lua'; 'Function']
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
    $P0 = subclass 'FixedIntegerArray', ['Lua'; 'InstructionList']
    $P0 = subclass 'FixedPMCArray', ['Lua'; 'ConstantList']
    $P0 = subclass 'Undef', ['Lua'; 'Nil']
    $P0 = subclass 'Boolean', ['Lua'; 'Boolean']
    $P0 = subclass 'Float', ['Lua'; 'Number']
    $P0 = subclass 'String', ['Lua'; 'String']
    $P0 = subclass 'FixedPMCArray', ['Lua'; 'PrototypeList']
    $P0 = subclass 'FixedIntegerArray', ['Lua'; 'LineList']
    $P0 = subclass 'FixedPMCArray', ['Lua'; 'LocalList']
    $P0 = subclass 'String', ['Lua'; 'Local']
    addattribute $P0, 'startpc'
    addattribute $P0, 'endpc'
    $P0 = subclass 'FixedPMCArray', ['Lua'; 'UpvalueList']
    $P0 = subclass 'String', ['Lua'; 'Upvalue']
.end

.sub 'brief' :method
    .param string filename
    print "; source chunk: "
    print filename
    print "\n"
    $P0 = getattribute self, 'top'
    $P0.'brief'(0, 1)
.end

.sub 'translate' :method
    .local string pir
    pir = <<'PIRCODE'
.include 'interpinfo.pasm'
.HLL 'lua'
.loadlib 'lua_group'

.namespace []

.sub '&start' :anon :main
    .param pmc args :optional
#    print "start\n"
    load_bytecode 'languages/lua/lua.pbc'
    lua_openlibs()
    .local pmc env
    env = get_hll_global '_G'
    .local pmc vararg
    vararg = argstolua(env, args)
    .const 'Sub' main = '&function_0'
    main.'setfenv'(env)
    ($I0, $P0) = docall(main, vararg :flat)
    unless $I0 goto L1
    printerr 'luac2pir: '
    printerr $P0
  L1:
.end

PIRCODE
    $P0 = getattribute self, 'top'
    $S0 = $P0.'translate'('&function_0', '&start')
    pir .= $S0
    .return (pir)
.end


.namespace ['Lua'; 'Function']

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

.sub 'translate' :method
    .param string funcname
    .param string outer
    .local string pir
    pir = ".sub '" . funcname
    pir .= "' :anon :lex :outer('"
    pir .= outer
    pir .= "')\n"
    .local int numparams
    $P0 = getattribute self, 'numparams'
    numparams = $P0
    .local int i
    i = 0
  L1:
    unless i < numparams goto L2
    $S0 = i
    pir .= "    .param pmc loc_"
    pir .= $S0
    pir .= " :optional\n    .param int has_loc_"
    pir .= $S0
    pir .= " :opt_flag\n"
    inc i
    goto L1
  L2:
    .local int is_vararg
    $P0 = getattribute self, 'is_vararg'
    is_vararg = $P0
    unless is_vararg goto L3
    pir.= "    .param pmc vararg :slurpy\n"
    goto L4
  L3:
    pir .= "    .param pmc extra :slurpy\n"
  L4:
    i = 0
  L5:
    unless i < numparams goto L6
    $S0 = i
    pir .= "    if has_loc_"
    pir .= $S0
    pir .= ", vivify_"
    pir .= $S0
    pir .= "\n    new loc_"
    pir .= $S0
    pir .= ", 'LuaNil'\n  vivify_"
    pir .= $S0
    pir .= ":\n"
    inc i
    goto L5
  L6:
    $P0 = getattribute self, 'locvars'
    $S0 = $P0.'translate'(numparams, is_vararg)
    pir .= $S0
    i = $P0
    .local int maxstacksize
    $P0 = getattribute self, 'maxstacksize'
    maxstacksize = $P0
  L7:
    unless i < maxstacksize goto L8
    pir .= "    .local pmc loc_"
    $S0 = i
    pir .= $S0
    pir .= "\n    new loc_"
    pir .= $S0
    pir .= ", 'LuaNil'\n"
    inc i
    goto L7
  L8:
    $P0 = getattribute self, 'k'
    $S0= $P0.'translate'()
    pir .= $S0
    pir .= "    .local pmc subr, env\n"
    pir .= "    subr = interpinfo .INTERPINFO_CURRENT_SUB\n"
    $P0 = getattribute self, 'code'
    $S0 = $P0.'translate'(self, funcname)
    pir .= $S0
    pir .= ".end\n\n"
    $P0 = getattribute self, 'p'
    $S0 = $P0.'translate'(funcname)
    pir .= $S0
    .return (pir)
.end


.namespace ['Lua'; 'ConstantList']

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

.sub 'translate' :method
    .local string pir
    .local int i, n
    pir = ''
    n = self
    i = 0
  L1:
    unless i < n goto L2
    $P0 = self[i]
    $S0 = $P0.'translate'(i)
    pir .= $S0
    inc i
    goto L1
  L2:
    .return (pir)
.end


.namespace ['Lua'; 'Nil']

.sub 'brief' :method
    .param int i
    print ".const  nil  ; "
    print i
    print "\n"
.end

.sub 'translate' :method
    .param int i
    .local string pir
    pir = "    .local pmc k_"
    $S0 = i
    pir .= $S0
    pir .= "\n    new k_"
    pir .= $S0
    pir .= ", 'LuaNil'\n"
    .return (pir)
.end


.namespace ['Lua'; 'Boolean']

.sub 'brief' :method
    .param int i
    print ".const  "
    print self
    print "  ; "
    print i
    print "\n"
.end

.sub 'translate' :method
    .param int i
    .local string pir
    pir = "    .local pmc k_"
    $S0 = i
    pir .= $S0
    pir .= "\n    new k_"
    pir .= $S0
    pir .= ", 'LuaBoolean'\n    set k_"
    pir .= $S0
    pir .= ", "
    $S0 = self
    pir .= $S0
    pir .= "\n"
    .return (pir)
.end


.namespace ['Lua'; 'Number']

.sub 'brief' :method
    .param int i
    print ".const  "
    print self
    print "  ; "
    print i
    print "\n"
.end

.sub 'translate' :method
    .param int i
    .local string pir
    pir = "    .local pmc k_"
    $S0 = i
    pir .= $S0
    pir .= "\n    box k_"
    pir .= $S0
    pir .= ", "
    $S0 = self
    pir .= $S0
    pir .= "\n"
    .return (pir)
.end


.namespace ['Lua'; 'String']

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

.sub 'translate' :method
    .param int i
    .local string pir
    pir = "    .local pmc k_"
    $S0 = i
    pir .= $S0
    pir .= "\n    box k_"
    pir .= $S0
    pir .= ", \""
    $S0 = self
    $S1 = escape $S0
    pir .= $S1
    pir .= "\"\n"
    .return (pir)
.end


.namespace ['Lua'; 'PrototypeList']

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

.sub 'translate' :method
    .param string outer
    .local string pir
    .local int i, n
    pir = ''
    n = self
    i = 0
  L1:
    unless i < n goto L2
    .local string funcname
    funcname = outer . '_'
    $S0 = i
    funcname .= $S0
    $P0 = self[i]
    $S0 = $P0.'translate'(funcname, outer)
    pir .= $S0
    inc i
    goto L1
  L2:
    .return (pir)
.end


.namespace ['Lua'; 'LocalList']

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

.sub 'translate' :method
    .param int numparams
    .param int is_vararg
    .local string pir
    .local int i, n
    pir = ''
    n = self
    i = numparams
    $I0 = is_vararg & 1
    unless $I0 goto L1
    inc i
  L1:
    unless i < n goto L2
    $P0 = self[i]
    $S0 = $P0.'translate'(i)
    pir .= $S0
    inc i
    goto L1
  L2:
    .return (pir)
.end


.namespace ['Lua'; 'Local']

.sub 'brief' :method
    .param int i
    print ".local  \""
    print self
    print "\"  ; "
    print i
    print "\n"
.end

.sub 'translate' :method
    .param int i
    .local string pir
    pir = "    .local pmc loc_"
    $S0 = i
    pir .= $S0
    pir .= " # "
    $S1 = self
    pir .= $S1
    pir .= "\n    new loc_"
    pir .= $S0
    pir .= ", 'LuaNil'\n"
    .return (pir)
.end


.namespace ['Lua'; 'UpvalueList']

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


.namespace ['Lua'; 'Upvalue']

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


.sub _init_script
#    print "_init_script (script.pir)\n"
    $P0 = subclass "Hash", "Wmls::Script"
    $P0 = subclass "Array", "Wmls::Constants"
    $P0 = subclass "Integer", "Wmls::ConstantInteger"
    $P0 = subclass "Float", "Wmls::ConstantFloat"
    $P0 = subclass "String", "Wmls::ConstantUTF8String"
    $P0 = subclass "String", "Wmls::ConstantEmptyString"
    $P0 = subclass "String", "Wmls::ConstantString"
    $P0 = subclass "Array", "Wmls::Pragmas"
    $P0 = subclass "Hash", "Wmls::AccessDomain" 
    $P0 = subclass "Hash", "Wmls::AccessPath" 
    $P0 = subclass "Hash", "Wmls::UserAgentProperty" 
    $P0 = subclass "Hash", "Wmls::UserAgentProperty&Scheme" 
    $P0 = subclass "Array", "Wmls::Functions"
    $P0 = subclass "Array", "Wmls::FunctionNameTable" 
    $P0 = subclass "Hash", "Wmls::Function" 
.end

.namespace ["Wmls::Script"]

.sub dump :method
    .local string filename
    filename = self['filename']
    print "## file:"
    print filename
    print "\n"
    print "##\n"
    print "## Bytecode Header\n"
    print "##\n"
    .local int version
    .local int major
    .local int minor
    version = self['VersionNumber']
    major = version / 16
    major = major + 1
    minor = version % 16
    print "VersionNumber "
    print major
    print "."
    print minor
    print "\n"
    .local int code_size
    code_size = self['CodeSize']
    print "CodeSize "
    print code_size
    print "\n"

    print "## Constant Pool\n"
    print "##\n"
    .local pmc constants
    .local int number_of_constants
    constants = self['Constants']
    number_of_constants = elements constants
    print "NumberOfConstants "
    print number_of_constants
    print "\n"
    .local int character_set
    character_set = self['CharacterSet']
    print "CharacterSet "
    print character_set
    print "\n"
    constants.dump()

    print "## Pragma Pool\n"
    print "##\n"
    .local pmc pragmas
    .local int number_of_pragmas
    pragmas = self['Pragmas']
    number_of_pragmas = elements pragmas
    print "NumberOfPragmas "
    print number_of_pragmas
    print "\n"
    pragmas.dump()

    print "## Function Pool\n"
    print "##\n"
    .local pmc functions
    .local int number_of_functions
    functions = self['Functions']
    number_of_functions = elements functions
    print "NumberOfFunctions "
    print number_of_functions
    print "\n"
    .local pmc function_name_table
    function_name_table = self['FunctionNameTable']
    function_name_table.dump()
    functions.dump()
.end

.sub translate :method
    .local string pir
    pir = <<"PIRCODE"
.HLL 'WMLScript', 'wmls_group'

.sub _init :load :anon

  push_eh _handler
  $P0 = global '@stdlibs'
  goto L1
_handler:
  load_bytecode 'languages/WMLScript/runtime/wmlslib.pbc'
L1:
PIRCODE

    .local pmc function_name_table
    function_name_table = self['FunctionNameTable']
    $S0 = function_name_table.translate(self)
    pir .= $S0
    pir .= "\n.end\n"

    .local pmc functions
    functions = self['Functions']
    $S0 = functions.translate(self)
    pir .= $S0

    .return (pir)
.end

.sub get_nb_arg :method
    .param int idx
    .local pmc functions
    functions = self['Functions']
    .local pmc function
    function = functions[idx]
    .local int number_of_arguments
    number_of_arguments = function['NumberOfArguments']
    .return (number_of_arguments)
.end

.namespace ["Wmls::Constants"]

.sub dump :method
    .local int nb
    .local int idx
    .local pmc constant
    nb = elements self
    idx = 0
L1:
    unless idx < nb goto L2
    constant = self[idx]
    print "cst"
    print idx
    print " "
    constant.dump()
    print "\n" 
    inc idx
    goto L1
L2:
.end

.sub translate :method
    .param int idx
    .local pmc constant
    constant = self[idx]
    $S0 = constant.translate(idx)
    .return ($S0)
.end

.namespace ["Wmls::ConstantInteger"]

.sub dump :method                                      
    print "int "
    print self
.end

.sub translate :method
    .param int idx                                          
    .local string pir
    pir = "  .local pmc const"
    $S0 = idx
    pir .= $S0
    pir .= "\n  new const"
    pir .= $S0
    pir .= ", .WmlsInteger\n  set const"
    pir .= $S0
    pir .= ", "
    $S0 = self
    pir .= $S0
    pir .= "\n"
    .return (pir)
.end

.namespace ["Wmls::ConstantFloat"]

.sub dump :method
    print "float "
    print self
.end

.sub translate :method
    .param int idx                                          
    .local string pir
    pir = "  .local pmc const"
    $S0 = idx
    pir .= $S0
    pir .= "\n  new const"
    pir .= $S0
    pir .= ", .WmlsFloat\n  set const"
    pir .= $S0
    pir .= ", "
    $S0 = self
    pir .= $S0
    pir .= "\n"
    .return (pir)
.end

.namespace ["Wmls::ConstantUTF8String"]

.sub dump :method
    .local int len
    len = elements self
    print "string UTF8 ["
    print len
    print "] "
    print self
.end

.sub translate :method
    .param int idx                                          
    .local string pir
    pir = "  .local pmc const"
    $S0 = idx
    pir .= $S0
    pir .= "\n  new const"
    pir .= $S0
    pir .= ", .WmlsString\n  set const"
    pir .= $S0
    pir .= ", unicode:\""
    $S0 = self
    $S0 = escape $S0
    pir .= $S0
    pir .= "\"\n"
    .return (pir)
.end

.namespace ["Wmls::ConstantEmptyString"]

.sub dump :method
    print "empty string"
.end

.sub translate :method
    .param int idx                                          
    .local string pir
    pir = "  .local pmc const"
    $S0 = idx
    pir .= $S0
    pir .= "\n  new const"
    pir .= $S0
    pir .= ", .WmlsString, ''\n"
    .return (pir)
.end

.namespace ["Wmls::ConstantString"]

.sub dump :method
    .local int len
    len = elements self
    print "string ["
    print len
    print "] "
    print self
.end

.sub translate :method
    .param int idx                                          
    .local string pir
    pir = "  .local pmc const"
    $S0 = idx
    pir .= $S0
    pir .= "\n  new const"
    pir .= $S0
    pir .= ", .WmlsString\n  set const"
    pir .= $S0
    pir .= ", \""
    $S0 = self
    $S0 = escape $S0
    pir .= $S0
    pir .= "\"\n"
    .return (pir)
.end

.namespace ["Wmls::Pragmas"]

.sub dump :method
    .local int nb
    .local int idx
    .local pmc pragma
    nb = elements self
    idx = 0
L1:
    unless idx < nb goto L2
    pragma = self[idx]
    print "pragma"
    print idx
    print " "
    pragma.dump()
    print "\n" 
    inc idx
    goto L1
L2:
.end

.namespace ["Wmls::AccessDomain"]

.sub dump :method
    .local int access_domain_index
    access_domain_index = self['AccessDomainIndex']
    print "AccessDomain "
    print access_domain_index                                          
.end

.namespace ["Wmls::AccessPath"]

.sub dump :method                                          
    .local int access_path_index
    access_path_index = self['AccessPathIndex']
    print "AccessPath "
    print access_path_index                                          
.end

.namespace ["Wmls::UserAgentProperty"]

.sub dump :method                                          
    .local int property_name_index
    property_name_index = self['PropertyNameIndex']
    .local int content_index
    content_index = self['ContentIndex']
    print "UserAgentProperty "
    print property_name_index
    print " "
    print content_index                                         
.end

.namespace ["Wmls::UserAgentProperty&Scheme"]

.sub dump :method                                          
    .local int property_name_index
    property_name_index = self['PropertyNameIndex']
    .local int content_index
    content_index = self['ContentIndex']
    .local int scheme_index
    scheme_index = self['SchemeIndex']
    print "UserAgentProperty "
    print property_name_index
    print " "
    print content_index                                         
    print " "
    print scheme_index                                         
.end

.namespace ["Wmls::FunctionNameTable"]

.sub dump :method                                          
    print "## Function Name Table\n"
    .local int number_of_function_names
    number_of_function_names = elements self
    print "NumberOfFunctionNames "
    print number_of_function_names
    print "\n"
    .local int idx
    .local pmc couple
    .local string function_name
    .local int function_name_size
    .local int function_index
    idx = 0
L1:
    unless idx < number_of_function_names goto L2
    couple = self[idx]
    function_index = couple[0]
    function_name = couple[1]
    function_name_size = length function_name
    print function_index
    print " "
    print function_name_size
    print " "
    print function_name
    print "\n"
    inc idx
    goto L1        
L2:
.end

.sub translate :method
    .param pmc script
    .local string namespace
    namespace = script['filename']
    .local string pir
    pir = "\n  # Function Name Table\n"
    .local int nb
    nb = elements self
    .local int idx
    idx = 0
    .local pmc couple
    .local string function_name
    .local int function_index
L1:
    unless idx < nb goto L2
    couple = self[idx]
    function_index = couple[0]
    function_name = couple[1]
    pir .= "  .const .Sub "
    pir .= function_name
    pir .= " = 'function"
    $S0 = function_index
    pir .= $S0 
    pir .= "'\n  global '"
    pir .= namespace
    pir .= ":"
    pir .= function_name
    pir .= "' = "
    pir .= function_name
    pir .= "\n"
    inc idx
    goto L1        
L2:
    .return (pir)
.end

.namespace ["Wmls::Functions"]

.sub dump :method
    .local int nb
    .local int idx
    .local pmc function
    nb = elements self
    idx = 0
L1:
    unless idx < nb goto L2
    function = self[idx]
    print "## function "
    print idx
    print "\n"
    function.dump()
    inc idx
    goto L1        
L2:
.end

.sub translate :method
    .param pmc script
    .local string pir
    pir = "\n#\n# Functions\n#\n"
    .local int nb
    .local int idx
    .local pmc function
    nb = elements self
    idx = 0
L1:
    unless idx < nb goto L2
    function = self[idx]
    $S0 = function.translate(script, idx)
    pir .= $S0
    inc idx
    goto L1        
L2:
    .return (pir)
.end

.namespace ["Wmls::Function"]

.sub dump :method                                          
    .local int number_of_arguments
    number_of_arguments = self['NumberOfArguments']
    .local int number_of_local_variables
    number_of_local_variables = self['NumberOfLocalVariables']
    .local string code_array
    .local int function_size
    code_array = self['CodeArray']
    function_size = length code_array
    print "NumberOfArgument "
    print number_of_arguments
    print "\n"
    print "NumberOfLocalVariables "
    print number_of_local_variables
    print "\n"
    print "FunctionSize "
    print function_size
    print "\n"
    dump_code(code_array)
.end

.sub translate :method
    .param pmc script
    .param int idx                                          
    .local string pir
    pir = "\n.sub function"
    $S0 = idx
    pir .= $S0
    pir .= " :anon\n"

    .local int number_of_arguments
    number_of_arguments = self['NumberOfArguments']
    .local int idx
    idx = 0
L1:
    unless idx < number_of_arguments goto L2
    pir .= "  .param pmc arg"
    $S0 = idx
    pir .= $S0
    pir .= "\n"
    inc idx
    goto L1        
L2:

    .local int number_of_local_variables
    number_of_local_variables = self['NumberOfLocalVariables']
    .local int number_of_variables
    number_of_variables = number_of_arguments + number_of_local_variables
    idx = 0
L3:
    unless idx < number_of_variables goto L4
    pir .= "  .local pmc local"
    $S0 = idx
    pir .= $S0
    pir .= "\n"
    inc idx
    goto L3        
L4:

    idx = 0
L5:
    unless idx < number_of_arguments goto L6
    pir .= "  local"
    $S0 = idx
    pir .= $S0
    pir .= " = arg"
    pir .= $S0
    pir .= "\n"
    inc idx
    goto L5        
L6:

    unless number_of_local_variables goto L7
    pir .= "  new $P0, .WmlsString, ''\n"
L7:
    unless idx < number_of_variables goto L8
    pir .= "  local"
    $S0 = idx
    pir .= $S0
    pir .= " = $P0\n"
    inc idx
    goto L7        
L8:

    .local string code_array
    code_array = self['CodeArray']
    $S0 = translate_code(code_array, script)
    pir .= $S0
    
    pir .= <<"PIRCODE"
  new $P0, .WmlsString, ''
  .return ($P0)
.end
PIRCODE

    .return (pir)
.end


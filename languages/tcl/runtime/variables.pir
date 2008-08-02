.HLL '_Tcl', ''
.namespace []

=head2 _Tcl::readVar

Read a variable from its name. It may be a scalar or an
array.

Use the call level to determine if we are referring to a
global variable or a lexical variable - will no doubt
require further refinement later as we support namespaces
other than the default, and multiple interpreters.

=cut

.sub readVar
  .param string name

  .local pmc variable

  # is this an array?
  # ends with )
  .local int char
  char = ord name, -1
  if char != 41 goto scalar
  # contains a (
  char = index name, '('
  if char == -1 goto scalar

array:
  .local string var
  var = substr name, 0, char

  .local string key
  .local int len
  len = length name
  len -= char
  len -= 2
  inc char
  key = substr name, char, len

  variable = findVar(var)
  if null variable goto no_such_variable

  $I0 = does variable, 'associative_array'
  unless $I0 goto cant_read_not_array

  variable = variable[key]
  if null variable goto bad_index
  $I0 = isa variable, 'Undef'
  if $I0 goto bad_index
  .return(variable)

bad_index:
  $S0 = "can't read \""
  $S0 .= name
  $S0 .= '": no such element in array'
  die $S0

cant_read_not_array:
  $S0 =  "can't read \""
  $S0 .= name
  $S0 .= "\": variable isn't array"
  die $S0

scalar:
  variable = findVar(name)
  if null variable goto no_such_variable

  $I0 = does variable, 'associative_array'
  if $I0 goto cant_read_array
  .return(variable)

cant_read_array:
  $S0 = "can't read \""
  $S0 .= name
  $S0 .= '": variable is array'
  die $S0

no_such_variable:
  $S0 = "can't read \""
  $S0 .= name
  $S0 .= '": no such variable'
  die $S0
.end

=head2 _Tcl::makeVar

Read a variable from its name. If it doesn't exist, create it. It may be a
scalar or an array.

Use the call level to determine if we are referring to a
global variable or a lexical variable - will no doubt
require further refinement later as we support namespaces
other than the default, and multiple interpreters.

=cut

.sub makeVar
  .param string name
  .param int    depth :named('depth') :optional

  .local pmc variable

  # is this an array?
  # ends with )
  .local int char
  char = ord name, -1
  if char != 41 goto scalar
  # contains a (
  char = index name, '('
  if char == -1 goto scalar

array:
  .local string var
  var = substr name, 0, char

  .local string key
  .local int len
  len = length name
  len -= char
  len -= 2
  inc char
  key = substr name, char, len

  variable = findVar(var, 'depth' => depth)
  unless null variable goto check_is_hash

  variable = new 'TclArray'
  variable = storeVar(var, variable, 'depth' => depth)

check_is_hash:
  $I0 = does variable, 'associative_array'
  unless $I0 goto cant_read_not_array

  $P0 = variable[key]
  if null $P0 goto create_elem
  .return($P0)

create_elem:
  $P0 = new 'Undef'
  variable[key] = $P0
  .return($P0)

cant_read_not_array:
  $S0 =  "can't read \""
  $S0 .= name
  $S0 .= "\": variable isn't array"
  die $S0

scalar:
  variable = findVar(name, 'depth' => depth)
  if null variable goto make_variable
  .return(variable)

make_variable:
    variable = new 'Undef'
    variable = storeVar(name, variable, 'depth' => depth)
    .return(variable)
.end

=head2 _Tcl::setVar

Set a variable by its name. It may be a scalar or an array.

Use the call level to determine if we are referring to a
global variable or a lexical variable - will no doubt
require further refinement later as we support namespaces
other than the default, and multiple interpreters.

=cut

.sub setVar
  .param string name
  .param pmc value

  .local pmc variable

  # Some cases in the code allow a NULL pmc to show up here.
  # This defensively converts them to an empty string.
  unless_null value, got_value
  value = new 'TclString'
  value = ''

 got_value:
  # is this an array?
  # ends with )
  .local int char
  char = ord name, -1
  if char != 41 goto scalar
  # contains a (
  char = index name, '('
  if char == -1 goto scalar

find_array:
  .local string var
  var = substr name, 0, char

  .local string key
  .local int len
  len = length name
  len -= char
  len -= 2
  inc char
  key = substr name, char, len

  .local pmc array
  null array
  array = findVar(var)
  if null array goto create_array

  $I0 = does array, 'associative_array'
  unless $I0 goto cant_set_not_array
  goto set_array

create_array:
  array = new 'TclArray'
  array = storeVar(var, array)

set_array:
  variable = array[key]
  if null variable goto set_new_elem
  assign variable, value
  $P0 = clone variable
  .return($P0)

set_new_elem:
  array[key] = value
  $P0 = clone value
  .return($P0)

cant_set_not_array:
  $S0 =  "can't set \""
  $S0 .= name
  $S0 .= "\": variable isn't array"
  die $S0

scalar:
  $P0 = findVar(name)
  if null $P0 goto create_scalar
  $I0 = does $P0, 'associative_array'
  if $I0 goto cant_set_array

create_scalar:
  storeVar(name, value)
  $P0 = clone value
  .return($P0)

cant_set_array:
  $S0 =  "can't set \""
  $S0 .= name
  $S0 .= "\": variable is array"
  die $S0
.end

=head2 _Tcl::findVar

Utility function used by readVar and setVar.

Gets the actual variable from memory and returns it.

=cut

.sub findVar
  .param string name
  .param int    isglobal :named('global') :optional
  .param int    depth    :named('depth')  :optional

  .local pmc value, ns
  ns = new 'ResizableStringArray'

  .local int absolute
  absolute = 0

  $I0 = index name, '::'
  if $I0 == 0  goto absolute_global
  if $I0 != -1 goto global_var
  if isglobal  goto global_var

  .local pmc call_chain
  .local int call_level
  call_chain = get_root_global ['_tcl'], 'call_chain'
  call_level = elements call_chain
  if call_level == 0 goto global_var

  name = '$' . name

  .local pmc lexpad, variable
  push_eh lexical_notfound
    lexpad     = call_chain[-1]
    value      = lexpad[name]
  pop_eh
  if null value goto args_check
  $I0 = isa value, 'Undef'
  if $I0 goto args_check
  goto found

args_check:
  # args is special -- it doesn't show up in [info vars]
  # unless you explicitly set it in your proc. but if you
  # try to get it, it's always there.
  unless name == '$args' goto notfound
  value = lexpad['args']
  .return(value)

absolute_global:
  absolute = 1
global_var:
  depth += 2
  ns = splitNamespace(name, depth)
  $S0 = pop ns
  $S0 = '$' . $S0

  unshift ns, 'tcl'
  ns = get_root_namespace ns
  if null ns goto notfound

  value = ns[$S0]
  if null value goto notfound
  $I0 = isa value, 'Undef'
  if $I0 goto notfound
  goto found

root_global_var:
  absolute = 1
  .local pmc colons, split
  colons = get_root_global ['_tcl'], 'colons'
  split  = get_root_global ['parrot'; 'PGE::Util'], 'split'

  ns  = split(colons, name)
  $S0 = pop ns
  $S0 = '$' . $S0

  unshift ns, 'tcl'
  ns = get_root_namespace ns
  if null ns goto notfound

  value = ns[$S0]
  if null value goto found
  $I0 = isa value, 'Undef'
  if $I0 goto notfound
  goto found

notfound:
  unless absolute goto root_global_var
lexical_notfound:
  null value
found:
  .return(value)
.end

=head2 _Tcl::storeVar

Utility function used by readVar and setVar.

Sets the actual variable from memory.

=cut

.sub storeVar
  .param string name
  .param pmc    value
  .param int    isglobal :named('global') :optional
  .param int    depth    :named('depth')  :optional

  .local pmc value, ns
  ns = new 'ResizableStringArray'

  $I0 = index name, '::'
  if $I0 != -1 goto global_var
  if isglobal goto global_var

  .local pmc call_chain
  .local int call_level
  call_chain = get_root_global ['_tcl'], 'call_chain'
  call_level = elements call_chain
  if call_level == 0 goto global_var

  name = '$' . name
lexical_var:
  .local pmc lexpad
  lexpad       = call_chain[-1]

  $P0 = lexpad[name]
  if null $P0 goto lexical_is_null

  copy $P0, value
  .return($P0)

lexical_is_null:
  lexpad[name] = value
  .return(value)

global_var:
  depth += 2
  ns = splitNamespace(name, depth)
  name = pop ns
  name = '$' . name

  unshift ns, 'tcl'
  ns = get_root_namespace ns
  if null ns goto global_not_undef
  $P0 = ns[name]
  if null $P0 goto global_not_undef

  copy $P0, value
  .return($P0)

global_not_undef:
  ns[name] = value
  .return(value)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

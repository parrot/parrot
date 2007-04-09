=head2 [namespace]

Parrot has its own namespaces which Tcl is only a part of. So, in the top
level parrot namespace, C<Tcl> refers to the top of the Tcl namespace.

To refer back to something in another parrot namespace, use the special
C<parrot> namespace inside Tcl - this should be an alias back to parrot's
real top level namespace.

=cut

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&namespace'
   .param pmc argv :slurpy

  .local pmc retval

  $I3 = argv
  unless $I3 goto no_args

  .local string subcommand_name
  subcommand_name = shift argv

  .local pmc options
  options = new .ResizablePMCArray
  options[0] = 'children'
  options[1] = 'code'
  options[2] = 'current'
  options[3] = 'delete'
  options[4] = 'ensemble'
  options[5] = 'eval'
  options[6] = 'exists'
  options[7] = 'export'
  options[8] = 'forget'
  options[9] = 'import'
  options[10] = 'inscope'
  options[11] = 'origin'
  options[12] = 'parent'
  options[13] = 'path'
  options[14] = 'qualifiers'
  options[15] = 'tail'
  options[16] = 'unknown'
  options[17] = 'upvar'
  options[18] = 'which'

  .local pmc select_option
  select_option  = get_root_global ['_tcl'], 'select_option'
  .local string canonical_subcommand
  canonical_subcommand = select_option(options, subcommand_name)
  
  .local pmc subcommand_proc
  null subcommand_proc

  subcommand_proc = get_root_global ['_tcl';'helpers';'namespace'], canonical_subcommand
  if null subcommand_proc goto bad_args

  .return subcommand_proc(argv)

bad_args:
  .return ('') # once all commands are implemented, remove this...

no_args:
  tcl_error 'wrong # args: should be "namespace subcommand ?arg ...?"'

.end

.HLL '_Tcl', ''
.namespace [ 'helpers'; 'namespace' ]

.sub 'current'
  .param pmc argv

  .local int argc
  argc = argv
  if argc goto bad_args

  .local pmc ns, __namespace
  __namespace = get_root_global ['_tcl'], '__namespace'
  ns  = __namespace('')
  $S0 = join '::', ns
  $S0 = '::' . $S0
  .return($S0)

bad_args:
  tcl_error 'wrong # args: should be "namespace current"'
.end

.sub 'delete'
  .param pmc argv

  .local int argc
  argc = elements argv
  # no arg delete does nothing
  if argc == 0 goto return
  
  .local pmc __namespace, ns_root
  __namespace = get_root_global ['_tcl'], '__namespace'
  ns_root = get_root_namespace ['tcl']
  
  $I0 = 0
delete_loop:
  if $I0 == argc goto return
  $S0 = argv[$I0]
  $P0 = __namespace($S0)
  $I1 = 0
  $I2 = elements $P0
  dec $I2
  $P1 = ns_root
loop:
  $S0 = $P0[$I1]
  if $I1 == $I2 goto end
  $P1 = $P1[$S0]
  inc $I1
  goto loop
end:
  delete $P1[$S0]
  inc $I0
  goto delete_loop

return:
  .return('')
.end

.sub 'exists'
  .param pmc argv

  .local int argc
  argc = argv
  if argc != 1 goto bad_args

  .local pmc colons, split, name
  colons = get_root_global ['_tcl'], 'colons'
  split  = get_root_global ['parrot'; 'PGE::Util'], 'split'

  name = argv[0]

  $P0 = split(colons, name)
  $I0 = elements $P0
  if $I0 == 0 goto relative

  $S0 = $P0[0]
  if $S0 != '' goto relative
  $P1 = pop $P0
  goto get

relative:

get:
  .local pmc ns
  $I0 = 0
  $I1 = elements $P0
  ns = get_root_namespace ['tcl']
get_loop:
  if $I0 == $I1 goto get_end
  $P1 = $P0[$I0]
  ns  = ns[$P1]
  if null ns goto doesnt_exist
  inc $I0
  goto get_loop
get_end:
  .return(1)
  
doesnt_exist:
  .return(0)

bad_args:
  tcl_error 'wrong # args: should be "namespace exists name"'
.end

.sub 'qualifiers'
  .param pmc argv
  
  .local int argc
  argc = argv
  if argc != 1 goto bad_args

  .local pmc p6r,match
  p6r = compreg 'PGE::P6Regex'
  match = p6r("(.*)\\:\\:+<-[:]>*$$")

  $S0 = argv[0]
  $P0 = match($S0)
  unless $P0 goto WHOLE
  $P1 = $P0[0]
  $S1 = $P1
  .return ($S1)

WHOLE:
  $S0 = argv[0]
  .return($S0)

  bad_args:
   tcl_error 'wrong # args: should be "namespace qualifiers string"'

.end

.sub 'tail'
  .param pmc argv
  
  .local int argc
  argc = argv
  if argc != 1 goto bad_args

  .local pmc p6r,match
  p6r= compreg 'PGE::P6Regex'
  match = p6r("\\:\\:+(<-[:]>)$$")

  $S0 = argv[0]
  $P0 = match($S0)
  unless $P0 goto WHOLE

  $P2 = $P0[0]
  
  $S1 = $P2
  .return ($S1)

WHOLE:
  $P0 = argv[0]
  .return($P0)

bad_args:
  tcl_error 'wrong # args: should be "namespace tail string"'

.end

.sub 'eval'
  .param pmc argv
  
  .local int argc
  argc = elements argv
  if argc < 2 goto bad_args

  .local pmc call_chain, temp_call_chain
  call_chain      = get_root_global ['_tcl'], 'call_chain'
  temp_call_chain = new .ResizablePMCArray
  set_root_global ['_tcl'], 'call_chain', temp_call_chain

  .local pmc info_level
  info_level = get_root_global ['_tcl'], 'info_level'
  $P0 = new .TclList
  assign $P0, argv
  unshift $P0, 'eval'
  unshift $P0, 'namespace'
  unshift info_level, $P0

  .local pmc ns, __namespace
  __namespace = get_root_global ['_tcl'], '__namespace'
  
  ns = shift argv
  ns = __namespace(ns, 1)

  .local string namespace
  namespace = ''
  $I0 = elements ns
  if $I0 == 0 goto global_ns
  
  namespace = join "'; '", ns
  namespace = "['" . namespace
  namespace .= "']"

global_ns:
  .local pmc __script, code
  __script = get_root_global ['_tcl'], '__script'
  code     = new 'PGE::CodeString'
  $S0 = join ' ', argv
  ($S0, $S1) = __script($S0, 'pir_only'=>1)
  $I0 = code.unique()
  code.emit(<<'END_PIR', namespace, $S0, $I0, $S1)
.HLL 'tcl', 'tcl_group'
.namespace %0
# src/compiler.pir :: pir_compiler (2)
.pragma n_operators 1
.sub compiled_tcl_sub_%2 
  .include 'languages/tcl/src/returncodes.pir'
  .local pmc epoch, colons, split, unk, interactive :unique_reg
  epoch  = get_root_global ['_tcl'], 'epoch'
  colons = get_root_global ['_tcl'], 'colons'
  split  = get_root_global ['parrot'; 'PGE::Util'], 'split'
  interactive = get_root_global ['tcl'], '$tcl_interactive'
  %1
  .return(%3)
.end
END_PIR
  
  .local pmc pir_compiler
  pir_compiler = compreg 'PIR'
  push_eh restore_call_chain
    $P0 = pir_compiler(code)
    $P0 = $P0()
  clear_eh
  set_root_global ['_tcl'], 'call_chain', call_chain
  .return($P0)

restore_call_chain:
  .catch()
  set_root_global ['_tcl'], 'call_chain', call_chain
  .rethrow()

bad_args:
  tcl_error 'wrong # args: should be "namespace eval name arg ?arg...?"'
.end

.sub 'export'
  .return ('')
.end

.sub 'children'
  .param pmc argv

  .local int has_pattern
  has_pattern = 0

  .local int argc
  argc = elements argv
  if argc > 2  goto bad_args
  if argc != 2 goto iterate

  .local pmc glob, pattern
  glob        = compreg 'PGE::Glob'
  pattern     = argv[1]
  pattern     = glob.'compile'(pattern)
  has_pattern = 1

iterate:
  .local pmc list
  list = new .TclList
  
  .local pmc __namespace, ns, ns_name
  .local string name
  __namespace = get_root_global ['_tcl'], '__namespace'
  name = ''
  if argc == 0 goto getname

  name = argv[0]
getname:
  ns_name  = __namespace(name, 1)

  unshift ns_name, 'tcl'
  ns = get_root_namespace ns_name
  if null ns goto unknown_namespace

  .local pmc iter
  iter = new .Iterator, ns
loop:
  unless iter goto end
  $S0 = shift iter
  $P0 = ns[$S0]
  $I0 = isa $P0, 'NameSpace'
  unless $I0 goto loop
  $P0 = $P0.'get_name'()
  $S0 = shift $P0 # get rid of 'tcl'
  $S0 = join '::', $P0
  $S0 = '::' . $S0
  $P0 = new .TclString
  $P0 = $S0
  unless has_pattern goto is_namespace
  $P1 = pattern($P0)
  unless $P1 goto loop
is_namespace:
  push list, $P0
  goto loop
end:

  $P0 = find_name 'children_cmp'
  list.sort($P0)
  .return(list)

bad_args:
  tcl_error 'wrong # args: should be "namespace children ?name? ?pattern?"'

unknown_namespace:
  $S0 = argv[0]
  $S0 = 'unknown namespace "' . $S0
  $S0 = $S0 . '" in namespace children command'
  tcl_error $S0
.end

.sub 'children_cmp'
    .param string a
    .param string b

    a = downcase a
    b = downcase b

    .local int len_a, len_b, pos
    len_a = length a
    len_b = length b
    pos   = 0

loop:
    if pos >= len_a goto exhausted_a
    if pos >= len_b goto a_first

    $I0 = ord a, pos
    $I1 = ord b, pos

    if $I0 < $I1 goto a_first
    if $I1 < $I0 goto b_first

    inc pos
    goto loop

exhausted_a:
    if len_a == len_b goto same
    goto b_first

same:
    .return(0)

a_first:
    .return(-1)

b_first:
    .return(1)
.end

.sub 'code'
  .return ('')
.end

.sub 'export'
  .return ('')
.end

.sub 'forget'
  .return ('')
.end

.sub 'import'
  .return ('')
.end

.sub 'inscope'
  .return ('')
.end

.sub 'origin'
  .return ('')
.end

.sub 'parent'
  .param pmc argv

  .local int argc
  argc = elements argv

  .local string name
  name = ''
  
  if argc > 1  goto bad_args
  if argc == 0 goto get_parent

  name = argv[0]
  
get_parent:
  .local pmc ns, __namespace
  __namespace = get_root_global ['_tcl'], '__namespace'
  ns  = __namespace(name)
  if $S0 != '' goto no_pop
  # for when someone calls [namespace current] from ::
  push_eh current_in_root
    $S0 = pop ns
  clear_eh
no_pop:
  $S0 = join '::', ns
  $S0 = '::' . $S0
  .return($S0)

current_in_root:
  .return('')

bad_args:
  tcl_error 'wrong # args: should be "namespace parent ?name?"'
.end

# RT#40753: Stub
.sub 'which'
  .return ('')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

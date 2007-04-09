.HLL '_Tcl', ''
.namespace

=head2 _Tcl::__list

Given a PMC, get a list from it. If the PMC is a TclList,
this is as simple as returning the list. If it's a string,
use __stringToList.

=cut

.sub __list :multi(TclList)
  .param pmc list
  .return(list)
.end

.sub __list :multi(_)
  .param pmc value

  $P0 = __stringToList(value)
  morph value, .Undef
  assign value, $P0

  .return(value)
.end


=head2 _Tcl::__dict

Given a PMC, get a TclDict from it, converting as needed.

=cut

.sub __dict :multi(TclDict)
  .param pmc dict
  .return(dict)
.end

.sub __dict :multi(TclList)
  .param pmc list

  $P0 = __listToDict(list)
  morph list, .Undef
  assign list, $P0

  .return(list)
.end

.sub __dict :multi(_)
  .param pmc value

  $P0 = __stringToDict(value)
  morph value, .Undef
  assign value, $P0

  .return(value)
.end


=head2 _Tcl::__number

Given a PMC, get a number from it.

=cut

.sub __number :multi(TclInt)
  .param pmc n
  .return(n)
.end

.sub __number :multi(TclFloat)
  .param pmc n
  .return(n)
.end

.sub __number :multi(_)
  .param pmc number

  .local string str
  .local int    len
  str = number
  len = length str
  .include 'cclass.pasm'

  .local pmc parse
  .local pmc match

  parse = get_root_global ['parrot'; 'TclExpr::Grammar'], 'number'
  $I0 = find_not_cclass .CCLASS_WHITESPACE, str, 0, len
  match = parse(str, 'pos'=>$I0, 'grammar'=>'TclExpr::Grammar')

  $I0 = match.'to'()
  $I1 = len - $I0
  $I0 = find_not_cclass .CCLASS_WHITESPACE, str, $I0, $I1
  if $I0 < len goto NaN

  # the following will dump out the match object
  #load_bytecode 'dumper.pbc'
  #load_bytecode 'PGE/Dumper.pbc'
  #$P0 = get_root_global ['parrot'], '_dumper'
  #$P0(match)

  unless match goto NaN

  .local pmc astgrammar, astbuilder, ast
  astgrammar = new 'TclExpr::PAST::Grammar'
  astbuilder = astgrammar.apply(match)
  ast = astbuilder.get('past')

  .local string class
  .local pmc    value
  class = ast['class']
  value = ast['value']

  $I0    = find_type class
  number = new $I0
  assign number, value

  .return(number)

NaN:
  $S1 = 'expected floating-point number but got "'
  $S0 = number
  $S1 .= $S0
  $S1 .= '"'
  tcl_error $S1
.end

=head2 _Tcl::__integer

Given a PMC, get an integer from it.

=cut

.sub __integer :multi(TclInt)
  .param pmc n
  .return(n)
.end

.sub __integer :multi(_)
  .param pmc value
  .param pmc rawhex :named ('rawhex') :optional 
  .param int has_rawhex               :opt_flag

  unless has_rawhex goto normal
  $S0 = value
  $S0 =  '0x' . $S0
  value = $S0

normal: 
  .local pmc integer

  push_eh not_integer_eh
    integer = __number(value)
  clear_eh
  $I0 = typeof integer
  if $I0 != .TclInt goto not_integer

  morph value, .Undef
  assign value, integer

  .return(value)

not_integer:
  $S1 = value
  $S0 = 'expected integer but got "'
  $S0 .= $S1
  $S0 .= '"'
  tcl_error $S0

not_integer_eh:
  get_results '(0,0)', $P99, $S99
  $I0 = index $S99, 'expected integer'
  if $I0 == -1 goto not_integer # got some other exception, rewrap it.
  rethrow $P99 # preserves the invalid octal message.
.end

=head2 _Tcl::__index

=cut

.sub __index
  .param string idx
  .param pmc    list

  if idx == 'end' goto end

  $S0 = substr idx, 0, 4
  if $S0 == 'end-' goto before_end
  if $S0 == 'end+' goto after_end

  push_eh bad_index
    $I0 = __integer(idx)
  clear_eh
  .return($I0)

before_end:
  $S0 = substr idx, 4
  push_eh bad_index
    $I0 = __integer($S0)
  clear_eh

  $I1 = elements list
  dec $I1
  $I0 = $I1 - $I0
  .return($I0)

after_end:
  $S0 = substr idx, 4
  push_eh bad_index
    $I0 = __integer($S0)
  clear_eh

  $I1 = elements list
  dec $I1
  $I0 = $I1 + $I0
  .return($I0)

end:
  $I0 = elements list
  dec $I0
  .return($I0)

bad_index:
  get_results '(0,0)', $P99, $S99
  $S0 = 'bad index "'
  $S0 .= idx
  $S0 .= '": must be integer?[+-]integer? or end?[+-]integer?'
  $S1 = ' (looks like invalid octal number)'
  $I0 = index $S99, $S1
  if $I0 == -1 goto bad_index_done
  $I0 = index idx, '--'
  if $I0 != -1 goto bad_index_done # don't squawk on negative indices..
  $S0 .= $S1
bad_index_done:
  tcl_error $S0
.end

=head2 _Tcl::__channel

Given a string, return the appropriate channel.

=cut

.sub __channel
  .param string channelID

  .local pmc channels
  channels = find_global 'channels'

  .local pmc io_obj
  io_obj = channels[channelID]
  if null io_obj goto bad_channel

  $I0 = typeof io_obj
  if $I0 == .ParrotIO goto done
  $I1 = find_type 'TCPStream'
  if $I0 == $I1 goto done

  # should never happen
  goto bad_channel

done:
  .return (io_obj)

bad_channel:
  $S0 = 'can not find channel named "'
  $S0 .= channelID
  $S0 .= '"'
  tcl_error $S0

.end

=head2 _Tcl::__expr

Given an expression, return a subroutine, or optionally, the raw PIR

=cut

.sub __expr
    .param string expression
    .param int    pir_only :named('pir_only') :optional
    .param pmc    ns       :named('ns')       :optional
    .param int    has_ns   :opt_flag

    .local pmc parse
    .local pmc match

    parse = get_root_global ['parrot'; 'TclExpr::Grammar'], 'expression'
    match = parse(expression, 'pos'=>0, 'grammar'=>'TclExpr::Grammar')

    # the following will dump out the match object
    #load_bytecode 'dumper.pbc'
    #load_bytecode 'PGE/Dumper.pbc'
    #$P0 = get_root_global ['parrot'], '_dumper'
    #$P0(match)

    unless match goto premature_end
    $I0 = length expression
    $I1 = match.to()
    .include 'cclass.pasm'
    $I1 = find_not_cclass .CCLASS_WHITESPACE, expression, $I1, $I0
    unless $I0 == $I1 goto extra_tokens

    .local pmc astgrammar, astbuilder, ast
    astgrammar = new 'TclExpr::PAST::Grammar'
    astbuilder = astgrammar.apply(match)
    ast = astbuilder.get('past')

    .local string namespace
    namespace = ''
    unless has_ns goto build_pir

    $P0 = ns.'get_name'()
    $S0 = shift $P0
    $I0 = elements $P0
    if $I0 == 0 goto build_pir
    $S0 = join "'; '", $P0
    $S0 = "['" . $S0
    $S0 = $S0 . "']"
    namespace = $S0

  build_pir:
    .local pmc pirgrammar, pirbuilder
    .local string result
    pirgrammar = new 'TclExpr::PIR::Grammar'
    pirbuilder = pirgrammar.'apply'(ast)
    result = pirbuilder.get('result')

    .local string ret
    ret = ast['ret']
    if pir_only goto only_pir

    .local pmc pir
    pir = new 'PGE::CodeString'

    pir.emit(".HLL 'Tcl', ''")
    pir.emit('.namespace %0', namespace)
    pir.emit(".sub '_anon' :anon")
    pir .= result
    pir.emit("  .return(%0)", ret)
    pir.emit(".end")

    $P1 = compreg 'PIR'
    $P2 = $P1(pir)
    .return ($P2)

  only_pir:
    .return(result, ret)

  premature_end:
    $S0 = expression
    $S0 = 'syntax error in expression "' . $S0
    $S0 = $S0 . '": premature end of expression'
    tcl_error $S0

  extra_tokens:
    $S0 = expression
    $S0 = 'syntax error in expression "' . $S0
    $S0 = $S0 . '": extra tokens at end of expression'
    tcl_error $S0
.end

=head2 _Tcl::__script

Given a chunk of tcl code, return a subroutine.

=cut

.sub __script
    .param string code
    .param int    pir_only :named('pir_only') :optional
    .param pmc    ns       :named('ns')       :optional
    .param int    has_ns   :opt_flag

    .local pmc parse
    .local pmc match

    parse = get_root_global ['parrot'; 'TclExpr::Grammar'], 'program'
    match = parse(code, 'pos'=>0, 'grammar'=>'TclExpr::Grammar')

    # the following will dump out the match object
    #load_bytecode 'dumper.pbc'
    #load_bytecode 'PGE/Dumper.pbc'
    #$P0 = get_root_global ['parrot'], '_dumper'
    #$P0(match)

    unless match goto premature_end
    $I0 = length code
    $I1 = match.to()
    .include 'cclass.pasm'
    $I1 = find_not_cclass .CCLASS_WHITESPACE, code, $I1, $I0
    unless $I0 == $I1 goto extra_tokens

    .local pmc astgrammar, astbuilder, ast
    astgrammar = new 'TclExpr::PAST::Grammar'
    astbuilder = astgrammar.apply(match)
    ast = astbuilder.get('past')

    .local string namespace
    namespace = ''
    unless has_ns goto build_pir

    $P0 = ns.'get_name'()
    $S0 = shift $P0
    $I0 = elements $P0
    if $I0 == 0 goto build_pir
    $S0 = join "'; '", $P0
    $S0 = "['" . $S0
    $S0 = $S0 . "']"
    namespace = $S0

  build_pir:
    .local pmc pirgrammar, pirbuilder
    .local string result
    pirgrammar = new 'TclExpr::PIR::Grammar'
    pirbuilder = pirgrammar.'apply'(ast)
    result = pirbuilder.get('result')

    .local string ret
    ret = ast['ret']
    if pir_only goto only_pir

    .local pmc pir
    pir = new 'PGE::CodeString'

    pir.emit(".HLL 'Tcl', ''")
    pir.emit(".loadlib 'tcl_ops'")
    pir.emit('.namespace %0', namespace)
    pir.emit(".include 'languages/tcl/src/returncodes.pir'")
    pir.emit(".sub '_anon' :anon")
    pir .= result
    pir.emit('  .return(%0)', ret)
    pir.emit('.end')

    $P1 = compreg 'PIR'
    $P2 = $P1(pir)
    .return ($P2)

  only_pir:
    .return(result, ret)

  premature_end:
    say code
    tcl_error "program doesn't match grammar"

  extra_tokens:
    $S0 = substr code, $I1
    $S0 = 'extra tokens at end of program: ' . $S0
    tcl_error $S0
.end

=head2 _Tcl::__namespace

Given a string namespace, return an array of names.

=cut

.sub __namespace
  .param string name
  .param int    depth     :optional
  .param int    has_depth :opt_flag

  if has_depth goto depth_set
  depth = 0

depth_set:
  .local pmc colons, split
  colons = get_root_global ['_tcl'], 'colons'
  split  = get_root_global ['parrot'; 'PGE::Util'], 'split'
  
  .local pmc ns_name
  ns_name = split(colons, name)
  $I0 = elements ns_name
  if $I0 == 0 goto relative
  $S0 = ns_name[0]
  if $S0 != '' goto relative
  
absolute:
  $P1 = shift ns_name
  goto return

relative:
  .local pmc interp
  interp = getinterp
relative_loop:
  inc depth
  $P0 = interp['sub'; depth]
  $P0 = $P0.'get_namespace'()
  $P0 = $P0.'get_name'()
  $S0 = $P0[0]
  if $S0 == '_tcl' goto relative_loop
  
  $I0 = elements $P0
combine_loop:
  dec $I0
  if $I0 == 0 goto return
  $P1 = $P0[$I0]
  unshift ns_name, $P1
  goto combine_loop

return:
  .return(ns_name)
.end

=head2 _Tcl::__boolean

Given a string, return its boolean value if it's a valid boolean. Otherwise,
throw an exception.

=cut

.sub __boolean
    .param pmc value

    .local string lc 
    $S0 = value
    lc = downcase $S0
 
    if lc == '1' goto true
    if lc == '0' goto false
    if lc == 'true'  goto true
    if lc == 'tru'   goto true
    if lc == 'tr'    goto true
    if lc == 't'     goto true
    if lc == 'false' goto false
    if lc == 'fals'  goto false
    if lc == 'fal'   goto false
    if lc == 'fa'    goto false
    if lc == 'f'     goto false
    if lc == 'yes'   goto true
    if lc == 'ye'    goto true
    if lc == 'y'     goto true
    if lc == 'no'    goto false
    if lc == 'n'     goto false
    if lc == 'on'    goto true
    if lc == 'off'   goto false
    if lc == 'of'    goto false

    .local pmc __number
    __number = get_hll_global '__number'

    push_eh error
      value = __number(value)
    clear_eh
    if value goto true
    goto false

error:
    $S0 = value
    $S0 = 'expected boolean value but got "' . $S0
    $S0 = $S0 . '"'
    tcl_error $S0

number:

true:
    .return(1)

false:
    .return(0)
.end

=head2 _Tcl::__call_level

Given a pmc containing the tcl-style call level, return an int-like pmc
indicating the parrot-style level, and an integer with a boolean 0/1 -
was this a valid tcl-style level, or did we get this value as a default?

=cut

.sub __call_level
  .param pmc tcl_level
  .local pmc parrot_level, defaulted, orig_level
  defaulted = new .Integer
  defaulted = 0

  .local pmc call_chain, __number
  .local int call_level
  call_chain = get_root_global ['_tcl'], 'call_chain'
  call_level = elements call_chain
  __number   = get_root_global ['_tcl'], '__number'
  orig_level = new .Integer
  orig_level = call_level
 
  .local int num_length

get_absolute:
  # Is this an absolute?
  $S0 = tcl_level
  $S1 = substr $S0, 0, 1, ''
  if $S1 != '#' goto get_integer
  push_eh default
    parrot_level = __number($S0)
  clear_eh
  goto bounds_check
 
get_integer:
  push_eh default
    parrot_level = __number(tcl_level)
  clear_eh

  if parrot_level < 0 goto default
  parrot_level = orig_level - parrot_level
  goto bounds_check
 
default:
  defaulted = 1
  parrot_level = new Integer
  parrot_level = orig_level - 1
  # fallthrough.

bounds_check:
  # Are we < 0 ?
  if parrot_level < 0          goto bad_level
  if parrot_level > orig_level goto bad_level

  $I1 = defaulted 
  .return(parrot_level,$I1)

bad_level:
  $S0 = tcl_level
  $S0 = 'bad level "' . $S0
  $S0 = $S0 . '"'
  tcl_error $S0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

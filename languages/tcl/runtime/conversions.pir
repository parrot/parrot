.HLL '_Tcl', ''
.namespace

=head2 _Tcl::__list

Given a PMC, get a list from it. If the PMC is a TclLst,
this is as simple as returning the list. If it's a string,
use __stringToList.

=cut

.sub __list
  .param pmc value

  $I0 = typeof value
  if $I0 == .TclList goto done

  $S0 = value
  .return __stringToList($S0)

done:
  .return(value)
.end

=head2 _Tcl::__number

Given a PMC, get a number from it.

=cut

.sub __number
  .param pmc value

  $I0 = typeof value
  if $I0 == .TclInt goto done
  if $I0 == .TclFloat goto done
  
  .local string str
  .local int len
  str = value
  len = length str

  .include 'cclass.pasm'
  .local int pos
  pos = find_not_cclass .CCLASS_WHITESPACE, str, 0, len

  .local int multiplier
  multiplier = 1

  $S1 = substr str, pos, 1
  if $S1 == '+' goto positive
  # If the first character is -, assume a negative number.
  unless $S1 == '-' goto get_value
  multiplier = -1
positive:
  inc pos
  str = substr str, pos
  len = length str
  pos = 0

get_value:
  (value, pos) = get_number(str, pos)
  if null value goto NaN
  $I0 = find_not_cclass .CCLASS_WHITESPACE, str, pos, len
  if len != $I0 goto NaN
  value *= multiplier

done:
  .return(value)

NaN:
  .throw('Not a number!')
.end

=head2 _Tcl::__integer

Given a PMC, get an integer from it.

=cut

.sub __integer
  .param pmc value
  
  .local pmc integer

  push_eh not_integer
    integer = __number(value)
  clear_eh
  $I0 = typeof integer
  if $I0 != .TclInt goto not_integer

  assign value, integer

  .return(value)

not_integer:
  $S1 = value
  $S0 = 'expected integer but got "'
  $S0 .= $S1
  $S0 .= '"'
  .throw($S0)
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
  if_null io_obj, bad_channel
  $I0 = typeof io_obj 
  if $I0 != .ParrotIO goto bad_channel # Should never happen?
  .return (io_obj)

bad_channel:
  $S0 = 'can not find channel named "'
  $S0 .= channelID
  $S0 .= '"'
 .throw($S0)

.end

=head2 _Tcl::__expr

Given an expression, return a subroutine.

=cut

.sub __expr
  .param string expr
  
  .get_from_HLL($P0, '_tcl', '__expression_compile')
  ($I0,$S0) = $P0(0,expr)
  $P2 = pir_compiler($I0,$S0)
  
  .return($P2)
.end

=head2 _Tcl::__script

Given a chunk of tcl code, return a subroutine.

=cut

.sub __script
  .param string code
  
  .get_from_HLL($P0, '_tcl', 'compile')
  ($I0,$S0) = $P0(0,code)
  $P2 = pir_compiler($I0,$S0)
  
  .return($P2)
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
  .local pmc p6rule, colons, split
  p6rule = compreg "PGE::P6Regex"
  colons = p6rule('\:\:+')
  .get_from_HLL(split, 'parrot'; 'PGE::Util', 'split')
  
  .local pmc ns_name
  ns_name = split(colons, name)
  $I0 = elements ns_name
  if $I0 == 0 goto empty
  if $I0 == 1  goto relative
  $S0 = ns_name[0]
  if $S0 != "" goto relative
  
absolute:
  $P1 = shift ns_name
  goto return

empty:
  push ns_name, ""
relative:
  .local pmc interp
  interp = getinterp
relative_loop:
  inc depth
  $P0 = interp["sub"; depth]
  $P0 = $P0.'get_namespace'()
  $P0 = $P0.'name'()
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

=head2 _Tcl::__call_level

Given a pmc containing the tcl-style call level, return an int-like pmc
indicating the parrot-style level, and an integer with a boolean 0/1 -
was this a valid tcl-style level, or did we get this value as a default?

=cut

.sub __call_level
  .param pmc tcl_level
  .local pmc parrot_level, defaulted, orig_level
  defaulted = new Integer
  defaulted = 0

  .local pmc current_call_level, get_number
  .get_from_HLL(current_call_level, '_tcl', 'call_level')
  .get_from_HLL(get_number, '_tcl', 'get_number')
  orig_level = current_call_level
 
  .local int num_length

get_absolute:
  # Is this an absolute? 
  $S0 = tcl_level
  $S1 = substr $S0, 0, 1
  if $S1 != "#" goto get_integer
  $S0 = tcl_level
  (parrot_level, num_length) = get_number($S0,1)
  if null parrot_level goto default
  $S0 = tcl_level
  $I0 = length $S0
  # num_length isn't really num_length -- it's the pos after the last digit
  if $I0 != num_length goto default
  goto bounds_check
 
get_integer:
  # Is this an integer? 
  $S0 = tcl_level
  (parrot_level, num_length) = get_number($S0,0)
  if null parrot_level goto default
  $S0 = tcl_level
  $I0 = length $S0
  if $I0 != num_length goto default
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
  $S0 = "bad level \"" . $S0
  $S0 = $S0 . "\""
  .throw($S0)
.end

.HLL '_Tcl', ''
.namespace

=head1 _Tcl::select_option(array options, string choice, ?string type?)

Given an array of strings in 'options', and the specified
choice, return the option specified in options
that matches choice, either exactly, or with an initial,
unambiguous match. If no match is possible, or more than one
option matches, throw an error.

If 'type' is specified, it is used to generate the error message.
Defaults to 'option'.

=cut

.sub select_option
  .param pmc options
  .param string choice
  .param string type_name  :optional
  .param int has_type_name :opt_flag

  if has_type_name goto got_type_name
  type_name = 'option'
  
got_type_name:

  .local pmc partials
  partials = new .ResizablePMCArray

  # is there an exact match?

  .local int ii,num_options,choice_len
  ii = 0
  num_options = elements options
  choice_len = length choice
  .local string option, error

  loop:
    if ii >= num_options goto check_partial
    option = options[ii]
    if option == choice goto got_match
    $S1 = substr option, 0, choice_len
    if $S1 != choice goto loop_next
    push partials, option 
 
  loop_next:      
    inc ii
  goto loop
 
check_partial: 
  $I1 = elements partials
  if $I1 == 0 goto no_match
  if $I1 >1 goto ambiguous
  option = partials[0]

got_match:
  .return (option)

no_match:
  error = 'bad '
  error .= type_name
  error .= ' "'
  error .= choice
  error .= '": must be '
  $S1 = __options_to_string(options)
  error .= $S1 
  tcl_error error

ambiguous:
  error = 'ambiguous '
  error .= type_name
  error .= ' "'
  error .= choice
  error .= '": must be '
  # $S1 = __options_to_string(partials)  # Now, I like this better...
  $S1 = __options_to_string(options)
  error .= $S1 
  tcl_error error
.end

=head1 hash options = _Tcl::select_switches(array switches, array argv, ?endswitch:0?, ?catchbad:0?, ?name: 'switch'?)

Given an array of valid switches, and an argv array (which should begin with
possible switches and be followed by the remaining args), return a hash
containing the names of the switches as keys, with the assigned values
as values.

If ?endswitch? is specified as a true value, then "--" is treated as an 
end of switch marker. The default is to not treat "--" specially.

Any options that are matched are removed from the argv array, simplifying
work for the caller.

The 'switches' array contains a list of all valid switches. For example, if
"-foo" is a valid boolean switch, then the string "foo" should appear in
the array. If the switch takes a parameter, then specify it as "foo:s".

If 'catchbad' is specified with a true value, then an exception is thrown
if a bad switch is specified.

The 'name' parameter is only used if catchbad is true : if set, it is used
to customize the error message slightly.
=cut

.sub select_switches
  .param pmc switches
  .param pmc argv
  .param int endswitch :optional
  .param int has_ends  :opt_flag
  .param int catchbad  :optional
  .param int has_catch :opt_flag
  .param string name   :optional
  .param int has_name  :opt_flag

  if has_ends goto check_catch
  endswitch = 0

check_catch:
  if has_catch goto check_name
  catchbad = 0

check_name:
  if has_name goto init 
  name = 'switch'

init:
  # setup types
  .local pmc with_type, results
  with_type = new .Hash
  results = new .Hash
  $P1 = new .Iterator, switches
  .local string switch,type
init_loop:
  unless $P1 goto init_loop_done
  switch = shift $P1
  type = ''
  $I1 = index switch, ':'
  if $I1 == -1 goto init_got_type
  $I2 = $I1 + 1
  type = substr switch, $I2, 1
  substr switch, $I1, 2, '' # assume a single char following the :
 
init_got_type:
  with_type[switch] = type
  goto init_loop

init_loop_done:
  
  .local int argv_len, pos
  argv_len = elements argv
  pos =0
  .local string arg
  .local pmc value
loop:
  if pos >= argv_len goto loop_done
  arg = argv[pos]
  $S1 = substr arg, 0, 1, '' 
  if $S1 != '-' goto loop_done
  unless endswitch goto loop_2
  if arg == '-' goto handle_endswitch # already ate one -
loop_2:
  $P1 = with_type[arg] 
  if_null $P1, bad_argument
  type = $P1 
  if type == '' goto simple_switch
typed_switch:
  inc pos
  value = argv[pos]
  results[arg] = value
  goto loop_next
simple_switch:
  results[arg] = 1
  goto loop_next
handle_endswitch:
  inc pos
  goto loop_done
bad_argument:
  dec pos
  unless catchbad goto loop_done
  unless endswitch goto throw_error
  switches = clone switches
  push switches, '-'
throw_error:
  $S1 = 'bad '
  $S1 .= name
  $S1 .= ' "-'
  $S1 .= arg
  $S1 .= '": must be '
  $S2 = __switches_to_string(switches)
  $S1 .= $S2
  tcl_error $S1 
loop_next:
  inc pos
  goto loop
loop_done:

  # delete any processed switches from the argv
  if pos <= 0 goto done
  $P1 = new .ResizablePMCArray
  splice argv, $P1, 0, pos   
 
done:
  .return (results)
.end
  
.sub __options_to_string
  .param pmc options

  # uncomment this if folks start passing in un-ordered lists...
  # options.'sort'()  

  .local string error
  error = ''
  .local int ii, num_options
  ii = 0
  num_options = elements options
  .local int penultimate, ultimate
  penultimate = num_options - 2
  ultimate = num_options - 1
  loop_out:
    if ii >= num_options goto invalid_done
    $S1 = options[ii]
    error .= $S1
    if ii == penultimate goto add_or
    if ii == ultimate goto loop_out_next
    error .= ', '
    goto loop_out_next
  add_or:
    if ii == 0 goto bare_or # don't add the , with only two items..
    error .= ', or '
    goto loop_out_next
  bare_or:
    error .= ' or '
  loop_out_next:
    inc ii
    goto loop_out

 invalid_done:
  .return (error)
.end

# Similar to __option_to_string. Refactor??
.sub __switches_to_string
  .param pmc switches

  # uncomment this if folks start passing in un-ordered lists...
  # switches.'sort'()  

  .local string error
  error = ''
  .local int ii, num_switches
  ii = 0
  num_switches = elements switches
  .local int penultimate, ultimate
  penultimate = num_switches - 2
  ultimate = num_switches - 1
  loop_out:
    if ii >= num_switches goto invalid_done
    $S1 = switches[ii]
    error .= '-'
    error .= $S1
    if ii == penultimate goto add_or
    if ii == ultimate goto loop_out_next
    error .= ', '
    goto loop_out_next
  add_or:
    error .= ', or '
  loop_out_next:
    inc ii
    goto loop_out

 invalid_done:
  .return (error)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

.HLL '_Tcl', ''
.namespace

=head1 _Tcl::select_option(array listing, string choice, ?string type?)

Given an array of strings in 'listing', and the specified
choice, return the option specified in listing
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
    error .= ', or '
  loop_out_next:
    inc ii
    goto loop_out

 invalid_done:
  .return (error)
.end


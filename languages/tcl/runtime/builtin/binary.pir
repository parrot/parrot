.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&binary'
  .param pmc argv :slurpy

  .local pmc retval

  $I0 = argv
  unless $I0 goto no_args

  .local string subcommand_name
  subcommand_name = shift argv
  .local pmc subcommand_proc
  null subcommand_proc

  subcommand_proc = get_root_global ['_tcl'; 'helpers'; 'binary'], subcommand_name
  if_null subcommand_proc, bad_args
  .return subcommand_proc(argv)

bad_args:
  $S0 = 'bad option "'
  $S0 .= subcommand_name
  $S0 .= '": must be format or scan'

  .throw ($S0)

no_args:
  .throw ('wrong # args: should be "binary option ?arg ...?"')

.end

.HLL '_Tcl',''
.namespace [ 'helpers'; 'binary' ]

.macro getBinaryArg ()
  if argvIndex == argc goto out_of_args
  argString = argv[argvIndex]
  inc argvIndex
.endm

.sub 'format'
  .param pmc argv

  .local int argc
  .local pmc retval

  argc = argv
  unless argc goto bad_args

  .local pmc binary_types
  binary_types = find_global 'binary_types'

  .local string outputString,formatString
  outputString = binary:""
  formatString = shift argv

  # Loop over the chunks of the format string and generate the
  # appropriate types. format strings consist of repeated chunks of
  # type count? whitespace*
  .local int pos,formatString_len,argvIndex,argc,count,digit,tempCount
  .local string formatChar,argString
  pos = 0
  argvIndex = 0
  argc = argv
  # a count of -1 indicates that '*' was specified.
  # a count of -2 indicates that no count was specified.
  count = -2
  formatString_len = length formatString

format_loop:
  if pos == formatString_len goto end_format_loop
  formatChar = substr formatString,pos,1

  $I1 = exists binary_types[formatChar]
  unless $I1 goto bad_field_specifier 
  
  .local int num_pos
  num_pos = pos + 1
 
  $S0 = substr formatString, num_pos, 1
  if $S0 != '*' goto get_int_count
  count = -1
  pos = num_pos
  goto got_count

get_int_count:
  tempCount = 0
  ## XXX  countString = 0
count_loop:
  if num_pos == formatString_len goto count_loop_done 
  digit = ord formatString, num_pos
  if digit < 48 goto count_loop_done
  if digit > 57 goto count_loop_done
  digit -= 48 # ascii
  # XXXX
  tempCount = tempCount * 10
  tempCount += digit 
  inc num_pos
  if num_pos == formatString_len goto count_loop_done
  ## XXX digitString = substr formatString,pos,1
  if num_pos == formatString_len goto count_loop_done
  goto count_loop
count_loop_done:
  $I0 = num_pos - 1  
  if $I0 == pos goto got_default_count

  pos = num_pos 
  count = tempCount
  goto got_count

got_default_count:
  inc pos

got_count:

which_format:

  if formatChar == 'a' goto format_a
  if formatChar == 'A' goto format_A
  if formatChar == 'x' goto format_x
 
  .throw('This error should never occur: must be missing a field specifier implementation.')

format_a:
  .getBinaryArg()
  if count == -1 goto format_a_star
  if count >= 0 goto format_a_counted
  count = 1

format_a_counted:
  $I0 = length argString
  if $I0 < count goto format_a_padding
  $S0 = substr argString, 0, count
  outputString .= $S0
  goto format_done

format_a_padding:
  outputString .= argString
  count = count - $I0
  $S0 = repeat binary:"\0", count
  outputString .= $S0
  goto format_done

format_a_star:
  outputString .= argString  
  goto format_done

format_A:
  .getBinaryArg()
  if count == -1 goto format_A_star
  if count >= 0 goto format_A_counted
  count = 1

format_A_counted:
  $I0 = length argString
  if $I0 < count goto format_A_padding
  $S0 = substr argString, 0, count
  outputString .= $S0
  goto format_done

format_A_padding:
  outputString .= argString
  count = count - $I0
  $S0 = repeat ' ', count
  outputString .= $S0
  goto format_done

format_A_star:
  outputString .= argString  
  goto format_done

format_x:
  outputString .= binary:"\0"

  # done with formats.
format_done:

  goto format_loop
end_format_loop:

  print 'ESCAPED OUTPUT IS:'
  $S0 = escape outputString
  print $S0
  print_newline
  .return(outputString)

bad_args:
  .throw ('wrong # args: should be "binary format formatString ?arg arg ...?"')
bad_field_specifier:
  $S0 = 'bad field specifier "'
  $S0 .= formatChar
  $S0 .= '"'
  .throw ($S0)
out_of_args:
  .throw ('not enough arguments for all format specifiers')

.end

.sub 'scan'
  .param pmc argv

  .local int argc
  .local pmc retval

  argc = argv
  unless argc > 2 goto bad_args

bad_args:
  .throw ('wrong # args: should be "binary scan value formatString ?varName varName ...?"')

.end

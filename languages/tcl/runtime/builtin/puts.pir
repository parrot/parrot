###
# [puts]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&puts'
  .param pmc argv :slurpy
 
  .local int argc 
  argc = argv
  if argc == 0 goto error
  if argc > 3 goto error

  .local int utf8
  utf8 = find_encoding 'utf8'

  .local pmc __channel, io
  .get_from_HLL(__channel,'_tcl','__channel')

  if argc == 1 goto one_arg
  if argc == 2 goto two_arg

three_arg: 
  $S1 = argv[0]
  if $S1 != '-nonewline' goto bad_option

  $S2 = argv[1]
  io = __channel($S2)

  $S3 = argv[2]
  $S3 = trans_encoding $S3, utf8
  print io, $S3
  goto done

two_arg:
  # The last arg is the string to print.
  $S3 = argv[1] 
  $S3 = trans_encoding $S3, utf8
  # The first arg could be the option, or it could be a channel
  # figure out which.
  $S2 = argv[0]
  if $S2 != '-nonewline' goto two_arg_channel
two_arg_nonewline:
  print $S3
  goto done

two_arg_channel:  
  io = __channel($S2)

  io.'say'($S3)
  goto done

one_arg:
  $P0 = argv[0]
  $S1 = $P0
  $S1 = trans_encoding $S1, utf8
  print $S1
  print "\n"
  goto done  

bad_option:
  $S0 = 'bad argument "'
  $S3 = argv[2]
  $S0 .= $S3
  $S0 .= '": should be "nonewline"'
  .throw($S0)
 
error:
  .throw('wrong # args: should be "puts ?-nonewline? ?channelId? string"')

done:
  .return('')
.end

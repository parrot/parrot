###
# [puts]

.namespace [ "Tcl" ]

.sub "&puts"
  .param pmc argv :slurpy
 
  .local int argc 
  argc = argv
  if argc == 0 goto error
  if argc > 3 goto error

  if argc == 1 goto one_arg
  if argc == 2 goto two_arg

three_arg: 
  $S1 = argv[0]
  if $S1 != "-nonewline" goto bad_option
  .local pmc channels 
  channels = find_global "_Tcl", "channels"
  $S2 = argv[1]
  $P1 = channels[$S2]
  if_null $P1, bad_channel
  $S3 = argv[2]
  print $P1, $S3
  goto done

two_arg:
  # The first arg could be the option, or it could be a channel
  # figure out which.
  $S2 = argv[0]
  if $S2 != "-nonewline" goto two_arg_channel
two_arg_nonewline:
  $S3 = argv[1] 
  print $S3
  goto done

two_arg_channel:  
  $S3 = argv[1]
  .local pmc channels 
  channels = find_global "_Tcl", "channels"
  $P1 = channels[$S2]
  if_null $P1, bad_channel
  print $P1, $S3
  print $P1, "\n"
  goto done

one_arg:
  $P0 = argv[0]
  $S1 = $P0
  print $S1
  print "\n"
  goto done  

bad_channel:
  $S0 = "can not find channel named \""
  $S0 .= $S2
  $S0 .= "\""
  .throw ($S0)

bad_option:
  $S0 = "bad argument \""
  $S3 = argv[2]
  $S0 .= $S3
  $S0 .= "\": should be \"nonewline\""
  .throw($S0)
 
error:
  .throw("wrong # args: should be \"puts ?-nonewline? ?channelId? string\"")

done:
  .return("")
.end

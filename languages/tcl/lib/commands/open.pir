.namespace [ "Tcl" ]

.sub "&open"
  .local pmc argv 
  argv = foldup

  .local int return_type
  .local pmc retval,channel,next_channel_id,channels
  .local string channel_id

  retval = new String

  .local int argc
  argc = argv
  if argc != 1 goto error

  channel_id = argv[0] 
  open channel, channel_id, "<"
  $I0 = typeof channel
  if $I0 == .Undef goto file_error
  channel_id = "file"
  channels = find_global "_Tcl", "channels"
  # get a new file channel name
  next_channel_id = find_global "_Tcl", "next_channel_id"
  $S0 = next_channel_id
  channel_id .= $S0
  next_channel_id += 1
  channels[channel_id] = channel
  goto done
 
file_error:
  retval = new String
  retval = "unable to open specified file"
  .return(TCL_ERROR,retval)
 
error:
  retval = new String
  retval = "bad call to open"
  .return(TCL_ERROR,retval)

done:
  retval = new String
  retval = channel_id
  .return(return_type,retval)
.end

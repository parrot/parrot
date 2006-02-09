.namespace [ "Tcl" ]

.sub "&open"
  .param pmc argv :slurpy

  .local pmc channel,next_channel_id,channels
  .local string channel_id

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
  .return(channel_id)
 
file_error:
  .throw ("unable to open specified file")
 
error:
  .throw ("XXX: bad call to open")

.end

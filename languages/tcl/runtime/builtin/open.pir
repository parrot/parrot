.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&open'
  .param pmc argv :slurpy

  .local pmc channel,next_channel_id,channels
  .local string channel_id

  .local int argc
  argc = argv
  if argc != 1 goto error

  channel_id = argv[0] 
  open channel, channel_id, '<'
  $I0 = typeof channel
  if $I0 == .Undef goto file_error
  channel_id = 'file'
  channels = get_root_global ['_tcl'], 'channels'
  # get a new file channel name
  next_channel_id = get_root_global ['_tcl'], 'next_channel_id'
  $S0 = next_channel_id
  channel_id .= $S0
  next_channel_id += 1
  channels[channel_id] = channel
  .return(channel_id)
 
file_error:
  tcl_error 'unable to open specified file'
 
error:
  tcl_error 'XXX: bad call to open'
.end

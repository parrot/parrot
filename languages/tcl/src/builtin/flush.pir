.HLL '_Tcl', ''
.namespace [ 'builtins']

.sub 'flush'
  .param int register_num
  .param pmc raw_args
  .param pmc argv

  .local string pir_code, temp_code
  pir_code = ''
  temp_code = ''
  
  # get number of arguments and check
  .local int argc
   argc = argv
  if argc != 1 goto args_miscount

  # number of args is ok

  # generate code that checks for the specified channel:
  # get the channel specified to be flushed

  $S0 = register_num
  pir_code .= '$P'
  pir_code .= $S0
  pir_code .= ' = '
  $S0 = argv[0]
  pir_code .= $S0
  pir_code .= "\n"
  temp_code = ".local string channel_id\n"
  temp_code .= 'channel_id = $P'
  $S0 = register_num
  temp_code .= $S0
  pir_code .= temp_code

  
  pir_code .= <<"END_PIR"
  # keep this comment, we need a newline!
  # generate code for accessing the "channels" variable in ParTcl 
  .local pmc channels, channel
  channels = get_root_global ['_tcl'], 'channels'

  # find the specified channel
  channel = channels[channel_id]

  # check whether the channel is found
  unless_null channel, do_flush
  #
  # channel is not found;
  # throw an exception
  .local string msg
  msg = 'can not find channel named "'
  msg .= channel_id
  msg .= '"' 
  tcl_error msg
END_PIR

  inc register_num
  pir_code .=<<"END_PIR"  
do_flush:
  # check whether it was opened for writing
  # XXX (#40712): TODO -- Seems like ParrotIO.pmc doesn't have support for this

  # everything ok, flush it
  channel."flush"()
END_PIR

  # return an empty string
  pir_code .= '$P'
  $S0 = register_num
  pir_code .= $S0
  pir_code .= "=new .TclString\n"
  pir_code .= '$P'
  pir_code .= $S0
  pir_code .= "=''\n"

  .return(register_num, pir_code)

channel_not_write_mode:
  pir_code=<<"END_PIR"
  .local string msg
  msg = "channel \""
  msg .= channel_id
  msg .= "\" wasn't opened for writing"
  tcl_error msg
END_PIR

.return(register_num, pir_code)

args_miscount:
  pir_code = "tcl_error \"wrong # args: should be \\\"flush channelId\\\"\"\n"
  .return(register_num, pir_code)
.end

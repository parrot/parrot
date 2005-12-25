.namespace [ '_Tcl::builtins']

.sub 'flush'
  .param int register_num
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

  .local pmc compiler, value
  compiler = find_global '_Tcl', 'compile_dispatch'
  .local int value_num
  value = argv[0]
  (value_num, temp_code) = compiler(register_num, value)
  pir_code .= temp_code
  register_num = value_num + 1
  $S0 = register_num
  pir_code .= '$P'
  pir_code .= $S0
  pir_code .= '=$P'
  $S0 = value_num
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
  channels = find_global "_Tcl", "channels"

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
  .throw(msg)
END_PIR

  inc register_num
  pir_code .=<<"END_PIR"  
do_flush:
  # check whether it was opened for writing
  # XXX TODO -- Seems like ParrotIO.pmc doesn't have support for this

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
  .throw(msg)
END_PIR

.return(register_num, pir_code)

args_miscount:
  pir_code = ".throw(\"wrong # args: should be flush \\\"channelId\\\"\")\n"
  .return(register_num, pir_code)

.end


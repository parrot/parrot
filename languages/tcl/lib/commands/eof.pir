.namespace [ "Tcl" ]

.sub "&eof"
  .param pmc argv :slurpy

  .local int argc
  argc = argv

  unless argc==1 goto bad_args
  .local string channelid
  channelid = shift argv

  $P1 = find_global "_Tcl", "channels"

  $P2 = $P1[channelid]
  if_null $P2, bad_channel
  $I0 = typeof $P2
  if $I0 != .ParrotIO goto bad_channel

  $I1 = isfalse $P2  # truth of IO PMC = !(eof)
  .return ($I1)

bad_args:
  .throw("wrong # args: should be \"eof channelId\"")

bad_channel:
   $S0 = "can not find channel named \""
   $S0 .= channelid
   $S0 .= "\""
  .throw($S0)

.end

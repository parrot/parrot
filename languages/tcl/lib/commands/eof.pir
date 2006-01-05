.namespace [ "Tcl" ]

.sub "&eof"
  .param pmc argv :slurpy

  .local int argc
  argc = argv

  unless argc==1 goto bad_args
  .local string channelID
  channelID = shift argv

  .local pmc __channel
  __channel = find_global "_Tcl", "__channel"

  $P2 = __channel(channelID)

  $I1 = isfalse $P2  # truth of IO PMC = !(eof)
  .return ($I1)

bad_args:
  .throw("wrong # args: should be \"eof channelId\"")

.end

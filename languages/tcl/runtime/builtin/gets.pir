=head1 [gets]

read a line from a channel

=cut

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&gets'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc == 0 goto bad_args
  if argc > 2  goto bad_args

  .local string channelID
  channelID = argv[0]

  .local pmc __channel
  __channel = get_root_global ['_tcl'], '__channel'

  .local pmc io
  io = __channel(channelID)

  $S0 = typeof io
  if $S0 == 'TCPStream' goto stream

  $S0 = readline io
  .return($S0)

stream:
  .return io.'readline'()

bad_args:
  tcl_error 'wrong # args: should be "gets channelId ?varName?"'
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

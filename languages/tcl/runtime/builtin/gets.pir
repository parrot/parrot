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

  .local string line
  line = readline io

  .return (line)

bad_args:
  tcl_error 'wrong # args: should be "gets channelId ?varName?"'
.end


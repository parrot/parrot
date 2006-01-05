=head1 [gets]

read a line from a channel

=cut

.namespace [ "Tcl" ]

.sub "&gets"
  .param pmc argv :slurpy

  .local string channelID
  channelID = argv[0]

  .local pmc __channel
  __channel = find_global "_Tcl", "__channel"

  .local pmc io
  io = __channel(channelID)

  .local string line
  line = readline io

  .return (line)
.end

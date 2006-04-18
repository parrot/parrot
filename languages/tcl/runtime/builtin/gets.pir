=head1 [gets]

read a line from a channel

=cut

.HLL 'Tcl', 'tcl_group'
.namespace [ '' ]

.sub "&gets"
  .param pmc argv :slurpy

  .local string channelID
  channelID = argv[0]

  .local pmc __channel
  .get_from_HLL(__channel, '_tcl', '__channel')

  .local pmc io
  io = __channel(channelID)

  .local string line
  line = readline io

  .return (line)
.end

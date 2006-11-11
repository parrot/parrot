=head1 [socket]

Sockets!

=cut

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&socket'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc < 2 goto bad_args
  if argc > 2 goto bad_args

  tcl_return ''

bad_args:
  tcl_error 'wrong # args: should be "socket ?-myaddr addr? ?-myport myport? ?-async? host port" or "socket -server command ?-myaddr addr? port"'
.end


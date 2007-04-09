.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&clock'
  .param pmc argv :slurpy
  
  .local int argc
  argc = argv

  if argc == 0 goto few_args

  .local string subcommand_name
  subcommand_name = shift argv

  .local pmc options
  options = new .ResizablePMCArray
  push options, 'add'
  push options, 'clicks'
  push options, 'format'
  push options, 'microseconds'
  push options, 'milliseconds'
  push options, 'scan'
  push options, 'seconds'
  .local pmc select_option
  select_option  = get_root_global ['_tcl'], 'select_option'
  .local string canonical_subcommand
  canonical_subcommand = select_option(options, subcommand_name)

  .local pmc subcommand_proc

  subcommand_proc = get_root_global ['_tcl';'helpers';'clock'], canonical_subcommand
  if_null subcommand_proc, bad_args

  .return subcommand_proc(argv)

bad_args:
  .return ('') # once all commands are implemented, remove this...

few_args:
  tcl_error 'wrong # args: should be "clock subcommand ?argument ...?"'
.end

.HLL '_Tcl', ''
.namespace [ 'helpers'; 'clock' ]

# XXX Need bignum support
.sub 'microseconds'
  .param pmc argv
  $I0 = elements argv
  if $I0 goto bad_args
  $N0 = time
  $N0 *= 1000000
  $I0 = $N0
  .return ($I0)
bad_args:
  tcl_error 'wrong # args: should be "clock microseconds"'
.end

# XXX Need bignum support
.sub 'milliseconds'
  .param pmc argv
  $I0 = elements argv
  if $I0 goto bad_args
  $N0 = time
  $N0 *= 1000
  $I0 = $N0
  .return ($I0)
bad_args:
  tcl_error 'wrong # args: should be "clock milliseconds"'
.end


.sub 'seconds'
  .param pmc argv
  $I0 = elements argv
  if $I0 goto bad_args
  $I0 = time
  .return ($I0)
bad_args:
  tcl_error 'wrong # args: should be "clock seconds"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

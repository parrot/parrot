# XXX (#40700): Stub 
# help tcltest compile

.HLL '_Tcl', ''
.namespace [ 'builtins']

.sub 'auto_execok'
  .param int register_num
  .param pmc raw_args
  .param pmc argv

  .return(register_num,'')
.end

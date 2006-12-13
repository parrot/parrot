# RT#40703: Stub 
# help tcltest compile

.HLL '_Tcl', ''
.namespace [ 'builtins']

.sub 'trace'
  .param string retval
  .param pmc    raw_args
  .param pmc    argv

  .return('')
.end


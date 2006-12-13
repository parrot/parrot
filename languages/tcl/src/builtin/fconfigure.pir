# RT#40704: Stub 
# help tcltest compile

.HLL '_Tcl', ''
.namespace [ 'builtins']

.sub 'fconfigure'
  .param string retval
  .param pmc    raw_args
  .param pmc    argv

  .return('')
.end


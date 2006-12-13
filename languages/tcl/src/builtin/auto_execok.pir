# RT#40700: Stub 
# help tcltest compile

.HLL '_Tcl', ''
.namespace [ 'builtins']

.sub 'auto_execok'
  .param string retval
  .param pmc    raw_args
  .param pmc    argv

  .return('')
.end

# RT#40698: Stub 
# help tcltest compile

.HLL '_Tcl', ''
.namespace [ 'builtins']

.sub 'exec'
  .param string retval
  .param pmc    raw_args
  .param pmc    argv

  .return('')
.end


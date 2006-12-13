# RT#40702: Stub 
# help tcltest compile

.HLL '_Tcl', ''
.namespace [ 'builtins']

.sub 'glob'
  .param string retval
  .param pmc    raw_args
  .param pmc    argv

  .return('')
.end


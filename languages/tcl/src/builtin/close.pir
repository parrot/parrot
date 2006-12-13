# RT#40706: Stub 
# help tcltest compile

.HLL '_Tcl', ''
.namespace [ 'builtins']

.sub 'close'
  .param string retval
  .param pmc    raw_args
  .param pmc    argv

  .return('')
.end


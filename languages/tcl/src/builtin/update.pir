# RT#40705: Stub 
# help tcltest compile

.HLL '_Tcl', ''
.namespace [ 'builtins']

.sub 'update'
  .param string retval
  .param pmc    raw_args
  .param pmc    argv

  .return('')
.end


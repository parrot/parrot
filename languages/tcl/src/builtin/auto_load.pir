# RT#40709: Stub 
# help tcltest compile

.HLL '_Tcl', ''
.namespace [ 'builtins']

.sub 'auto_load'
  .param string retval
  .param pmc   raw_args
  .param pmc   argv

  .return('')
.end


# RT#40698: Stub 
# help tcltest compile

.HLL '_Tcl', 'tcl_group'
.namespace

.sub 'exec'
  .param string retval
  .param pmc    raw_args
  .param pmc    argv

  .return('')
.end


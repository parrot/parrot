# RT#40709: Stub 
# help tcltest compile

.HLL '_Tcl', 'tcl_group'
.namespace

.sub 'auto_load'
  .param string retval
  .param pmc   raw_args
  .param pmc   argv

  .return('')
.end


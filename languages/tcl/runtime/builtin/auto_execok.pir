# RT#40700: Stub 
# help tcltest compile

.HLL '_Tcl', 'tcl_group'
.namespace 

.sub 'auto_execok'
  .param string retval
  .param pmc    raw_args
  .param pmc    argv

  .return('')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

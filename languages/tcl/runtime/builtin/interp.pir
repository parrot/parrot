# RT#40701: Stub 
# help shootout compile

.HLL '_Tcl', 'tcl_group'
.namespace

.sub 'interp'
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

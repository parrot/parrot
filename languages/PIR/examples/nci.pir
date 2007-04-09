.sub main :main
  .pcc_begin                                
  .nci_call $P1 # r = funcname(x, y, z)      
  .pcc_end                                 
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

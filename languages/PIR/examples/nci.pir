.sub main :main
  .pcc_begin                                
  .nci_call $P1 # r = funcname(x, y, z)      
  .pcc_end                                 
.end

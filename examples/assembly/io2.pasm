# Quick sample for using the open/read ops
# read op is limited to 65535 bytes per read.

   open P0, "/etc/passwd", "<"
   read S0, P0, 256 
   print S0
   end

# samples for using the pioctl op
# add lots of samples here

   open P0, "/etc/passwd", "<"
   pioctl I0, P0, 6, 0
   print "Bufsize "
   print I0
   print "\n"
   pioctl I0, P0, 5, 2222 
   pioctl I0, P0, 6, 0
   print "Bufsize "
   print I0
   print "\n"
   end

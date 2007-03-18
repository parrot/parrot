.sub _accessor :method
  .param string attrib
  .param pmc value :optional
  .param int got_value
  unless got_value goto get_attr
  setattribute self, attrib, value
get_attr:
  .local pmc rv 
  rv = getattribute self, attrib
  .return(rv)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

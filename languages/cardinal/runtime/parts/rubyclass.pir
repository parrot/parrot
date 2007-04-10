.HLL 'parrot', ''
#.HLL 'Ruby', 'ruby_group'

.namespace [ 'RubyClass' ]

.sub 'allocate' :method
.end

.sub 'inherited' :method
.end

.sub 'superclass' :method
.end

.sub 'to_yaml' :method
.end

.sub 'new' :method
  .param pmc args :slurpy
    $I0 = typeof self
    $P0 = new $I0
    print "13\n"
    $P0.'initialize'()
    print "14\n"
    .return ($P0)
.end

#cardinal specific
.sub '_store_instance_var' :method
  .param string name
  .param pmc value
  print self
  print " "
  print name
  print " "
  print value
  print "\n"
  $I0 = classoffset self, name
  unless $I0 > 0 goto exists
  addattribute self, name
exists:
  setattribute self, name, value
  .return ()
.end
  

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

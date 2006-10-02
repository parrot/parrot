.HLL 'Ruby', 'ruby_group'

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
    $P0 = new 'RubyObject'
    .return ($P0)
.end

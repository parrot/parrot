require 'test'
plan 1

pass '.exit! on Kernel'


Kernel.exit! 1

#should never get here
fail '.exit! on Kernel'
